.class public final Lokio/InflaterSource;
.super Ljava/lang/Object;
.source "InflaterSource.java"

# interfaces
.implements Lokio/Source;


# instance fields
.field private bufferBytesHeldByInflater:I

.field private closed:Z

.field private final inflater:Ljava/util/zip/Inflater;

.field private final source:Lokio/BufferedSource;


# direct methods
.method constructor <init>(Lokio/BufferedSource;Ljava/util/zip/Inflater;)V
    .registers 5
    .param p1, "source"    # Lokio/BufferedSource;
    .param p2, "inflater"    # Ljava/util/zip/Inflater;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_d
    if-nez p2, :cond_17

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "inflater == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_17
    iput-object p1, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    .line 52
    iput-object p2, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    .line 53
    return-void
.end method

.method public constructor <init>(Lokio/Source;Ljava/util/zip/Inflater;)V
    .registers 4
    .param p1, "source"    # Lokio/Source;
    .param p2, "inflater"    # Ljava/util/zip/Inflater;

    .prologue
    .line 40
    invoke-static {p1}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lokio/InflaterSource;-><init>(Lokio/BufferedSource;Ljava/util/zip/Inflater;)V

    .line 41
    return-void
.end method

.method private releaseInflatedBytes()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    iget v1, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    if-nez v1, :cond_5

    .line 111
    :goto_4
    return-void

    .line 108
    :cond_5
    iget v1, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    iget-object v2, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v2

    sub-int v0, v1, v2

    .line 109
    .local v0, "toRelease":I
    iget v1, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    sub-int/2addr v1, v0

    iput v1, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    .line 110
    iget-object v1, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    int-to-long v2, v0

    invoke-interface {v1, v2, v3}, Lokio/BufferedSource;->skip(J)V

    goto :goto_4
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    iget-boolean v0, p0, Lokio/InflaterSource;->closed:Z

    if-eqz v0, :cond_5

    .line 122
    :goto_4
    return-void

    .line 119
    :cond_5
    iget-object v0, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 120
    const/4 v0, 0x1

    iput-boolean v0, p0, Lokio/InflaterSource;->closed:Z

    .line 121
    iget-object v0, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->close()V

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
    const-wide/16 v4, 0x0

    .line 57
    cmp-long v6, p2, v4

    if-gez v6, :cond_1f

    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "byteCount < 0: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 58
    :cond_1f
    iget-boolean v6, p0, Lokio/InflaterSource;->closed:Z

    if-eqz v6, :cond_2b

    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "closed"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 59
    :cond_2b
    cmp-long v6, p2, v4

    if-nez v6, :cond_30

    .line 75
    :goto_2f
    return-wide v4

    .line 62
    :cond_30
    invoke-virtual {p0}, Lokio/InflaterSource;->refill()Z

    move-result v2

    .line 66
    .local v2, "sourceExhausted":Z
    const/4 v4, 0x1

    :try_start_35
    invoke-virtual {p1, v4}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 67
    .local v3, "tail":Lokio/Segment;
    iget-object v4, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    iget-object v5, v3, Lokio/Segment;->data:[B

    iget v6, v3, Lokio/Segment;->limit:I

    iget v7, v3, Lokio/Segment;->limit:I

    rsub-int v7, v7, 0x800

    invoke-virtual {v4, v5, v6, v7}, Ljava/util/zip/Inflater;->inflate([BII)I

    move-result v0

    .line 68
    .local v0, "bytesInflated":I
    if-lez v0, :cond_56

    .line 69
    iget v4, v3, Lokio/Segment;->limit:I

    add-int/2addr v4, v0

    iput v4, v3, Lokio/Segment;->limit:I

    .line 70
    iget-wide v4, p1, Lokio/Buffer;->size:J

    int-to-long v6, v0

    add-long/2addr v4, v6

    iput-wide v4, p1, Lokio/Buffer;->size:J

    .line 71
    int-to-long v4, v0

    goto :goto_2f

    .line 73
    :cond_56
    iget-object v4, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v4}, Ljava/util/zip/Inflater;->finished()Z

    move-result v4

    if-nez v4, :cond_66

    iget-object v4, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v4}, Ljava/util/zip/Inflater;->needsDictionary()Z

    move-result v4

    if-eqz v4, :cond_6c

    .line 74
    :cond_66
    invoke-direct {p0}, Lokio/InflaterSource;->releaseInflatedBytes()V

    .line 75
    const-wide/16 v4, -0x1

    goto :goto_2f

    .line 77
    :cond_6c
    if-eqz v2, :cond_30

    new-instance v4, Ljava/io/EOFException;

    const-string v5, "source exhausted prematurely"

    invoke-direct {v4, v5}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_76
    .catch Ljava/util/zip/DataFormatException; {:try_start_35 .. :try_end_76} :catch_76

    .line 78
    .end local v0    # "bytesInflated":I
    .end local v3    # "tail":Lokio/Segment;
    :catch_76
    move-exception v1

    .line 79
    .local v1, "e":Ljava/util/zip/DataFormatException;
    new-instance v4, Ljava/io/IOException;

    invoke-direct {v4, v1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public refill()Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 90
    iget-object v2, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v2

    if-nez v2, :cond_a

    .line 102
    :goto_9
    return v1

    .line 92
    :cond_a
    invoke-direct {p0}, Lokio/InflaterSource;->releaseInflatedBytes()V

    .line 93
    iget-object v2, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->getRemaining()I

    move-result v2

    if-eqz v2, :cond_1d

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "?"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 96
    :cond_1d
    iget-object v2, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->exhausted()Z

    move-result v2

    if-eqz v2, :cond_27

    const/4 v1, 0x1

    goto :goto_9

    .line 99
    :cond_27
    iget-object v2, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    invoke-interface {v2}, Lokio/BufferedSource;->buffer()Lokio/Buffer;

    move-result-object v2

    iget-object v0, v2, Lokio/Buffer;->head:Lokio/Segment;

    .line 100
    .local v0, "head":Lokio/Segment;
    iget v2, v0, Lokio/Segment;->limit:I

    iget v3, v0, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    iput v2, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    .line 101
    iget-object v2, p0, Lokio/InflaterSource;->inflater:Ljava/util/zip/Inflater;

    iget-object v3, v0, Lokio/Segment;->data:[B

    iget v4, v0, Lokio/Segment;->pos:I

    iget v5, p0, Lokio/InflaterSource;->bufferBytesHeldByInflater:I

    invoke-virtual {v2, v3, v4, v5}, Ljava/util/zip/Inflater;->setInput([BII)V

    goto :goto_9
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lokio/InflaterSource;->source:Lokio/BufferedSource;

    invoke-interface {v0}, Lokio/BufferedSource;->timeout()Lokio/Timeout;

    move-result-object v0

    return-object v0
.end method
