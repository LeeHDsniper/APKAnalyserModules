.class public Lorg/apache/http/conn/params/ConnRouteParamBean;
.super Lorg/apache/http/params/HttpAbstractParamBean;
.source "ConnRouteParamBean.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# direct methods
.method public constructor <init>(Lorg/apache/http/params/HttpParams;)V
    .registers 2
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/http/params/HttpAbstractParamBean;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 53
    return-void
.end method


# virtual methods
.method public setDefaultProxy(Lorg/apache/http/HttpHost;)V
    .registers 4
    .param p1, "defaultProxy"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnRouteParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.route.default-proxy"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 58
    return-void
.end method

.method public setForcedRoute(Lorg/apache/http/conn/routing/HttpRoute;)V
    .registers 4
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 67
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnRouteParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.route.forced-route"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 68
    return-void
.end method

.method public setLocalAddress(Ljava/net/InetAddress;)V
    .registers 4
    .param p1, "address"    # Ljava/net/InetAddress;

    .prologue
    .line 62
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnRouteParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.route.local-address"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 63
    return-void
.end method
