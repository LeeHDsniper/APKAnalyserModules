.class public Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;
.super Ljava/net/HttpURLConnection;
.source "HttpURLConnectionImpl.java"


# instance fields
.field final client:Lcom/squareup/okhttp/OkHttpClient;

.field private fixedContentLength:J

.field handshake:Lcom/squareup/okhttp/Handshake;

.field protected httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

.field protected httpEngineFailure:Ljava/io/IOException;

.field private redirectionCount:I

.field private requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

.field private responseHeaders:Lcom/squareup/okhttp/Headers;

.field private route:Lcom/squareup/okhttp/Route;


# direct methods
.method public constructor <init>(Ljava/net/URL;Lcom/squareup/okhttp/OkHttpClient;)V
    .registers 5
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 97
    invoke-direct {p0, p1}, Ljava/net/HttpURLConnection;-><init>(Ljava/net/URL;)V

    .line 74
    new-instance v0, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    .line 77
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    .line 98
    iput-object p2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 99
    return-void
.end method

.method private defaultUserAgent()Ljava/lang/String;
    .registers 4

    .prologue
    .line 357
    const-string v1, "http.agent"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 358
    .local v0, "agent":Ljava/lang/String;
    if-eqz v0, :cond_9

    .end local v0    # "agent":Ljava/lang/String;
    :goto_8
    return-object v0

    .restart local v0    # "agent":Ljava/lang/String;
    :cond_9
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Java"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "java.version"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method

