.class public abstract Lorg/apache/http/impl/conn/AbstractPoolEntry;
.super Ljava/lang/Object;
.source "AbstractPoolEntry.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field protected final connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

.field protected final connection:Lorg/apache/http/conn/OperatedClientConnection;

.field protected volatile route:Lorg/apache/http/conn/routing/HttpRoute;

.field protected volatile state:Ljava/lang/Object;

.field protected volatile tracker:Lorg/apache/http/conn/routing/RouteTracker;


# direct methods
.method protected constructor <init>(Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/conn/routing/HttpRoute;)V
    .registers 4
    .param p1, "connOperator"    # Lorg/apache/http/conn/ClientConnectionOperator;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    const-string v0, "Connection operator"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 93
    iput-object p1, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    .line 94
    invoke-interface {p1}, Lorg/apache/http/conn/ClientConnectionOperator;->createConnection()Lorg/apache/http/conn/OperatedClientConnection;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    .line 95
    iput-object p2, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->route:Lorg/apache/http/conn/routing/HttpRoute;

    .line 96
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    .line 97
    return-void
.end method


# virtual methods
.method public getState()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->state:Ljava/lang/Object;

    return-object v0
.end method

.method public layerProtocol(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    const-string v1, "HTTP parameters"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 231
    iget-object v1, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    const-string v2, "Route tracker"

    invoke-static {v1, v2}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 232
    iget-object v1, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v1}, Lorg/apache/http/conn/routing/RouteTracker;->isConnected()Z

    move-result v1

    const-string v2, "Connection not open"

    invoke-static {v1, v2}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 233
    iget-object v1, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v1}, Lorg/apache/http/conn/routing/RouteTracker;->isTunnelled()Z

    move-result v1

    const-string v2, "Protocol layering without a tunnel not supported"

    invoke-static {v1, v2}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 234
    iget-object v1, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v1}, Lorg/apache/http/conn/routing/RouteTracker;->isLayered()Z

    move-result v1

    if-nez v1, :cond_49

    const/4 v1, 0x1

    :goto_2b
    const-string v2, "Multiple protocol layering not supported"

    invoke-static {v1, v2}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 241
    iget-object v1, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v1}, Lorg/apache/http/conn/routing/RouteTracker;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v0

    .line 243
    .local v0, "target":Lorg/apache/http/HttpHost;
    iget-object v1, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    iget-object v2, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-interface {v1, v2, v0, p1, p2}, Lorg/apache/http/conn/ClientConnectionOperator;->updateSecureConnection(Lorg/apache/http/conn/OperatedClientConnection;Lorg/apache/http/HttpHost;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 246
    iget-object v1, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    iget-object v2, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-interface {v2}, Lorg/apache/http/conn/OperatedClientConnection;->isSecure()Z

    move-result v2

    invoke-virtual {v1, v2}, Lorg/apache/http/conn/routing/RouteTracker;->layerProtocol(Z)V

    .line 248
    return-void

    .line 234
    .end local v0    # "target":Lorg/apache/http/HttpHost;
    :cond_49
    const/4 v1, 0x0

    goto :goto_2b
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
    .line 130
    const-string v0, "Route"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 131
    const-string v0, "HTTP parameters"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 132
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    if-eqz v0, :cond_1c

    .line 133
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v0}, Lorg/apache/http/conn/routing/RouteTracker;->isConnected()Z

    move-result v0

    if-nez v0, :cond_43

    const/4 v0, 0x1

    :goto_17
    const-string v1, "Connection already open"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 141
    :cond_1c
    new-instance v0, Lorg/apache/http/conn/routing/RouteTracker;

    invoke-direct {v0, p1}, Lorg/apache/http/conn/routing/RouteTracker;-><init>(Lorg/apache/http/conn/routing/HttpRoute;)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    .line 142
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v7

    .line 144
    .local v7, "proxy":Lorg/apache/http/HttpHost;
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connOperator:Lorg/apache/http/conn/ClientConnectionOperator;

    iget-object v1, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    if-eqz v7, :cond_45

    move-object v2, v7

    :goto_2e
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v3

    move-object v4, p2

    move-object v5, p3

    invoke-interface/range {v0 .. v5}, Lorg/apache/http/conn/ClientConnectionOperator;->openConnection(Lorg/apache/http/conn/OperatedClientConnection;Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 150
    iget-object v6, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    .line 154
    .local v6, "localTracker":Lorg/apache/http/conn/routing/RouteTracker;
    if-nez v6, :cond_4a

    .line 155
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "Request aborted"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    .end local v6    # "localTracker":Lorg/apache/http/conn/routing/RouteTracker;
    .end local v7    # "proxy":Lorg/apache/http/HttpHost;
    :cond_43
    const/4 v0, 0x0

    goto :goto_17

    .line 144
    .restart local v7    # "proxy":Lorg/apache/http/HttpHost;
    :cond_45
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    goto :goto_2e

    .line 158
    .restart local v6    # "localTracker":Lorg/apache/http/conn/routing/RouteTracker;
    :cond_4a
    if-nez v7, :cond_56

    .line 159
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->isSecure()Z

    move-result v0

    invoke-virtual {v6, v0}, Lorg/apache/http/conn/routing/RouteTracker;->connectTarget(Z)V

    .line 164
    :goto_55
    return-void

    .line 161
    :cond_56
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->isSecure()Z

    move-result v0

    invoke-virtual {v6, v7, v0}, Lorg/apache/http/conn/routing/RouteTracker;->connectProxy(Lorg/apache/http/HttpHost;Z)V

    goto :goto_55
.end method

.method public setState(Ljava/lang/Object;)V
    .registers 2
    .param p1, "state"    # Ljava/lang/Object;

    .prologue
    .line 114
    iput-object p1, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->state:Ljava/lang/Object;

    .line 115
    return-void
.end method

.method protected shutdownEntry()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 257
    iput-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    .line 258
    iput-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->state:Ljava/lang/Object;

    .line 259
    return-void
.end method

.method public tunnelProxy(Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "next"    # Lorg/apache/http/HttpHost;
    .param p2, "secure"    # Z
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 208
    const-string v0, "Next proxy"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 209
    const-string v0, "Parameters"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 211
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    const-string v1, "Route tracker"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 212
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v0}, Lorg/apache/http/conn/routing/RouteTracker;->isConnected()Z

    move-result v0

    const-string v1, "Connection not open"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 214
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1, p2, p3}, Lorg/apache/http/conn/OperatedClientConnection;->update(Ljava/net/Socket;Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V

    .line 215
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/conn/routing/RouteTracker;->tunnelProxy(Lorg/apache/http/HttpHost;Z)V

    .line 216
    return-void
.end method

.method public tunnelTarget(ZLorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "secure"    # Z
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    const-string v0, "HTTP parameters"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 181
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    const-string v1, "Route tracker"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v0}, Lorg/apache/http/conn/routing/RouteTracker;->isConnected()Z

    move-result v0

    const-string v1, "Connection not open"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 183
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v0}, Lorg/apache/http/conn/routing/RouteTracker;->isTunnelled()Z

    move-result v0

    if-nez v0, :cond_37

    const/4 v0, 0x1

    :goto_20
    const-string v1, "Connection is already tunnelled"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 185
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v2}, Lorg/apache/http/conn/routing/RouteTracker;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    invoke-interface {v0, v1, v2, p1, p2}, Lorg/apache/http/conn/OperatedClientConnection;->update(Ljava/net/Socket;Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V

    .line 187
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v0, p1}, Lorg/apache/http/conn/routing/RouteTracker;->tunnelTarget(Z)V

    .line 188
    return-void

    .line 183
    :cond_37
    const/4 v0, 0x0

    goto :goto_20
.end method
