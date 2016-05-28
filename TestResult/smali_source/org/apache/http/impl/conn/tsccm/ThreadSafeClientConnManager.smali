.class public Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;
.super Ljava/lang/Object;
.source "ThreadSafeClientConnManager.java"

# interfaces
.implements Lorg/apache/http/conn/ClientConnectionManager;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field protected final connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

.field protected final connPerRoute:Lorg/apache/http/conn/params/ConnPerRouteBean;

.field protected final connectionPool:Lorg/apache/http/impl/conn/tsccm/AbstractConnPool;

.field private final log:Lorg/apache/commons/logging/Log;

.field protected final pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

.field protected final schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 101
    invoke-static {}, Lorg/apache/http/impl/conn/SchemeRegistryFactory;->createDefault()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V
    .registers 5
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    .line 94
    const-wide/16 v0, -0x1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;JLjava/util/concurrent/TimeUnit;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;JLjava/util/concurrent/TimeUnit;)V
    .registers 11
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;
    .param p2, "connTTL"    # J
    .param p4, "connTTLTimeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 115
    new-instance v5, Lorg/apache/http/conn/params/ConnPerRouteBean;

    invoke-direct {v5}, Lorg/apache/http/conn/params/ConnPerRouteBean;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/conn/params/ConnPerRouteBean;)V

    .line 116
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/conn/params/ConnPerRouteBean;)V
    .registers 8
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;
    .param p2, "connTTL"    # J
    .param p4, "connTTLTimeUnit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "connPerRoute"    # Lorg/apache/http/conn/params/ConnPerRouteBean;

    .prologue
    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    const-string v0, "Scheme registry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 134
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    .line 135
    iput-object p1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 136
    iput-object p5, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connPerRoute:Lorg/apache/http/conn/params/ConnPerRouteBean;

    .line 137
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->createConnectionOperator(Lorg/apache/http/conn/scheme/SchemeRegistry;)Lorg/apache/http/conn/ClientConnectionOperator;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    .line 138
    invoke-virtual {p0, p2, p3, p4}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->createConnectionPool(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    .line 139
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    iput-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connectionPool:Lorg/apache/http/impl/conn/tsccm/AbstractConnPool;

    .line 140
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V
    .registers 4
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;
    .param p2, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    const-string v0, "Scheme registry"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 154
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    .line 155
    iput-object p2, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 156
    new-instance v0, Lorg/apache/http/conn/params/ConnPerRouteBean;

    invoke-direct {v0}, Lorg/apache/http/conn/params/ConnPerRouteBean;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connPerRoute:Lorg/apache/http/conn/params/ConnPerRouteBean;

    .line 157
    invoke-virtual {p0, p2}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->createConnectionOperator(Lorg/apache/http/conn/scheme/SchemeRegistry;)Lorg/apache/http/conn/ClientConnectionOperator;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    .line 158
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->createConnectionPool(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/impl/conn/tsccm/AbstractConnPool;

    move-result-object v0

    check-cast v0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    iput-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    .line 159
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    iput-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connectionPool:Lorg/apache/http/impl/conn/tsccm/AbstractConnPool;

    .line 160
    return-void
.end method

.method static synthetic access$000(Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;)Lorg/apache/commons/logging/Log;
    .registers 2
    .param p0, "x0"    # Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    return-object v0
.end method


# virtual methods
.method public closeExpiredConnections()V
    .registers 3

    .prologue
    .line 330
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v1, "Closing expired connections"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 331
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->closeExpiredConnections()V

    .line 332
    return-void
.end method

.method public closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 7
    .param p1, "idleTimeout"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 323
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 324
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Closing connections idle longer than "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 326
    :cond_2a
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V

    .line 327
    return-void
.end method

.method protected createConnectionOperator(Lorg/apache/http/conn/scheme/SchemeRegistry;)Lorg/apache/http/conn/ClientConnectionOperator;
    .registers 3
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    .line 209
    new-instance v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    return-object v0
.end method

.method protected createConnectionPool(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/impl/conn/tsccm/AbstractConnPool;
    .registers 4
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 180
    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    invoke-direct {v0, v1, p1}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;-><init>(Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/params/HttpParams;)V

    return-object v0
.end method

.method protected createConnectionPool(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;
    .registers 11
    .param p1, "connTTL"    # J
    .param p3, "connTTLTimeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 191
    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    iget-object v2, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connPerRoute:Lorg/apache/http/conn/params/ConnPerRouteBean;

    const/16 v3, 0x14

    move-wide v4, p1

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;-><init>(Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/conn/params/ConnPerRoute;IJLjava/util/concurrent/TimeUnit;)V

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
    .line 165
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->shutdown()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_7

    .line 167
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 169
    return-void

    .line 167
    :catchall_7
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getConnectionsInPool()I
    .registers 2

    .prologue
    .line 319
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->getConnectionsInPool()I

    move-result v0

    return v0
.end method

.method public getConnectionsInPool(Lorg/apache/http/conn/routing/HttpRoute;)I
    .registers 3
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 307
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->getConnectionsInPool(Lorg/apache/http/conn/routing/HttpRoute;)I

    move-result v0

    return v0
.end method

.method public getDefaultMaxPerRoute()I
    .registers 2

    .prologue
    .line 352
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connPerRoute:Lorg/apache/http/conn/params/ConnPerRouteBean;

    invoke-virtual {v0}, Lorg/apache/http/conn/params/ConnPerRouteBean;->getDefaultMaxPerRoute()I

    move-result v0

    return v0
.end method

.method public getMaxForRoute(Lorg/apache/http/conn/routing/HttpRoute;)I
    .registers 3
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 366
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connPerRoute:Lorg/apache/http/conn/params/ConnPerRouteBean;

    invoke-virtual {v0, p1}, Lorg/apache/http/conn/params/ConnPerRouteBean;->getMaxForRoute(Lorg/apache/http/conn/routing/HttpRoute;)I

    move-result v0

    return v0
.end method

.method public getMaxTotal()I
    .registers 2

    .prologue
    .line 338
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->getMaxTotalConnections()I

    move-result v0

    return v0
.end method

.method public getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    return-object v0
.end method

.method public releaseConnection(Lorg/apache/http/conn/ManagedClientConnection;JLjava/util/concurrent/TimeUnit;)V
    .registers 15
    .param p1, "conn"    # Lorg/apache/http/conn/ManagedClientConnection;
    .param p2, "validDuration"    # J
    .param p4, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 247
    instance-of v1, p1, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;

    const-string v4, "Connection class mismatch, connection not obtained from this manager"

    invoke-static {v1, v4}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    move-object v0, p1

    .line 249
    check-cast v0, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;

    .line 250
    .local v0, "hca":Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v1

    if-eqz v1, :cond_1c

    .line 251
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->getManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    if-ne v1, p0, :cond_27

    const/4 v1, 0x1

    :goto_17
    const-string v4, "Connection not obtained from this manager"

    invoke-static {v1, v4}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 253
    :cond_1c
    monitor-enter v0

    .line 254
    :try_start_1d
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v2

    check-cast v2, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;

    .line 255
    .local v2, "entry":Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;
    if-nez v2, :cond_29

    .line 256
    monitor-exit v0
    :try_end_26
    .catchall {:try_start_1d .. :try_end_26} :catchall_59

    .line 289
    :goto_26
    return-void

    .line 251
    .end local v2    # "entry":Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;
    :cond_27
    const/4 v1, 0x0

    goto :goto_17

    .line 260
    .restart local v2    # "entry":Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;
    :cond_29
    :try_start_29
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_38

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->isMarkedReusable()Z

    move-result v1

    if-nez v1, :cond_38

    .line 269
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->shutdown()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_38} :catch_64
    .catchall {:try_start_29 .. :try_end_38} :catchall_9c

    .line 277
    :cond_38
    :try_start_38
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->isMarkedReusable()Z

    move-result v3

    .line 278
    .local v3, "reusable":Z
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_4d

    .line 279
    if-eqz v3, :cond_5c

    .line 280
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Released connection is reusable."

    invoke-interface {v1, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 285
    :cond_4d
    :goto_4d
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->detach()V

    .line 286
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    move-wide v4, p2

    move-object v6, p4

    invoke-virtual/range {v1 .. v6}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->freeEntry(Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;ZJLjava/util/concurrent/TimeUnit;)V

    .line 288
    :goto_57
    monitor-exit v0

    goto :goto_26

    .end local v2    # "entry":Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;
    .end local v3    # "reusable":Z
    :catchall_59
    move-exception v1

    monitor-exit v0
    :try_end_5b
    .catchall {:try_start_38 .. :try_end_5b} :catchall_59

    throw v1

    .line 282
    .restart local v2    # "entry":Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;
    .restart local v3    # "reusable":Z
    :cond_5c
    :try_start_5c
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Released connection is not reusable."

    invoke-interface {v1, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_63
    .catchall {:try_start_5c .. :try_end_63} :catchall_59

    goto :goto_4d

    .line 271
    .end local v3    # "reusable":Z
    :catch_64
    move-exception v7

    .line 272
    .local v7, "iox":Ljava/io/IOException;
    :try_start_65
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_74

    .line 273
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Exception shutting down released connection."

    invoke-interface {v1, v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_74
    .catchall {:try_start_65 .. :try_end_74} :catchall_9c

    .line 277
    :cond_74
    :try_start_74
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->isMarkedReusable()Z

    move-result v3

    .line 278
    .restart local v3    # "reusable":Z
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_89

    .line 279
    if-eqz v3, :cond_94

    .line 280
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Released connection is reusable."

    invoke-interface {v1, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 285
    :cond_89
    :goto_89
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->detach()V

    .line 286
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    move-wide v4, p2

    move-object v6, p4

    invoke-virtual/range {v1 .. v6}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->freeEntry(Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;ZJLjava/util/concurrent/TimeUnit;)V

    goto :goto_57

    .line 282
    :cond_94
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Released connection is not reusable."

    invoke-interface {v1, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_89

    .line 277
    .end local v3    # "reusable":Z
    .end local v7    # "iox":Ljava/io/IOException;
    :catchall_9c
    move-exception v1

    move-object v8, v1

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->isMarkedReusable()Z

    move-result v3

    .line 278
    .restart local v3    # "reusable":Z
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_b3

    .line 279
    if-eqz v3, :cond_be

    .line 280
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Released connection is reusable."

    invoke-interface {v1, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 285
    :cond_b3
    :goto_b3
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/BasicPooledConnAdapter;->detach()V

    .line 286
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    move-wide v4, p2

    move-object v6, p4

    invoke-virtual/range {v1 .. v6}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->freeEntry(Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;ZJLjava/util/concurrent/TimeUnit;)V

    .line 287
    throw v8

    .line 282
    :cond_be
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Released connection is not reusable."

    invoke-interface {v1, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_c5
    .catchall {:try_start_74 .. :try_end_c5} :catchall_59

    goto :goto_b3
.end method

.method public requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ClientConnectionRequest;
    .registers 5
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 220
    iget-object v1, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    invoke-virtual {v1, p1, p2}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->requestPoolEntry(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/impl/conn/tsccm/PoolEntryRequest;

    move-result-object v0

    .line 223
    .local v0, "poolRequest":Lorg/apache/http/impl/conn/tsccm/PoolEntryRequest;
    new-instance v1, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager$1;

    invoke-direct {v1, p0, v0, p1}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager$1;-><init>(Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;Lorg/apache/http/impl/conn/tsccm/PoolEntryRequest;Lorg/apache/http/conn/routing/HttpRoute;)V

    return-object v1
.end method

.method public setDefaultMaxPerRoute(I)V
    .registers 3
    .param p1, "max"    # I

    .prologue
    .line 359
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connPerRoute:Lorg/apache/http/conn/params/ConnPerRouteBean;

    invoke-virtual {v0, p1}, Lorg/apache/http/conn/params/ConnPerRouteBean;->setDefaultMaxPerRoute(I)V

    .line 360
    return-void
.end method

.method public setMaxForRoute(Lorg/apache/http/conn/routing/HttpRoute;I)V
    .registers 4
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "max"    # I

    .prologue
    .line 373
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->connPerRoute:Lorg/apache/http/conn/params/ConnPerRouteBean;

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/conn/params/ConnPerRouteBean;->setMaxForRoute(Lorg/apache/http/conn/routing/HttpRoute;I)V

    .line 374
    return-void
.end method

.method public setMaxTotal(I)V
    .registers 3
    .param p1, "max"    # I

    .prologue
    .line 345
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->setMaxTotalConnections(I)V

    .line 346
    return-void
.end method

.method public shutdown()V
    .registers 3

    .prologue
    .line 292
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->log:Lorg/apache/commons/logging/Log;

    const-string v1, "Shutting down"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 293
    iget-object v0, p0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;->pool:Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/tsccm/ConnPoolByRoute;->shutdown()V

    .line 294
    return-void
.end method