.method private execute(Z)Z
    .registers 5
    .param p1, "readResponse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 423
    :try_start_0
    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->sendRequest()V

    .line 424
    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v2

    iput-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->route:Lcom/squareup/okhttp/Route;

    .line 425
    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getConnection()Lcom/squareup/okhttp/Connection;

    move-result-object v2

    if-eqz v2, :cond_2a

    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getConnection()Lcom/squareup/okhttp/Connection;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->getHandshake()Lcom/squareup/okhttp/Handshake;

    move-result-object v2

    :goto_1f
    iput-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 428
    if-eqz p1, :cond_28

    .line 429
    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->readResponse()V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_28} :catch_2c

    .line 432
    :cond_28
    const/4 v2, 0x1

    .line 437
    :goto_29
    return v2

    .line 425
    :cond_2a
    const/4 v2, 0x0

    goto :goto_1f

    .line 433
    :catch_2c
    move-exception v0

    .line 434
    .local v0, "e":Ljava/io/IOException;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2, v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->recover(Ljava/io/IOException;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v1

    .line 435
    .local v1, "retryEngine":Lcom/squareup/okhttp/internal/http/HttpEngine;
    if-eqz v1, :cond_39

    .line 436
    iput-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 437
    const/4 v2, 0x0

    goto :goto_29

    .line 441
    :cond_39
    iput-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 442
    throw v0
.end method

.method private getHeaders()Lcom/squareup/okhttp/Headers;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lcom/squareup/okhttp/Headers;

    if-nez v2, :cond_3d

    .line 140
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v1

    .line 141
    .local v1, "response":Lcom/squareup/okhttp/Response;
    invoke-virtual {v1}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v0

    .line 143
    .local v0, "headers":Lcom/squareup/okhttp/Headers;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers;->newBuilder()Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/Platform;->getPrefix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-Response-Source"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->responseSourceHeader(Lcom/squareup/okhttp/Response;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v2

    iput-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lcom/squareup/okhttp/Headers;

    .line 147
    .end local v0    # "headers":Lcom/squareup/okhttp/Headers;
    .end local v1    # "response":Lcom/squareup/okhttp/Response;
    :cond_3d
    iget-object v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->responseHeaders:Lcom/squareup/okhttp/Headers;

    return-object v2
.end method

.method private getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 367
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->initHttpEngine()V

    .line 369
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hasResponse()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 370
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 383
    :goto_d
    return-object v4

    .line 374
    :cond_e
    :goto_e
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->execute(Z)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 378
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v3

    .line 379
    .local v3, "response":Lcom/squareup/okhttp/Response;
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->followUpRequest()Lcom/squareup/okhttp/Request;

    move-result-object v1

    .line 381
    .local v1, "followUp":Lcom/squareup/okhttp/Request;
    if-nez v1, :cond_2b

    .line 382
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 383
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    goto :goto_d

    .line 386
    :cond_2b
    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->isRedirect()Z

    move-result v4

    if-eqz v4, :cond_56

    iget v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->redirectionCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->redirectionCount:I

    const/16 v5, 0x14

    if-le v4, v5, :cond_56

    .line 387
    new-instance v4, Ljava/net/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Too many redirects: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->redirectionCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 391
    :cond_56
    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->url:Ljava/net/URL;

    .line 392
    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v4

    invoke-virtual {v4}, Lcom/squareup/okhttp/Headers;->newBuilder()Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    .line 397
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRequestBody()Lokio/Sink;

    move-result-object v2

    .line 398
    .local v2, "requestBody":Lokio/Sink;
    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_79

    .line 399
    const/4 v2, 0x0

    .line 402
    :cond_79
    if-eqz v2, :cond_89

    instance-of v4, v2, Lcom/squareup/okhttp/internal/http/RetryableSink;

    if-nez v4, :cond_89

    .line 403
    new-instance v4, Ljava/net/HttpRetryException;

    const-string v5, "Cannot retry streamed HTTP body"

    iget v6, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->responseCode:I

    invoke-direct {v4, v5, v6}, Ljava/net/HttpRetryException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 406
    :cond_89
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->sameConnection(Ljava/net/URL;)Z

    move-result v4

    if-nez v4, :cond_9a

    .line 407
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 410
    :cond_9a
    iget-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->close()Lcom/squareup/okhttp/Connection;

    move-result-object v0

    .line 411
    .local v0, "connection":Lcom/squareup/okhttp/Connection;
    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v4

    check-cast v2, Lcom/squareup/okhttp/internal/http/RetryableSink;

    .end local v2    # "requestBody":Lokio/Sink;
    invoke-direct {p0, v4, v0, v2, v3}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->newHttpEngine(Ljava/lang/String;Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v4

    iput-object v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    goto/16 :goto_e
.end method

.method private initHttpEngine()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    if-eqz v1, :cond_7

    .line 290
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    throw v1

    .line 291
    :cond_7
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    if-eqz v1, :cond_c

    .line 311
    :goto_b
    return-void

    .line 295
    :cond_c
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->connected:Z

    .line 297
    :try_start_f
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->doOutput:Z

    if-eqz v1, :cond_21

    .line 298
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    const-string v2, "GET"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 300
    const-string v1, "POST"

    iput-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    .line 306
    :cond_21
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->newHttpEngine(Ljava/lang/String;Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_2c} :catch_2d

    goto :goto_b

    .line 307
    :catch_2d
    move-exception v0

    .line 308
    .local v0, "e":Ljava/io/IOException;
    iput-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngineFailure:Ljava/io/IOException;

    .line 309
    throw v0

    .line 301
    .end local v0    # "e":Ljava/io/IOException;
    :cond_31
    :try_start_31
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_21

    .line 302
    new-instance v1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " does not support writing"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_54} :catch_2d
.end method

.method private newHttpEngine(Ljava/lang/String;Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/HttpEngine;
    .registers 16
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p3, "requestBody"    # Lcom/squareup/okhttp/internal/http/RetryableSink;
    .param p4, "priorResponse"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 315
    new-instance v0, Lcom/squareup/okhttp/Request$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/Request$Builder;-><init>()V

    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getURL()Ljava/net/URL;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/squareup/okhttp/Request$Builder;->url(Ljava/net/URL;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v0, p1, v4}, Lcom/squareup/okhttp/Request$Builder;->method(Ljava/lang/String;Lcom/squareup/okhttp/RequestBody;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v8

    .line 318
    .local v8, "builder":Lcom/squareup/okhttp/Request$Builder;
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v9

    .line 319
    .local v9, "headers":Lcom/squareup/okhttp/Headers;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_19
    invoke-virtual {v9}, Lcom/squareup/okhttp/Headers;->size()I

    move-result v0

    if-ge v10, v0, :cond_2d

    .line 320
    invoke-virtual {v9, v10}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v10}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v0, v4}, Lcom/squareup/okhttp/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 319
    add-int/lit8 v10, v10, 0x1

    goto :goto_19

    .line 323
    :cond_2d
    const/4 v3, 0x0

    .line 324
    .local v3, "bufferRequestBody":Z
    invoke-static {p1}, Lcom/squareup/okhttp/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_56

    .line 326
    iget-wide v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    const-wide/16 v6, -0x1

    cmp-long v0, v4, v6

    if-eqz v0, :cond_90

    .line 327
    const-string v0, "Content-Length"

    iget-wide v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v0, v4}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 335
    :goto_47
    const-string v0, "Content-Type"

    invoke-virtual {v9, v0}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_56

    .line 336
    const-string v0, "Content-Type"

    const-string v4, "application/x-www-form-urlencoded"

    invoke-virtual {v8, v0, v4}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 340
    :cond_56
    const-string v0, "User-Agent"

    invoke-virtual {v9, v0}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_67

    .line 341
    const-string v0, "User-Agent"

    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->defaultUserAgent()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v0, v4}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 344
    :cond_67
    invoke-virtual {v8}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v2

    .line 347
    .local v2, "request":Lcom/squareup/okhttp/Request;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 348
    .local v1, "engineClient":Lcom/squareup/okhttp/OkHttpClient;
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/Internal;->internalCache(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/InternalCache;

    move-result-object v0

    if-eqz v0, :cond_86

    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getUseCaches()Z

    move-result v0

    if-nez v0, :cond_86

    .line 349
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0}, Lcom/squareup/okhttp/OkHttpClient;->clone()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/squareup/okhttp/OkHttpClient;->setCache(Lcom/squareup/okhttp/Cache;)Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v1

    .line 352
    :cond_86
    new-instance v0, Lcom/squareup/okhttp/internal/http/HttpEngine;

    const/4 v5, 0x0

    move-object v4, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/squareup/okhttp/internal/http/HttpEngine;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;ZLcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RouteSelector;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)V

    return-object v0

    .line 328
    .end local v1    # "engineClient":Lcom/squareup/okhttp/OkHttpClient;
    .end local v2    # "request":Lcom/squareup/okhttp/Request;
    :cond_90
    iget v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->chunkLength:I

    if-lez v0, :cond_9c

    .line 329
    const-string v0, "Transfer-Encoding"

    const-string v4, "chunked"

    invoke-virtual {v8, v0, v4}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    goto :goto_47

    .line 331
    :cond_9c
    const/4 v3, 0x1

    goto :goto_47
