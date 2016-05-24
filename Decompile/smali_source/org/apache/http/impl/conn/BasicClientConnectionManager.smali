.class public Lorg/apache/http/impl/conn/BasicClientConnectionManager;
.super Ljava/lang/Object;
.source "BasicClientConnectionManager.java"

# interfaces
.implements Lorg/apache/http/conn/ClientConnectionManager;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# static fields
.field private static final COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

.field public static final MISUSE_MESSAGE:Ljava/lang/String; = "Invalid use of BasicClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one."


# instance fields
.field private conn:Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

.field private final log:Lorg/apache/commons/logging/Log;

.field private poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

.field private volatile shutdown:Z
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 73
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 110
    invoke-static {}, Lorg/apache/http/impl/conn/SchemeRegistryFactory;->createDefault()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/BasicClientConnectionManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V
    .registers 3
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    .line 104
    const-string v0, "Scheme registry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 105
    iput-object p1, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 106
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->createConnectionOperator(Lorg/apache/http/conn/scheme/SchemeRegistry;)Lorg/apache/http/conn/ClientConnectionOperator;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    .line 107
    return-void
.end method

.method private assertNotShutdown()V
    .registers 3

    .prologue
    .line 150
    iget-boolean v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->shutdown:Z

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_5
    const-string v1, "Connection manager has been shut down"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 151
    return-void

    .line 150
    :cond_b
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private shutdownConnection(Lorg/apache/http/HttpClientConnection;)V
    .registers 5
    .param p1, "conn"    # Lorg/apache/http/HttpClientConnection;

    .prologue
    .line 182
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpClientConnection;->shutdown()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 188
    :cond_3
    :goto_3
    return-void

    .line 183
    :catch_4
    move-exception v0

    .line 184
    .local v0, "iox":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 185
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "I/O exception shutting down connection"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_3
.end method


# virtual methods
.method public closeExpiredConnections()V
    .registers 4

    .prologue
    .line 236
    monitor-enter p0

    .line 237
    :try_start_1
    invoke-direct {p0}, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->assertNotShutdown()V

    .line 238
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 239
    .local v0, "now":J
    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-eqz v2, :cond_22

    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v2, v0, v1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->isExpired(J)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 240
    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/HttpPoolEntry;->close()V

    .line 241
    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->reset()V

    .line 243
    :cond_22
    monitor-exit p0

    .line 244
    return-void

    .line 243
    .end local v0    # "now":J
    :catchall_24
    move-exception v2

    monitor-exit p0
    :try_end_26
    .catchall {:try_start_1 .. :try_end_26} :catchall_24

    throw v2
.end method

.method public closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 11
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 247
    const-string v4, "Time unit"

    invoke-static {p3, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 248
    monitor-enter p0

    .line 249
    :try_start_6
    invoke-direct {p0}, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->assertNotShutdown()V

    .line 250
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    .line 251
    .local v2, "time":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_15

    .line 252
    const-wide/16 v2, 0x0

    .line 254
    :cond_15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v4, v2

    .line 255
    .local v0, "deadline":J
    iget-object v4, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-eqz v4, :cond_37

    iget-object v4, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v4}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getUpdated()J

    move-result-wide v4

    cmp-long v4, v4, v0

    if-gtz v4, :cond_37

    .line 256
    iget-object v4, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v4}, Lorg/apache/http/impl/conn/HttpPoolEntry;->close()V

    .line 257
    iget-object v4, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v4}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/http/conn/routing/RouteTracker;->reset()V

    .line 259
    :cond_37
    monitor-exit p0

    .line 260
    return-void

    .line 259
    .end local v0    # "deadline":J
    .end local v2    # "time":J
    :catchall_39
    move-exception v4

    monitor-exit p0
    :try_end_3b
    .catchall {:try_start_6 .. :try_end_3b} :catchall_39

    throw v4
.end method

