.class public Lorg/apache/http/impl/client/DecompressingHttpClient;
.super Ljava/lang/Object;
.source "DecompressingHttpClient.java"

# interfaces
.implements Lorg/apache/http/client/HttpClient;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final acceptEncodingInterceptor:Lorg/apache/http/HttpRequestInterceptor;

.field private final backend:Lorg/apache/http/client/HttpClient;

.field private final contentEncodingInterceptor:Lorg/apache/http/HttpResponseInterceptor;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 89
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/DecompressingHttpClient;-><init>(Lorg/apache/http/client/HttpClient;)V

    .line 90
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/HttpClient;)V
    .registers 4
    .param p1, "backend"    # Lorg/apache/http/client/HttpClient;

    .prologue
    .line 99
    new-instance v0, Lorg/apache/http/client/protocol/RequestAcceptEncoding;

    invoke-direct {v0}, Lorg/apache/http/client/protocol/RequestAcceptEncoding;-><init>()V

    new-instance v1, Lorg/apache/http/client/protocol/ResponseContentEncoding;

    invoke-direct {v1}, Lorg/apache/http/client/protocol/ResponseContentEncoding;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/http/impl/client/DecompressingHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/HttpRequestInterceptor;Lorg/apache/http/HttpResponseInterceptor;)V

    .line 100
    return-void
.end method