.end method

.method private static responseSourceHeader(Lcom/squareup/okhttp/Response;)Ljava/lang/String;
    .registers 3
    .param p0, "response"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->networkResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    if-nez v0, :cond_27

    .line 152
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->cacheResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    if-nez v0, :cond_f

    .line 153
    const-string v0, "NONE"

    .line 160
    :goto_e
    return-object v0

    .line 155
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CACHE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->code()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 157
    :cond_27
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->cacheResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    if-nez v0, :cond_45

    .line 158
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NETWORK "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->code()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 160
    :cond_45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CONDITIONAL_CACHE "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->networkResponse()Lcom/squareup/okhttp/Response;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/Response;->code()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method private setProtocols(Ljava/lang/String;Z)V
    .registers 11
    .param p1, "protocolsString"    # Ljava/lang/String;
    .param p2, "append"    # Z

    .prologue
    .line 538
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 539
    .local v5, "protocolsList":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Protocol;>;"
    if-eqz p2, :cond_10

    .line 540
    iget-object v6, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v6}, Lcom/squareup/okhttp/OkHttpClient;->getProtocols()Ljava/util/List;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 542
    :cond_10
    const-string v6, ","

    const/4 v7, -0x1

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_19
    if-ge v2, v3, :cond_2e

    aget-object v4, v0, v2

    .line 544
    .local v4, "protocol":Ljava/lang/String;
    :try_start_1d
    invoke-static {v4}, Lcom/squareup/okhttp/Protocol;->get(Ljava/lang/String;)Lcom/squareup/okhttp/Protocol;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_24} :catch_27

    .line 542
    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    .line 545
    :catch_27
    move-exception v1

    .line 546
    .local v1, "e":Ljava/io/IOException;
    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 549
    .end local v1    # "e":Ljava/io/IOException;
    .end local v4    # "protocol":Ljava/lang/String;
    :cond_2e
    iget-object v6, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v6, v5}, Lcom/squareup/okhttp/OkHttpClient;->setProtocols(Ljava/util/List;)Lcom/squareup/okhttp/OkHttpClient;

    .line 550
    return-void
