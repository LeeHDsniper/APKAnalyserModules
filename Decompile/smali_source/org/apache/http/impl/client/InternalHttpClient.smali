.class Lorg/apache/http/impl/client/InternalHttpClient;
.super Lorg/apache/http/impl/client/CloseableHttpClient;
.source "InternalHttpClient.java"


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final authSchemeRegistry:Lorg/apache/http/config/Lookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/auth/AuthSchemeProvider;",
            ">;"
        }
    .end annotation
.end field

.field private final closeables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/Closeable;",
            ">;"
        }
    .end annotation
.end field

.field private final connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

.field private final cookieSpecRegistry:Lorg/apache/http/config/Lookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/cookie/CookieSpecProvider;",
            ">;"
        }
    .end annotation
.end field

.field private final cookieStore:Lorg/apache/http/client/CookieStore;

.field private final credentialsProvider:Lorg/apache/http/client/CredentialsProvider;

.field private final defaultConfig:Lorg/apache/http/client/config/RequestConfig;

.field private final execChain:Lorg/apache/http/impl/execchain/ClientExecChain;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/config/Lookup;Lorg/apache/http/config/Lookup;Lorg/apache/http/client/CookieStore;Lorg/apache/http/client/CredentialsProvider;Lorg/apache/http/client/config/RequestConfig;Ljava/util/List;)V
    .registers 11
    .param p1, "execChain"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "connManager"    # Lorg/apache/http/conn/HttpClientConnectionManager;
    .param p3, "routePlanner"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .param p6, "cookieStore"    # Lorg/apache/http/client/CookieStore;
    .param p7, "credentialsProvider"    # Lorg/apache/http/client/CredentialsProvider;
    .param p8, "defaultConfig"    # Lorg/apache/http/client/config/RequestConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/impl/execchain/ClientExecChain;",
            "Lorg/apache/http/conn/HttpClientConnectionManager;",
            "Lorg/apache/http/conn/routing/HttpRoutePlanner;",
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/cookie/CookieSpecProvider;",
            ">;",
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/auth/AuthSchemeProvider;",
            ">;",
            "Lorg/apache/http/client/CookieStore;",
            "Lorg/apache/http/client/CredentialsProvider;",
            "Lorg/apache/http/client/config/RequestConfig;",
            "Ljava/util/List",
            "<",
            "Ljava/io/Closeable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p4, "cookieSpecRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/cookie/CookieSpecProvider;>;"
    .local p5, "authSchemeRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/auth/AuthSchemeProvider;>;"
    .local p9, "closeables":Ljava/util/List;, "Ljava/util/List<Ljava/io/Closeable;>;"
    invoke-direct {p0}, Lorg/apache/http/impl/client/CloseableHttpClient;-><init>()V

    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/InternalHttpClient;->log:Lorg/apache/commons/logging/Log;

    .line 103
    const-string v0, "HTTP client exec chain"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 104
    const-string v0, "HTTP connection manager"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 105
    const-string v0, "HTTP route planner"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 106
    iput-object p1, p0, Lorg/apache/http/impl/client/InternalHttpClient;->execChain:Lorg/apache/http/impl/execchain/ClientExecChain;

    .line 107
    iput-object p2, p0, Lorg/apache/http/impl/client/InternalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    .line 108
    iput-object p3, p0, Lorg/apache/http/impl/client/InternalHttpClient;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

    .line 109
    iput-object p4, p0, Lorg/apache/http/impl/client/InternalHttpClient;->cookieSpecRegistry:Lorg/apache/http/config/Lookup;

    .line 110
    iput-object p5, p0, Lorg/apache/http/impl/client/InternalHttpClient;->authSchemeRegistry:Lorg/apache/http/config/Lookup;

    .line 111
    iput-object p6, p0, Lorg/apache/http/impl/client/InternalHttpClient;->cookieStore:Lorg/apache/http/client/CookieStore;

    .line 112
    iput-object p7, p0, Lorg/apache/http/impl/client/InternalHttpClient;->credentialsProvider:Lorg/apache/http/client/CredentialsProvider;

    .line 113
    iput-object p8, p0, Lorg/apache/http/impl/client/InternalHttpClient;->defaultConfig:Lorg/apache/http/client/config/RequestConfig;

    .line 114
    iput-object p9, p0, Lorg/apache/http/impl/client/InternalHttpClient;->closeables:Ljava/util/List;

    .line 115
    return-void
.end method

.method static synthetic access$000(Lorg/apache/http/impl/client/InternalHttpClient;)Lorg/apache/http/conn/HttpClientConnectionManager;
    .registers 2
    .param p0, "x0"    # Lorg/apache/http/impl/client/InternalHttpClient;

    .prologue
    .line 78
    iget-object v0, p0, Lorg/apache/http/impl/client/InternalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    return-object v0
.end method

