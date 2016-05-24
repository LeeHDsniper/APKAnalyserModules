.class Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;
.super Ljava/lang/Object;
.source "ManagedClientConnectionImpl.java"

# interfaces
.implements Lorg/apache/http/conn/ManagedClientConnection;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private volatile duration:J

.field private final manager:Lorg/apache/http/conn/ClientConnectionManager;

.field private final operator:Lorg/apache/http/conn/ClientConnectionOperator;

.field private volatile poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

.field private volatile reusable:Z


# direct methods
.method constructor <init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/impl/conn/HttpPoolEntry;)V
    .registers 6
    .param p1, "manager"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p2, "operator"    # Lorg/apache/http/conn/ClientConnectionOperator;
    .param p3, "entry"    # Lorg/apache/http/impl/conn/HttpPoolEntry;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const-string v0, "Connection manager"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 77
    const-string v0, "Connection operator"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 78
    const-string v0, "HTTP pool entry"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 79
    iput-object p1, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->manager:Lorg/apache/http/conn/ClientConnectionManager;

    .line 80
    iput-object p2, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->operator:Lorg/apache/http/conn/ClientConnectionOperator;

    .line 81
    iput-object p3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 82
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->reusable:Z

    .line 83
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->duration:J

    .line 84
    return-void
.end method

.method private ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;
    .registers 3

    .prologue
    .line 113
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 114
    .local v0, "local":Lorg/apache/http/impl/conn/HttpPoolEntry;
    if-nez v0, :cond_a

    .line 115
    new-instance v1, Lorg/apache/http/impl/conn/ConnectionShutdownException;

    invoke-direct {v1}, Lorg/apache/http/impl/conn/ConnectionShutdownException;-><init>()V

    throw v1

    .line 117
    :cond_a
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/conn/OperatedClientConnection;

    return-object v1
.end method

.method private ensurePoolEntry()Lorg/apache/http/impl/conn/HttpPoolEntry;
    .registers 3

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 122
    .local v0, "local":Lorg/apache/http/impl/conn/HttpPoolEntry;
    if-nez v0, :cond_a

    .line 123
    new-instance v1, Lorg/apache/http/impl/conn/ConnectionShutdownException;

    invoke-direct {v1}, Lorg/apache/http/impl/conn/ConnectionShutdownException;-><init>()V

    throw v1

    .line 125
    :cond_a
    return-object v0
.end method

.method private getConnection()Lorg/apache/http/conn/OperatedClientConnection;
    .registers 3

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 106
    .local v0, "local":Lorg/apache/http/impl/conn/HttpPoolEntry;
    if-nez v0, :cond_6

    .line 107
    const/4 v1, 0x0

    .line 109
    :goto_5
    return-object v1

    :cond_6
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/conn/OperatedClientConnection;

    goto :goto_5
.end method


# virtual methods
.method public abortConnection()V
    .registers 6

    .prologue
    .line 446
    monitor-enter p0

    .line 447
    :try_start_1
    iget-object v1, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v1, :cond_7

    .line 448
    monitor-exit p0

    .line 459
    :goto_6
    return-void

    .line 450
    :cond_7
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->reusable:Z

    .line 451
    iget-object v1, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/OperatedClientConnection;
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_23

    .line 453
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    :try_start_12
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->shutdown()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_15} :catch_26
    .catchall {:try_start_12 .. :try_end_15} :catchall_23

    .line 456
    :goto_15
    :try_start_15
    iget-object v1, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->manager:Lorg/apache/http/conn/ClientConnectionManager;

    iget-wide v2, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->duration:J

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, p0, v2, v3, v4}, Lorg/apache/http/conn/ClientConnectionManager;->releaseConnection(Lorg/apache/http/conn/ManagedClientConnection;JLjava/util/concurrent/TimeUnit;)V

    .line 457
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 458
    monitor-exit p0

    goto :goto_6

    .end local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    :catchall_23
    move-exception v1

    monitor-exit p0
    :try_end_25
    .catchall {:try_start_15 .. :try_end_25} :catchall_23

    throw v1

    .line 454
    .restart local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    :catch_26
    move-exception v1

    goto :goto_15
.end method

