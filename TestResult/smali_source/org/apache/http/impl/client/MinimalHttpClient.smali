.class Lorg/apache/http/impl/client/MinimalHttpClient;
.super Lorg/apache/http/impl/client/CloseableHttpClient;
.source "MinimalHttpClient.java"


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

.field private final params:Lorg/apache/http/params/HttpParams;

.field private final requestExecutor:Lorg/apache/http/impl/execchain/MinimalClientExec;


# direct methods
.method public constructor <init>(Lorg/apache/http/conn/HttpClientConnectionManager;)V
    .registers 6
    .param p1, "connManager"    # Lorg/apache/http/conn/HttpClientConnectionManager;

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/apache/http/impl/client/CloseableHttpClient;-><init>()V

    .line 75
    const-string v0, "HTTP connection manager"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/HttpClientConnectionManager;

    iput-object v0, p0, Lorg/apache/http/impl/client/MinimalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    .line 76
    new-instance v0, Lorg/apache/http/impl/execchain/MinimalClientExec;

    new-instance v1, Lorg/apache/http/protocol/HttpRequestExecutor;

    invoke-direct {v1}, Lorg/apache/http/protocol/HttpRequestExecutor;-><init>()V

    sget-object v2, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lorg/apache/http/impl/DefaultConnectionReuseStrategy;

    sget-object v3, Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;->INSTANCE:Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;

    invoke-direct {v0, v1, p1, v2, v3}, Lorg/apache/http/impl/execchain/MinimalClientExec;-><init>(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/MinimalHttpClient;->requestExecutor:Lorg/apache/http/impl/execchain/MinimalClientExec;

    .line 81
    new-instance v0, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v0}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/MinimalHttpClient;->params:Lorg/apache/http/params/HttpParams;

    .line 82
    return-void
.end method

.method static synthetic access$000(Lorg/apache/http/impl/client/MinimalHttpClient;)Lorg/apache/http/conn/HttpClientConnectionManager;
    .registers 2
    .param p0, "x0"    # Lorg/apache/http/impl/client/MinimalHttpClient;

    .prologue
    .line 66
    iget-object v0, p0, Lorg/apache/http/impl/client/MinimalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lorg/apache/http/impl/client/MinimalHttpClient;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    invoke-interface {v0}, Lorg/apache/http/conn/HttpClientConnectionManager;->shutdown()V

    .line 119
    return-void
.end method

.method protected doExecute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .registers 11
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
    .line 89
    const-string v6, "Target host"

    invoke-static {p1, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 90
    const-string v6, "HTTP request"

    invoke-static {p2, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    const/4 v1, 0x0

    .line 92
    .local v1, "execAware":Lorg/apache/http/client/methods/HttpExecutionAware;
    instance-of v6, p2, Lorg/apache/http/client/methods/HttpExecutionAware;

    if-eqz v6, :cond_12

    move-object v1, p2

    .line 93
    check-cast v1, Lorg/apache/http/client/methods/HttpExecutionAware;

    .line 96
    :cond_12
    :try_start_12
    invoke-static {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->wrap(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v5

    .line 97
    .local v5, "wrapper":Lorg/apache/http/client/methods/HttpRequestWrapper;
    if-eqz p3, :cond_38

    .end local p3    # "context":Lorg/apache/http/protocol/HttpContext;
    :goto_18
    invoke-static {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v3

    .line 99
    .local v3, "localcontext":Lorg/apache/http/client/protocol/HttpClientContext;
    new-instance v4, Lorg/apache/http/conn/routing/HttpRoute;

    invoke-direct {v4, p1}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;)V

    .line 100
    .local v4, "route":Lorg/apache/http/conn/routing/HttpRoute;
    const/4 v0, 0x0

    .line 101
    .local v0, "config":Lorg/apache/http/client/config/RequestConfig;
    instance-of v6, p2, Lorg/apache/http/client/methods/Configurable;

    if-eqz v6, :cond_2c

    .line 102
    check-cast p2, Lorg/apache/http/client/methods/Configurable;

    .end local p2    # "request":Lorg/apache/http/HttpRequest;
    invoke-interface {p2}, Lorg/apache/http/client/methods/Configurable;->getConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v0

    .line 104
    :cond_2c
    if-eqz v0, :cond_31

    .line 105
    invoke-virtual {v3, v0}, Lorg/apache/http/client/protocol/HttpClientContext;->setRequestConfig(Lorg/apache/http/client/config/RequestConfig;)V

    .line 107
    :cond_31
    iget-object v6, p0, Lorg/apache/http/impl/client/MinimalHttpClient;->requestExecutor:Lorg/apache/http/impl/execchain/MinimalClientExec;

    invoke-virtual {v6, v4, v5, v3, v1}, Lorg/apache/http/impl/execchain/MinimalClientExec;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v6

    return-object v6

    .line 97
    .end local v0    # "config":Lorg/apache/http/client/config/RequestConfig;
    .end local v3    # "localcontext":Lorg/apache/http/client/protocol/HttpClientContext;
    .end local v4    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local p2    # "request":Lorg/apache/http/HttpRequest;
    .restart local p3    # "context":Lorg/apache/http/protocol/HttpContext;
    :cond_38
    new-instance p3, Lorg/apache/http/protocol/BasicHttpContext;

    .end local p3    # "context":Lorg/apache/http/protocol/HttpContext;
    invoke-direct {p3}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V
    :try_end_3d
    .catch Lorg/apache/http/HttpException; {:try_start_12 .. :try_end_3d} :catch_3e

    goto :goto_18

    .line 108
    .end local v5    # "wrapper":Lorg/apache/http/client/methods/HttpRequestWrapper;
    .end local p2    # "request":Lorg/apache/http/HttpRequest;
    :catch_3e
    move-exception v2

    .line 109
    .local v2, "httpException":Lorg/apache/http/HttpException;
    new-instance v6, Lorg/apache/http/client/ClientProtocolException;

    invoke-direct {v6, v2}, Lorg/apache/http/client/ClientProtocolException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method

.method public getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 123
    new-instance v0, Lorg/apache/http/impl/client/MinimalHttpClient$1;

    invoke-direct {v0, p0}, Lorg/apache/http/impl/client/MinimalHttpClient$1;-><init>(Lorg/apache/http/impl/client/MinimalHttpClient;)V

    return-object v0
.end method

.method public getParams()Lorg/apache/http/params/HttpParams;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lorg/apache/http/impl/client/MinimalHttpClient;->params:Lorg/apache/http/params/HttpParams;

    return-object v0
.end method
