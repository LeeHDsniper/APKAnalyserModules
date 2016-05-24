.class public Lorg/apache/http/client/params/ClientParamBean;
.super Lorg/apache/http/params/HttpAbstractParamBean;
.source "ClientParamBean.java"


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
.method public setAllowCircularRedirects(Z)V
    .registers 4
    .param p1, "allow"    # Z

    .prologue
    .line 76
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.protocol.allow-circular-redirects"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 77
    return-void
.end method

.method public setConnectionManagerFactoryClassName(Ljava/lang/String;)V
    .registers 4
    .param p1, "factory"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.connection-manager.factory-class-name"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 61
    return-void
.end method

.method public setConnectionManagerTimeout(J)V
    .registers 6
    .param p1, "timeout"    # J

    .prologue
    .line 103
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.conn-manager.timeout"

    invoke-interface {v0, v1, p1, p2}, Lorg/apache/http/params/HttpParams;->setLongParameter(Ljava/lang/String;J)Lorg/apache/http/params/HttpParams;

    .line 104
    return-void
.end method

.method public setCookiePolicy(Ljava/lang/String;)V
    .registers 4
    .param p1, "policy"    # Ljava/lang/String;

    .prologue
    .line 84
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.protocol.cookie-policy"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 85
    return-void
.end method

.method public setDefaultHeaders(Ljava/util/Collection;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/apache/http/Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "headers":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/apache/http/Header;>;"
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.default-headers"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 93
    return-void
.end method

.method public setDefaultHost(Lorg/apache/http/HttpHost;)V
    .registers 4
    .param p1, "host"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 96
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.default-host"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 97
    return-void
.end method

.method public setHandleAuthentication(Z)V
    .registers 4
    .param p1, "handle"    # Z

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.protocol.handle-authentication"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 81
    return-void
.end method

.method public setHandleRedirects(Z)V
    .registers 4
    .param p1, "handle"    # Z

    .prologue
    .line 64
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.protocol.handle-redirects"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 65
    return-void
.end method

.method public setMaxRedirects(I)V
    .registers 4
    .param p1, "maxRedirects"    # I

    .prologue
    .line 72
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.protocol.max-redirects"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    .line 73
    return-void
.end method

.method public setRejectRelativeRedirect(Z)V
    .registers 4
    .param p1, "reject"    # Z

    .prologue
    .line 68
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.protocol.reject-relative-redirect"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 69
    return-void
.end method

.method public setVirtualHost(Lorg/apache/http/HttpHost;)V
    .registers 4
    .param p1, "host"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 88
    iget-object v0, p0, Lorg/apache/http/client/params/ClientParamBean;->params:Lorg/apache/http/params/HttpParams;

    const-string v1, "http.virtual-host"

    invoke-interface {v0, v1, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 89
    return-void
.end method