.method public bind(Ljava/net/Socket;)V
    .registers 3
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 238
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    iget-object v1, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 130
    .local v1, "local":Lorg/apache/http/impl/conn/HttpPoolEntry;
    if-eqz v1, :cond_14

    .line 131
    invoke-virtual {v1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/OperatedClientConnection;

    .line 132
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-virtual {v1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->reset()V

    .line 133
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->close()V

    .line 135
    .end local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    :cond_14
    return-void
.end method

.method detach()Lorg/apache/http/impl/conn/HttpPoolEntry;
    .registers 3

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 96
    .local v0, "local":Lorg/apache/http/impl/conn/HttpPoolEntry;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 97
    return-object v0
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 181
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->flush()V

    .line 182
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 257
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 258
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    instance-of v1, v0, Lorg/apache/http/protocol/HttpContext;

    if-eqz v1, :cond_f

    .line 259
    check-cast v0, Lorg/apache/http/protocol/HttpContext;

    .end local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0, p1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 261
    :goto_e
    return-object v1

    .restart local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .registers 3

    .prologue
    .line 213
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 214
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    return-object v1
.end method

.method public getLocalPort()I
    .registers 3

    .prologue
    .line 218
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 219
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->getLocalPort()I

    move-result v1

    return v1
.end method

.method public getManager()Lorg/apache/http/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->manager:Lorg/apache/http/conn/ClientConnectionManager;

    return-object v0
.end method

.method public getMetrics()Lorg/apache/http/HttpConnectionMetrics;
    .registers 3

    .prologue
    .line 175
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 176
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->getMetrics()Lorg/apache/http/HttpConnectionMetrics;

    move-result-object v1

    return-object v1
.end method

.method getPoolEntry()Lorg/apache/http/impl/conn/HttpPoolEntry;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    return-object v0
.end method

.method public getRemoteAddress()Ljava/net/InetAddress;
    .registers 3

    .prologue
    .line 223
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 224
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v1

    return-object v1
.end method

.method public getRemotePort()I
    .registers 3

    .prologue
    .line 228
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 229
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->getRemotePort()I

    move-result v1

    return v1
.end method

.method public getRoute()Lorg/apache/http/conn/routing/HttpRoute;
    .registers 3

    .prologue
    .line 282
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensurePoolEntry()Lorg/apache/http/impl/conn/HttpPoolEntry;

    move-result-object v0

    .line 283
    .local v0, "local":Lorg/apache/http/impl/conn/HttpPoolEntry;
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getEffectiveRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v1

    return-object v1
.end method

.method public getSSLSession()Ljavax/net/ssl/SSLSession;
    .registers 5

    .prologue
    .line 247
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 248
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    const/4 v1, 0x0

    .line 249
    .local v1, "result":Ljavax/net/ssl/SSLSession;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v2

    .line 250
    .local v2, "sock":Ljava/net/Socket;
    instance-of v3, v2, Ljavax/net/ssl/SSLSocket;

    if-eqz v3, :cond_13

    .line 251
    check-cast v2, Ljavax/net/ssl/SSLSocket;

    .end local v2    # "sock":Ljava/net/Socket;
    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v1

    .line 253
    :cond_13
    return-object v1
.end method

.method public getSocket()Ljava/net/Socket;
    .registers 3

    .prologue
    .line 242
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 243
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v1

    return-object v1
.end method

.method public getSocketTimeout()I
    .registers 3

    .prologue
    .line 170
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 171
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->getSocketTimeout()I

    move-result v1

    return v1
.end method

.method public getState()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 406
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensurePoolEntry()Lorg/apache/http/impl/conn/HttpPoolEntry;

    move-result-object v0

    .line 407
    .local v0, "local":Lorg/apache/http/impl/conn/HttpPoolEntry;
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getState()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public isMarkedReusable()Z
    .registers 2

    .prologue
    .line 424
    iget-boolean v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->reusable:Z

    return v0
.end method

.method public isOpen()Z
    .registers 3

    .prologue
    .line 147
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->getConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 148
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    if-eqz v0, :cond_b

    .line 149
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->isOpen()Z

    move-result v1

    .line 151
    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public isResponseAvailable(I)Z
    .registers 4
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 185
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 186
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0, p1}, Lorg/apache/http/conn/OperatedClientConnection;->isResponseAvailable(I)Z

    move-result v1

    return v1
.end method

.method public isSecure()Z
    .registers 3

    .prologue
    .line 233
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 234
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->isSecure()Z

    move-result v1

    return v1
.end method

.method public isStale()Z
    .registers 3

    .prologue
    .line 156
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->getConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 157
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    if-eqz v0, :cond_b

    .line 158
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->isStale()Z

    move-result v1

    .line 160
    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x1

    goto :goto_a
.end method

.method public layerProtocol(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .registers 8
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 379
    const-string v3, "HTTP parameters"

    invoke-static {p2, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 382
    monitor-enter p0

    .line 383
    :try_start_6
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v3, :cond_13

    .line 384
    new-instance v3, Lorg/apache/http/impl/conn/ConnectionShutdownException;

    invoke-direct {v3}, Lorg/apache/http/impl/conn/ConnectionShutdownException;-><init>()V

    throw v3

    .line 393
    :catchall_10
    move-exception v3

    monitor-exit p0
    :try_end_12
    .catchall {:try_start_6 .. :try_end_12} :catchall_10

    throw v3

    .line 386
    :cond_13
    :try_start_13
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v3}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v2

    .line 387
    .local v2, "tracker":Lorg/apache/http/conn/routing/RouteTracker;
    const-string v3, "Route tracker"

    invoke-static {v2, v3}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 388
    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->isConnected()Z

    move-result v3

    const-string v4, "Connection not open"

    invoke-static {v3, v4}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 389
    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->isTunnelled()Z

    move-result v3

    const-string v4, "Protocol layering without a tunnel not supported"

    invoke-static {v3, v4}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 390
    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->isLayered()Z

    move-result v3

    if-nez v3, :cond_5c

    const/4 v3, 0x1

    :goto_37
    const-string v4, "Multiple protocol layering not supported"

    invoke-static {v3, v4}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 391
    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 392
    .local v1, "target":Lorg/apache/http/HttpHost;
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v3}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/OperatedClientConnection;

    .line 393
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    monitor-exit p0
    :try_end_49
    .catchall {:try_start_13 .. :try_end_49} :catchall_10

    .line 394
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->operator:Lorg/apache/http/conn/ClientConnectionOperator;

    invoke-interface {v3, v0, v1, p1, p2}, Lorg/apache/http/conn/ClientConnectionOperator;->updateSecureConnection(Lorg/apache/http/conn/OperatedClientConnection;Lorg/apache/http/HttpHost;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 396
    monitor-enter p0

    .line 397
    :try_start_4f
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v3, :cond_5e

    .line 398
    new-instance v3, Ljava/io/InterruptedIOException;

    invoke-direct {v3}, Ljava/io/InterruptedIOException;-><init>()V

    throw v3

    .line 402
    :catchall_59
    move-exception v3

    monitor-exit p0
    :try_end_5b
    .catchall {:try_start_4f .. :try_end_5b} :catchall_59

    throw v3

    .line 390
    .end local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    .end local v1    # "target":Lorg/apache/http/HttpHost;
    :cond_5c
    const/4 v3, 0x0

    goto :goto_37

    .line 400
    .restart local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    .restart local v1    # "target":Lorg/apache/http/HttpHost;
    :cond_5e
    :try_start_5e
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v3}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v2

    .line 401
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->isSecure()Z

    move-result v3

    invoke-virtual {v2, v3}, Lorg/apache/http/conn/routing/RouteTracker;->layerProtocol(Z)V

    .line 402
    monitor-exit p0
    :try_end_6c
    .catchall {:try_start_5e .. :try_end_6c} :catchall_59

    .line 403
    return-void
.end method

.method public markReusable()V
    .registers 2

    .prologue
    .line 416
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->reusable:Z

    .line 417
    return-void
.end method

.method public open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .registers 12
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    const-string v0, "Route"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 291
    const-string v0, "HTTP parameters"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 293
    monitor-enter p0

    .line 294
    :try_start_b
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v0, :cond_18

    .line 295
    new-instance v0, Lorg/apache/http/impl/conn/ConnectionShutdownException;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/ConnectionShutdownException;-><init>()V

    throw v0

    .line 301
    :catchall_15
    move-exception v0

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_b .. :try_end_17} :catchall_15

    throw v0

    .line 297
    :cond_18
    :try_start_18
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v7

    .line 298
    .local v7, "tracker":Lorg/apache/http/conn/routing/RouteTracker;
    const-string v0, "Route tracker"

    invoke-static {v7, v0}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 299
    invoke-virtual {v7}, Lorg/apache/http/conn/routing/RouteTracker;->isConnected()Z

    move-result v0

    if-nez v0, :cond_58

    const/4 v0, 0x1

    :goto_2a
    const-string v2, "Connection already open"

    invoke-static {v0, v2}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 300
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/conn/OperatedClientConnection;

    .line 301
    .local v1, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    monitor-exit p0
    :try_end_38
    .catchall {:try_start_18 .. :try_end_38} :catchall_15

    .line 303
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v6

    .line 304
    .local v6, "proxy":Lorg/apache/http/HttpHost;
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->operator:Lorg/apache/http/conn/ClientConnectionOperator;

    if-eqz v6, :cond_5a

    move-object v2, v6

    :goto_41
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v3

    move-object v4, p2

    move-object v5, p3

    invoke-interface/range {v0 .. v5}, Lorg/apache/http/conn/ClientConnectionOperator;->openConnection(Lorg/apache/http/conn/OperatedClientConnection;Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 310
    monitor-enter p0

    .line 311
    :try_start_4b
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v0, :cond_5f

    .line 312
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0

    .line 320
    :catchall_55
    move-exception v0

    monitor-exit p0
    :try_end_57
    .catchall {:try_start_4b .. :try_end_57} :catchall_55

    throw v0

    .line 299
    .end local v1    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    .end local v6    # "proxy":Lorg/apache/http/HttpHost;
    :cond_58
    const/4 v0, 0x0

    goto :goto_2a

    .line 304
    .restart local v1    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    .restart local v6    # "proxy":Lorg/apache/http/HttpHost;
    :cond_5a
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    goto :goto_41

    .line 314
    :cond_5f
    :try_start_5f
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v7

    .line 315
    if-nez v6, :cond_70

    .line 316
    invoke-interface {v1}, Lorg/apache/http/conn/OperatedClientConnection;->isSecure()Z

    move-result v0

    invoke-virtual {v7, v0}, Lorg/apache/http/conn/routing/RouteTracker;->connectTarget(Z)V

    .line 320
    :goto_6e
    monitor-exit p0

    .line 321
    return-void

    .line 318
    :cond_70
    invoke-interface {v1}, Lorg/apache/http/conn/OperatedClientConnection;->isSecure()Z

    move-result v0

    invoke-virtual {v7, v6, v0}, Lorg/apache/http/conn/routing/RouteTracker;->connectProxy(Lorg/apache/http/HttpHost;Z)V
    :try_end_77
    .catchall {:try_start_5f .. :try_end_77} :catchall_55

    goto :goto_6e
.end method

.method public receiveResponseEntity(Lorg/apache/http/HttpResponse;)V
    .registers 3
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 192
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0, p1}, Lorg/apache/http/conn/OperatedClientConnection;->receiveResponseEntity(Lorg/apache/http/HttpResponse;)V

    .line 193
    return-void