.end method


# virtual methods
.method public final addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 507
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-eqz v0, :cond_c

    .line 508
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot add request property after connection is made"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 510
    :cond_c
    if-nez p1, :cond_16

    .line 511
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "field == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 513
    :cond_16
    if-nez p2, :cond_39

    .line 519
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Ignoring header "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " because its value was null."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/Platform;->logW(Ljava/lang/String;)V

    .line 529
    :goto_38
    return-void

    .line 524
    :cond_39
    const-string v0, "X-Android-Transports"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    const-string v0, "X-Android-Protocols"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 525
    :cond_49
    const/4 v0, 0x1

    invoke-direct {p0, p2, v0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->setProtocols(Ljava/lang/String;Z)V

    goto :goto_38

    .line 527
    :cond_4e
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_38
.end method

.method public final connect()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->initHttpEngine()V

    .line 105
    :cond_3
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->execute(Z)Z

    move-result v0

    .line 106
    .local v0, "success":Z
    if-eqz v0, :cond_3

    .line 107
    return-void
.end method

.method public final disconnect()V
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    if-nez v0, :cond_5

    .line 120
    :goto_4
    return-void

    .line 113
    :cond_5
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->disconnect()V

    goto :goto_4
.end method

.method public getConnectTimeout()I
    .registers 2

    .prologue
    .line 277
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0}, Lcom/squareup/okhttp/OkHttpClient;->getConnectTimeout()I

    move-result v0

    return v0
.end method

.method public final getErrorStream()Ljava/io/InputStream;
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 128
    :try_start_1
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v1

    .line 129
    .local v1, "response":Lcom/squareup/okhttp/internal/http/HttpEngine;
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hasResponseBody()Z

    move-result v3

    if-eqz v3, :cond_1b

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v3

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->code()I

    move-result v3

    const/16 v4, 0x190

    if-lt v3, v4, :cond_1b

    .line 130
    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponseBodyBytes()Ljava/io/InputStream;
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1a} :catch_1c

    move-result-object v2

    .line 134
    .end local v1    # "response":Lcom/squareup/okhttp/internal/http/HttpEngine;
    :cond_1b
    :goto_1b
    return-object v2

    .line 133
    :catch_1c
    move-exception v0

    .line 134
    .local v0, "e":Ljava/io/IOException;
    goto :goto_1b
.end method

.method public final getHeaderField(I)Ljava/lang/String;
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 169
    :try_start_0
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getHeaders()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/Headers;->value(I)Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 171
    :goto_8
    return-object v1

    .line 170
    :catch_9
    move-exception v0

    .line 171
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public final getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 182
    if-nez p1, :cond_13

    :try_start_2
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/StatusLine;->get(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/StatusLine;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/StatusLine;->toString()Ljava/lang/String;

    move-result-object v1

    .line 186
    :goto_12
    return-object v1

    .line 182
    :cond_13
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getHeaders()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_1a} :catch_1c

    move-result-object v1

    goto :goto_12

    .line 185
    :catch_1c
    move-exception v0

    .line 186
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public final getHeaderFieldKey(I)Ljava/lang/String;
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 192
    :try_start_0
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getHeaders()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/Headers;->name(I)Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 194
    :goto_8
    return-object v1

    .line 193
    :catch_9
    move-exception v0

    .line 194
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public final getHeaderFields()Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 200
    :try_start_0
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getHeaders()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/StatusLine;->get(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/internal/http/StatusLine;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/StatusLine;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/squareup/okhttp/internal/http/OkHeaders;->toMultimap(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)Ljava/util/Map;
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_17} :catch_19

    move-result-object v1

    .line 203
    :goto_18
    return-object v1

    .line 202
    :catch_19
    move-exception v0

    .line 203
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    goto :goto_18
.end method