.method protected createConnectionOperator(Lorg/apache/http/conn/scheme/SchemeRegistry;)Lorg/apache/http/conn/ClientConnectionOperator;
    .registers 3
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    .line 127
    new-instance v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    return-object v0
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 116
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->shutdown()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_7

    .line 118
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 120
    return-void

    .line 118
    :catchall_7
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method getConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ManagedClientConnection;
    .registers 15
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 154
    const-string v0, "Route"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 155
    monitor-enter p0

    .line 156
    :try_start_6
    invoke-direct {p0}, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->assertNotShutdown()V

    .line 157
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 158
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Get connection for route "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 160
    :cond_29
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->conn:Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    if-nez v0, :cond_96

    const/4 v0, 0x1

    :goto_2e
    const-string v1, "Invalid use of BasicClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one."

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 161
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getPlannedRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/conn/routing/HttpRoute;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4b

    .line 162
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->close()V

    .line 163
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 165
    :cond_4b
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-nez v0, :cond_6d

    .line 166
    sget-object v0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    .line 167
    .local v3, "id":Ljava/lang/String;
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionOperator;->createConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v5

    .line 168
    .local v5, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    new-instance v1, Lorg/apache/http/impl/conn/HttpPoolEntry;

    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-wide/16 v6, 0x0

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v4, p1

    invoke-direct/range {v1 .. v8}, Lorg/apache/http/impl/conn/HttpPoolEntry;-><init>(Lorg/apache/commons/logging/Log;Ljava/lang/String;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/OperatedClientConnection;JLjava/util/concurrent/TimeUnit;)V

    iput-object v1, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 170
    .end local v3    # "id":Ljava/lang/String;
    .end local v5    # "conn":Lorg/apache/http/conn/OperatedClientConnection;
    :cond_6d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 171
    .local v10, "now":J
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v0, v10, v11}, Lorg/apache/http/impl/conn/HttpPoolEntry;->isExpired(J)Z

    move-result v0

    if-eqz v0, :cond_87

    .line 172
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->close()V

    .line 173
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getTracker()Lorg/apache/http/conn/routing/RouteTracker;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/conn/routing/RouteTracker;->reset()V

    .line 175
    :cond_87
    new-instance v0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-direct {v0, p0, v1, v2}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/impl/conn/HttpPoolEntry;)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->conn:Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    .line 176
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->conn:Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    monitor-exit p0

    return-object v0

    .line 160
    .end local v10    # "now":J
    :cond_96
    const/4 v0, 0x0

    goto :goto_2e

    .line 177
    :catchall_98
    move-exception v0

    monitor-exit p0
    :try_end_9a
    .catchall {:try_start_6 .. :try_end_9a} :catchall_98

    throw v0
.end method

.method public getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    return-object v0
.end method

