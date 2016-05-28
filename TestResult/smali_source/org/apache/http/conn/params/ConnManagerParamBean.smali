.class public Lorg/apache/http/conn/params/ConnManagerParamBean;
.super Lorg/apache/http/params/HttpAbstractParamBean;
.source "ConnManagerParamBean.java"


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
    .line 48
    invoke-direct {p0, p1}, Lorg/apache/http/params/HttpAbstractParamBean;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 49
    return-void
.end method


# virtual methods
.method public setConnectionsPerRoute(Lorg/apache/http/conn/params/ConnPerRouteBean;)V
    .registers 4
    .param p1, "connPerRoute"    # Lorg/apache/http/conn/params/ConnPerRouteBean;

    .prologue
    .line 60
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnManagerParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.conn-manager.max-per-route"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 61
    return-void
.end method

.method public setMaxTotalConnections(I)V
    .registers 4
    .param p1, "maxConnections"    # I

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnManagerParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.conn-manager.max-total"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    .line 57
    return-void
.end method

.method public setTimeout(J)V
    .registers 6
    .param p1, "timeout"    # J

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnManagerParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.conn-manager.timeout"

    invoke-interface {v0, v1, p1, p2}, Lorg/apache/http/params/HttpParams;->setLongParameter(Ljava/lang/String;J)Lorg/apache/http/params/HttpParams;

    .line 53
    return-void
.end method
