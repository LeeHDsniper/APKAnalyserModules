.class public Lcom/squareup/okhttp/Call;
.super Ljava/lang/Object;
.source "Call.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/Call$RealResponseBody;
    }
.end annotation


# instance fields
.field volatile canceled:Z

.field private final client:Lcom/squareup/okhttp/OkHttpClient;

.field engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

.field private executed:Z

.field private redirectionCount:I

.field private request:Lcom/squareup/okhttp/Request;


# direct methods
.method protected constructor <init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;)V
    .registers 4
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->copyWithDefaults()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 54
    iput-object p2, p0, Lcom/squareup/okhttp/Call;->request:Lcom/squareup/okhttp/Request;

    .line 55
    return-void
.end method

.method private getResponse()Lcom/squareup/okhttp/Response;
    .registers 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Request;->body()Lcom/squareup/okhttp/RequestBody;

    move-result-object v17

    .line 205
    .local v17, "body":Lcom/squareup/okhttp/RequestBody;
    const/4 v8, 0x0

    .line 206
    .local v8, "requestBodyOut":Lcom/squareup/okhttp/internal/http/RetryableSink;
    if-eqz v17, :cond_48

    .line 207
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v23

    .line 209
    .local v23, "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    invoke-virtual/range {v17 .. v17}, Lcom/squareup/okhttp/RequestBody;->contentType()Lcom/squareup/okhttp/MediaType;

    move-result-object v20

    .line 210
    .local v20, "contentType":Lcom/squareup/okhttp/MediaType;
    if-eqz v20, :cond_24

    .line 211
    const-string v2, "Content-Type"

    invoke-virtual/range {v20 .. v20}, Lcom/squareup/okhttp/MediaType;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    invoke-virtual {v0, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 214
    :cond_24
    invoke-virtual/range {v17 .. v17}, Lcom/squareup/okhttp/RequestBody;->contentLength()J

    move-result-wide v18

    .line 215
    .local v18, "contentLength":J
    const-wide/16 v2, -0x1

    cmp-long v2, v18, v2

    if-eqz v2, :cond_65

    .line 216
    const-string v2, "Content-Length"

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    invoke-virtual {v0, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 217
    const-string v2, "Transfer-Encoding"

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 223
    :goto_40
    invoke-virtual/range {v23 .. v23}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/squareup/okhttp/Call;->request:Lcom/squareup/okhttp/Request;

    .line 227
    .end local v18    # "contentLength":J
    .end local v20    # "contentType":Lcom/squareup/okhttp/MediaType;
    .end local v23    # "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    :cond_48
    new-instance v2, Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/squareup/okhttp/Call;->request:Lcom/squareup/okhttp/Request;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v2 .. v9}, Lcom/squareup/okhttp/internal/http/HttpEngine;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;ZLcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RouteSelector;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 230
    :goto_5d
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/squareup/okhttp/Call;->canceled:Z

    if-eqz v2, :cond_76

    const/4 v2, 0x0

    .line 257
    :goto_64
    return-object v2

    .line 219
    .restart local v18    # "contentLength":J
    .restart local v20    # "contentType":Lcom/squareup/okhttp/MediaType;
    .restart local v23    # "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    :cond_65
    const-string v2, "Transfer-Encoding"

    const-string v3, "chunked"

    move-object/from16 v0, v23

    invoke-virtual {v0, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    .line 220
    const-string v2, "Content-Length"

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    goto :goto_40

    .line 233
    .end local v18    # "contentLength":J
    .end local v20    # "contentType":Lcom/squareup/okhttp/MediaType;
    .end local v23    # "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    :cond_76
    :try_start_76
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->sendRequest()V

    .line 235
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Request;->body()Lcom/squareup/okhttp/RequestBody;

    move-result-object v2

    if-eqz v2, :cond_9c

    .line 236
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getBufferedRequestBody()Lokio/BufferedSink;

    move-result-object v25

    .line 237
    .local v25, "sink":Lokio/BufferedSink;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Request;->body()Lcom/squareup/okhttp/RequestBody;

    move-result-object v2

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Lcom/squareup/okhttp/RequestBody;->writeTo(Lokio/BufferedSink;)V

    .line 240
    .end local v25    # "sink":Lokio/BufferedSink;
    :cond_9c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->readResponse()V
    :try_end_a3
    .catch Ljava/io/IOException; {:try_start_76 .. :try_end_a3} :catch_d8

    .line 252
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v16

    .line 253
    .local v16, "response":Lcom/squareup/okhttp/Response;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->followUpRequest()Lcom/squareup/okhttp/Request;

    move-result-object v22

    .line 255
    .local v22, "followUp":Lcom/squareup/okhttp/Request;
    if-nez v22, :cond_ef

    .line 256
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 257
    invoke-virtual/range {v16 .. v16}, Lcom/squareup/okhttp/Response;->newBuilder()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v2

    new-instance v3, Lcom/squareup/okhttp/Call$RealResponseBody;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponseBody()Lokio/BufferedSource;

    move-result-object v4

    move-object/from16 v0, v16

    invoke-direct {v3, v0, v4}, Lcom/squareup/okhttp/Call$RealResponseBody;-><init>(Lcom/squareup/okhttp/Response;Lokio/BufferedSource;)V

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/Response$Builder;->body(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/Response$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/Response$Builder;->build()Lcom/squareup/okhttp/Response;

    move-result-object v2

    goto :goto_64

    .line 241
    .end local v16    # "response":Lcom/squareup/okhttp/Response;
    .end local v22    # "followUp":Lcom/squareup/okhttp/Request;
    :catch_d8
    move-exception v21

    .line 242
    .local v21, "e":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    const/4 v3, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v2, v0, v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->recover(Ljava/io/IOException;Lokio/Sink;)Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-result-object v24

    .line 243
    .local v24, "retryEngine":Lcom/squareup/okhttp/internal/http/HttpEngine;
    if-eqz v24, :cond_ee

    .line 244
    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    goto/16 :goto_5d

    .line 249
    :cond_ee
    throw v21

    .line 262
    .end local v21    # "e":Ljava/io/IOException;
    .end local v24    # "retryEngine":Lcom/squareup/okhttp/internal/http/HttpEngine;
    .restart local v16    # "response":Lcom/squareup/okhttp/Response;
    .restart local v22    # "followUp":Lcom/squareup/okhttp/Request;
    :cond_ef
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/Response;->isRedirect()Z

    move-result v2

    if-eqz v2, :cond_128

    move-object/from16 v0, p0

    iget v2, v0, Lcom/squareup/okhttp/Call;->redirectionCount:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lcom/squareup/okhttp/Call;->redirectionCount:I

    const/16 v3, 0x14

    if-le v2, v3, :cond_128

    .line 263
    new-instance v2, Ljava/net/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Too many redirects: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/squareup/okhttp/Call;->redirectionCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 266
    :cond_128
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual/range {v22 .. v22}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->sameConnection(Ljava/net/URL;)Z

    move-result v2

    if-nez v2, :cond_13d

    .line 267
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 270
    :cond_13d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->close()Lcom/squareup/okhttp/Connection;

    move-result-object v13

    .line 271
    .local v13, "connection":Lcom/squareup/okhttp/Connection;
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/squareup/okhttp/Call;->request:Lcom/squareup/okhttp/Request;

    .line 272
    new-instance v9, Lcom/squareup/okhttp/internal/http/HttpEngine;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/squareup/okhttp/Call;->request:Lcom/squareup/okhttp/Request;

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-direct/range {v9 .. v16}, Lcom/squareup/okhttp/internal/http/HttpEngine;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;ZLcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/RouteSelector;Lcom/squareup/okhttp/internal/http/RetryableSink;Lcom/squareup/okhttp/Response;)V

    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    goto/16 :goto_5d
.end method


# virtual methods
.method public execute()Lcom/squareup/okhttp/Response;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    monitor-enter p0

    .line 79
    :try_start_1
    iget-boolean v1, p0, Lcom/squareup/okhttp/Call;->executed:Z

    if-eqz v1, :cond_10

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Already Executed"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 81
    :catchall_d
    move-exception v1

    monitor-exit p0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_d

    throw v1

    .line 80
    :cond_10
    const/4 v1, 0x1

    :try_start_11
    iput-boolean v1, p0, Lcom/squareup/okhttp/Call;->executed:Z

    .line 81
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_d

    .line 83
    :try_start_14
    iget-object v1, p0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/squareup/okhttp/Dispatcher;->executed(Lcom/squareup/okhttp/Call;)V

    .line 84
    invoke-direct {p0}, Lcom/squareup/okhttp/Call;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v0

    .line 85
    .local v0, "result":Lcom/squareup/okhttp/Response;
    iget-object v1, p0, Lcom/squareup/okhttp/Call;->engine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->releaseConnection()V

    .line 86
    if-nez v0, :cond_3b

    new-instance v1, Ljava/io/IOException;

    const-string v2, "Canceled"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_30
    .catchall {:try_start_14 .. :try_end_30} :catchall_30

    .line 89
    .end local v0    # "result":Lcom/squareup/okhttp/Response;
    :catchall_30
    move-exception v1

    iget-object v2, p0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v2}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/squareup/okhttp/Dispatcher;->finished(Lcom/squareup/okhttp/Call;)V

    throw v1

    .restart local v0    # "result":Lcom/squareup/okhttp/Response;
    :cond_3b
    iget-object v1, p0, Lcom/squareup/okhttp/Call;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->getDispatcher()Lcom/squareup/okhttp/Dispatcher;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/squareup/okhttp/Dispatcher;->finished(Lcom/squareup/okhttp/Call;)V

    return-object v0
.end method
