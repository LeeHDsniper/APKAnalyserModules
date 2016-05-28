.class public Lorg/apache/http/impl/conn/SingleClientConnManager;
.super Ljava/lang/Object;
.source "SingleClientConnManager.java"

# interfaces
.implements Lorg/apache/http/conn/ClientConnectionManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;,
        Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# static fields
.field public static final MISUSE_MESSAGE:Ljava/lang/String; = "Invalid use of SingleClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one."


# instance fields
.field protected final alwaysShutDown:Z

.field protected final connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

.field protected volatile connectionExpiresTime:J
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field protected volatile isShutDown:Z

.field protected volatile lastReleaseTime:J
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final log:Lorg/apache/commons/logging/Log;

.field protected volatile managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field protected final schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

.field protected volatile uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 136
    invoke-static {}, Lorg/apache/http/impl/conn/SchemeRegistryFactory;->createDefault()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/SingleClientConnManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 137
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V
    .registers 5
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    const/4 v2, 0x0

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    .line 122
    const-string v0, "Scheme registry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 123
    iput-object p1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 124
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/SingleClientConnManager;->createConnectionOperator(Lorg/apache/http/conn/scheme/SchemeRegistry;)Lorg/apache/http/conn/ClientConnectionOperator;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    .line 125
    new-instance v0, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    invoke-direct {v0, p0}, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;-><init>(Lorg/apache/http/impl/conn/SingleClientConnManager;)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    .line 126
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    .line 127
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->lastReleaseTime:J

    .line 128
    iput-boolean v2, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->alwaysShutDown:Z

    .line 129
    iput-boolean v2, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->isShutDown:Z

    .line 130
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V
    .registers 3
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;
    .param p2, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 114
    invoke-direct {p0, p2}, Lorg/apache/http/impl/conn/SingleClientConnManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 115
    return-void
.end method


# virtual methods
.method protected final assertStillUp()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 175
    iget-boolean v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->isShutDown:Z

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_5
    const-string v1, "Manager is shut down"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 176
    return-void

    .line 175
    :cond_b
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public closeExpiredConnections()V
    .registers 6

    .prologue
    .line 311
    iget-wide v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->connectionExpiresTime:J

    .line 312
    .local v0, "time":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v2, v2, v0

    if-ltz v2, :cond_11

    .line 313
    const-wide/16 v2, 0x0

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0, v2, v3, v4}, Lorg/apache/http/impl/conn/SingleClientConnManager;->closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V

    .line 315
    :cond_11
    return-void
.end method

