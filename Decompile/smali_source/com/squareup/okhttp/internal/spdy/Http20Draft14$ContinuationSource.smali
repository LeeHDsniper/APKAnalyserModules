.class final Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;
.super Ljava/lang/Object;
.source "Http20Draft14.java"

# interfaces
.implements Lokio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/Http20Draft14;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ContinuationSource"
.end annotation


# instance fields
.field flags:B

.field left:I

.field length:I

.field padding:S

.field private final source:Lokio/BufferedSource;

.field streamId:I


# direct methods
.method public constructor <init>(Lokio/BufferedSource;)V
    .registers 2
    .param p1, "source"    # Lokio/BufferedSource;

    .prologue
    .line 602
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 603
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->source:Lokio/BufferedSource;

    .line 604
    return-void
.end method

.method private readContinuationHeader()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 629
    iget v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->streamId:I

    .line 631
    .local v0, "previousStreamId":I
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->source:Lokio/BufferedSource;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->readMedium(Lokio/BufferedSource;)I
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$200(Lokio/BufferedSource;)I

    move-result v2

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->left:I

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->length:I

    .line 632
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->readByte()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v1, v2

    .line 633
    .local v1, "type":B
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->readByte()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    iput-byte v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->flags:B

    .line 634
    sget-object v2, Lcom/squareup/okhttp/internal/Internal;->logger:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_3b

    sget-object v2, Lcom/squareup/okhttp/internal/Internal;->logger:Ljava/util/logging/Logger;

    iget v3, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->streamId:I

    iget v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->length:I

    iget-byte v5, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->flags:B

    invoke-static {v7, v3, v4, v1, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$FrameLogger;->formatHeader(ZIIBB)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 635
    :cond_3b
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->readInt()I

    move-result v2

    const v3, 0x7fffffff

    and-int/2addr v2, v3

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->streamId:I

    .line 636
    const/16 v2, 0x9

    if-eq v1, v2, :cond_5a

    const-string v2, "%s != TYPE_CONTINUATION"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v3, v6

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 637
    :cond_5a
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->streamId:I

    if-eq v2, v0, :cond_67

    const-string v2, "TYPE_CONTINUATION streamId changed"

    new-array v3, v6, [Ljava/lang/Object;

    # invokes: Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14;->access$100(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 638
    :cond_67
    return-void
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 626
    return-void
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

    .line 607
    :goto_2
    iget v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->left:I

    if-nez v4, :cond_1d

    .line 608
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->source:Lokio/BufferedSource;

    iget-short v5, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->padding:S

    int-to-long v6, v5

    invoke-interface {v4, v6, v7}, Lokio/BufferedSource;->skip(J)V

    .line 609
    const/4 v4, 0x0

    iput-short v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->padding:S

    .line 610
    iget-byte v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->flags:B

    and-int/lit8 v4, v4, 0x4

    if-eqz v4, :cond_19

    move-wide v0, v2

    .line 618
    :goto_18
    return-wide v0

    .line 611
    :cond_19
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->readContinuationHeader()V

    goto :goto_2

    .line 615
    :cond_1d
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->source:Lokio/BufferedSource;

    iget v5, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->left:I

    int-to-long v6, v5

    invoke-static {p2, p3, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    invoke-interface {v4, p1, v6, v7}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 616
    .local v0, "read":J
    cmp-long v4, v0, v2

    if-nez v4, :cond_30

    move-wide v0, v2

    goto :goto_18

    .line 617
    :cond_30
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->left:I

    int-to-long v2, v2

    sub-long/2addr v2, v0

    long-to-int v2, v2

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->left:I

    goto :goto_18
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 622
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft14$ContinuationSource;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->timeout()Lokio/Timeout;

    move-result-object v0

    return-object v0
.end method