.method private determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;
    .registers 7
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 121
    move-object v0, p1

    .line 122
    .local v0, "host":Lorg/apache/http/HttpHost;
    if-nez v0, :cond_f

    .line 123
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    const-string v2, "http.default-host"

    invoke-interface {v1, v2}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "host":Lorg/apache/http/HttpHost;
    check-cast v0, Lorg/apache/http/HttpHost;

    .line 125
    .restart local v0    # "host":Lorg/apache/http/HttpHost;
    :cond_f
    const-string v1, "Target host"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    iget-object v1, p0, Lorg/apache/http/impl/client/InternalHttpClient;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

    invoke-interface {v1, v0, p2, p3}, Lorg/apache/http/conn/routing/HttpRoutePlanner;->determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v1

    return-object v1
.end method

.method private setupContext(Lorg/apache/http/client/protocol/HttpClientContext;)V
    .registers 4
    .param p1, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;

    .prologue
    .line 130
    const-string v0, "http.auth.target-scope"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_12

    .line 131
    const-string v0, "http.auth.target-scope"

    new-instance v1, Lorg/apache/http/auth/AuthState;

    invoke-direct {v1}, Lorg/apache/http/auth/AuthState;-><init>()V

    invoke-virtual {p1, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    :cond_12
    const-string v0, "http.auth.proxy-scope"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_24

    .line 134
    const-string v0, "http.auth.proxy-scope"

    new-instance v1, Lorg/apache/http/auth/AuthState;

    invoke-direct {v1}, Lorg/apache/http/auth/AuthState;-><init>()V

    invoke-virtual {p1, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 136
    :cond_24
    const-string v0, "http.authscheme-registry"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_33

    .line 137
    const-string v0, "http.authscheme-registry"

    iget-object v1, p0, Lorg/apache/http/impl/client/InternalHttpClient;->authSchemeRegistry:Lorg/apache/http/config/Lookup;

    invoke-virtual {p1, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 139
    :cond_33
    const-string v0, "http.cookiespec-registry"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_42

    .line 140
    const-string v0, "http.cookiespec-registry"

    iget-object v1, p0, Lorg/apache/http/impl/client/InternalHttpClient;->cookieSpecRegistry:Lorg/apache/http/config/Lookup;

    invoke-virtual {p1, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 142
    :cond_42
    const-string v0, "http.cookie-store"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_51

    .line 143
    const-string v0, "http.cookie-store"

    iget-object v1, p0, Lorg/apache/http/impl/client/InternalHttpClient;->cookieStore:Lorg/apache/http/client/CookieStore;

    invoke-virtual {p1, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 145
    :cond_51
    const-string v0, "http.auth.credentials-provider"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_60

    .line 146
    const-string v0, "http.auth.credentials-provider"

    iget-object v1, p0, Lorg/apache/http/impl/client/InternalHttpClient;->credentialsProvider:Lorg/apache/http/client/CredentialsProvider;

    invoke-virtual {p1, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 148
    :cond_60
    const-string v0, "http.request-config"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_6f

    .line 149
    const-string v0, "http.request-config"

    iget-object v1, p0, Lorg/apache/http/impl/client/InternalHttpClient;->defaultConfig:Lorg/apache/http/client/config/RequestConfig;

    invoke-virtual {p1, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 151
    :cond_6f
    return-void
.end method


# virtual methods
.method public close()V
    .registers 6

    .prologue
    .line 193
    iget-object v3, p0, Lorg/apache/http/impl/client/InternalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    invoke-interface {v3}, Lorg/apache/http/conn/HttpClientConnectionManager;->shutdown()V

    .line 194
    iget-object v3, p0, Lorg/apache/http/impl/client/InternalHttpClient;->closeables:Ljava/util/List;

    if-eqz v3, :cond_2a

    .line 195
    iget-object v3, p0, Lorg/apache/http/impl/client/InternalHttpClient;->closeables:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Closeable;

    .line 197
    .local v0, "closeable":Ljava/io/Closeable;
    :try_start_1b
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1e} :catch_1f

    goto :goto_f

    .line 198
    :catch_1f
    move-exception v1

    .line 199
    .local v1, "ex":Ljava/io/IOException;
    iget-object v3, p0, Lorg/apache/http/impl/client/InternalHttpClient;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_f

    .line 203
    .end local v0    # "closeable":Ljava/io/Closeable;
    .end local v1    # "ex":Ljava/io/IOException;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_2a
    return-void
.end method

.method protected doExecute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .registers 13
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 158
    const-string v8, "HTTP request"

    invoke-static {p2, v8}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 159
    const/4 v2, 0x0

    .line 160
    .local v2, "execAware":Lorg/apache/http/client/methods/HttpExecutionAware;
    instance-of v8, p2, Lorg/apache/http/client/methods/HttpExecutionAware;

    if-eqz v8, :cond_d

    move-object v2, p2

    .line 161
    check-cast v2, Lorg/apache/http/client/methods/HttpExecutionAware;

    .line 164
    :cond_d
    :try_start_d
    invoke-static {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->wrap(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v7

    .line 165
    .local v7, "wrapper":Lorg/apache/http/client/methods/HttpRequestWrapper;
    if-eqz p3, :cond_53

    .end local p3    # "context":Lorg/apache/http/protocol/HttpContext;
    :goto_13
    invoke-static {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v4

    .line 167
    .local v4, "localcontext":Lorg/apache/http/client/protocol/HttpClientContext;
    const/4 v1, 0x0

    .line 168
    .local v1, "config":Lorg/apache/http/client/config/RequestConfig;
    instance-of v8, p2, Lorg/apache/http/client/methods/Configurable;

    if-eqz v8, :cond_24

    .line 169
    move-object v0, p2

    check-cast v0, Lorg/apache/http/client/methods/Configurable;

    move-object v8, v0

    invoke-interface {v8}, Lorg/apache/http/client/methods/Configurable;->getConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v1

    .line 171
    :cond_24
    if-nez v1, :cond_40

    .line 172
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v5

    .line 173
    .local v5, "params":Lorg/apache/http/params/HttpParams;
    instance-of v8, v5, Lorg/apache/http/params/HttpParamsNames;

    if-eqz v8, :cond_60

    .line 174
    move-object v0, v5

    check-cast v0, Lorg/apache/http/params/HttpParamsNames;

    move-object v8, v0

    invoke-interface {v8}, Lorg/apache/http/params/HttpParamsNames;->getNames()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_40

    .line 175
    invoke-static {v5}, Lorg/apache/http/client/params/HttpClientParamConfig;->getRequestConfig(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/config/RequestConfig;

    move-result-object v1

    .line 181
    .end local v5    # "params":Lorg/apache/http/params/HttpParams;
    :cond_40
    :goto_40
    if-eqz v1, :cond_45

    .line 182
    invoke-virtual {v4, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setRequestConfig(Lorg/apache/http/client/config/RequestConfig;)V

    .line 184
    :cond_45
    invoke-direct {p0, v4}, Lorg/apache/http/impl/client/InternalHttpClient;->setupContext(Lorg/apache/http/client/protocol/HttpClientContext;)V

    .line 185
    invoke-direct {p0, p1, v7, v4}, Lorg/apache/http/impl/client/InternalHttpClient;->determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v6

    .line 186
    .local v6, "route":Lorg/apache/http/conn/routing/HttpRoute;
    iget-object v8, p0, Lorg/apache/http/impl/client/InternalHttpClient;->execChain:Lorg/apache/http/impl/execchain/ClientExecChain;

    invoke-interface {v8, v6, v7, v4, v2}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v8

    return-object v8

    .line 165
    .end local v1    # "config":Lorg/apache/http/client/config/RequestConfig;
    .end local v4    # "localcontext":Lorg/apache/http/client/protocol/HttpClientContext;
    .end local v6    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local p3    # "context":Lorg/apache/http/protocol/HttpContext;
    :cond_53
    new-instance p3, Lorg/apache/http/protocol/BasicHttpContext;

    .end local p3    # "context":Lorg/apache/http/protocol/HttpContext;
    invoke-direct {p3}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V
    :try_end_58
    .catch Lorg/apache/http/HttpException; {:try_start_d .. :try_end_58} :catch_59

    goto :goto_13

    .line 187
    .end local v7    # "wrapper":Lorg/apache/http/client/methods/HttpRequestWrapper;
    :catch_59
    move-exception v3

    .line 188
    .local v3, "httpException":Lorg/apache/http/HttpException;
    new-instance v8, Lorg/apache/http/client/ClientProtocolException;

    invoke-direct {v8, v3}, Lorg/apache/http/client/ClientProtocolException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 178
    .end local v3    # "httpException":Lorg/apache/http/HttpException;
    .restart local v1    # "config":Lorg/apache/http/client/config/RequestConfig;
    .restart local v4    # "localcontext":Lorg/apache/http/client/protocol/HttpClientContext;
    .restart local v5    # "params":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "wrapper":Lorg/apache/http/client/methods/HttpRequestWrapper;
    :cond_60
    :try_start_60
    invoke-static {v5}, Lorg/apache/http/client/params/HttpClientParamConfig;->getRequestConfig(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/config/RequestConfig;
    :try_end_63
    .catch Lorg/apache/http/HttpException; {:try_start_60 .. :try_end_63} :catch_59

    move-result-object v1

    goto :goto_40
.end method

.method public getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 211
    new-instance v0, Lorg/apache/http/impl/client/InternalHttpClient$1;

    invoke-direct {v0, p0}, Lorg/apache/http/impl/client/InternalHttpClient$1;-><init>(Lorg/apache/http/impl/client/InternalHttpClient;)V

    return-object v0
.end method

.method public getParams()Lorg/apache/http/params/HttpParams;
    .registers 2

    .prologue
    .line 206
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
