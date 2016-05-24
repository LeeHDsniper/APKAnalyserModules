.class public final Lcom/squareup/okhttp/internal/http/HttpEngine;
.super Ljava/lang/Object;
.source "HttpEngine.java"


# static fields
.field private static final EMPTY_BODY:Lcom/squareup/okhttp/ResponseBody;


# instance fields
.field public final bufferRequestBody:Z

.field private bufferedRequestBody:Lokio/BufferedSink;

.field private cacheResponse:Lcom/squareup/okhttp/Response;

.field private cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

.field final client:Lcom/squareup/okhttp/OkHttpClient;

.field private connection:Lcom/squareup/okhttp/Connection;

.field private networkRequest:Lcom/squareup/okhttp/Request;

.field private networkResponse:Lcom/squareup/okhttp/Response;

.field private final priorResponse:Lcom/squareup/okhttp/Response;

.field private requestBodyOut:Lokio/Sink;

.field private responseBody:Lokio/BufferedSource;

.field private responseBodyBytes:Ljava/io/InputStream;

.field private responseTransferSource:Lokio/Source;

.field private route:Lcom/squareup/okhttp/Route;

.field private routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

.field sentRequestMillis:J

.field private storeRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

.field private transparentGzip:Z

.field private transport:Lcom/squareup/okhttp/internal/http/Transport;

.field private final userRequest:Lcom/squareup/okhttp/Request;

.field private userResponse:Lcom/squareup/okhttp/Response;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 92
    new-instance v0, Lcom/squareup/okhttp/internal/http/HttpEngine$1;

    invoke-direct {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine$1;-><init>()V

    sput-object v0, Lcom/squareup/okhttp/internal/http/HttpEngine;->EMPTY_BODY:Lcom/squareup/okhttp/ResponseBody;

    return-void
.end method

.method public constructor <init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;ZLcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RouteSelector;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)V
    .registers 10
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "request"    # Lcom/squareup/okhttp/Request;
    .param p3, "bufferRequestBody"    # Z
    .param p4, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p5, "routeSelector"    # Lcom/squareup/okhttp/internal/http/RouteSelector;
    .param p6, "requestBodyOut"    # Lcom/squareup/okhttp/internal/http/RetryableSink;
    .param p7, "priorResponse"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->sentRequestMillis:J

    .line 189
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 190
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    .line 191
    iput-boolean p3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferRequestBody:Z

    .line 192
    iput-object p4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 193
    iput-object p5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    .line 194
    iput-object p6, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    .line 195
    iput-object p7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    .line 197
    if-eqz p4, :cond_23

    .line 198
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v0, p4, p0}, Lcom/squareup/okhttp/internal/Internal;->setOwner(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)V

    .line 199
    invoke-virtual {p4}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->route:Lcom/squareup/okhttp/Route;

    .line 203
    :goto_22
    return-void

    .line 201
    :cond_23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->route:Lcom/squareup/okhttp/Route;

    goto :goto_22
.end method

