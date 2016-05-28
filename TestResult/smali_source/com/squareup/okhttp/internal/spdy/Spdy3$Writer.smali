.class final Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;
.super Ljava/lang/Object;
.source "Spdy3.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/spdy/FrameWriter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/Spdy3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Writer"
.end annotation


# instance fields
.field private final client:Z

.field private closed:Z

.field private final headerBlockBuffer:Lokio/Buffer;

.field private final headerBlockOut:Lokio/BufferedSink;

.field private final sink:Lokio/BufferedSink;


# direct methods
.method constructor <init>(Lokio/BufferedSink;Z)V
    .registers 6
    .param p1, "sink"    # Lokio/BufferedSink;
    .param p2, "client"    # Z

    .prologue
    .line 294
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 295
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    .line 296
    iput-boolean p2, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->client:Z

    .line 298
    new-instance v0, Ljava/util/zip/Deflater;

    invoke-direct {v0}, Ljava/util/zip/Deflater;-><init>()V

    .line 299
    .local v0, "deflater":Ljava/util/zip/Deflater;
    sget-object v1, Lcom/squareup/okhttp/internal/spdy/Spdy3;->DICTIONARY:[B

    invoke-virtual {v0, v1}, Ljava/util/zip/Deflater;->setDictionary([B)V

    .line 300
    new-instance v1, Lokio/Buffer;

    invoke-direct {v1}, Lokio/Buffer;-><init>()V

    iput-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockBuffer:Lokio/Buffer;

    .line 301
    new-instance v1, Lokio/DeflaterSink;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockBuffer:Lokio/Buffer;

    invoke-direct {v1, v2, v0}, Lokio/DeflaterSink;-><init>(Lokio/Sink;Ljava/util/zip/Deflater;)V

    invoke-static {v1}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockOut:Lokio/BufferedSink;

    .line 302
    return-void
.end method

.method private writeNameValueBlockToBuffer(Ljava/util/List;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/spdy/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 409
    .local p1, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockBuffer:Lokio/Buffer;

    invoke-virtual {v4}, Lokio/Buffer;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_12

    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 410
    :cond_12
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockOut:Lokio/BufferedSink;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 411
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "size":I
    :goto_20
    if-ge v0, v2, :cond_51

    .line 412
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/squareup/okhttp/internal/spdy/Header;

    iget-object v1, v4, Lcom/squareup/okhttp/internal/spdy/Header;->name:Lokio/ByteString;

    .line 413
    .local v1, "name":Lokio/ByteString;
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockOut:Lokio/BufferedSink;

    invoke-virtual {v1}, Lokio/ByteString;->size()I

    move-result v5

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 414
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockOut:Lokio/BufferedSink;

    invoke-interface {v4, v1}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 415
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/squareup/okhttp/internal/spdy/Header;

    iget-object v3, v4, Lcom/squareup/okhttp/internal/spdy/Header;->value:Lokio/ByteString;

    .line 416
    .local v3, "value":Lokio/ByteString;
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockOut:Lokio/BufferedSink;

    invoke-virtual {v3}, Lokio/ByteString;->size()I

    move-result v5

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 417
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockOut:Lokio/BufferedSink;

    invoke-interface {v4, v3}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 411
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 419
    .end local v1    # "name":Lokio/ByteString;
    .end local v3    # "value":Lokio/ByteString;
    :cond_51
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockOut:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->flush()V

    .line 420
    return-void
.end method


# virtual methods
.method public ackSettings(Lcom/squareup/okhttp/internal/spdy/Settings;)V
    .registers 2
    .param p1, "peerSettings"    # Lcom/squareup/okhttp/internal/spdy/Settings;

    .prologue
    .line 306
    return-void
.end method

.method public declared-synchronized close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 488
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->closed:Z

    .line 489
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockOut:Lokio/BufferedSink;

    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/Util;->closeAll(Ljava/io/Closeable;Ljava/io/Closeable;)V
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_d

    .line 490
    monitor-exit p0

    return-void

    .line 488
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized connectionPreface()V
    .registers 1

    .prologue
    .line 316
    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method public declared-synchronized data(ZILokio/Buffer;I)V
    .registers 7
    .param p1, "outFinished"    # Z
    .param p2, "streamId"    # I
    .param p3, "source"    # Lokio/Buffer;
    .param p4, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 391
    monitor-enter p0

    if-eqz p1, :cond_9

    const/4 v0, 0x1

    .line 392
    .local v0, "flags":I
    :goto_4
    :try_start_4
    invoke-virtual {p0, p2, v0, p3, p4}, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sendDataFrame(IILokio/Buffer;I)V
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_b

    .line 393
    monitor-exit p0

    return-void

    .line 391
    .end local v0    # "flags":I
    :cond_9
    const/4 v0, 0x0

    goto :goto_4

    .restart local v0    # "flags":I
    :catchall_b
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized flush()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 319
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->closed:Z

    if-eqz v0, :cond_10

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 320
    :cond_10
    :try_start_10
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_15
    .catchall {:try_start_10 .. :try_end_15} :catchall_d

    .line 321
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized goAway(ILcom/squareup/okhttp/internal/spdy/ErrorCode;[B)V
    .registers 9
    .param p1, "lastGoodStreamId"    # I
    .param p2, "errorCode"    # Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    .param p3, "ignored"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 456
    monitor-enter p0

    :try_start_1
    iget-boolean v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->closed:Z

    if-eqz v3, :cond_10

    new-instance v3, Ljava/io/IOException;

    const-string v4, "closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v3

    monitor-exit p0

    throw v3

    .line 457
    :cond_10
    :try_start_10
    iget v3, p2, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->spdyGoAwayCode:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1d

    .line 458
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "errorCode.spdyGoAwayCode == -1"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 460
    :cond_1d
    const/4 v2, 0x7

    .line 461
    .local v2, "type":I
    const/4 v0, 0x0

    .line 462
    .local v0, "flags":I
    const/16 v1, 0x8

    .line 463
    .local v1, "length":I
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const v4, -0x7ffcfff9

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 464
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const/16 v4, 0x8

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 465
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v3, p1}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 466
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    iget v4, p2, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->spdyGoAwayCode:I

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 467
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V
    :try_end_41
    .catchall {:try_start_10 .. :try_end_41} :catchall_d

    .line 468
    monitor-exit p0

    return-void
.end method

.method public maxDataLength()I
    .registers 2

    .prologue
    .line 386
    const/16 v0, 0x3fff

    return v0
.end method

.method public declared-synchronized ping(ZII)V
    .registers 11
    .param p1, "reply"    # Z
    .param p2, "payload1"    # I
    .param p3, "payload2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x1

    .line 442
    monitor-enter p0

    :try_start_3
    iget-boolean v5, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->closed:Z

    if-eqz v5, :cond_12

    new-instance v4, Ljava/io/IOException;

    const-string v5, "closed"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_f

    :catchall_f
    move-exception v4

    monitor-exit p0

    throw v4

    .line 443
    :cond_12
    :try_start_12
    iget-boolean v6, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->client:Z

    and-int/lit8 v5, p2, 0x1

    if-ne v5, v2, :cond_25

    move v5, v2

    :goto_19
    if-eq v6, v5, :cond_27

    .line 444
    .local v2, "payloadIsReply":Z
    :goto_1b
    if-eq p1, v2, :cond_29

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "payload != reply"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v2    # "payloadIsReply":Z
    :cond_25
    move v5, v4

    .line 443
    goto :goto_19

    :cond_27
    move v2, v4

    goto :goto_1b

    .line 445
    .restart local v2    # "payloadIsReply":Z
    :cond_29
    const/4 v3, 0x6

    .line 446
    .local v3, "type":I
    const/4 v0, 0x0

    .line 447
    .local v0, "flags":I
    const/4 v1, 0x4

    .line 448
    .local v1, "length":I
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const v5, -0x7ffcfffa

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 449
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const/4 v5, 0x4

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 450
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4, p2}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 451
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->flush()V
    :try_end_44
    .catchall {:try_start_12 .. :try_end_44} :catchall_f

    .line 452
    monitor-exit p0

    return-void
.end method

.method public pushPromise(IILjava/util/List;)V
    .registers 4
    .param p1, "streamId"    # I
    .param p2, "promisedStreamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/spdy/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    .local p3, "requestHeaders":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    return-void
.end method

.method public declared-synchronized rstStream(ILcom/squareup/okhttp/internal/spdy/ErrorCode;)V
    .registers 8
    .param p1, "streamId"    # I
    .param p2, "errorCode"    # Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 373
    monitor-enter p0

    :try_start_1
    iget-boolean v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->closed:Z

    if-eqz v3, :cond_10

    new-instance v3, Ljava/io/IOException;

    const-string v4, "closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v3

    monitor-exit p0

    throw v3

    .line 374
    :cond_10
    :try_start_10
    iget v3, p2, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->spdyRstCode:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1b

    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 375
    :cond_1b
    const/4 v0, 0x0

    .line 376
    .local v0, "flags":I
    const/4 v2, 0x3

    .line 377
    .local v2, "type":I
    const/16 v1, 0x8

    .line 378
    .local v1, "length":I
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const v4, -0x7ffcfffd

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 379
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const/16 v4, 0x8

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 380
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const v4, 0x7fffffff

    and-int/2addr v4, p1

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 381
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    iget v4, p2, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->spdyRstCode:I

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 382
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V
    :try_end_43
    .catchall {:try_start_10 .. :try_end_43} :catchall_d

    .line 383
    monitor-exit p0

    return-void
.end method

.method sendDataFrame(IILokio/Buffer;I)V
    .registers 9
    .param p1, "streamId"    # I
    .param p2, "flags"    # I
    .param p3, "buffer"    # Lokio/Buffer;
    .param p4, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 397
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->closed:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 398
    :cond_c
    int-to-long v0, p4

    const-wide/32 v2, 0xffffff

    cmp-long v0, v0, v2

    if-lez v0, :cond_2d

    .line 399
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FRAME_TOO_LARGE max size is 16Mib: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 401
    :cond_2d
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const v1, 0x7fffffff

    and-int/2addr v1, p1

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 402
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    and-int/lit16 v1, p2, 0xff

    shl-int/lit8 v1, v1, 0x18

    const v2, 0xffffff

    and-int/2addr v2, p4

    or-int/2addr v1, v2

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 403
    if-lez p4, :cond_4c

    .line 404
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    int-to-long v2, p4

    invoke-interface {v0, p3, v2, v3}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    .line 406
    :cond_4c
    return-void
.end method

.method public declared-synchronized settings(Lcom/squareup/okhttp/internal/spdy/Settings;)V
    .registers 12
    .param p1, "settings"    # Lcom/squareup/okhttp/internal/spdy/Settings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v9, 0xffffff

    .line 423
    monitor-enter p0

    :try_start_4
    iget-boolean v6, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->closed:Z

    if-eqz v6, :cond_13

    new-instance v6, Ljava/io/IOException;

    const-string v7, "closed"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_10
    .catchall {:try_start_4 .. :try_end_10} :catchall_10

    :catchall_10
    move-exception v6

    monitor-exit p0

    throw v6

    .line 424
    :cond_13
    const/4 v5, 0x4

    .line 425
    .local v5, "type":I
    const/4 v0, 0x0

    .line 426
    .local v0, "flags":I
    :try_start_15
    invoke-virtual {p1}, Lcom/squareup/okhttp/internal/spdy/Settings;->size()I

    move-result v4

    .line 427
    .local v4, "size":I
    mul-int/lit8 v6, v4, 0x8

    add-int/lit8 v2, v6, 0x4

    .line 428
    .local v2, "length":I
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const v7, -0x7ffcfffc

    invoke-interface {v6, v7}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 429
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    and-int v7, v2, v9

    or-int/lit8 v7, v7, 0x0

    invoke-interface {v6, v7}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 430
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v6, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 431
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_34
    const/16 v6, 0xa

    if-gt v1, v6, :cond_5b

    .line 432
    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/internal/spdy/Settings;->isSet(I)Z

    move-result v6

    if-nez v6, :cond_41

    .line 431
    :goto_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_34

    .line 433
    :cond_41
    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/internal/spdy/Settings;->flags(I)I

    move-result v3

    .line 434
    .local v3, "settingsFlags":I
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    and-int/lit16 v7, v3, 0xff

    shl-int/lit8 v7, v7, 0x18

    and-int v8, v1, v9

    or-int/2addr v7, v8

    invoke-interface {v6, v7}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 435
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/internal/spdy/Settings;->get(I)I

    move-result v7

    invoke-interface {v6, v7}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    goto :goto_3e

    .line 437
    .end local v3    # "settingsFlags":I
    :cond_5b
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v6}, Lokio/BufferedSink;->flush()V
    :try_end_60
    .catchall {:try_start_15 .. :try_end_60} :catchall_10

    .line 438
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized synStream(ZZIILjava/util/List;)V
    .registers 14
    .param p1, "outFinished"    # Z
    .param p2, "inFinished"    # Z
    .param p3, "streamId"    # I
    .param p4, "associatedStreamId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZII",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/spdy/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    .local p5, "headerBlock":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    monitor-enter p0

    :try_start_1
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->closed:Z

    if-eqz v4, :cond_10

    new-instance v4, Ljava/io/IOException;

    const-string v5, "closed"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v4

    monitor-exit p0

    throw v4

    .line 327
    :cond_10
    :try_start_10
    invoke-direct {p0, p5}, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->writeNameValueBlockToBuffer(Ljava/util/List;)V

    .line 328
    const-wide/16 v4, 0xa

    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockBuffer:Lokio/Buffer;

    invoke-virtual {v6}, Lokio/Buffer;->size()J

    move-result-wide v6

    add-long/2addr v4, v6

    long-to-int v1, v4

    .line 329
    .local v1, "length":I
    const/4 v2, 0x1

    .line 330
    .local v2, "type":I
    if-eqz p1, :cond_64

    const/4 v4, 0x1

    move v5, v4

    :goto_22
    if-eqz p2, :cond_67

    const/4 v4, 0x2

    :goto_25
    or-int v0, v5, v4

    .line 332
    .local v0, "flags":I
    const/4 v3, 0x0

    .line 333
    .local v3, "unused":I
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const v5, -0x7ffcffff

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 334
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    and-int/lit16 v5, v0, 0xff

    shl-int/lit8 v5, v5, 0x18

    const v6, 0xffffff

    and-int/2addr v6, v1

    or-int/2addr v5, v6

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 335
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const v5, 0x7fffffff

    and-int/2addr v5, p3

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 336
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const v5, 0x7fffffff

    and-int/2addr v5, p4

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 337
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeShort(I)Lokio/BufferedSink;

    .line 338
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->headerBlockBuffer:Lokio/Buffer;

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeAll(Lokio/Source;)J

    .line 339
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->flush()V
    :try_end_62
    .catchall {:try_start_10 .. :try_end_62} :catchall_d

    .line 340
    monitor-exit p0

    return-void

    .line 330
    .end local v0    # "flags":I
    .end local v3    # "unused":I
    :cond_64
    const/4 v4, 0x0

    move v5, v4

    goto :goto_22

    :cond_67
    const/4 v4, 0x0

    goto :goto_25
.end method

.method public declared-synchronized windowUpdate(IJ)V
    .registers 10
    .param p1, "streamId"    # I
    .param p2, "increment"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 472
    monitor-enter p0

    :try_start_1
    iget-boolean v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->closed:Z

    if-eqz v3, :cond_10

    new-instance v3, Ljava/io/IOException;

    const-string v4, "closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v3

    monitor-exit p0

    throw v3

    .line 473
    :cond_10
    const-wide/16 v4, 0x0

    cmp-long v3, p2, v4

    if-eqz v3, :cond_1d

    const-wide/32 v4, 0x7fffffff

    cmp-long v3, p2, v4

    if-lez v3, :cond_36

    .line 474
    :cond_1d
    :try_start_1d
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "windowSizeIncrement must be between 1 and 0x7fffffff: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 477
    :cond_36
    const/16 v2, 0x9

    .line 478
    .local v2, "type":I
    const/4 v0, 0x0

    .line 479
    .local v0, "flags":I
    const/16 v1, 0x8

    .line 480
    .local v1, "length":I
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const v4, -0x7ffcfff7

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 481
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    const/16 v4, 0x8

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 482
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v3, p1}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 483
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    long-to-int v4, p2

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 484
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Spdy3$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V
    :try_end_5a
    .catchall {:try_start_1d .. :try_end_5a} :catchall_d

    .line 485
    monitor-exit p0

    return-void
.end method
