.class Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;
.super Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;
.source "HttpConnection.java"

# interfaces
.implements Lokio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChunkedSource"
.end annotation


# instance fields
.field private bytesRemainingInChunk:I

.field private hasMoreChunks:Z

.field private final httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/http/HttpConnection;Lcom/squareup/okhttp/internal/http/CacheRequest;Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .registers 5
    .param p2, "cacheRequest"    # Lcom/squareup/okhttp/internal/http/CacheRequest;
    .param p3, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 494
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    .line 495
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;-><init>(Lcom/squareup/okhttp/internal/http/HttpConnection;Lcom/squareup/okhttp/internal/http/CacheRequest;)V

    .line 490
    const/4 v0, -0x1

    iput v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    .line 491
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    .line 496
    iput-object p3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 497
    return-void
.end method

.method private readChunkSize()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 522
    iget v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    if-eq v4, v5, :cond_f

    .line 523
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$900(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v4

    invoke-interface {v4}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 525
    :cond_f
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$900(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v4

    invoke-interface {v4}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object v0

    .line 526
    .local v0, "chunkSizeString":Ljava/lang/String;
    const-string v4, ";"

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 527
    .local v2, "index":I
    if-eq v2, v5, :cond_25

    .line 528
    invoke-virtual {v0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 531
    :cond_25
    :try_start_25
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x10

    invoke-static {v4, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I
    :try_end_31
    .catch Ljava/lang/NumberFormatException; {:try_start_25 .. :try_end_31} :catch_4f

    .line 535
    iget v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    if-nez v4, :cond_4e

    .line 536
    iput-boolean v6, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    .line 537
    new-instance v3, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v3}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    .line 538
    .local v3, "trailersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v4, v3}, Lcom/squareup/okhttp/internal/http/HttpConnection;->readHeaders(Lcom/squareup/okhttp/Headers$Builder;)V

    .line 539
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/squareup/okhttp/internal/http/HttpEngine;->receiveHeaders(Lcom/squareup/okhttp/Headers;)V

    .line 540
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->endOfInput(Z)V

    .line 542
    .end local v3    # "trailersBuilder":Lcom/squareup/okhttp/Headers$Builder;
    :cond_4e
    return-void

    .line 532
    :catch_4f
    move-exception v1

    .line 533
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v4, Ljava/net/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Expected a hex chunk size but was "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 549
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->closed:Z

    if-eqz v0, :cond_5

    .line 554
    :goto_4
    return-void

    .line 550
    :cond_5
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    const/16 v1, 0x64

    invoke-virtual {v0, p0, v1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->discard(Lokio/Source;I)Z

    move-result v0

    if-nez v0, :cond_16

    .line 551
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->unexpectedEndOfInput()V

    .line 553
    :cond_16
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->closed:Z

    goto :goto_4
.end method

.method public read(Lokio/Buffer;J)J
    .registers 12
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, -0x1

    .line 501
    const-wide/16 v4, 0x0

    cmp-long v4, p2, v4

    if-gez v4, :cond_21

    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "byteCount < 0: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 502
    :cond_21
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->closed:Z

    if-eqz v4, :cond_2d

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "closed"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 503
    :cond_2d
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    if-nez v4, :cond_33

    move-wide v0, v2

    .line 517
    :goto_32
    return-wide v0

    .line 505
    :cond_33
    iget v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    if-eqz v4, :cond_3c

    iget v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_45

    .line 506
    :cond_3c
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->readChunkSize()V

    .line 507
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->hasMoreChunks:Z

    if-nez v4, :cond_45

    move-wide v0, v2

    goto :goto_32

    .line 510
    :cond_45
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v4}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$900(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v4

    iget v5, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    int-to-long v6, v5

    invoke-static {p2, p3, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    invoke-interface {v4, p1, v6, v7}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 511
    .local v0, "read":J
    cmp-long v2, v0, v2

    if-nez v2, :cond_65

    .line 512
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->unexpectedEndOfInput()V

    .line 513
    new-instance v2, Ljava/io/IOException;

    const-string v3, "unexpected end of stream"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 515
    :cond_65
    iget v2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    int-to-long v2, v2

    sub-long/2addr v2, v0

    long-to-int v2, v2

    iput v2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->bytesRemainingInChunk:I

    .line 516
    invoke-virtual {p0, p1, v0, v1}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->cacheWrite(Lokio/Buffer;J)V

    goto :goto_32
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 545
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->source:Lokio/BufferedSource;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$900(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSource;

    move-result-object v0

    invoke-interface {v0}, Lokio/BufferedSource;->timeout()Lokio/Timeout;

    move-result-object v0

    return-object v0
.end method
