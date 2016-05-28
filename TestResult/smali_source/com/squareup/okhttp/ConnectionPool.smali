.class public final Lcom/squareup/okhttp/ConnectionPool;
.super Ljava/lang/Object;
.source "ConnectionPool.java"


# static fields
.field private static final systemDefault:Lcom/squareup/okhttp/ConnectionPool;


# instance fields
.field private final connections:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/squareup/okhttp/Connection;",
            ">;"
        }
    .end annotation
.end field

.field private final connectionsCleanupRunnable:Ljava/lang/Runnable;

.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private final keepAliveDurationNs:J

.field private final maxIdleConnections:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    .line 61
    const-string v5, "http.keepAlive"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 62
    .local v0, "keepAlive":Ljava/lang/String;
    const-string v5, "http.keepAliveDuration"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 63
    .local v1, "keepAliveDuration":Ljava/lang/String;
    const-string v5, "http.maxConnections"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 64
    .local v4, "maxIdleConnections":Ljava/lang/String;
    if-eqz v1, :cond_29

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 66
    .local v2, "keepAliveDurationMs":J
    :goto_18
    if-eqz v0, :cond_2d

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2d

    .line 67
    new-instance v5, Lcom/squareup/okhttp/ConnectionPool;

    const/4 v6, 0x0

    invoke-direct {v5, v6, v2, v3}, Lcom/squareup/okhttp/ConnectionPool;-><init>(IJ)V

    sput-object v5, Lcom/squareup/okhttp/ConnectionPool;->systemDefault:Lcom/squareup/okhttp/ConnectionPool;

    .line 73
    :goto_28
    return-void

    .line 64
    .end local v2    # "keepAliveDurationMs":J
    :cond_29
    const-wide/32 v2, 0x493e0

    goto :goto_18

    .line 68
    .restart local v2    # "keepAliveDurationMs":J
    :cond_2d
    if-eqz v4, :cond_3b

    .line 69
    new-instance v5, Lcom/squareup/okhttp/ConnectionPool;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-direct {v5, v6, v2, v3}, Lcom/squareup/okhttp/ConnectionPool;-><init>(IJ)V

    sput-object v5, Lcom/squareup/okhttp/ConnectionPool;->systemDefault:Lcom/squareup/okhttp/ConnectionPool;

    goto :goto_28

    .line 71
    :cond_3b
    new-instance v5, Lcom/squareup/okhttp/ConnectionPool;

    const/4 v6, 0x5

    invoke-direct {v5, v6, v2, v3}, Lcom/squareup/okhttp/ConnectionPool;-><init>(IJ)V

    sput-object v5, Lcom/squareup/okhttp/ConnectionPool;->systemDefault:Lcom/squareup/okhttp/ConnectionPool;

    goto :goto_28
.end method

.method public constructor <init>(IJ)V
    .registers 16
    .param p1, "maxIdleConnections"    # I
    .param p2, "keepAliveDurationMs"    # J

    .prologue
    const-wide/16 v10, 0x3e8

    const/4 v3, 0x1

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    .line 82
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v2, 0x0

    const-wide/16 v4, 0x3c

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const-string v0, "OkHttp ConnectionPool"

    invoke-static {v0, v3}, Lcom/squareup/okhttp/internal/Util;->threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    move-result-object v8

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v1, p0, Lcom/squareup/okhttp/ConnectionPool;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 85
    new-instance v0, Lcom/squareup/okhttp/ConnectionPool$1;

    invoke-direct {v0, p0}, Lcom/squareup/okhttp/ConnectionPool$1;-><init>(Lcom/squareup/okhttp/ConnectionPool;)V

    iput-object v0, p0, Lcom/squareup/okhttp/ConnectionPool;->connectionsCleanupRunnable:Ljava/lang/Runnable;

    .line 119
    iput p1, p0, Lcom/squareup/okhttp/ConnectionPool;->maxIdleConnections:I

    .line 120
    mul-long v0, p2, v10

    mul-long/2addr v0, v10

    iput-wide v0, p0, Lcom/squareup/okhttp/ConnectionPool;->keepAliveDurationNs:J

    .line 121
    return-void
.end method

.method static synthetic access$000(Lcom/squareup/okhttp/ConnectionPool;)Ljava/util/LinkedList;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionPool;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/ConnectionPool;)J
    .registers 3
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionPool;

    .prologue
    .line 54
    iget-wide v0, p0, Lcom/squareup/okhttp/ConnectionPool;->keepAliveDurationNs:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/ConnectionPool;)I
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/ConnectionPool;

    .prologue
    .line 54
    iget v0, p0, Lcom/squareup/okhttp/ConnectionPool;->maxIdleConnections:I

    return v0
.end method