.method public releaseConnection(Lorg/apache/http/conn/ManagedClientConnection;JLjava/util/concurrent/TimeUnit;)V
    .registers 11
    .param p1, "conn"    # Lorg/apache/http/conn/ManagedClientConnection;
    .param p2, "keepalive"    # J
    .param p4, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 191
    instance-of v3, p1, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    const-string v4, "Connection class mismatch, connection not obtained from this manager"

    invoke-static {v3, v4}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    move-object v0, p1

    .line 193
    check-cast v0, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    .line 194
    .local v0, "managedConn":Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;
    monitor-enter v0

    .line 195
    :try_start_b
    iget-object v3, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 196
    iget-object v3, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Releasing connection "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 198
    :cond_2b
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->getPoolEntry()Lorg/apache/http/impl/conn/HttpPoolEntry;

    move-result-object v3

    if-nez v3, :cond_33

    .line 199
    monitor-exit v0

    .line 233
    :goto_32
    return-void

    .line 201
    :cond_33
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->getManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    .line 202
    .local v1, "manager":Lorg/apache/http/conn/ClientConnectionManager;
    if-ne v1, p0, :cond_4d

    const/4 v3, 0x1

    :goto_3a
    const-string v4, "Connection not obtained from this manager"

    invoke-static {v3, v4}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 203
    monitor-enter p0
    :try_end_40
    .catchall {:try_start_b .. :try_end_40} :catchall_4a

    .line 204
    :try_start_40
    iget-boolean v3, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->shutdown:Z

    if-eqz v3, :cond_4f

    .line 205
    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->shutdownConnection(Lorg/apache/http/HttpClientConnection;)V

    .line 206
    monitor-exit p0
    :try_end_48
    .catchall {:try_start_40 .. :try_end_48} :catchall_dd

    :try_start_48
    monitor-exit v0

    goto :goto_32

    .line 232
    .end local v1    # "manager":Lorg/apache/http/conn/ClientConnectionManager;
    :catchall_4a
    move-exception v3

    monitor-exit v0
    :try_end_4c
    .catchall {:try_start_48 .. :try_end_4c} :catchall_4a

    throw v3

    .line 202
    .restart local v1    # "manager":Lorg/apache/http/conn/ClientConnectionManager;
    :cond_4d
    const/4 v3, 0x0

    goto :goto_3a

    .line 209
    :cond_4f
    :try_start_4f
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_5e

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->isMarkedReusable()Z

    move-result v3

    if-nez v3, :cond_5e

    .line 210
    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->shutdownConnection(Lorg/apache/http/HttpClientConnection;)V

    .line 212
    :cond_5e
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->isMarkedReusable()Z

    move-result v3

    if-eqz v3, :cond_af

    .line 213
    iget-object v4, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-eqz p4, :cond_c4

    move-object v3, p4

    :goto_69
    invoke-virtual {v4, p2, p3, v3}, Lorg/apache/http/impl/conn/HttpPoolEntry;->updateExpiry(JLjava/util/concurrent/TimeUnit;)V

    .line 214
    iget-object v3, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_af

    .line 216
    const-wide/16 v4, 0x0

    cmp-long v3, p2, v4

    if-lez v3, :cond_c7

    .line 217
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 221
    .local v2, "s":Ljava/lang/String;
    :goto_97
    iget-object v3, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Connection can be kept alive "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_af
    .catchall {:try_start_4f .. :try_end_af} :catchall_ca

    .line 225
    .end local v2    # "s":Ljava/lang/String;
    :cond_af
    :try_start_af
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->detach()Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 226
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->conn:Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    .line 227
    iget-object v3, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v3}, Lorg/apache/http/impl/conn/HttpPoolEntry;->isClosed()Z

    move-result v3

    if-eqz v3, :cond_c0

    .line 228
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 231
    :cond_c0
    monitor-exit p0
    :try_end_c1
    .catchall {:try_start_af .. :try_end_c1} :catchall_dd

    .line 232
    :try_start_c1
    monitor-exit v0
    :try_end_c2
    .catchall {:try_start_c1 .. :try_end_c2} :catchall_4a

    goto/16 :goto_32

    .line 213
    :cond_c4
    :try_start_c4
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    goto :goto_69

    .line 219
    :cond_c7
    const-string v2, "indefinitely"
    :try_end_c9
    .catchall {:try_start_c4 .. :try_end_c9} :catchall_ca

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_97

    .line 225
    .end local v2    # "s":Ljava/lang/String;
    :catchall_ca
    move-exception v3

    :try_start_cb
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->detach()Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 226
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->conn:Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    .line 227
    iget-object v4, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v4}, Lorg/apache/http/impl/conn/HttpPoolEntry;->isClosed()Z

    move-result v4

    if-eqz v4, :cond_dc

    .line 228
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    :cond_dc
    throw v3

    .line 231
    :catchall_dd
    move-exception v3

    monitor-exit p0
    :try_end_df
    .catchall {:try_start_cb .. :try_end_df} :catchall_dd

    :try_start_df
    throw v3
    :try_end_e0
    .catchall {:try_start_df .. :try_end_e0} :catchall_4a
.end method

.method public final requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ClientConnectionRequest;
    .registers 4
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 134
    new-instance v0, Lorg/apache/http/impl/conn/BasicClientConnectionManager$1;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/http/impl/conn/BasicClientConnectionManager$1;-><init>(Lorg/apache/http/impl/conn/BasicClientConnectionManager;Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)V

    return-object v0
.end method

.method public shutdown()V
    .registers 3

    .prologue
    .line 263
    monitor-enter p0

    .line 264
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->shutdown:Z
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_1d

    .line 266
    :try_start_4
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    if-eqz v0, :cond_d

    .line 267
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->close()V
    :try_end_d
    .catchall {:try_start_4 .. :try_end_d} :catchall_15

    .line 270
    :cond_d
    const/4 v0, 0x0

    :try_start_e
    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 271
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->conn:Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    .line 273
    monitor-exit p0

    .line 274
    return-void

    .line 270
    :catchall_15
    move-exception v0

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->poolEntry:Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 271
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/BasicClientConnectionManager;->conn:Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    throw v0

    .line 273
    :catchall_1d
    move-exception v0

    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_e .. :try_end_1f} :catchall_1d

    throw v0
.end method