.end method

.method public receiveResponseHeader()Lorg/apache/http/HttpResponse;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 197
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->receiveResponseHeader()Lorg/apache/http/HttpResponse;

    move-result-object v1

    return-object v1
.end method

.method public releaseConnection()V
    .registers 5

    .prologue
    .line 436
    monitor-enter p0

    .line 437
    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v0, :cond_7

    .line 438
    monitor-exit p0

    .line 443
    :goto_6
    return-void

    .line 440
    :cond_7
    iget-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->manager:Lorg/apache/http/conn/ClientConnectionManager;

    iget-wide v2, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->duration:J

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p0, v2, v3, v1}, Lorg/apache/http/conn/ClientConnectionManager;->releaseConnection(Lorg/apache/http/conn/ManagedClientConnection;JLjava/util/concurrent/TimeUnit;)V

    .line 441
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 442
    monitor-exit p0

    goto :goto_6

    :catchall_15
    move-exception v0

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 266
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 267
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    instance-of v1, v0, Lorg/apache/http/protocol/HttpContext;

    if-eqz v1, :cond_f

    .line 268
    check-cast v0, Lorg/apache/http/protocol/HttpContext;

    .end local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0, p1}, Lorg/apache/http/protocol/HttpContext;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 270
    :goto_e
    return-object v1

    .restart local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public sendRequestEntity(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    .registers 3
    .param p1, "request"    # Lorg/apache/http/HttpEntityEnclosingRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 203
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0, p1}, Lorg/apache/http/conn/OperatedClientConnection;->sendRequestEntity(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    .line 204
    return-void
.end method

.method public sendRequestHeader(Lorg/apache/http/HttpRequest;)V
    .registers 3
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 208
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 209
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0, p1}, Lorg/apache/http/conn/OperatedClientConnection;->sendRequestHeader(Lorg/apache/http/HttpRequest;)V

    .line 210
    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 275
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 276
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    instance-of v1, v0, Lorg/apache/http/protocol/HttpContext;

    if-eqz v1, :cond_d

    .line 277
    check-cast v0, Lorg/apache/http/protocol/HttpContext;

    .end local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0, p1, p2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 279
    :cond_d
    return-void
