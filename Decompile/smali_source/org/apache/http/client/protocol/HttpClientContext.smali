.class public Lorg/apache/http/client/protocol/HttpClientContext;
.super Lorg/apache/http/protocol/HttpCoreContext;
.source "HttpClientContext.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field public static final AUTHSCHEME_REGISTRY:Ljava/lang/String; = "http.authscheme-registry"

.field public static final AUTH_CACHE:Ljava/lang/String; = "http.auth.auth-cache"

.field public static final COOKIESPEC_REGISTRY:Ljava/lang/String; = "http.cookiespec-registry"

.field public static final COOKIE_ORIGIN:Ljava/lang/String; = "http.cookie-origin"

.field public static final COOKIE_SPEC:Ljava/lang/String; = "http.cookie-spec"

.field public static final COOKIE_STORE:Ljava/lang/String; = "http.cookie-store"

.field public static final CREDS_PROVIDER:Ljava/lang/String; = "http.auth.credentials-provider"

.field public static final HTTP_ROUTE:Ljava/lang/String; = "http.route"

.field public static final PROXY_AUTH_STATE:Ljava/lang/String; = "http.auth.proxy-scope"

.field public static final REDIRECT_LOCATIONS:Ljava/lang/String; = "http.protocol.redirect-locations"

.field public static final REQUEST_CONFIG:Ljava/lang/String; = "http.request-config"

.field public static final TARGET_AUTH_STATE:Ljava/lang/String; = "http.auth.target-scope"

.field public static final USER_TOKEN:Ljava/lang/String; = "http.user-token"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 155
    invoke-direct {p0}, Lorg/apache/http/protocol/HttpCoreContext;-><init>()V

    .line 156
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpContext;)V
    .registers 2
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 151
    invoke-direct {p0, p1}, Lorg/apache/http/protocol/HttpCoreContext;-><init>(Lorg/apache/http/protocol/HttpContext;)V

    .line 152
    return-void
.end method

.method public static adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;
    .registers 2
    .param p0, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 139
    instance-of v0, p0, Lorg/apache/http/client/protocol/HttpClientContext;

    if-eqz v0, :cond_7

    .line 140
    check-cast p0, Lorg/apache/http/client/protocol/HttpClientContext;

    .line 142
    .end local p0    # "context":Lorg/apache/http/protocol/HttpContext;
    :goto_6
    return-object p0

    .restart local p0    # "context":Lorg/apache/http/protocol/HttpContext;
    :cond_7
    new-instance v0, Lorg/apache/http/client/protocol/HttpClientContext;

    invoke-direct {v0, p0}, Lorg/apache/http/client/protocol/HttpClientContext;-><init>(Lorg/apache/http/protocol/HttpContext;)V

    move-object p0, v0

    goto :goto_6
.end method