.method public final getInputStream()Ljava/io/InputStream;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    iget-boolean v2, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->doInput:Z

    if-nez v2, :cond_c

    .line 218
    new-instance v2, Ljava/net/ProtocolException;

    const-string v3, "This protocol does not support input"

    invoke-direct {v2, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 221
    :cond_c
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v0

    .line 227
    .local v0, "response":Lcom/squareup/okhttp/internal/http/HttpEngine;
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponseCode()I

    move-result v2

    const/16 v3, 0x190

    if-lt v2, v3, :cond_24

    .line 228
    new-instance v2, Ljava/io/FileNotFoundException;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->url:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 231
    :cond_24
    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponseBodyBytes()Ljava/io/InputStream;

    move-result-object v1

    .line 232
    .local v1, "result":Ljava/io/InputStream;
    if-nez v1, :cond_47

    .line 233
    new-instance v2, Ljava/net/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No response body exists; responseCode="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponseCode()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 235
    :cond_47
    return-object v1
.end method

.method public final getOutputStream()Ljava/io/OutputStream;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 239
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->connect()V

    .line 241
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getBufferedRequestBody()Lokio/BufferedSink;

    move-result-object v0

    .line 242
    .local v0, "sink":Lokio/BufferedSink;
    if-nez v0, :cond_26

    .line 243
    new-instance v1, Ljava/net/ProtocolException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "method does not support a request body: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 244
    :cond_26
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hasResponse()Z

    move-result v1

    if-eqz v1, :cond_36

    .line 245
    new-instance v1, Ljava/net/ProtocolException;

    const-string v2, "cannot write request body after response has been read"

    invoke-direct {v1, v2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 248
    :cond_36
    invoke-interface {v0}, Lokio/BufferedSink;->outputStream()Ljava/io/OutputStream;

    move-result-object v1

    return-object v1
.end method

.method public final getPermission()Ljava/security/Permission;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 252
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getURL()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    .line 253
    .local v0, "hostName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getURL()Ljava/net/URL;

    move-result-object v3

    invoke-static {v3}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v1

    .line 254
    .local v1, "hostPort":I
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->usingProxy()Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 255
    iget-object v3, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v3}, Lcom/squareup/okhttp/OkHttpClient;->getProxy()Ljava/net/Proxy;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v2

    check-cast v2, Ljava/net/InetSocketAddress;

    .line 256
    .local v2, "proxyAddress":Ljava/net/InetSocketAddress;
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v0

    .line 257
    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v1

    .line 259
    .end local v2    # "proxyAddress":Ljava/net/InetSocketAddress;
    :cond_2a
    new-instance v3, Ljava/net/SocketPermission;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "connect, resolve"

    invoke-direct {v3, v4, v5}, Ljava/net/SocketPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v3
.end method

.method public getReadTimeout()I
    .registers 2

    .prologue
    .line 285
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0}, Lcom/squareup/okhttp/OkHttpClient;->getReadTimeout()I

    move-result v0

    return v0
.end method