.end method

.method public setIdleDuration(JLjava/util/concurrent/TimeUnit;)V
    .registers 7
    .param p1, "duration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 428
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_d

    .line 429
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->duration:J

    .line 433
    :goto_c
    return-void

    .line 431
    :cond_d
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->duration:J

    goto :goto_c
.end method

.method public setSocketTimeout(I)V
    .registers 3
    .param p1, "timeout"    # I

    .prologue
    .line 165
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensureConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 166
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0, p1}, Lorg/apache/http/conn/OperatedClientConnection;->setSocketTimeout(I)V

    .line 167
    return-void
.end method

.method public setState(Ljava/lang/Object;)V
    .registers 3
    .param p1, "state"    # Ljava/lang/Object;

    .prologue
    .line 411
    invoke-direct {p0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->ensurePoolEntry()Lorg/apache/http/impl/conn/HttpPoolEntry;

    move-result-object v0

    .line 412
    .local v0, "local":Lorg/apache/http/impl/conn/HttpPoolEntry;
    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->setState(Ljava/lang/Object;)V

    .line 413
    return-void
.end method

.method public shutdown()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    iget-object v1, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 139
    .local v1, "local":Lorg/apache/http/impl/conn/HttpPoolEntry;
    if-eqz v1, :cond_14

    .line 140
    invoke-virtual {v1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/OperatedClientConnection;

    .line 141
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-virtual {v1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->reset()V

    .line 142
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->shutdown()V

    .line 144
    .end local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    :cond_14
    return-void
.end method

.method public tunnelProxy(Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V
    .registers 8
    .param p1, "next"    # Lorg/apache/http/HttpHost;
    .param p2, "secure"    # Z
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 353
    const-string v2, "Next proxy"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 354
    const-string v2, "HTTP parameters"

    invoke-static {p3, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 356
    monitor-enter p0

    .line 357
    :try_start_b
    iget-object v2, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v2, :cond_18

    .line 358
    new-instance v2, Lorg/apache/http/impl/conn/ConnectionShutdownException;

    invoke-direct {v2}, Lorg/apache/http/impl/conn/ConnectionShutdownException;-><init>()V

    throw v2

    .line 364
    :catchall_15
    move-exception v2

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_b .. :try_end_17} :catchall_15

    throw v2

    .line 360
    :cond_18
    :try_start_18
    iget-object v2, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v1

    .line 361
    .local v1, "tracker":Lorg/apache/http/conn/routing/RouteTracker;
    const-string v2, "Route tracker"

    invoke-static {v1, v2}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 362
    invoke-virtual {v1}, Lorg/apache/http/conn/routing/RouteTracker;->isConnected()Z

    move-result v2

    const-string v3, "Connection not open"

    invoke-static {v2, v3}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 363
    iget-object v2, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/OperatedClientConnection;

    .line 364
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    monitor-exit p0
    :try_end_35
    .catchall {:try_start_18 .. :try_end_35} :catchall_15

    .line 366
    const/4 v2, 0x0

    invoke-interface {v0, v2, p1, p2, p3}, Lorg/apache/http/conn/OperatedClientConnection;->update(Ljava/net/Socket;Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V

    .line 368
    monitor-enter p0

    .line 369
    :try_start_3a
    iget-object v2, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v2, :cond_47

    .line 370
    new-instance v2, Ljava/io/InterruptedIOException;

    invoke-direct {v2}, Ljava/io/InterruptedIOException;-><init>()V

    throw v2

    .line 374
    :catchall_44
    move-exception v2

    monitor-exit p0
    :try_end_46
    .catchall {:try_start_3a .. :try_end_46} :catchall_44

    throw v2

    .line 372
    :cond_47
    :try_start_47
    iget-object v2, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v1

    .line 373
    invoke-virtual {v1, p1, p2}, Lorg/apache/http/conn/routing/RouteTracker;->tunnelProxy(Lorg/apache/http/HttpHost;Z)V

    .line 374
    monitor-exit p0
    :try_end_51
    .catchall {:try_start_47 .. :try_end_51} :catchall_44

    .line 375
    return-void
.end method

.method public tunnelTarget(ZLorg/apache/http/params/HttpParams;)V
    .registers 8
    .param p1, "secure"    # Z
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 325
    const-string v3, "HTTP parameters"

    invoke-static {p2, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 328
    monitor-enter p0

    .line 329
    :try_start_6
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v3, :cond_13

    .line 330
    new-instance v3, Lorg/apache/http/impl/conn/ConnectionShutdownException;

    invoke-direct {v3}, Lorg/apache/http/impl/conn/ConnectionShutdownException;-><init>()V

    throw v3

    .line 338
    :catchall_10
    move-exception v3

    monitor-exit p0
    :try_end_12
    .catchall {:try_start_6 .. :try_end_12} :catchall_10

    throw v3

    .line 332
    :cond_13
    :try_start_13
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v3}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v2

    .line 333
    .local v2, "tracker":Lorg/apache/http/conn/routing/RouteTracker;
    const-string v3, "Route tracker"

    invoke-static {v2, v3}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 334
    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->isConnected()Z

    move-result v3

    const-string v4, "Connection not open"

    invoke-static {v3, v4}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 335
    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->isTunnelled()Z

    move-result v3

    if-nez v3, :cond_52

    const/4 v3, 0x1

    :goto_2e
    const-string v4, "Connection is already tunnelled"

    invoke-static {v3, v4}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 336
    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 337
    .local v1, "target":Lorg/apache/http/HttpHost;
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v3}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/OperatedClientConnection;

    .line 338
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    monitor-exit p0
    :try_end_40
    .catchall {:try_start_13 .. :try_end_40} :catchall_10

    .line 340
    const/4 v3, 0x0

    invoke-interface {v0, v3, v1, p1, p2}, Lorg/apache/http/conn/OperatedClientConnection;->update(Ljava/net/Socket;Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V

    .line 342
    monitor-enter p0

    .line 343
    :try_start_45
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v3, :cond_54

    .line 344
    new-instance v3, Ljava/io/InterruptedIOException;

    invoke-direct {v3}, Ljava/io/InterruptedIOException;-><init>()V

    throw v3

    .line 348
    :catchall_4f
    move-exception v3

    monitor-exit p0
    :try_end_51
    .catchall {:try_start_45 .. :try_end_51} :catchall_4f

    throw v3

    .line 335
    .end local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    .end local v1    # "target":Lorg/apache/http/HttpHost;
    :cond_52
    const/4 v3, 0x0

    goto :goto_2e

    .line 346
    .restart local v0    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    .restart local v1    # "target":Lorg/apache/http/HttpHost;
    :cond_54
    :try_start_54
    iget-object v3, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v3}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v2

    .line 347
    invoke-virtual {v2, p1}, Lorg/apache/http/conn/routing/RouteTracker;->tunnelTarget(Z)V

    .line 348
    monitor-exit p0
    :try_end_5e
    .catchall {:try_start_54 .. :try_end_5e} :catchall_4f

    .line 349
    return-void
.end method

.method public unmarkReusable()V
    .registers 2

    .prologue
    .line 420
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->reusable:Z

    .line 421
    return-void
.end method