.method private static combine(Lcom/squareup/okhttp/Headers;Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Headers;
    .registers 7
    .param p0, "cachedHeaders"    # Lcom/squareup/okhttp/Headers;
    .param p1, "networkHeaders"    # Lcom/squareup/okhttp/Headers;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 749
    new-instance v2, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v2}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    .line 751
    .local v2, "result":Lcom/squareup/okhttp/Headers$Builder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    invoke-virtual {p0}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v4

    if-ge v1, v4, :cond_37

    .line 752
    invoke-virtual {p0, v1}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v0

    .line 753
    .local v0, "fieldName":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    .line 754
    .local v3, "value":Ljava/lang/String;
    const-string v4, "Warning"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_27

    const-string v4, "1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_27

    .line 751
    :cond_24
    :goto_24
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 757
    :cond_27
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/OkHeaders;->isEndToEnd(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_33

    invoke-virtual {p1, v0}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_24

    .line 758
    :cond_33
    invoke-virtual {v2, v0, v3}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_24

    .line 762
    .end local v0    # "fieldName":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_37
    const/4 v1, 0x0

    :goto_38
    invoke-virtual {p1}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v4

    if-ge v1, v4, :cond_5b

    .line 763
    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v0

    .line 764
    .restart local v0    # "fieldName":Ljava/lang/String;
    const-string v4, "Content-Length"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4d

    .line 762
    :cond_4a
    :goto_4a
    add-int/lit8 v1, v1, 0x1

    goto :goto_38

    .line 767
    :cond_4d
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/OkHeaders;->isEndToEnd(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 768
    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v0, v4}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_4a

    .line 772
    .end local v0    # "fieldName":Ljava/lang/String;
    :cond_5b
    invoke-virtual {v2}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v4

    return-object v4
.end method

.method private connect(Lcom/squareup/okhttp/Request;)V
    .registers 3
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v0, :cond_a

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 310
    :cond_a
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-nez v0, :cond_16

    .line 311
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-static {p1, v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->get(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/http/RouteSelector;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    .line 314
    :cond_16
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    invoke-virtual {v0, p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->next(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/Connection;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 315
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->route:Lcom/squareup/okhttp/Route;

    .line 316
    return-void
.end method

.method public static hostHeader(Ljava/net/URL;)Ljava/lang/String;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 614
    invoke-static {p0}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v0

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/Util;->getDefaultPort(Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_2e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2d
    return-object v0

    :cond_2e
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    goto :goto_2d
.end method

.method private initContentStream(Lokio/Source;)V
    .registers 5
    .param p1, "transferSource"    # Lokio/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 530
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseTransferSource:Lokio/Source;

    .line 531
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transparentGzip:Z

    if-eqz v0, :cond_3a

    const-string v0, "gzip"

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    const-string v2, "Content-Encoding"

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 532
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v0

    const-string v1, "Content-Encoding"

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/Response$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v0

    const-string v1, "Content-Length"

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/Response$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    .line 536
    new-instance v0, Lokio/GzipSource;

    invoke-direct {v0, p1}, Lokio/GzipSource;-><init>(Lokio/Source;)V

    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseBody:Lokio/BufferedSource;

    .line 540
    :goto_39
    return-void

    .line 538
    :cond_3a
    invoke-static {p1}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseBody:Lokio/BufferedSource;

    goto :goto_39
.end method

.method private isRecoverable(Ljava/io/IOException;)Z
    .registers 7
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 410
    instance-of v4, p1, Ljavax/net/ssl/SSLPeerUnverifiedException;

    if-nez v4, :cond_12

    instance-of v4, p1, Ljavax/net/ssl/SSLHandshakeException;

    if-eqz v4, :cond_1a

    invoke-virtual {p1}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    instance-of v4, v4, Ljava/security/cert/CertificateException;

    if-eqz v4, :cond_1a

    :cond_12
    move v1, v3

    .line 412
    .local v1, "sslFailure":Z
    :goto_13
    instance-of v0, p1, Ljava/net/ProtocolException;

    .line 413
    .local v0, "protocolFailure":Z
    if-nez v1, :cond_1c

    if-nez v0, :cond_1c

    :goto_19
    return v3

    .end local v0    # "protocolFailure":Z
    .end local v1    # "sslFailure":Z
    :cond_1a
    move v1, v2

    .line 410
    goto :goto_13

    .restart local v0    # "protocolFailure":Z
    .restart local v1    # "sslFailure":Z
    :cond_1c
    move v3, v2

    .line 413
    goto :goto_19
.end method

.method private maybeCache()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 425
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1, v2}, Lcom/squareup/okhttp/internal/Internal;->internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v0

    .line 426
    .local v0, "responseCache":Lcom/squareup/okhttp/internal/InternalCache;
    if-nez v0, :cond_b

    .line 442
    :cond_a
    :goto_a
    return-void

    .line 429
    :cond_b
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-static {v1, v2}, Lcom/squareup/okhttp/internal/http/CacheStrategy;->isCacheable(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Request;)Z

    move-result v1

    if-nez v1, :cond_29

    .line 430
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/HttpMethod;->invalidatesCache(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 432
    :try_start_21
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-interface {v0, v1}, Lcom/squareup/okhttp/internal/InternalCache;->remove(Lcom/squareup/okhttp/Request;)V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_26} :catch_27

    goto :goto_a

    .line 433
    :catch_27
    move-exception v1

    goto :goto_a

    .line 441
    :cond_29
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/squareup/okhttp/internal/InternalCache;->put(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/CacheRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->storeRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    goto :goto_a
.end method

.method private networkRequest(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Request;
    .registers 8
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 577
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v3

    .line 579
    .local v3, "result":Lcom/squareup/okhttp/Request$Builder;
    const-string v4, "Host"

    invoke-virtual {p1, v4}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_19

    .line 580
    const-string v4, "Host"

    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v5

    invoke-static {v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hostHeader(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 583
    :cond_19
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v4, :cond_27

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v4}, Lcom/squareup/okhttp/Connection;->getProtocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v4

    sget-object v5, Lcom/squareup/okhttp/Protocol;->HTTP_1_0:Lcom/squareup/okhttp/Protocol;

    if-eq v4, v5, :cond_36

    :cond_27
    const-string v4, "Connection"

    invoke-virtual {p1, v4}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_36

    .line 585
    const-string v4, "Connection"

    const-string v5, "Keep-Alive"

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 588
    :cond_36
    const-string v4, "Accept-Encoding"

    invoke-virtual {p1, v4}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_48

    .line 589
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transparentGzip:Z

    .line 590
    const-string v4, "Accept-Encoding"

    const-string v5, "gzip"

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 593
    :cond_48
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v4}, Lcom/squareup/okhttp/OkHttpClient;->getCookieHandler()Ljava/net/CookieHandler;

    move-result-object v0

    .line 594
    .local v0, "cookieHandler":Ljava/net/CookieHandler;
    if-eqz v0, :cond_68

    .line 598
    invoke-virtual {v3}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/Request;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/http/OkHeaders;->toMultimap(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    .line 600
    .local v2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->uri()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v0, v4, v2}, Ljava/net/CookieHandler;->get(Ljava/net/URI;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 603
    .local v1, "cookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-static {v3, v1}, Lcom/squareup/okhttp/internal/http/OkHeaders;->addCookies(Lcom/squareup/okhttp/Request$Builder;Ljava/util/Map;)V

    .line 606
    .end local v1    # "cookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_68
    const-string v4, "User-Agent"

    invoke-virtual {p1, v4}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_79

    .line 607
    const-string v4, "User-Agent"

    invoke-static {}, Lcom/squareup/okhttp/internal/Version;->userAgent()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 610
    :cond_79
    invoke-virtual {v3}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v4

    return-object v4
.end method

.method private static stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;
    .registers 3
    .param p0, "response"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 301
    if-eqz p0, :cond_15

    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/Response$Builder;->body(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object p0

    .end local p0    # "response":Lcom/squareup/okhttp/Response;
    :cond_15
    return-object p0
.end method

.method private static validate(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)Z
    .registers 10
    .param p0, "cached"    # Lcom/squareup/okhttp/Response;
    .param p1, "network"    # Lcom/squareup/okhttp/Response;

    .prologue
    const/4 v2, 0x1

    .line 725
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->code()I

    move-result v3

    const/16 v4, 0x130

    if-ne v3, v4, :cond_a

    .line 741
    :cond_9
    :goto_9
    return v2

    .line 732
    :cond_a
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v3

    const-string v4, "Last-Modified"

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Headers;->getDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 733
    .local v0, "lastModified":Ljava/util/Date;
    if-eqz v0, :cond_2e

    .line 734
    invoke-virtual {p1}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v3

    const-string v4, "Last-Modified"

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Headers;->getDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 735
    .local v1, "networkLastModified":Ljava/util/Date;
    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-ltz v3, :cond_9

    .line 741
    .end local v1    # "networkLastModified":Ljava/util/Date;
    :cond_2e
    const/4 v2, 0x0

    goto :goto_9
.end method


# virtual methods
.method public close()Lcom/squareup/okhttp/Connection;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 476
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    if-eqz v2, :cond_1f

    .line 478
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 484
    :cond_a
    :goto_a
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseBody:Lokio/BufferedSource;

    if-nez v2, :cond_29

    .line 485
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v2, :cond_1b

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 486
    :cond_1b
    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    move-object v0, v1

    .line 510
    :goto_1e
    return-object v0

    .line 479
    :cond_1f
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    if-eqz v2, :cond_a

    .line 480
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_a

    .line 491
    :cond_29
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseBody:Lokio/BufferedSource;

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 494
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseBodyBytes:Ljava/io/InputStream;

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 497
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    if-eqz v2, :cond_50

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v2, :cond_50

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v2}, Lcom/squareup/okhttp/internal/http/Transport;->canReuseConnection()Z

    move-result v2

    if-nez v2, :cond_50

    .line 498
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 499
    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    move-object v0, v1

    .line 500
    goto :goto_1e

    .line 504
    :cond_50
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v2, :cond_60

    sget-object v2, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/internal/Internal;->clearOwner(Lcom/squareup/okhttp/Connection;)Z

    move-result v2

    if-nez v2, :cond_60

    .line 505
    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 508
    :cond_60
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 509
    .local v0, "result":Lcom/squareup/okhttp/Connection;
    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    goto :goto_1e
.end method

.method public disconnect()V
    .registers 2

    .prologue
    .line 463
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    if-eqz v0, :cond_9

    .line 465
    :try_start_4
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v0, p0}, Lcom/squareup/okhttp/internal/http/Transport;->disconnect(Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_9} :catch_a

    .line 469
    :cond_9
    :goto_9
    return-void

    .line 466
    :catch_a
    move-exception v0

    goto :goto_9
.end method

.method public followUpRequest()Lcom/squareup/okhttp/Request;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 788
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    if-nez v7, :cond_b

    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6}, Ljava/lang/IllegalStateException;-><init>()V

    throw v6

    .line 789
    :cond_b
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v7

    if-eqz v7, :cond_23

    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v7

    invoke-virtual {v7}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v4

    .line 792
    .local v4, "selectedProxy":Ljava/net/Proxy;
    :goto_19
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->code()I

    move-result v2

    .line 794
    .local v2, "responseCode":I
    sparse-switch v2, :sswitch_data_f0

    .line 848
    :cond_22
    :goto_22
    return-object v6

    .line 789
    .end local v2    # "responseCode":I
    .end local v4    # "selectedProxy":Ljava/net/Proxy;
    :cond_23
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v7}, Lcom/squareup/okhttp/OkHttpClient;->getProxy()Ljava/net/Proxy;

    move-result-object v4

    goto :goto_19

    .line 796
    .restart local v2    # "responseCode":I
    .restart local v4    # "selectedProxy":Ljava/net/Proxy;
    :sswitch_2a
    invoke-virtual {v4}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v6

    sget-object v7, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-eq v6, v7, :cond_3a

    .line 797
    new-instance v6, Ljava/net/ProtocolException;

    const-string v7, "Received HTTP_PROXY_AUTH (407) code while not using proxy"

    invoke-direct {v6, v7}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 801
    :cond_3a
    :sswitch_3a
    iget-object v6, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v6}, Lcom/squareup/okhttp/OkHttpClient;->getAuthenticator()Lcom/squareup/okhttp/Authenticator;

    move-result-object v6

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v6, v7, v4}, Lcom/squareup/okhttp/internal/http/OkHeaders;->processAuthHeader(Lcom/squareup/okhttp/Authenticator;Lcom/squareup/okhttp/Response;Ljava/net/Proxy;)Lcom/squareup/okhttp/Request;

    move-result-object v6

    goto :goto_22

    .line 807
    :sswitch_47
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v7

    const-string v8, "GET"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_63

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v7

    const-string v8, "HEAD"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_22

    .line 816
    :cond_63
    :sswitch_63
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v7}, Lcom/squareup/okhttp/OkHttpClient;->getFollowRedirects()Z

    move-result v7

    if-eqz v7, :cond_22

    .line 818
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    const-string v8, "Location"

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 819
    .local v0, "location":Ljava/lang/String;
    if-eqz v0, :cond_22

    .line 820
    new-instance v5, Ljava/net/URL;

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v7

    invoke-direct {v5, v7, v0}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 823
    .local v5, "url":Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v7

    const-string v8, "https"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_98

    invoke-virtual {v5}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v7

    const-string v8, "http"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_22

    .line 826
    :cond_98
    invoke-virtual {v5}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v8}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 827
    .local v3, "sameProtocol":Z
    if-nez v3, :cond_b4

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v7}, Lcom/squareup/okhttp/OkHttpClient;->getFollowSslRedirects()Z

    move-result v7

    if-eqz v7, :cond_22

    .line 830
    :cond_b4
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    .line 831
    .local v1, "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/squareup/okhttp/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_da

    .line 832
    const-string v7, "GET"

    invoke-virtual {v1, v7, v6}, Lcom/squareup/okhttp/Request$Builder;->method(Ljava/lang/String;Lcom/squareup/okhttp/RequestBody;)Lcom/squareup/okhttp/Request$Builder;

    .line 833
    const-string v6, "Transfer-Encoding"

    invoke-virtual {v1, v6}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 834
    const-string v6, "Content-Length"

    invoke-virtual {v1, v6}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 835
    const-string v6, "Content-Type"

    invoke-virtual {v1, v6}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 841
    :cond_da
    invoke-virtual {p0, v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->sameConnection(Ljava/net/URL;)Z

    move-result v6

    if-nez v6, :cond_e5

    .line 842
    const-string v6, "Authorization"

    invoke-virtual {v1, v6}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 845
    :cond_e5
    invoke-virtual {v1, v5}, Lcom/squareup/okhttp/Request$Builder;->url(Ljava/net/URL;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v6

    goto/16 :goto_22

    .line 794
    nop

    :sswitch_data_f0
    .sparse-switch
        0x12c -> :sswitch_63
        0x12d -> :sswitch_63
        0x12e -> :sswitch_63
        0x12f -> :sswitch_63
        0x133 -> :sswitch_47
        0x134 -> :sswitch_47
        0x191 -> :sswitch_3a
        0x197 -> :sswitch_2a
    .end sparse-switch
.end method

.method public getBufferedRequestBody()Lokio/BufferedSink;
    .registers 4

    .prologue
    .line 338
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    .line 339
    .local v1, "result":Lokio/BufferedSink;
    if-eqz v1, :cond_5

    .line 341
    .end local v1    # "result":Lokio/BufferedSink;
    :goto_4
    return-object v1

    .line 340
    .restart local v1    # "result":Lokio/BufferedSink;
    :cond_5
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRequestBody()Lokio/Sink;

    move-result-object v0

    .line 341
    .local v0, "requestBody":Lokio/Sink;
    if-eqz v0, :cond_13

    invoke-static {v0}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v2

    iput-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    :goto_11
    move-object v1, v2

    goto :goto_4

    :cond_13
    const/4 v2, 0x0

    goto :goto_11
.end method

.method public getConnection()Lcom/squareup/okhttp/Connection;
    .registers 2

    .prologue
    .line 374
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    return-object v0
.end method

.method public getRequest()Lcom/squareup/okhttp/Request;
    .registers 2

    .prologue
    .line 351
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    return-object v0
.end method

.method public getRequestBody()Lokio/Sink;
    .registers 2

    .prologue
    .line 333
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 334
    :cond_a
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    return-object v0
.end method

.method public getResponse()Lcom/squareup/okhttp/Response;
    .registers 2

    .prologue
    .line 357
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 358
    :cond_a
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method public getResponseBody()Lokio/BufferedSource;
    .registers 2

    .prologue
    .line 362
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    if-nez v0, :cond_a

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 363
    :cond_a
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseBody:Lokio/BufferedSource;

    return-object v0
.end method

.method public getResponseBodyBytes()Ljava/io/InputStream;
    .registers 3

    .prologue
    .line 367
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseBodyBytes:Ljava/io/InputStream;

    .line 368
    .local v0, "result":Ljava/io/InputStream;
    if-eqz v0, :cond_5

    .end local v0    # "result":Ljava/io/InputStream;
    :goto_4
    return-object v0

    .restart local v0    # "result":Ljava/io/InputStream;
    :cond_5
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponseBody()Lokio/BufferedSource;

    move-result-object v1

    invoke-static {v1}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v1

    invoke-interface {v1}, Lokio/BufferedSource;->inputStream()Ljava/io/InputStream;

    move-result-object v0

    .end local v0    # "result":Ljava/io/InputStream;
    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseBodyBytes:Ljava/io/InputStream;

    goto :goto_4
.end method

.method public getRoute()Lcom/squareup/okhttp/Route;
    .registers 2

    .prologue
    .line 421
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->route:Lcom/squareup/okhttp/Route;

    return-object v0
.end method

.method public hasResponse()Z
    .registers 2

    .prologue
    .line 347
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public hasResponseBody()Z
    .registers 9

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 548
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v3

    const-string v4, "HEAD"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 567
    :cond_10
    :goto_10
    return v1

    .line 552
    :cond_11
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->code()I

    move-result v0

    .line 553
    .local v0, "responseCode":I
    const/16 v3, 0x64

    if-lt v0, v3, :cond_1f

    const/16 v3, 0xc8

    if-lt v0, v3, :cond_29

    :cond_1f
    const/16 v3, 0xcc

    if-eq v0, v3, :cond_29

    const/16 v3, 0x130

    if-eq v0, v3, :cond_29

    move v1, v2

    .line 556
    goto :goto_10

    .line 562
    :cond_29
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v3}, Lcom/squareup/okhttp/internal/http/OkHeaders;->contentLength(Lcom/squareup/okhttp/Response;)J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v3, v4, v6

    if-nez v3, :cond_45

    const-string v3, "chunked"

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkResponse:Lcom/squareup/okhttp/Response;

    const-string v5, "Transfer-Encoding"

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_10

    :cond_45
    move v1, v2

    .line 564
    goto :goto_10
.end method

.method permitsRequestBody()Z
    .registers 2

    .prologue
    .line 328
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public readResponse()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, -0x1

    .line 624
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    if-eqz v3, :cond_7

    .line 718
    :cond_6
    :goto_6
    return-void

    .line 627
    :cond_7
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    if-nez v3, :cond_17

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    if-nez v3, :cond_17

    .line 628
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "call sendRequest() first!"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 630
    :cond_17
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    if-eqz v3, :cond_6

    .line 635
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    if-eqz v3, :cond_34

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->buffer()Lokio/Buffer;

    move-result-object v3

    invoke-virtual {v3}, Lokio/Buffer;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_34

    .line 636
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V

    .line 639
    :cond_34
    iget-wide v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->sentRequestMillis:J

    cmp-long v3, v4, v8

    if-nez v3, :cond_6f

    .line 640
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-static {v3}, Lcom/squareup/okhttp/internal/http/OkHeaders;->contentLength(Lcom/squareup/okhttp/Request;)J

    move-result-wide v4

    cmp-long v3, v4, v8

    if-nez v3, :cond_68

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    instance-of v3, v3, Lcom/squareup/okhttp/internal/http/RetryableSink;

    if-eqz v3, :cond_68

    .line 643
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    check-cast v3, Lcom/squareup/okhttp/internal/http/RetryableSink;

    invoke-virtual {v3}, Lcom/squareup/okhttp/internal/http/RetryableSink;->contentLength()J

    move-result-wide v0

    .line 644
    .local v0, "contentLength":J
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v3

    const-string v4, "Content-Length"

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    .line 648
    .end local v0    # "contentLength":J
    :cond_68
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-interface {v3, v4}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestHeaders(Lcom/squareup/okhttp/Request;)V

    .line 651
    :cond_6f
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    if-eqz v3, :cond_8b

    .line 652
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    if-eqz v3, :cond_163

    .line 654
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferedRequestBody:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->close()V

    .line 658
    :goto_7c
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    instance-of v3, v3, Lcom/squareup/okhttp/internal/http/RetryableSink;

    if-eqz v3, :cond_8b

    .line 659
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    check-cast v3, Lcom/squareup/okhttp/internal/http/RetryableSink;

    invoke-interface {v4, v3}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestBody(Lcom/squareup/okhttp/internal/http/RetryableSink;)V

    .line 663
    :cond_8b
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v3}, Lcom/squareup/okhttp/internal/http/Transport;->flushRequest()V

    .line 665
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v3}, Lcom/squareup/okhttp/internal/http/Transport;->readResponseHeaders()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v4}, Lcom/squareup/okhttp/Connection;->getHandshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->handshake(Lcom/squareup/okhttp/Handshake;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    sget-object v4, Lcom/squareup/okhttp/internal/http/OkHeaders;->SENT_MILLIS:Ljava/lang/String;

    iget-wide v6, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->sentRequestMillis:J

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Response$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    sget-object v4, Lcom/squareup/okhttp/internal/http/OkHeaders;->RECEIVED_MILLIS:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/Response$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkResponse:Lcom/squareup/okhttp/Response;

    .line 671
    sget-object v3, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v5}, Lcom/squareup/okhttp/Response;->protocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/squareup/okhttp/internal/Internal;->setProtocol(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/Protocol;)V

    .line 672
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->receiveHeaders(Lcom/squareup/okhttp/Headers;)V

    .line 675
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    if-eqz v3, :cond_173

    .line 676
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v3, v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->validate(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)Z

    move-result v3

    if-eqz v3, :cond_16a

    .line 677
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->priorResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v4}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v5}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->combine(Lcom/squareup/okhttp/Headers;Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Headers;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->headers(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->cacheResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->networkResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    .line 684
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v3}, Lcom/squareup/okhttp/internal/http/Transport;->emptyTransferStream()V

    .line 685
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 689
    sget-object v3, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/internal/Internal;->internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v2

    .line 690
    .local v2, "responseCache":Lcom/squareup/okhttp/internal/InternalCache;
    invoke-interface {v2}, Lcom/squareup/okhttp/internal/InternalCache;->trackConditionalCacheHit()V

    .line 691
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/squareup/okhttp/internal/InternalCache;->update(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response;)V

    .line 693
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v3

    if-eqz v3, :cond_6

    .line 694
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->initContentStream(Lokio/Source;)V

    goto/16 :goto_6

    .line 656
    .end local v2    # "responseCache":Lcom/squareup/okhttp/internal/InternalCache;
    :cond_163
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    invoke-interface {v3}, Lokio/Sink;->close()V

    goto/16 :goto_7c

    .line 698
    :cond_16a
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v3

    invoke-static {v3}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 702
    :cond_173
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->priorResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->cacheResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response$Builder;->networkResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    .line 709
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hasResponseBody()Z

    move-result v3

    if-nez v3, :cond_1bd

    .line 711
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->storeRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    invoke-interface {v3, v4}, Lcom/squareup/okhttp/internal/http/Transport;->getTransferStream(Lcom/squareup/okhttp/internal/http/CacheRequest;)Lokio/Source;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseTransferSource:Lokio/Source;

    .line 712
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseTransferSource:Lokio/Source;

    invoke-static {v3}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->responseBody:Lokio/BufferedSource;

    goto/16 :goto_6

    .line 716
    :cond_1bd
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->maybeCache()V

    .line 717
    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->storeRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    invoke-interface {v3, v4}, Lcom/squareup/okhttp/internal/http/Transport;->getTransferStream(Lcom/squareup/okhttp/internal/http/CacheRequest;)Lokio/Source;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->initContentStream(Lokio/Source;)V

    goto/16 :goto_6
.end method

.method public receiveHeaders(Lcom/squareup/okhttp/Headers;)V
    .registers 5
    .param p1, "headers"    # Lcom/squareup/okhttp/Headers;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 776
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getCookieHandler()Ljava/net/CookieHandler;

    move-result-object v0

    .line 777
    .local v0, "cookieHandler":Ljava/net/CookieHandler;
    if-eqz v0, :cond_16

    .line 778
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->uri()Ljava/net/URI;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p1, v2}, Lcom/squareup/okhttp/internal/http/OkHeaders;->toMultimap(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/net/CookieHandler;->put(Ljava/net/URI;Ljava/util/Map;)V

    .line 780
    :cond_16
    return-void
.end method

.method public recover(Ljava/io/IOException;)Lcom/squareup/okhttp/internal/http/HttpEngine;
    .registers 3
    .param p1, "e"    # Ljava/io/IOException;

    .prologue
    .line 404
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    invoke-virtual {p0, p1, v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->recover(Ljava/io/IOException;Lokio/Sink;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v0

    return-object v0
.end method

.method public recover(Ljava/io/IOException;Lokio/Sink;)Lcom/squareup/okhttp/internal/http/HttpEngine;
    .registers 12
    .param p1, "e"    # Ljava/io/IOException;
    .param p2, "requestBodyOut"    # Lokio/Sink;

    .prologue
    .line 384
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v0, :cond_f

    .line 385
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v0, v1, p1}, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectFailed(Lcom/squareup/okhttp/Connection;Ljava/io/IOException;)V

    .line 388
    :cond_f
    if-eqz p2, :cond_15

    instance-of v0, p2, Lcom/squareup/okhttp/internal/http/RetryableSink;

    if-eqz v0, :cond_34

    :cond_15
    const/4 v8, 0x1

    .line 389
    .local v8, "canRetryRequestBody":Z
    :goto_16
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-nez v0, :cond_1e

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v0, :cond_32

    :cond_1e
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_32

    :cond_2a
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->isRecoverable(Ljava/io/IOException;)Z

    move-result v0

    if-eqz v0, :cond_32

    if-nez v8, :cond_36

    .line 393
    :cond_32
    const/4 v0, 0x0

    .line 399
    :goto_33
    return-object v0

    .line 388
    .end local v8    # "canRetryRequestBody":Z
    :cond_34
    const/4 v8, 0x0

    goto :goto_16

    .line 396
    .restart local v8    # "canRetryRequestBody":Z
    :cond_36
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->close()Lcom/squareup/okhttp/Connection;

    move-result-object v4

    .line 399
    .local v4, "connection":Lcom/squareup/okhttp/Connection;
    new-instance v0, Lcom/squareup/okhttp/internal/http/HttpEngine;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    iget-boolean v3, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferRequestBody:Z

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->routeSelector:Lcom/squareup/okhttp/internal/http/RouteSelector;

    move-object v6, p2

    check-cast v6, Lcom/squareup/okhttp/internal/http/RetryableSink;

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    invoke-direct/range {v0 .. v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;ZLcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RouteSelector;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)V

    goto :goto_33
.end method

.method public releaseConnection()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 450
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v0, :cond_d

    .line 451
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v0}, Lcom/squareup/okhttp/internal/http/Transport;->releaseConnectionOnIdle()V

    .line 453
    :cond_d
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 454
    return-void
.end method

.method public sameConnection(Ljava/net/URL;)Z
    .registers 5
    .param p1, "followUp"    # Ljava/net/URL;

    .prologue
    .line 857
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v0

    .line 858
    .local v0, "url":Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v1

    invoke-static {p1}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v2

    if-ne v1, v2, :cond_2e

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    const/4 v1, 0x1

    :goto_2d
    return v1

    :cond_2e
    const/4 v1, 0x0

    goto :goto_2d
.end method

.method public sendRequest()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 211
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    if-eqz v8, :cond_6

    .line 298
    :cond_5
    :goto_5
    return-void

    .line 212
    :cond_6
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    if-eqz v8, :cond_10

    new-instance v7, Ljava/lang/IllegalStateException;

    invoke-direct {v7}, Ljava/lang/IllegalStateException;-><init>()V

    throw v7

    .line 214
    :cond_10
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-direct {p0, v8}, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Request;

    move-result-object v1

    .line 216
    .local v1, "request":Lcom/squareup/okhttp/Request;
    sget-object v8, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v8, v9}, Lcom/squareup/okhttp/internal/Internal;->internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v6

    .line 217
    .local v6, "responseCache":Lcom/squareup/okhttp/internal/InternalCache;
    if-eqz v6, :cond_8b

    invoke-interface {v6, v1}, Lcom/squareup/okhttp/internal/InternalCache;->get(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    .line 221
    .local v0, "cacheCandidate":Lcom/squareup/okhttp/Response;
    :goto_24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 222
    .local v4, "now":J
    new-instance v8, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;

    invoke-direct {v8, v4, v5, v1, v0}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;-><init>(JLcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;)V

    invoke-virtual {v8}, Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;->get()Lcom/squareup/okhttp/internal/http/CacheStrategy;

    move-result-object v8

    iput-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    .line 223
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    iget-object v8, v8, Lcom/squareup/okhttp/internal/http/CacheStrategy;->networkRequest:Lcom/squareup/okhttp/Request;

    iput-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    .line 224
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    iget-object v8, v8, Lcom/squareup/okhttp/internal/http/CacheStrategy;->cacheResponse:Lcom/squareup/okhttp/Response;

    iput-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 226
    if-eqz v6, :cond_46

    .line 227
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheStrategy:Lcom/squareup/okhttp/internal/http/CacheStrategy;

    invoke-interface {v6, v8}, Lcom/squareup/okhttp/internal/InternalCache;->trackResponse(Lcom/squareup/okhttp/internal/http/CacheStrategy;)V

    .line 230
    :cond_46
    if-eqz v0, :cond_53

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    if-nez v8, :cond_53

    .line 231
    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v8

    invoke-static {v8}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 234
    :cond_53
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    if-eqz v8, :cond_ba

    .line 236
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-nez v7, :cond_60

    .line 237
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->networkRequest:Lcom/squareup/okhttp/Request;

    invoke-direct {p0, v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->connect(Lcom/squareup/okhttp/Request;)V

    .line 240
    :cond_60
    sget-object v7, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v7, v8, p0}, Lcom/squareup/okhttp/internal/Internal;->newTransport(Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/internal/http/Transport;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    .line 244
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->permitsRequestBody()Z

    move-result v7

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    if-nez v7, :cond_5

    .line 245
    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/OkHeaders;->contentLength(Lcom/squareup/okhttp/Request;)J

    move-result-wide v2

    .line 246
    .local v2, "contentLength":J
    iget-boolean v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->bufferRequestBody:Z

    if-eqz v7, :cond_ab

    .line 247
    const-wide/32 v8, 0x7fffffff

    cmp-long v7, v2, v8

    if-lez v7, :cond_8d

    .line 248
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "Use setFixedLengthStreamingMode() or setChunkedStreamingMode() for requests larger than 2 GiB."

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .end local v0    # "cacheCandidate":Lcom/squareup/okhttp/Response;
    .end local v2    # "contentLength":J
    .end local v4    # "now":J
    :cond_8b
    move-object v0, v7

    .line 217
    goto :goto_24

    .line 252
    .restart local v0    # "cacheCandidate":Lcom/squareup/okhttp/Response;
    .restart local v2    # "contentLength":J
    .restart local v4    # "now":J
    :cond_8d
    const-wide/16 v8, -0x1

    cmp-long v7, v2, v8

    if-eqz v7, :cond_a2

    .line 254
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v7, v1}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestHeaders(Lcom/squareup/okhttp/Request;)V

    .line 255
    new-instance v7, Lcom/squareup/okhttp/internal/http/RetryableSink;

    long-to-int v8, v2

    invoke-direct {v7, v8}, Lcom/squareup/okhttp/internal/http/RetryableSink;-><init>(I)V

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    goto/16 :goto_5

    .line 260
    :cond_a2
    new-instance v7, Lcom/squareup/okhttp/internal/http/RetryableSink;

    invoke-direct {v7}, Lcom/squareup/okhttp/internal/http/RetryableSink;-><init>()V

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    goto/16 :goto_5

    .line 263
    :cond_ab
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v7, v1}, Lcom/squareup/okhttp/internal/http/Transport;->writeRequestHeaders(Lcom/squareup/okhttp/Request;)V

    .line 264
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->transport:Lcom/squareup/okhttp/internal/http/Transport;

    invoke-interface {v7, v1, v2, v3}, Lcom/squareup/okhttp/internal/http/Transport;->createRequestBody(Lcom/squareup/okhttp/Request;J)Lokio/Sink;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->requestBodyOut:Lokio/Sink;

    goto/16 :goto_5

    .line 270
    .end local v2    # "contentLength":J
    :cond_ba
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    if-eqz v8, :cond_cd

    .line 271
    sget-object v8, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v9, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v9}, Lcom/squareup/okhttp/OkHttpClient;->getConnectionPool()Lcom/squareup/okhttp/ConnectionPool;

    move-result-object v9

    iget-object v10, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v8, v9, v10}, Lcom/squareup/okhttp/internal/Internal;->recycle(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;)V

    .line 272
    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->connection:Lcom/squareup/okhttp/Connection;

    .line 275
    :cond_cd
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    if-eqz v7, :cond_10e

    .line 277
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v8}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->priorResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->cacheResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v8}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->cacheResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    .line 294
    :goto_f7
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v7

    if-eqz v7, :cond_5

    .line 295
    iget-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v7

    invoke-virtual {v7}, Lcom/squareup/okhttp/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;->initContentStream(Lokio/Source;)V

    goto/16 :goto_5

    .line 284
    :cond_10e
    new-instance v7, Lcom/squareup/okhttp/Response$Builder;

    invoke-direct {v7}, Lcom/squareup/okhttp/Response$Builder;-><init>()V

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userRequest:Lcom/squareup/okhttp/Request;

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->priorResponse:Lcom/squareup/okhttp/Response;

    invoke-static {v8}, Lcom/squareup/okhttp/internal/http/HttpEngine;->stripBody(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->priorResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    sget-object v8, Lcom/squareup/okhttp/Protocol;->HTTP_1_1:Lcom/squareup/okhttp/Protocol;

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->protocol(Lcom/squareup/okhttp/Protocol;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    const/16 v8, 0x1f8

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->code(I)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    const-string v8, "Unsatisfiable Request (only-if-cached)"

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->message(Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    sget-object v8, Lcom/squareup/okhttp/internal/http/HttpEngine;->EMPTY_BODY:Lcom/squareup/okhttp/ResponseBody;

    invoke-virtual {v7, v8}, Lcom/squareup/okhttp/Response$Builder;->body(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v7

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v7

    iput-object v7, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->userResponse:Lcom/squareup/okhttp/Response;

    goto :goto_f7
.end method

.method public writingRequestHeaders()V
    .registers 5

    .prologue
    .line 323
    iget-wide v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->sentRequestMillis:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 324
    :cond_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/squareup/okhttp/internal/http/HttpEngine;->sentRequestMillis:J

    .line 325
    return-void
.end method
