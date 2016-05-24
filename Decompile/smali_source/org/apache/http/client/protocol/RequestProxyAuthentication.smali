.class public Lorg/apache/http/client/protocol/RequestProxyAuthentication;
.super Lorg/apache/http/client/protocol/RequestAuthenticationBase;
.source "RequestProxyAuthentication.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/apache/http/client/protocol/RequestAuthenticationBase;-><init>()V

    .line 57
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .registers 9
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    const-string v3, "HTTP request"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    const-string v3, "HTTP context"

    invoke-static {p2, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 64
    const-string v3, "Proxy-Authorization"

    invoke-interface {p1, v3}, Lorg/apache/http/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 90
    :cond_12
    :goto_12
    return-void

    .line 68
    :cond_13
    const-string v3, "http.connection"

    invoke-interface {p2, v3}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/conn/HttpRoutedConnection;

    .line 70
    .local v1, "conn":Lorg/apache/http/conn/HttpRoutedConnection;
    if-nez v1, :cond_25

    .line 71
    iget-object v3, p0, Lorg/apache/http/client/protocol/RequestProxyAuthentication;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "HTTP connection not set in the context"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_12

    .line 74
    :cond_25
    invoke-interface {v1}, Lorg/apache/http/conn/HttpRoutedConnection;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v2

    .line 75
    .local v2, "route":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-virtual {v2}, Lorg/apache/http/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v3

    if-nez v3, :cond_12

    .line 80
    const-string v3, "http.auth.proxy-scope"

    invoke-interface {p2, v3}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/auth/AuthState;

    .line 82
    .local v0, "authState":Lorg/apache/http/auth/AuthState;
    if-nez v0, :cond_41

    .line 83
    iget-object v3, p0, Lorg/apache/http/client/protocol/RequestProxyAuthentication;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Proxy auth state not set in the context"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_12

    .line 86
    :cond_41
    iget-object v3, p0, Lorg/apache/http/client/protocol/RequestProxyAuthentication;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_65

    .line 87
    iget-object v3, p0, Lorg/apache/http/client/protocol/RequestProxyAuthentication;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Proxy auth state: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 89
    :cond_65
    invoke-virtual {p0, v0, p1, p2}, Lorg/apache/http/client/protocol/RequestProxyAuthentication;->process(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V

    goto :goto_12
.end method
