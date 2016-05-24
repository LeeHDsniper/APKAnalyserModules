.class public abstract Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;
.super Lorg/apache/http/impl/conn/AbstractClientConnAdapter;
.source "AbstractPooledConnAdapter.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field protected volatile poolEntry:Lorg/apache/http/impl/conn/AbstractPoolEntry;


# direct methods
.method protected constructor <init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/impl/conn/AbstractPoolEntry;)V
    .registers 4
    .param p1, "manager"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p2, "entry"    # Lorg/apache/http/impl/conn/AbstractPoolEntry;

    .prologue
    .line 66
    iget-object v0, p2, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/conn/AbstractClientConnAdapter;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/conn/OperatedClientConnection;)V

    .line 67
    iput-object p2, p0, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->poolEntry:Lorg/apache/http/impl/conn/AbstractPoolEntry;

    .line 68
    return-void
.end method


# virtual methods
.method protected final assertAttached()V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->poolEntry:Lorg/apache/http/impl/conn/AbstractPoolEntry;

    if-nez v0, :cond_a

    .line 106
    new-instance v0, Lorg/apache/http/impl/conn/ConnectionShutdownException;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/ConnectionShutdownException;-><init>()V

    throw v0

    .line 108
    :cond_a
    return-void
.end method

.method protected assertValid(Lorg/apache/http/impl/conn/AbstractPoolEntry;)V
    .registers 3
    .param p1, "entry"    # Lorg/apache/http/impl/conn/AbstractPoolEntry;

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->isReleased()Z

    move-result v0

    if-nez v0, :cond_8

    if-nez p1, :cond_e

    .line 96
    :cond_8
    new-instance v0, Lorg/apache/http/impl/conn/ConnectionShutdownException;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/ConnectionShutdownException;-><init>()V

    throw v0

    .line 98
    :cond_e
    return-void
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v1

    .line 157
    .local v1, "entry":Lorg/apache/http/impl/conn/AbstractPoolEntry;
    if-eqz v1, :cond_9

    .line 158
    invoke-virtual {v1}, Lorg/apache/http/impl/conn/AbstractPoolEntry;->shutdownEntry()V

    .line 161
    :cond_9
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getWrappedConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 162
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    if-eqz v0, :cond_12

    .line 163
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->close()V

    .line 165
    :cond_12
    return-void
.end method

.method protected declared-synchronized detach()V
    .registers 2

    .prologue
    .line 116
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->poolEntry:Lorg/apache/http/impl/conn/AbstractPoolEntry;

    .line 117
    invoke-super {p0}, Lorg/apache/http/impl/conn/AbstractClientConnAdapter;->detach()V
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_9

    .line 118
    monitor-exit p0

    return-void

    .line 116
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->poolEntry:Lorg/apache/http/impl/conn/AbstractPoolEntry;

    return-object v0
.end method

.method public getRoute()Lorg/apache/http/conn/routing/HttpRoute;
    .registers 3

    .prologue
    .line 121
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v0

    .line 122
    .local v0, "entry":Lorg/apache/http/impl/conn/AbstractPoolEntry;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->assertValid(Lorg/apache/http/impl/conn/AbstractPoolEntry;)V

    .line 123
    iget-object v1, v0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    if-nez v1, :cond_d

    const/4 v1, 0x0

    :goto_c
    return-object v1

    :cond_d
    iget-object v1, v0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v1}, Lorg/apache/http/conn/routing/RouteTracker;->toRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v1

    goto :goto_c
.end method

.method public getState()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 180
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v0

    .line 181
    .local v0, "entry":Lorg/apache/http/impl/conn/AbstractPoolEntry;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->assertValid(Lorg/apache/http/impl/conn/AbstractPoolEntry;)V

    .line 182
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/AbstractPoolEntry;->getState()Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public layerProtocol(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .registers 4
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v0

    .line 151
    .local v0, "entry":Lorg/apache/http/impl/conn/AbstractPoolEntry;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->assertValid(Lorg/apache/http/impl/conn/AbstractPoolEntry;)V

    .line 152
    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/conn/AbstractPoolEntry;->layerProtocol(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 153
    return-void
.end method

.method public open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .registers 5
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v0

    .line 130
    .local v0, "entry":Lorg/apache/http/impl/conn/AbstractPoolEntry;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->assertValid(Lorg/apache/http/impl/conn/AbstractPoolEntry;)V

    .line 131
    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/http/impl/conn/AbstractPoolEntry;->open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 132
    return-void
.end method

.method public setState(Ljava/lang/Object;)V
    .registers 3
    .param p1, "state"    # Ljava/lang/Object;

    .prologue
    .line 186
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v0

    .line 187
    .local v0, "entry":Lorg/apache/http/impl/conn/AbstractPoolEntry;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->assertValid(Lorg/apache/http/impl/conn/AbstractPoolEntry;)V

    .line 188
    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/AbstractPoolEntry;->setState(Ljava/lang/Object;)V

    .line 189
    return-void
.end method

.method public shutdown()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v1

    .line 169
    .local v1, "entry":Lorg/apache/http/impl/conn/AbstractPoolEntry;
    if-eqz v1, :cond_9

    .line 170
    invoke-virtual {v1}, Lorg/apache/http/impl/conn/AbstractPoolEntry;->shutdownEntry()V

    .line 173
    :cond_9
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getWrappedConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    .line 174
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    if-eqz v0, :cond_12

    .line 175
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->shutdown()V

    .line 177
    :cond_12
    return-void
.end method

.method public tunnelProxy(Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V
    .registers 5
    .param p1, "next"    # Lorg/apache/http/HttpHost;
    .param p2, "secure"    # Z
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v0

    .line 144
    .local v0, "entry":Lorg/apache/http/impl/conn/AbstractPoolEntry;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->assertValid(Lorg/apache/http/impl/conn/AbstractPoolEntry;)V

    .line 145
    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tunnelProxy(Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V

    .line 146
    return-void
.end method

.method public tunnelTarget(ZLorg/apache/http/params/HttpParams;)V
    .registers 4
    .param p1, "secure"    # Z
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->getPoolEntry()Lorg/apache/http/impl/conn/AbstractPoolEntry;

    move-result-object v0

    .line 137
    .local v0, "entry":Lorg/apache/http/impl/conn/AbstractPoolEntry;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/conn/AbstractPooledConnAdapter;->assertValid(Lorg/apache/http/impl/conn/AbstractPoolEntry;)V

    .line 138
    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tunnelTarget(ZLorg/apache/http/params/HttpParams;)V

    .line 139
    return-void
.end method