.method constructor <init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/HttpRequestInterceptor;Lorg/apache/http/HttpResponseInterceptor;)V
    .registers 4
    .param p1, "backend"    # Lorg/apache/http/client/HttpClient;
    .param p2, "requestInterceptor"    # Lorg/apache/http/HttpRequestInterceptor;
    .param p3, "responseInterceptor"    # Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    iput-object p1, p0, Lorg/apache/http/impl/client/DecompressingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    .line 106
    iput-object p2, p0, Lorg/apache/http/impl/client/DecompressingHttpClient;->acceptEncodingInterceptor:Lorg/apache/http/HttpRequestInterceptor;

    .line 107
    iput-object p3, p0, Lorg/apache/http/impl/client/DecompressingHttpClient;->contentEncodingInterceptor:Lorg/apache/http/HttpResponseInterceptor;

    .line 108
    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;
    .registers 5
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 197
    .local p3, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/http/impl/client/DecompressingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;
    .registers 8
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 203
    .local p3, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    invoke-virtual {p0, p1, p2, p4}, Lorg/apache/http/impl/client/DecompressingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 205
    .local v1, "response":Lorg/apache/http/HttpResponse;
    :try_start_4
    invoke-interface {p3, v1}, Lorg/apache/http/client/ResponseHandler;->handleResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_12

    move-result-object v2

    .line 207
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 208
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_11

    .line 209
    invoke-static {v0}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 211
    :cond_11
    return-object v2

    .line 207
    .end local v0    # "entity":Lorg/apache/http/HttpEntity;
    :catchall_12
    move-exception v2

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 208
    .restart local v0    # "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_1c

    .line 209
    invoke-static {v0}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 211
    :cond_1c
    throw v2
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;
    .registers 4
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 185
    .local p2, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/DecompressingHttpClient;->getHttpHost(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpHost;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/apache/http/impl/client/DecompressingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;
    .registers 5
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 191
    .local p2, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/DecompressingHttpClient;->getHttpHost(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpHost;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2, p3}, Lorg/apache/http/impl/client/DecompressingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/HttpResponse;
    .registers 4
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 144
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/http/protocol/HttpContext;

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/impl/client/DecompressingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
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
    .line 150
    if-eqz p3, :cond_3c

    move-object v2, p3

    .line 152
    .local v2, "localContext":Lorg/apache/http/protocol/HttpContext;
    :goto_3
    :try_start_3
    instance-of v5, p2, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v5, :cond_49

    .line 153
    new-instance v4, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;

    check-cast p2, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local p2    # "request":Lorg/apache/http/HttpRequest;
    invoke-direct {v4, p2}, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;-><init>(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    .line 157
    .local v4, "wrapped":Lorg/apache/http/HttpRequest;
    :goto_e
    iget-object v5, p0, Lorg/apache/http/impl/client/DecompressingHttpClient;->acceptEncodingInterceptor:Lorg/apache/http/HttpRequestInterceptor;

    invoke-interface {v5, v4, v2}, Lorg/apache/http/HttpRequestInterceptor;->process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V

    .line 158
    iget-object v5, p0, Lorg/apache/http/impl/client/DecompressingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    invoke-interface {v5, p1, v4, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    :try_end_18
    .catch Lorg/apache/http/HttpException; {:try_start_3 .. :try_end_18} :catch_42

    move-result-object v3

    .line 160
    .local v3, "response":Lorg/apache/http/HttpResponse;
    :try_start_19
    iget-object v5, p0, Lorg/apache/http/impl/client/DecompressingHttpClient;->contentEncodingInterceptor:Lorg/apache/http/HttpResponseInterceptor;

    invoke-interface {v5, v3, v2}, Lorg/apache/http/HttpResponseInterceptor;->process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V

    .line 161
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v6, "http.client.response.uncompressed"

    invoke-interface {v2, v6}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 162
    const-string v5, "Content-Length"

    invoke-interface {v3, v5}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 163
    const-string v5, "Content-Encoding"

    invoke-interface {v3, v5}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V

    .line 164
    const-string v5, "Content-MD5"

    invoke-interface {v3, v5}, Lorg/apache/http/HttpResponse;->removeHeaders(Ljava/lang/String;)V
    :try_end_3b
    .catch Lorg/apache/http/HttpException; {:try_start_19 .. :try_end_3b} :catch_4f
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_3b} :catch_58
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_3b} :catch_61

    .line 166
    :cond_3b
    return-object v3

    .line 150
    .end local v2    # "localContext":Lorg/apache/http/protocol/HttpContext;
    .end local v3    # "response":Lorg/apache/http/HttpResponse;
    .end local v4    # "wrapped":Lorg/apache/http/HttpRequest;
    .restart local p2    # "request":Lorg/apache/http/HttpRequest;
    :cond_3c
    :try_start_3c
    new-instance v2, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v2}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V
    :try_end_41
    .catch Lorg/apache/http/HttpException; {:try_start_3c .. :try_end_41} :catch_42

    goto :goto_3

    .line 177
    .end local p2    # "request":Lorg/apache/http/HttpRequest;
    :catch_42
    move-exception v0

    .line 178
    .local v0, "e":Lorg/apache/http/HttpException;
    new-instance v5, Lorg/apache/http/client/ClientProtocolException;

    invoke-direct {v5, v0}, Lorg/apache/http/client/ClientProtocolException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 155
    .end local v0    # "e":Lorg/apache/http/HttpException;
    .restart local v2    # "localContext":Lorg/apache/http/protocol/HttpContext;
    .restart local p2    # "request":Lorg/apache/http/HttpRequest;
    :cond_49
    :try_start_49
    new-instance v4, Lorg/apache/http/impl/client/RequestWrapper;

    invoke-direct {v4, p2}, Lorg/apache/http/impl/client/RequestWrapper;-><init>(Lorg/apache/http/HttpRequest;)V

    .restart local v4    # "wrapped":Lorg/apache/http/HttpRequest;
    goto :goto_e

    .line 167
    .end local p2    # "request":Lorg/apache/http/HttpRequest;
    .restart local v3    # "response":Lorg/apache/http/HttpResponse;
    :catch_4f
    move-exception v1

    .line 168
    .local v1, "ex":Lorg/apache/http/HttpException;
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 169
    throw v1

    .line 170
    .end local v1    # "ex":Lorg/apache/http/HttpException;
    :catch_58
    move-exception v1

    .line 171
    .local v1, "ex":Ljava/io/IOException;
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 172
    throw v1

    .line 173
    .end local v1    # "ex":Ljava/io/IOException;
    :catch_61
    move-exception v1

    .line 174
    .local v1, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 175
    throw v1
    :try_end_6a
    .catch Lorg/apache/http/HttpException; {:try_start_49 .. :try_end_6a} :catch_42
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    .registers 4
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 120
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/DecompressingHttpClient;->getHttpHost(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpHost;

    move-result-object v1

    const/4 v0, 0x0

    check-cast v0, Lorg/apache/http/protocol/HttpContext;

    invoke-virtual {p0, v1, p1, v0}, Lorg/apache/http/impl/client/DecompressingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 4
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/DecompressingHttpClient;->getHttpHost(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpHost;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/apache/http/impl/client/DecompressingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lorg/apache/http/impl/client/DecompressingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    return-object v0
.end method

.method public getHttpClient()Lorg/apache/http/client/HttpClient;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lorg/apache/http/impl/client/DecompressingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    return-object v0
.end method

.method getHttpHost(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpHost;
    .registers 4
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;

    .prologue
    .line 133
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v0

    .line 134
    .local v0, "uri":Ljava/net/URI;
    invoke-static {v0}, Lorg/apache/http/client/utils/URIUtils;->extractHost(Ljava/net/URI;)Lorg/apache/http/HttpHost;

    move-result-object v1

    return-object v1
.end method

.method public getParams()Lorg/apache/http/params/HttpParams;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/apache/http/impl/client/DecompressingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    return-object v0
.end method
