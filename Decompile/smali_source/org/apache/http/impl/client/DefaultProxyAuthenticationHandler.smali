.class public Lorg/apache/http/impl/client/DefaultProxyAuthenticationHandler;
.super Lorg/apache/http/impl/client/AbstractAuthenticationHandler;
.source "DefaultProxyAuthenticationHandler.java"


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
    invoke-direct {p0}, Lorg/apache/http/impl/client/AbstractAuthenticationHandler;-><init>()V

    .line 57
    return-void
.end method


# virtual methods
.method protected getAuthPreferences(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/List;
    .registers 6
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpResponse;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    const-string v2, "http.auth.proxy-scheme-pref"

    invoke-interface {v1, v2}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 83
    .local v0, "authpref":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_f

    .line 86
    .end local v0    # "authpref":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_e
    return-object v0

    .restart local v0    # "authpref":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_f
    invoke-super {p0, p1, p2}, Lorg/apache/http/impl/client/AbstractAuthenticationHandler;->getAuthPreferences(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/List;

    move-result-object v0

    goto :goto_e
.end method

.method public getChallenges(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/util/Map;
    .registers 5
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpResponse;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/Header;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 70
    const-string v1, "HTTP response"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    const-string v1, "Proxy-Authenticate"

    invoke-interface {p1, v1}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    .line 72
    .local v0, "headers":[Lorg/apache/http/Header;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/client/DefaultProxyAuthenticationHandler;->parseChallenges([Lorg/apache/http/Header;)Ljava/util/Map;

    move-result-object v1

    return-object v1
.end method

.method public isAuthenticationRequested(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 5
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 62
    const-string v1, "HTTP response"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 63
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    .line 64
    .local v0, "status":I
    const/16 v1, 0x197

    if-ne v0, v1, :cond_13

    const/4 v1, 0x1

    :goto_12
    return v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method