.method public closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 13
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 318
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/SingleClientConnManager;->assertStillUp()V

    .line 321
    const-string v3, "Time unit"

    invoke-static {p3, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 323
    monitor-enter p0

    .line 324
    :try_start_9
    iget-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    if-nez v3, :cond_2c

    iget-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    iget-object v3, v3, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-interface {v3}, Lorg/apache/http/conn/OperatedClientConnection;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 325
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v6

    sub-long v0, v4, v6

    .line 327
    .local v0, "cutoff":J
    iget-wide v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->lastReleaseTime:J
    :try_end_23
    .catchall {:try_start_9 .. :try_end_23} :catchall_37

    cmp-long v3, v4, v0

    if-gtz v3, :cond_2c

    .line 329
    :try_start_27
    iget-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    invoke-virtual {v3}, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->close()V
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2c} :catch_2e
    .catchall {:try_start_27 .. :try_end_2c} :catchall_37

    .line 336
    .end local v0    # "cutoff":J
    :cond_2c
    :goto_2c
    :try_start_2c
    monitor-exit p0

    .line 337
    return-void

    .line 330
    .restart local v0    # "cutoff":J
    :catch_2e
    move-exception v2

    .line 332
    .local v2, "iox":Ljava/io/IOException;
    iget-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Problem closing idle connection."

    invoke-interface {v3, v4, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_2c

    .line 336
    .end local v0    # "cutoff":J
    .end local v2    # "iox":Ljava/io/IOException;
    :catchall_37
    move-exception v3

    monitor-exit p0
    :try_end_39
    .catchall {:try_start_2c .. :try_end_39} :catchall_37

    throw v3
.end method

.method protected createConnectionOperator(Lorg/apache/http/conn/scheme/SchemeRegistry;)Lorg/apache/http/conn/ClientConnectionOperator;
    .registers 3
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    .line 166
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
    .line 142
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/SingleClientConnManager;->shutdown()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_7

    .line 144
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 146
    return-void

    .line 144
    :catchall_7
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ManagedClientConnection;
    .registers 12
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 206
    const-string v6, "Route"

    invoke-static {p1, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 207
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/SingleClientConnManager;->assertStillUp()V

    .line 209
    iget-object v6, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_2a

    .line 210
    iget-object v6, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Get connection for route "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 213
    :cond_2a
    monitor-enter p0

    .line 215
    :try_start_2b
    iget-object v6, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    if-nez v6, :cond_73

    move v6, v5

    :goto_30
    const-string v7, "Invalid use of SingleClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one."

    invoke-static {v6, v7}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 218
    const/4 v1, 0x0

    .line 219
    .local v1, "recreate":Z
    const/4 v2, 0x0

    .line 222
    .local v2, "shutdown":Z
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/SingleClientConnManager;->closeExpiredConnections()V

    .line 224
    iget-object v6, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    iget-object v6, v6, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-interface {v6}, Lorg/apache/http/conn/OperatedClientConnection;->isOpen()Z

    move-result v6

    if-eqz v6, :cond_77

    .line 225
    iget-object v6, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    iget-object v3, v6, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    .line 226
    .local v3, "tracker":Lorg/apache/http/conn/routing/RouteTracker;
    if-eqz v3, :cond_54

    invoke-virtual {v3}, Lorg/apache/http/conn/routing/RouteTracker;->toRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v6

    invoke-virtual {v6, p1}, Lorg/apache/http/conn/routing/HttpRoute;->equals(Ljava/lang/Object;)Z
    :try_end_51
    .catchall {:try_start_2b .. :try_end_51} :catchall_82

    move-result v6

    if-nez v6, :cond_75

    :cond_54
    move v2, v5

    .line 237
    .end local v3    # "tracker":Lorg/apache/http/conn/routing/RouteTracker;
    :goto_55
    if-eqz v2, :cond_5d

    .line 238
    const/4 v1, 0x1

    .line 240
    :try_start_58
    iget-object v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    invoke-virtual {v4}, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->shutdown()V
    :try_end_5d
    .catch Ljava/io/IOException; {:try_start_58 .. :try_end_5d} :catch_79
    .catchall {:try_start_58 .. :try_end_5d} :catchall_82

    .line 246
    :cond_5d
    :goto_5d
    if-eqz v1, :cond_66

    .line 247
    :try_start_5f
    new-instance v4, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    invoke-direct {v4, p0}, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;-><init>(Lorg/apache/http/impl/conn/SingleClientConnManager;)V

    iput-object v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    .line 250
    :cond_66
    new-instance v4, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    iget-object v5, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    invoke-direct {v4, p0, v5, p1}, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;-><init>(Lorg/apache/http/impl/conn/SingleClientConnManager;Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;Lorg/apache/http/conn/routing/HttpRoute;)V

    iput-object v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    .line 252
    iget-object v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    monitor-exit p0

    return-object v4

    .end local v1    # "recreate":Z
    .end local v2    # "shutdown":Z
    :cond_73
    move v6, v4

    .line 215
    goto :goto_30

    .restart local v1    # "recreate":Z
    .restart local v2    # "shutdown":Z
    .restart local v3    # "tracker":Lorg/apache/http/conn/routing/RouteTracker;
    :cond_75
    move v2, v4

    .line 226
    goto :goto_55

    .line 234
    .end local v3    # "tracker":Lorg/apache/http/conn/routing/RouteTracker;
    :cond_77
    const/4 v1, 0x1

    goto :goto_55

    .line 241
    :catch_79
    move-exception v0

    .line 242
    .local v0, "iox":Ljava/io/IOException;
    iget-object v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Problem shutting down connection."

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_5d

    .line 253
    .end local v0    # "iox":Ljava/io/IOException;
    .end local v1    # "recreate":Z
    .end local v2    # "shutdown":Z
    :catchall_82
    move-exception v4

    monitor-exit p0
    :try_end_84
    .catchall {:try_start_5f .. :try_end_84} :catchall_82

    throw v4
.end method

.method public getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    return-object v0
.end method

.method public releaseConnection(Lorg/apache/http/conn/ManagedClientConnection;JLjava/util/concurrent/TimeUnit;)V
    .registers 13
    .param p1, "conn"    # Lorg/apache/http/conn/ManagedClientConnection;
    .param p2, "validDuration"    # J
    .param p4, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    const-wide/16 v6, 0x0

    .line 259
    instance-of v3, p1, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    const-string v4, "Connection class mismatch, connection not obtained from this manager"

    invoke-static {v3, v4}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    .line 261
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/SingleClientConnManager;->assertStillUp()V

    .line 263
    iget-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 264
    iget-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

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

    :cond_2c
    move-object v2, p1

    .line 267
    check-cast v2, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    .line 268
    .local v2, "sca":Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    monitor-enter v2

    .line 269
    :try_start_30
    iget-object v3, v2, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->poolEntry:Lorg/apache/http/impl/conn/AbstractPoolEntry;

    if-nez v3, :cond_36

    .line 271
    monitor-exit v2

    .line 308
    :goto_35
    return-void

    .line 273
    :cond_36
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->getManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    .line 274
    .local v1, "manager":Lorg/apache/http/conn/ClientConnectionManager;
    if-ne v1, p0, :cond_84

    const/4 v3, 0x1

    :goto_3d
    const-string v4, "Connection not obtained from this manager"

    invoke-static {v3, v4}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V
    :try_end_42
    .catchall {:try_start_30 .. :try_end_42} :catchall_81

    .line 277
    :try_start_42
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_64

    iget-boolean v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->alwaysShutDown:Z

    if-nez v3, :cond_52

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->isMarkedReusable()Z

    move-result v3

    if-nez v3, :cond_64

    .line 280
    :cond_52
    iget-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_61

    .line 281
    iget-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Released connection open but not reusable."

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 288
    :cond_61
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->shutdown()V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_64} :catch_91
    .catchall {:try_start_42 .. :try_end_64} :catchall_c8

    .line 296
    :cond_64
    :try_start_64
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->detach()V

    .line 297
    monitor-enter p0
    :try_end_68
    .catchall {:try_start_64 .. :try_end_68} :catchall_81

    .line 298
    const/4 v3, 0x0

    :try_start_69
    iput-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    .line 299
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->lastReleaseTime:J

    .line 300
    cmp-long v3, p2, v6

    if-lez v3, :cond_86

    .line 301
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    iget-wide v6, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->lastReleaseTime:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->connectionExpiresTime:J

    .line 305
    :goto_7e
    monitor-exit p0
    :try_end_7f
    .catchall {:try_start_69 .. :try_end_7f} :catchall_8e

    .line 307
    :goto_7f
    :try_start_7f
    monitor-exit v2

    goto :goto_35

    .end local v1    # "manager":Lorg/apache/http/conn/ClientConnectionManager;
    :catchall_81
    move-exception v3

    monitor-exit v2
    :try_end_83
    .catchall {:try_start_7f .. :try_end_83} :catchall_81

    throw v3

    .line 274
    .restart local v1    # "manager":Lorg/apache/http/conn/ClientConnectionManager;
    :cond_84
    const/4 v3, 0x0

    goto :goto_3d

    .line 303
    :cond_86
    const-wide v4, 0x7fffffffffffffffL

    :try_start_8b
    iput-wide v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->connectionExpiresTime:J

    goto :goto_7e

    .line 305
    :catchall_8e
    move-exception v3

    monitor-exit p0
    :try_end_90
    .catchall {:try_start_8b .. :try_end_90} :catchall_8e

    :try_start_90
    throw v3
    :try_end_91
    .catchall {:try_start_90 .. :try_end_91} :catchall_81

    .line 290
    :catch_91
    move-exception v0

    .line 291
    .local v0, "iox":Ljava/io/IOException;
    :try_start_92
    iget-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_a1

    .line 292
    iget-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Exception shutting down released connection."

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_a1
    .catchall {:try_start_92 .. :try_end_a1} :catchall_c8

    .line 296
    :cond_a1
    :try_start_a1
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->detach()V

    .line 297
    monitor-enter p0
    :try_end_a5
    .catchall {:try_start_a1 .. :try_end_a5} :catchall_81

    .line 298
    const/4 v3, 0x0

    :try_start_a6
    iput-object v3, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    .line 299
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->lastReleaseTime:J

    .line 300
    cmp-long v3, p2, v6

    if-lez v3, :cond_c0

    .line 301
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    iget-wide v6, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->lastReleaseTime:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->connectionExpiresTime:J

    .line 305
    :goto_bb
    monitor-exit p0

    goto :goto_7f

    :catchall_bd
    move-exception v3

    monitor-exit p0
    :try_end_bf
    .catchall {:try_start_a6 .. :try_end_bf} :catchall_bd

    :try_start_bf
    throw v3
    :try_end_c0
    .catchall {:try_start_bf .. :try_end_c0} :catchall_81

    .line 303
    :cond_c0
    const-wide v4, 0x7fffffffffffffffL

    :try_start_c5
    iput-wide v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->connectionExpiresTime:J
    :try_end_c7
    .catchall {:try_start_c5 .. :try_end_c7} :catchall_bd

    goto :goto_bb

    .line 296
    .end local v0    # "iox":Ljava/io/IOException;
    :catchall_c8
    move-exception v3

    :try_start_c9
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->detach()V

    .line 297
    monitor-enter p0
    :try_end_cd
    .catchall {:try_start_c9 .. :try_end_cd} :catchall_81

    .line 298
    const/4 v4, 0x0

    :try_start_ce
    iput-object v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    .line 299
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->lastReleaseTime:J

    .line 300
    cmp-long v4, p2, v6

    if-lez v4, :cond_e5

    .line 301
    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    iget-wide v6, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->lastReleaseTime:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->connectionExpiresTime:J

    .line 305
    :goto_e3
    monitor-exit p0
    :try_end_e4
    .catchall {:try_start_ce .. :try_end_e4} :catchall_ed

    :try_start_e4
    throw v3
    :try_end_e5
    .catchall {:try_start_e4 .. :try_end_e5} :catchall_81

    .line 303
    :cond_e5
    const-wide v4, 0x7fffffffffffffffL

    :try_start_ea
    iput-wide v4, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->connectionExpiresTime:J

    goto :goto_e3

    .line 305
    :catchall_ed
    move-exception v3

    monitor-exit p0
    :try_end_ef
    .catchall {:try_start_ea .. :try_end_ef} :catchall_ed

    :try_start_ef
    throw v3
    :try_end_f0
    .catchall {:try_start_ef .. :try_end_f0} :catchall_81
.end method

.method public final requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ClientConnectionRequest;
    .registers 4
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 182
    new-instance v0, Lorg/apache/http/impl/conn/SingleClientConnManager$1;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/http/impl/conn/SingleClientConnManager$1;-><init>(Lorg/apache/http/impl/conn/SingleClientConnManager;Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected revokeConnection()V
    .registers 5

    .prologue
    .line 357
    iget-object v0, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    .line 358
    .local v0, "conn":Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;
    if-nez v0, :cond_5

    .line 371
    :goto_4
    return-void

    .line 361
    :cond_5
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;->detach()V

    .line 363
    monitor-enter p0

    .line 365
    :try_start_9
    iget-object v2, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->shutdown()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_e} :catch_13
    .catchall {:try_start_9 .. :try_end_e} :catchall_10

    .line 370
    :goto_e
    :try_start_e
    monitor-exit p0

    goto :goto_4

    :catchall_10
    move-exception v2

    monitor-exit p0
    :try_end_12
    .catchall {:try_start_e .. :try_end_12} :catchall_10

    throw v2

    .line 366
    :catch_13
    move-exception v1

    .line 368
    .local v1, "iox":Ljava/io/IOException;
    :try_start_14
    iget-object v2, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v3, "Problem while shutting down connection."

    invoke-interface {v2, v3, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_1b
    .catchall {:try_start_14 .. :try_end_1b} :catchall_10

    goto :goto_e
.end method

.method public shutdown()V
    .registers 4

    .prologue
    .line 340
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->isShutDown:Z

    .line 341
    monitor-enter p0

    .line 343
    :try_start_4
    iget-object v1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    if-eqz v1, :cond_d

    .line 344
    iget-object v1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;->shutdown()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_d} :catch_15
    .catchall {:try_start_4 .. :try_end_d} :catchall_27

    .line 350
    :cond_d
    const/4 v1, 0x0

    :try_start_e
    iput-object v1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    .line 351
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    .line 353
    :goto_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_24

    .line 354
    return-void

    .line 346
    :catch_15
    move-exception v0

    .line 348
    .local v0, "iox":Ljava/io/IOException;
    :try_start_16
    iget-object v1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Problem while shutting down manager."

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_1d
    .catchall {:try_start_16 .. :try_end_1d} :catchall_27

    .line 350
    const/4 v1, 0x0

    :try_start_1e
    iput-object v1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    .line 351
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    goto :goto_13

    .line 353
    .end local v0    # "iox":Ljava/io/IOException;
    :catchall_24
    move-exception v1

    monitor-exit p0
    :try_end_26
    .catchall {:try_start_1e .. :try_end_26} :catchall_24

    throw v1

    .line 350
    :catchall_27
    move-exception v1

    const/4 v2, 0x0

    :try_start_29
    iput-object v2, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->uniquePoolEntry:Lorg/apache/http/impl/conn/SingleClientConnManager$PoolEntry;

    .line 351
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/http/impl/conn/SingleClientConnManager;->managedConn:Lorg/apache/http/impl/conn/SingleClientConnManager$ConnAdapter;

    throw v1
    :try_end_2f
    .catchall {:try_start_29 .. :try_end_2f} :catchall_24
.end method