.method public static create()Lorg/apache/http/client/protocol/HttpClientContext;
    .registers 2

    .prologue
    .line 147
    new-instance v0, Lorg/apache/http/client/protocol/HttpClientContext;

    new-instance v1, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v1}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    invoke-direct {v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;-><init>(Lorg/apache/http/protocol/HttpContext;)V

    return-object v0
.end method

.method private getLookup(Ljava/lang/String;Ljava/lang/Class;)Lorg/apache/http/config/Lookup;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lorg/apache/http/config/Lookup",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 185
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v0, Lorg/apache/http/config/Lookup;

    invoke-virtual {p0, p1, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/config/Lookup;

    return-object v0
.end method


# virtual methods
.method public getAuthCache()Lorg/apache/http/client/AuthCache;
    .registers 3

    .prologue
    .line 213
    const-string v0, "http.auth.auth-cache"

    const-class v1, Lorg/apache/http/client/AuthCache;

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/AuthCache;

    return-object v0
.end method

.method public getAuthSchemeRegistry()Lorg/apache/http/config/Lookup;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/auth/AuthSchemeProvider;",
            ">;"
        }
    .end annotation

    .prologue
    .line 197
    const-string v0, "http.authscheme-registry"

    const-class v1, Lorg/apache/http/auth/AuthSchemeProvider;

    invoke-direct {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getLookup(Ljava/lang/String;Ljava/lang/Class;)Lorg/apache/http/config/Lookup;

    move-result-object v0

    return-object v0
.end method

.method public getCookieOrigin()Lorg/apache/http/cookie/CookieOrigin;
    .registers 3

    .prologue
    .line 180
    const-string v0, "http.cookie-origin"

    const-class v1, Lorg/apache/http/cookie/CookieOrigin;

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/cookie/CookieOrigin;

    return-object v0
.end method

.method public getCookieSpec()Lorg/apache/http/cookie/CookieSpec;
    .registers 3

    .prologue
    .line 176
    const-string v0, "http.cookie-spec"

    const-class v1, Lorg/apache/http/cookie/CookieSpec;

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/cookie/CookieSpec;

    return-object v0
.end method

.method public getCookieSpecRegistry()Lorg/apache/http/config/Lookup;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/cookie/CookieSpecProvider;",
            ">;"
        }
    .end annotation

    .prologue
    .line 189
    const-string v0, "http.cookiespec-registry"

    const-class v1, Lorg/apache/http/cookie/CookieSpecProvider;

    invoke-direct {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getLookup(Ljava/lang/String;Ljava/lang/Class;)Lorg/apache/http/config/Lookup;

    move-result-object v0

    return-object v0
.end method

.method public getCookieStore()Lorg/apache/http/client/CookieStore;
    .registers 3

    .prologue
    .line 168
    const-string v0, "http.cookie-store"

    const-class v1, Lorg/apache/http/client/CookieStore;

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/CookieStore;

    return-object v0
.end method

.method public getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;
    .registers 3

    .prologue
    .line 205
    const-string v0, "http.auth.credentials-provider"

    const-class v1, Lorg/apache/http/client/CredentialsProvider;

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/CredentialsProvider;

    return-object v0
.end method

.method public getHttpRoute()Lorg/apache/http/conn/routing/RouteInfo;
    .registers 3

    .prologue
    .line 159
    const-string v0, "http.route"

    const-class v1, Lorg/apache/http/conn/routing/HttpRoute;

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/routing/RouteInfo;

    return-object v0
.end method

.method public getProxyAuthState()Lorg/apache/http/auth/AuthState;
    .registers 3

    .prologue
    .line 225
    const-string v0, "http.auth.proxy-scope"

    const-class v1, Lorg/apache/http/auth/AuthState;

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/auth/AuthState;

    return-object v0
.end method

.method public getRedirectLocations()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/net/URI;",
            ">;"
        }
    .end annotation

    .prologue
    .line 164
    const-string v0, "http.protocol.redirect-locations"

    const-class v1, Ljava/util/List;

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getRequestConfig()Lorg/apache/http/client/config/RequestConfig;
    .registers 4

    .prologue
    .line 241
    const-string v1, "http.request-config"

    const-class v2, Lorg/apache/http/client/config/RequestConfig;

    invoke-virtual {p0, v1, v2}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/config/RequestConfig;

    .line 242
    .local v0, "config":Lorg/apache/http/client/config/RequestConfig;
    if-eqz v0, :cond_d

    .end local v0    # "config":Lorg/apache/http/client/config/RequestConfig;
    :goto_c
    return-object v0

    .restart local v0    # "config":Lorg/apache/http/client/config/RequestConfig;
    :cond_d
    sget-object v0, Lorg/apache/http/client/config/RequestConfig;->DEFAULT:Lorg/apache/http/client/config/RequestConfig;

    goto :goto_c
.end method

.method public getTargetAuthState()Lorg/apache/http/auth/AuthState;
    .registers 3

    .prologue
    .line 221
    const-string v0, "http.auth.target-scope"

    const-class v1, Lorg/apache/http/auth/AuthState;

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/auth/AuthState;

    return-object v0
.end method

.method public getUserToken()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 233
    const-string v0, "http.user-token"

    invoke-virtual {p0, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getUserToken(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 229
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-string v0, "http.user-token"

    invoke-virtual {p0, v0, p1}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setAuthCache(Lorg/apache/http/client/AuthCache;)V
    .registers 3
    .param p1, "authCache"    # Lorg/apache/http/client/AuthCache;

    .prologue
    .line 217
    const-string v0, "http.auth.auth-cache"

    invoke-virtual {p0, v0, p1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 218
    return-void
.end method

.method public setAuthSchemeRegistry(Lorg/apache/http/config/Lookup;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/auth/AuthSchemeProvider;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 201
    .local p1, "lookup":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/auth/AuthSchemeProvider;>;"
    const-string v0, "http.authscheme-registry"

    invoke-virtual {p0, v0, p1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 202
    return-void
.end method

.method public setCookieSpecRegistry(Lorg/apache/http/config/Lookup;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/cookie/CookieSpecProvider;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 193
    .local p1, "lookup":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/cookie/CookieSpecProvider;>;"
    const-string v0, "http.cookiespec-registry"

    invoke-virtual {p0, v0, p1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 194
    return-void
.end method

.method public setCookieStore(Lorg/apache/http/client/CookieStore;)V
    .registers 3
    .param p1, "cookieStore"    # Lorg/apache/http/client/CookieStore;

    .prologue
    .line 172
    const-string v0, "http.cookie-store"

    invoke-virtual {p0, v0, p1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 173
    return-void
.end method

.method public setCredentialsProvider(Lorg/apache/http/client/CredentialsProvider;)V
    .registers 3
    .param p1, "credentialsProvider"    # Lorg/apache/http/client/CredentialsProvider;

    .prologue
    .line 209
    const-string v0, "http.auth.credentials-provider"

    invoke-virtual {p0, v0, p1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 210
    return-void
.end method

.method public setRequestConfig(Lorg/apache/http/client/config/RequestConfig;)V
    .registers 3
    .param p1, "config"    # Lorg/apache/http/client/config/RequestConfig;

    .prologue
    .line 246
    const-string v0, "http.request-config"

    invoke-virtual {p0, v0, p1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 247
    return-void
.end method

.method public setUserToken(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 237
    const-string v0, "http.user-token"

    invoke-virtual {p0, v0, p1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 238
    return-void
.end method