.method public static getDefault()Lcom/squareup/okhttp/ConnectionPool;
    .registers 1

    .prologue
    .line 150
    sget-object v0, Lcom/squareup/okhttp/ConnectionPool;->systemDefault:Lcom/squareup/okhttp/ConnectionPool;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized get(Lcom/squareup/okhttp/Address;)Lcom/squareup/okhttp/Connection;
    .registers 10
    .param p1, "address"    # Lcom/squareup/okhttp/Address;

    .prologue
    .line 178
    monitor-enter p0

    const/4 v2, 0x0

    .line 179
    .local v2, "foundConnection":Lcom/squareup/okhttp/Connection;
    :try_start_2
    iget-object v4, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    iget-object v5, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v3

    .line 180
    .local v3, "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/squareup/okhttp/Connection;>;"
    :cond_e
    :goto_e
    invoke-interface {v3}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v4

    if-eqz v4, :cond_52

    .line 181
    invoke-interface {v3}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Connection;

    .line 182
    .local v0, "connection":Lcom/squareup/okhttp/Connection;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/Route;->getAddress()Lcom/squareup/okhttp/Address;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/squareup/okhttp/Address;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getIdleStartTimeNs()J

    move-result-wide v6

    sub-long/2addr v4, v6

    iget-wide v6, p0, Lcom/squareup/okhttp/ConnectionPool;->keepAliveDurationNs:J

    cmp-long v4, v4, v6

    if-gez v4, :cond_e

    .line 187
    invoke-interface {v3}, Ljava/util/ListIterator;->remove()V

    .line 188
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->isSpdy()Z
    :try_end_43
    .catchall {:try_start_2 .. :try_end_43} :catchall_8b

    move-result v4

    if-nez v4, :cond_51

    .line 190
    :try_start_46
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v4

    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/Platform;->tagSocket(Ljava/net/Socket;)V
    :try_end_51
    .catch Ljava/net/SocketException; {:try_start_46 .. :try_end_51} :catch_68
    .catchall {:try_start_46 .. :try_end_51} :catchall_8b

    .line 198
    :cond_51
    move-object v2, v0

    .line 202
    .end local v0    # "connection":Lcom/squareup/okhttp/Connection;
    :cond_52
    if-eqz v2, :cond_5f

    :try_start_54
    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->isSpdy()Z

    move-result v4

    if-eqz v4, :cond_5f

    .line 203
    iget-object v4, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v4, v2}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 206
    :cond_5f
    iget-object v4, p0, Lcom/squareup/okhttp/ConnectionPool;->executorService:Ljava/util/concurrent/ExecutorService;

    iget-object v5, p0, Lcom/squareup/okhttp/ConnectionPool;->connectionsCleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v4, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_66
    .catchall {:try_start_54 .. :try_end_66} :catchall_8b

    .line 207
    monitor-exit p0

    return-object v2

    .line 191
    .restart local v0    # "connection":Lcom/squareup/okhttp/Connection;
    :catch_68
    move-exception v1

    .line 192
    .local v1, "e":Ljava/net/SocketException;
    :try_start_69
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v4

    invoke-static {v4}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 194
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to tagSocket(): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/Platform;->logW(Ljava/lang/String;)V
    :try_end_8a
    .catchall {:try_start_69 .. :try_end_8a} :catchall_8b

    goto :goto_e

    .line 178
    .end local v0    # "connection":Lcom/squareup/okhttp/Connection;
    .end local v1    # "e":Ljava/net/SocketException;
    .end local v3    # "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lcom/squareup/okhttp/Connection;>;"
    :catchall_8b
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method recycle(Lcom/squareup/okhttp/Connection;)V
    .registers 6
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 217
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isSpdy()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 246
    :cond_6
    :goto_6
    return-void

    .line 221
    :cond_7
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->clearOwner()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 225
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isAlive()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 226
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    goto :goto_6

    .line 231
    :cond_1b
    :try_start_1b
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v1

    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/Platform;->untagSocket(Ljava/net/Socket;)V
    :try_end_26
    .catch Ljava/net/SocketException; {:try_start_1b .. :try_end_26} :catch_3b

    .line 239
    monitor-enter p0

    .line 240
    :try_start_27
    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 241
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->incrementRecycleCount()V

    .line 242
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->resetIdleStartTime()V

    .line 243
    monitor-exit p0
    :try_end_33
    .catchall {:try_start_27 .. :try_end_33} :catchall_5e

    .line 245
    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionPool;->executorService:Ljava/util/concurrent/ExecutorService;

    iget-object v2, p0, Lcom/squareup/okhttp/ConnectionPool;->connectionsCleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_6

    .line 232
    :catch_3b
    move-exception v0

    .line 234
    .local v0, "e":Ljava/net/SocketException;
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to untagSocket(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/Platform;->logW(Ljava/lang/String;)V

    .line 235
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    goto :goto_6

    .line 243
    .end local v0    # "e":Ljava/net/SocketException;
    :catchall_5e
    move-exception v1

    :try_start_5f
    monitor-exit p0
    :try_end_60
    .catchall {:try_start_5f .. :try_end_60} :catchall_5e

    throw v1
.end method

.method share(Lcom/squareup/okhttp/Connection;)V
    .registers 4
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;

    .prologue
    .line 253
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isSpdy()Z

    move-result v0

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 254
    :cond_c
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionPool;->executorService:Ljava/util/concurrent/ExecutorService;

    iget-object v1, p0, Lcom/squareup/okhttp/ConnectionPool;->connectionsCleanupRunnable:Ljava/lang/Runnable;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 255
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 256
    monitor-enter p0

    .line 257
    :try_start_1a
    iget-object v0, p0, Lcom/squareup/okhttp/ConnectionPool;->connections:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 258
    monitor-exit p0

    .line 260
    :cond_20
    return-void

    .line 258
    :catchall_21
    move-exception v0

    monitor-exit p0
    :try_end_23
    .catchall {:try_start_1a .. :try_end_23} :catchall_21

    throw v0
.end method