.method public final getRequestProperties()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 208
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-eqz v0, :cond_c

    .line 209
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot access request header fields after connection is set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_c
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/http/OkHeaders;->toMultimap(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public final getRequestProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 263
    if-nez p1, :cond_4

    const/4 v0, 0x0

    .line 264
    :goto_3
    return-object v0

    :cond_4
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public final getResponseCode()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 469
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->code()I

    move-result v0

    return v0
.end method

.method public getResponseMessage()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 465
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->getResponse()Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Response;->message()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setConnectTimeout(I)V
    .registers 6
    .param p1, "timeoutMillis"    # I

    .prologue
    .line 268
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    int-to-long v2, p1

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lcom/squareup/okhttp/OkHttpClient;->setConnectTimeout(JLjava/util/concurrent/TimeUnit;)V

    .line 269
    return-void
.end method

.method public setFixedLengthStreamingMode(I)V
    .registers 4
    .param p1, "contentLength"    # I

    .prologue
    .line 561
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->setFixedLengthStreamingMode(J)V

    .line 562
    return-void
.end method

.method public setFixedLengthStreamingMode(J)V
    .registers 6
    .param p1, "contentLength"    # J

    .prologue
    .line 565
    iget-boolean v0, p0, Ljava/net/HttpURLConnection;->connected:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 566
    :cond_c
    iget v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->chunkLength:I

    if-lez v0, :cond_18

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already in chunked mode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 567
    :cond_18
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_26

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "contentLength < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 568
    :cond_26
    iput-wide p1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->fixedContentLength:J

    .line 569
    const-wide/32 v0, 0x7fffffff

    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Ljava/net/HttpURLConnection;->fixedContentLength:I

    .line 570
    return-void
.end method

.method public setIfModifiedSince(J)V
    .registers 10
    .param p1, "newValue"    # J

    .prologue
    .line 498
    invoke-super {p0, p1, p2}, Ljava/net/HttpURLConnection;->setIfModifiedSince(J)V

    .line 499
    iget-wide v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->ifModifiedSince:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1e

    .line 500
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    const-string v1, "If-Modified-Since"

    new-instance v2, Ljava/util/Date;

    iget-wide v4, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->ifModifiedSince:J

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/HttpDate;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/squareup/okhttp/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 504
    :goto_1d
    return-void

    .line 502
    :cond_1e
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    const-string v1, "If-Modified-Since"

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/Headers$Builder;->removeAll(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_1d
.end method

.method public setInstanceFollowRedirects(Z)V
    .registers 3
    .param p1, "followRedirects"    # Z

    .prologue
    .line 273
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/OkHttpClient;->setFollowRedirects(Z)V

    .line 274
    return-void
.end method

.method public setReadTimeout(I)V
    .registers 6
    .param p1, "timeoutMillis"    # I

    .prologue
    .line 281
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    int-to-long v2, p1

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lcom/squareup/okhttp/OkHttpClient;->setReadTimeout(JLjava/util/concurrent/TimeUnit;)V

    .line 282
    return-void
.end method

.method public setRequestMethod(Ljava/lang/String;)V
    .registers 5
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ProtocolException;
        }
    .end annotation

    .prologue
    .line 553
    sget-object v0, Lcom/squareup/okhttp/internal/http/HttpMethod;->METHODS:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d

    .line 554
    new-instance v0, Ljava/net/ProtocolException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected one of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/squareup/okhttp/internal/http/HttpMethod;->METHODS:Ljava/util/Set;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " but was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 557
    :cond_2d
    iput-object p1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->method:Ljava/lang/String;

    .line 558
    return-void
.end method

.method public final setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "newValue"    # Ljava/lang/String;

    .prologue
    .line 473
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->connected:Z

    if-eqz v0, :cond_c

    .line 474
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot set request property after connection is made"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 476
    :cond_c
    if-nez p1, :cond_16

    .line 477
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "field == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 479
    :cond_16
    if-nez p2, :cond_39

    .line 485
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Ignoring header "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " because its value was null."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/Platform;->logW(Ljava/lang/String;)V

    .line 495
    :goto_38
    return-void

    .line 490
    :cond_39
    const-string v0, "X-Android-Transports"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    const-string v0, "X-Android-Protocols"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 491
    :cond_49
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->setProtocols(Ljava/lang/String;Z)V

    goto :goto_38

    .line 493
    :cond_4e
    iget-object v0, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->requestHeaders:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    goto :goto_38
.end method

.method public final usingProxy()Z
    .registers 4

    .prologue
    .line 458
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->route:Lcom/squareup/okhttp/Route;

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->route:Lcom/squareup/okhttp/Route;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v0

    .line 461
    .local v0, "proxy":Ljava/net/Proxy;
    :goto_a
    if-eqz v0, :cond_1d

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v1

    sget-object v2, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v1, v2, :cond_1d

    const/4 v1, 0x1

    :goto_15
    return v1

    .line 458
    .end local v0    # "proxy":Ljava/net/Proxy;
    :cond_16
    iget-object v1, p0, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getProxy()Ljava/net/Proxy;

    move-result-object v0

    goto :goto_a

    .line 461
    .restart local v0    # "proxy":Ljava/net/Proxy;
    :cond_1d
    const/4 v1, 0x0

    goto :goto_15
.end method
