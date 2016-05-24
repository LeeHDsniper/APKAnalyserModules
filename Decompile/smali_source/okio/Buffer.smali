.class public final Lokio/Buffer;
.super Ljava/lang/Object;
.source "Buffer.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Lokio/BufferedSink;
.implements Lokio/BufferedSource;


# instance fields
.field head:Lokio/Segment;

.field size:J


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    return-void
.end method


# virtual methods
.method public buffer()Lokio/Buffer;
    .registers 1

    .prologue
    .line 60
    return-object p0
.end method

.method public clear()V
    .registers 5

    .prologue
    .line 525
    :try_start_0
    iget-wide v2, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->skip(J)V
    :try_end_5
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_5} :catch_6

    .line 529
    return-void

    .line 526
    :catch_6
    move-exception v0

    .line 527
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lokio/Buffer;
    .registers 7

    .prologue
    .line 901
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 902
    .local v0, "result":Lokio/Buffer;
    iget-wide v2, p0, Lokio/Buffer;->size:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_e

    .line 909
    :cond_d
    return-object v0

    .line 904
    :cond_e
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v2, v2, Lokio/Segment;->data:[B

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->pos:I

    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v4, v4, Lokio/Segment;->limit:I

    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v5, v5, Lokio/Segment;->pos:I

    sub-int/2addr v4, v5

    invoke-virtual {v0, v2, v3, v4}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 905
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, v2, Lokio/Segment;->next:Lokio/Segment;

    .local v1, "s":Lokio/Segment;
    :goto_26
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v1, v2, :cond_d

    .line 906
    iget-object v2, v1, Lokio/Segment;->data:[B

    iget v3, v1, Lokio/Segment;->pos:I

    iget v4, v1, Lokio/Segment;->limit:I

    iget v5, v1, Lokio/Segment;->pos:I

    sub-int/2addr v4, v5

    invoke-virtual {v0, v2, v3, v4}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    .line 905
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_26
.end method

.method public close()V
    .registers 1

    .prologue
    .line 813
    return-void
.end method

.method public completeSegmentByteCount()J
    .registers 7

    .prologue
    const-wide/16 v4, 0x0

    .line 217
    iget-wide v0, p0, Lokio/Buffer;->size:J

    .line 218
    .local v0, "result":J
    cmp-long v3, v0, v4

    if-nez v3, :cond_9

    .line 226
    :goto_8
    return-wide v4

    .line 221
    :cond_9
    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v2, v3, Lokio/Segment;->prev:Lokio/Segment;

    .line 222
    .local v2, "tail":Lokio/Segment;
    iget v3, v2, Lokio/Segment;->limit:I

    const/16 v4, 0x800

    if-ge v3, v4, :cond_1a

    .line 223
    iget v3, v2, Lokio/Segment;->limit:I

    iget v4, v2, Lokio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v4, v3

    sub-long/2addr v0, v4

    :cond_1a
    move-wide v4, v0

    .line 226
    goto :goto_8
.end method

.method public emitCompleteSegments()Lokio/Buffer;
    .registers 1

    .prologue
    .line 86
    return-object p0
.end method

.method public bridge synthetic emitCompleteSegments()Lokio/BufferedSink;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0}, Lokio/Buffer;->emitCompleteSegments()Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 20
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 831
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-ne v0, v1, :cond_8

    const/4 v14, 0x1

    .line 860
    :goto_7
    return v14

    .line 832
    :cond_8
    move-object/from16 v0, p1

    instance-of v14, v0, Lokio/Buffer;

    if-nez v14, :cond_10

    const/4 v14, 0x0

    goto :goto_7

    :cond_10
    move-object/from16 v13, p1

    .line 833
    check-cast v13, Lokio/Buffer;

    .line 834
    .local v13, "that":Lokio/Buffer;
    move-object/from16 v0, p0

    iget-wide v14, v0, Lokio/Buffer;->size:J

    iget-wide v0, v13, Lokio/Buffer;->size:J

    move-wide/from16 v16, v0

    cmp-long v14, v14, v16

    if-eqz v14, :cond_22

    const/4 v14, 0x0

    goto :goto_7

    .line 835
    :cond_22
    move-object/from16 v0, p0

    iget-wide v14, v0, Lokio/Buffer;->size:J

    const-wide/16 v16, 0x0

    cmp-long v14, v14, v16

    if-nez v14, :cond_2e

    const/4 v14, 0x1

    goto :goto_7

    .line 837
    :cond_2e
    move-object/from16 v0, p0

    iget-object v11, v0, Lokio/Buffer;->head:Lokio/Segment;

    .line 838
    .local v11, "sa":Lokio/Segment;
    iget-object v12, v13, Lokio/Buffer;->head:Lokio/Segment;

    .line 839
    .local v12, "sb":Lokio/Segment;
    iget v5, v11, Lokio/Segment;->pos:I

    .line 840
    .local v5, "posA":I
    iget v9, v12, Lokio/Segment;->pos:I

    .line 842
    .local v9, "posB":I
    const-wide/16 v6, 0x0

    .local v6, "pos":J
    :goto_3a
    move-object/from16 v0, p0

    iget-wide v14, v0, Lokio/Buffer;->size:J

    cmp-long v14, v6, v14

    if-gez v14, :cond_7c

    .line 843
    iget v14, v11, Lokio/Segment;->limit:I

    sub-int/2addr v14, v5

    iget v15, v12, Lokio/Segment;->limit:I

    sub-int/2addr v15, v9

    invoke-static {v14, v15}, Ljava/lang/Math;->min(II)I

    move-result v14

    int-to-long v2, v14

    .line 845
    .local v2, "count":J
    const/4 v4, 0x0

    .local v4, "i":I
    move v10, v9

    .end local v9    # "posB":I
    .local v10, "posB":I
    move v8, v5

    .end local v5    # "posA":I
    .local v8, "posA":I
    :goto_50
    int-to-long v14, v4

    cmp-long v14, v14, v2

    if-gez v14, :cond_6a

    .line 846
    iget-object v14, v11, Lokio/Segment;->data:[B

    add-int/lit8 v5, v8, 0x1

    .end local v8    # "posA":I
    .restart local v5    # "posA":I
    aget-byte v14, v14, v8

    iget-object v15, v12, Lokio/Segment;->data:[B

    add-int/lit8 v9, v10, 0x1

    .end local v10    # "posB":I
    .restart local v9    # "posB":I
    aget-byte v15, v15, v10

    if-eq v14, v15, :cond_65

    const/4 v14, 0x0

    goto :goto_7

    .line 845
    :cond_65
    add-int/lit8 v4, v4, 0x1

    move v10, v9

    .end local v9    # "posB":I
    .restart local v10    # "posB":I
    move v8, v5

    .end local v5    # "posA":I
    .restart local v8    # "posA":I
    goto :goto_50

    .line 849
    :cond_6a
    iget v14, v11, Lokio/Segment;->limit:I

    if-ne v8, v14, :cond_80

    .line 850
    iget-object v11, v11, Lokio/Segment;->next:Lokio/Segment;

    .line 851
    iget v5, v11, Lokio/Segment;->pos:I

    .line 854
    .end local v8    # "posA":I
    .restart local v5    # "posA":I
    :goto_72
    iget v14, v12, Lokio/Segment;->limit:I

    if-ne v10, v14, :cond_7e

    .line 855
    iget-object v12, v12, Lokio/Segment;->next:Lokio/Segment;

    .line 856
    iget v9, v12, Lokio/Segment;->pos:I

    .line 842
    .end local v10    # "posB":I
    .restart local v9    # "posB":I
    :goto_7a
    add-long/2addr v6, v2

    goto :goto_3a

    .line 860
    .end local v2    # "count":J
    .end local v4    # "i":I
    :cond_7c
    const/4 v14, 0x1

    goto :goto_7

    .end local v9    # "posB":I
    .restart local v2    # "count":J
    .restart local v4    # "i":I
    .restart local v10    # "posB":I
    :cond_7e
    move v9, v10

    .end local v10    # "posB":I
    .restart local v9    # "posB":I
    goto :goto_7a

    .end local v5    # "posA":I
    .end local v9    # "posB":I
    .restart local v8    # "posA":I
    .restart local v10    # "posB":I
    :cond_80
    move v5, v8

    .end local v8    # "posA":I
    .restart local v5    # "posA":I
    goto :goto_72
.end method

.method public exhausted()Z
    .registers 5

    .prologue
    .line 90
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public flush()V
    .registers 1

    .prologue
    .line 810
    return-void
.end method

.method public getByte(J)B
    .registers 12
    .param p1, "pos"    # J

    .prologue
    .line 252
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v4, 0x1

    move-wide v2, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 253
    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 254
    .local v6, "s":Lokio/Segment;
    :goto_a
    iget v0, v6, Lokio/Segment;->limit:I

    iget v1, v6, Lokio/Segment;->pos:I

    sub-int v7, v0, v1

    .line 255
    .local v7, "segmentByteCount":I
    int-to-long v0, v7

    cmp-long v0, p1, v0

    if-gez v0, :cond_1e

    iget-object v0, v6, Lokio/Segment;->data:[B

    iget v1, v6, Lokio/Segment;->pos:I

    long-to-int v2, p1

    add-int/2addr v1, v2

    aget-byte v0, v0, v1

    return v0

    .line 256
    :cond_1e
    int-to-long v0, v7

    sub-long/2addr p1, v0

    .line 253
    iget-object v6, v6, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_a
.end method

.method public hashCode()I
    .registers 7

    .prologue
    .line 864
    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 865
    .local v3, "s":Lokio/Segment;
    if-nez v3, :cond_6

    const/4 v2, 0x0

    .line 873
    :goto_5
    return v2

    .line 866
    :cond_6
    const/4 v2, 0x1

    .line 868
    .local v2, "result":I
    :cond_7
    iget v1, v3, Lokio/Segment;->pos:I

    .local v1, "pos":I
    iget v0, v3, Lokio/Segment;->limit:I

    .local v0, "limit":I
    :goto_b
    if-ge v1, v0, :cond_18

    .line 869
    mul-int/lit8 v4, v2, 0x1f

    iget-object v5, v3, Lokio/Segment;->data:[B

    aget-byte v5, v5, v1

    add-int v2, v4, v5

    .line 868
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 871
    :cond_18
    iget-object v3, v3, Lokio/Segment;->next:Lokio/Segment;

    .line 872
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-ne v3, v4, :cond_7

    goto :goto_5
.end method

.method public indexOf(B)J
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 779
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->indexOf(BJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public indexOf(BJ)J
    .registers 18
    .param p1, "b"    # B
    .param p2, "fromIndex"    # J

    .prologue
    .line 787
    const-wide/16 v10, 0x0

    cmp-long v9, p2, v10

    if-gez v9, :cond_e

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "fromIndex < 0"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 789
    :cond_e
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 790
    .local v1, "s":Lokio/Segment;
    if-nez v1, :cond_15

    const-wide/16 v10, -0x1

    .line 806
    :goto_14
    return-wide v10

    .line 791
    :cond_15
    const-wide/16 v4, 0x0

    .line 793
    .local v4, "offset":J
    :cond_17
    iget v9, v1, Lokio/Segment;->limit:I

    iget v10, v1, Lokio/Segment;->pos:I

    sub-int v8, v9, v10

    .line 794
    .local v8, "segmentByteCount":I
    int-to-long v10, v8

    cmp-long v9, p2, v10

    if-ltz v9, :cond_30

    .line 795
    int-to-long v10, v8

    sub-long p2, p2, v10

    .line 803
    :goto_25
    int-to-long v10, v8

    add-long/2addr v4, v10

    .line 804
    iget-object v1, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 805
    iget-object v9, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-ne v1, v9, :cond_17

    .line 806
    const-wide/16 v10, -0x1

    goto :goto_14

    .line 797
    :cond_30
    iget-object v0, v1, Lokio/Segment;->data:[B

    .line 798
    .local v0, "data":[B
    iget v9, v1, Lokio/Segment;->pos:I

    int-to-long v10, v9

    add-long v6, v10, p2

    .local v6, "pos":J
    iget v9, v1, Lokio/Segment;->limit:I

    int-to-long v2, v9

    .local v2, "limit":J
    :goto_3a
    cmp-long v9, v6, v2

    if-gez v9, :cond_4e

    .line 799
    long-to-int v9, v6

    aget-byte v9, v0, v9

    if-ne v9, p1, :cond_4a

    add-long v10, v4, v6

    iget v9, v1, Lokio/Segment;->pos:I

    int-to-long v12, v9

    sub-long/2addr v10, v12

    goto :goto_14

    .line 798
    :cond_4a
    const-wide/16 v10, 0x1

    add-long/2addr v6, v10

    goto :goto_3a

    .line 801
    :cond_4e
    const-wide/16 p2, 0x0

    goto :goto_25
.end method

.method public inputStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 98
    new-instance v0, Lokio/Buffer$2;

    invoke-direct {v0, p0}, Lokio/Buffer$2;-><init>(Lokio/Buffer;)V

    return-object v0
.end method

.method public outputStream()Ljava/io/OutputStream;
    .registers 2

    .prologue
    .line 64
    new-instance v0, Lokio/Buffer$1;

    invoke-direct {v0, p0}, Lokio/Buffer$1;-><init>(Lokio/Buffer;)V

    return-object v0
.end method

.method public read([BII)I
    .registers 12
    .param p1, "sink"    # [B
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    .prologue
    .line 501
    array-length v0, p1

    int-to-long v0, v0

    int-to-long v2, p2

    int-to-long v4, p3

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 503
    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 504
    .local v6, "s":Lokio/Segment;
    if-nez v6, :cond_d

    const/4 v7, -0x1

    .line 516
    :cond_c
    :goto_c
    return v7

    .line 505
    :cond_d
    iget v0, v6, Lokio/Segment;->limit:I

    iget v1, v6, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 506
    .local v7, "toCopy":I
    iget-object v0, v6, Lokio/Segment;->data:[B

    iget v1, v6, Lokio/Segment;->pos:I

    invoke-static {v0, v1, p1, p2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 508
    iget v0, v6, Lokio/Segment;->pos:I

    add-int/2addr v0, v7

    iput v0, v6, Lokio/Segment;->pos:I

    .line 509
    iget-wide v0, p0, Lokio/Buffer;->size:J

    int-to-long v2, v7

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 511
    iget v0, v6, Lokio/Segment;->pos:I

    iget v1, v6, Lokio/Segment;->limit:I

    if-ne v0, v1, :cond_c

    .line 512
    invoke-virtual {v6}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v0

    iput-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 513
    sget-object v0, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v0, v6}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_c
.end method

.method public read(Lokio/Buffer;J)J
    .registers 8
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 770
    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "sink == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 771
    :cond_c
    cmp-long v0, p2, v2

    if-gez v0, :cond_29

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 772
    :cond_29
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_32

    const-wide/16 v0, -0x1

    .line 775
    :goto_31
    return-wide v0

    .line 773
    :cond_32
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, p2, v0

    if-lez v0, :cond_3a

    iget-wide p2, p0, Lokio/Buffer;->size:J

    .line 774
    :cond_3a
    invoke-virtual {p1, p0, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    move-wide v0, p2

    .line 775
    goto :goto_31
.end method

.method public readByte()B
    .registers 11

    .prologue
    .line 230
    iget-wide v6, p0, Lokio/Buffer;->size:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-nez v6, :cond_10

    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "size == 0"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 232
    :cond_10
    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 233
    .local v5, "segment":Lokio/Segment;
    iget v3, v5, Lokio/Segment;->pos:I

    .line 234
    .local v3, "pos":I
    iget v2, v5, Lokio/Segment;->limit:I

    .line 236
    .local v2, "limit":I
    iget-object v1, v5, Lokio/Segment;->data:[B

    .line 237
    .local v1, "data":[B
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .local v4, "pos":I
    aget-byte v0, v1, v3

    .line 238
    .local v0, "b":B
    iget-wide v6, p0, Lokio/Buffer;->size:J

    const-wide/16 v8, 0x1

    sub-long/2addr v6, v8

    iput-wide v6, p0, Lokio/Buffer;->size:J

    .line 240
    if-ne v4, v2, :cond_31

    .line 241
    invoke-virtual {v5}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 242
    sget-object v6, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v6, v5}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 247
    :goto_30
    return v0

    .line 244
    :cond_31
    iput v4, v5, Lokio/Segment;->pos:I

    goto :goto_30
.end method

.method public readByteArray()[B
    .registers 5

    .prologue
    .line 470
    :try_start_0
    iget-wide v2, p0, Lokio/Buffer;->size:J

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->readByteArray(J)[B
    :try_end_5
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 471
    :catch_7
    move-exception v0

    .line 472
    .local v0, "e":Ljava/io/EOFException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public readByteArray(J)[B
    .registers 10
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 477
    iget-wide v0, p0, Lokio/Buffer;->size:J

    const-wide/16 v2, 0x0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 478
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_28

    .line 479
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount > Integer.MAX_VALUE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 482
    :cond_28
    long-to-int v0, p1

    new-array v6, v0, [B

    .line 483
    .local v6, "result":[B
    invoke-virtual {p0, v6}, Lokio/Buffer;->readFully([B)V

    .line 484
    return-object v6
.end method

.method public readByteString()Lokio/ByteString;
    .registers 3

    .prologue
    .line 368
    new-instance v0, Lokio/ByteString;

    invoke-virtual {p0}, Lokio/Buffer;->readByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public readByteString(J)Lokio/ByteString;
    .registers 6
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 372
    new-instance v0, Lokio/ByteString;

    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lokio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public readFully([B)V
    .registers 5
    .param p1, "sink"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 492
    const/4 v0, 0x0

    .line 493
    .local v0, "offset":I
    :goto_1
    array-length v2, p1

    if-ge v0, v2, :cond_15

    .line 494
    array-length v2, p1

    sub-int/2addr v2, v0

    invoke-virtual {p0, p1, v0, v2}, Lokio/Buffer;->read([BII)I

    move-result v1

    .line 495
    .local v1, "read":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_13

    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 496
    :cond_13
    add-int/2addr v0, v1

    .line 497
    goto :goto_1

    .line 498
    .end local v1    # "read":I
    :cond_15
    return-void
.end method

.method public readInt()I
    .registers 11

    .prologue
    const-wide/16 v8, 0x4

    .line 290
    iget-wide v6, p0, Lokio/Buffer;->size:J

    cmp-long v6, v6, v8

    if-gez v6, :cond_23

    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "size < 4: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lokio/Buffer;->size:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 292
    :cond_23
    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 293
    .local v5, "segment":Lokio/Segment;
    iget v3, v5, Lokio/Segment;->pos:I

    .line 294
    .local v3, "pos":I
    iget v2, v5, Lokio/Segment;->limit:I

    .line 297
    .local v2, "limit":I
    sub-int v6, v2, v3

    const/4 v7, 0x4

    if-ge v6, v7, :cond_51

    .line 298
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x18

    .line 299
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x10

    or-int/2addr v6, v7

    .line 300
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v6, v7

    .line 301
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    or-int v1, v6, v7

    .line 318
    :goto_50
    return v1

    .line 304
    :cond_51
    iget-object v0, v5, Lokio/Segment;->data:[B

    .line 305
    .local v0, "data":[B
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .local v4, "pos":I
    aget-byte v6, v0, v3

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x18

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    aget-byte v7, v0, v4

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x10

    or-int/2addr v6, v7

    add-int/lit8 v4, v3, 0x1

    .end local v3    # "pos":I
    .restart local v4    # "pos":I
    aget-byte v7, v0, v3

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v6, v7

    add-int/lit8 v3, v4, 0x1

    .end local v4    # "pos":I
    .restart local v3    # "pos":I
    aget-byte v7, v0, v4

    and-int/lit16 v7, v7, 0xff

    or-int v1, v6, v7

    .line 309
    .local v1, "i":I
    iget-wide v6, p0, Lokio/Buffer;->size:J

    sub-long/2addr v6, v8

    iput-wide v6, p0, Lokio/Buffer;->size:J

    .line 311
    if-ne v3, v2, :cond_88

    .line 312
    invoke-virtual {v5}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 313
    sget-object v6, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v6, v5}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_50

    .line 315
    :cond_88
    iput v3, v5, Lokio/Segment;->pos:I

    goto :goto_50
.end method

.method public readIntLe()I
    .registers 2

    .prologue
    .line 360
    invoke-virtual {p0}, Lokio/Buffer;->readInt()I

    move-result v0

    invoke-static {v0}, Lokio/Util;->reverseBytesInt(I)I

    move-result v0

    return v0
.end method

.method public readShort()S
    .registers 11

    .prologue
    const-wide/16 v8, 0x2

    .line 261
    iget-wide v6, p0, Lokio/Buffer;->size:J

    cmp-long v6, v6, v8

    if-gez v6, :cond_23

    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "size < 2: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lokio/Buffer;->size:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 263
    :cond_23
    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 264
    .local v5, "segment":Lokio/Segment;
    iget v2, v5, Lokio/Segment;->pos:I

    .line 265
    .local v2, "pos":I
    iget v1, v5, Lokio/Segment;->limit:I

    .line 268
    .local v1, "limit":I
    sub-int v6, v1, v2

    const/4 v7, 0x2

    if-ge v6, v7, :cond_40

    .line 269
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    .line 270
    invoke-virtual {p0}, Lokio/Buffer;->readByte()B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    or-int v4, v6, v7

    .line 271
    .local v4, "s":I
    int-to-short v6, v4

    .line 286
    :goto_3f
    return v6

    .line 274
    .end local v4    # "s":I
    :cond_40
    iget-object v0, v5, Lokio/Segment;->data:[B

    .line 275
    .local v0, "data":[B
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "pos":I
    .local v3, "pos":I
    aget-byte v6, v0, v2

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "pos":I
    .restart local v2    # "pos":I
    aget-byte v7, v0, v3

    and-int/lit16 v7, v7, 0xff

    or-int v4, v6, v7

    .line 277
    .restart local v4    # "s":I
    iget-wide v6, p0, Lokio/Buffer;->size:J

    sub-long/2addr v6, v8

    iput-wide v6, p0, Lokio/Buffer;->size:J

    .line 279
    if-ne v2, v1, :cond_66

    .line 280
    invoke-virtual {v5}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v6

    iput-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 281
    sget-object v6, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v6, v5}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    .line 286
    :goto_64
    int-to-short v6, v4

    goto :goto_3f

    .line 283
    :cond_66
    iput v2, v5, Lokio/Segment;->pos:I

    goto :goto_64
.end method

.method public readShortLe()S
    .registers 2

    .prologue
    .line 356
    invoke-virtual {p0}, Lokio/Buffer;->readShort()S

    move-result v0

    invoke-static {v0}, Lokio/Util;->reverseBytesShort(S)S

    move-result v0

    return v0
.end method

.method public readString(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .registers 13
    .param p1, "byteCount"    # J
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 412
    iget-wide v0, p0, Lokio/Buffer;->size:J

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 413
    if-nez p3, :cond_12

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "charset == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 414
    :cond_12
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_32

    .line 415
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "byteCount > Integer.MAX_VALUE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 417
    :cond_32
    cmp-long v0, p1, v2

    if-nez v0, :cond_39

    const-string v7, ""

    .line 434
    :cond_38
    :goto_38
    return-object v7

    .line 419
    :cond_39
    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 420
    .local v6, "head":Lokio/Segment;
    iget v0, v6, Lokio/Segment;->pos:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    iget v2, v6, Lokio/Segment;->limit:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_50

    .line 422
    new-instance v7, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readByteArray(J)[B

    move-result-object v0

    invoke-direct {v7, v0, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    goto :goto_38

    .line 425
    :cond_50
    new-instance v7, Ljava/lang/String;

    iget-object v0, v6, Lokio/Segment;->data:[B

    iget v1, v6, Lokio/Segment;->pos:I

    long-to-int v2, p1

    invoke-direct {v7, v0, v1, v2, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 426
    .local v7, "result":Ljava/lang/String;
    iget v0, v6, Lokio/Segment;->pos:I

    int-to-long v0, v0

    add-long/2addr v0, p1

    long-to-int v0, v0

    iput v0, v6, Lokio/Segment;->pos:I

    .line 427
    iget-wide v0, p0, Lokio/Buffer;->size:J

    sub-long/2addr v0, p1

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 429
    iget v0, v6, Lokio/Segment;->pos:I

    iget v1, v6, Lokio/Segment;->limit:I

    if-ne v0, v1, :cond_38

    .line 430
    invoke-virtual {v6}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v0

    iput-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 431
    sget-object v0, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v0, v6}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_38
.end method

.method public readUtf8(J)Ljava/lang/String;
    .registers 4
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 400
    sget-object v0, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1, p2, v0}, Lokio/Buffer;->readString(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method readUtf8Line(J)Ljava/lang/String;
    .registers 10
    .param p1, "newline"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x1

    .line 454
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-lez v2, :cond_1f

    sub-long v2, p1, v4

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->getByte(J)B

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_1f

    .line 456
    sub-long v2, p1, v4

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v0

    .line 457
    .local v0, "result":Ljava/lang/String;
    const-wide/16 v2, 0x2

    invoke-virtual {p0, v2, v3}, Lokio/Buffer;->skip(J)V

    move-object v1, v0

    .line 464
    .end local v0    # "result":Ljava/lang/String;
    .local v1, "result":Ljava/lang/String;
    :goto_1e
    return-object v1

    .line 462
    .end local v1    # "result":Ljava/lang/String;
    :cond_1f
    invoke-virtual {p0, p1, p2}, Lokio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object v0

    .line 463
    .restart local v0    # "result":Ljava/lang/String;
    invoke-virtual {p0, v4, v5}, Lokio/Buffer;->skip(J)V

    move-object v1, v0

    .line 464
    .end local v0    # "result":Ljava/lang/String;
    .restart local v1    # "result":Ljava/lang/String;
    goto :goto_1e
.end method

.method public readUtf8LineStrict()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 448
    const/16 v2, 0xa

    invoke-virtual {p0, v2}, Lokio/Buffer;->indexOf(B)J

    move-result-wide v0

    .line 449
    .local v0, "newline":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_12

    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 450
    :cond_12
    invoke-virtual {p0, v0, v1}, Lokio/Buffer;->readUtf8Line(J)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public require(J)V
    .registers 6
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 94
    iget-wide v0, p0, Lokio/Buffer;->size:J

    cmp-long v0, v0, p1

    if-gez v0, :cond_c

    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 95
    :cond_c
    return-void
.end method

.method public size()J
    .registers 3

    .prologue
    .line 56
    iget-wide v0, p0, Lokio/Buffer;->size:J

    return-wide v0
.end method

.method public skip(J)V
    .registers 10
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 533
    :cond_0
    :goto_0
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-lez v2, :cond_46

    .line 534
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v2, :cond_10

    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 536
    :cond_10
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->limit:I

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->pos:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v1, v2

    .line 537
    .local v1, "toSkip":I
    iget-wide v2, p0, Lokio/Buffer;->size:J

    int-to-long v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 538
    int-to-long v2, v1

    sub-long/2addr p1, v2

    .line 539
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v2, Lokio/Segment;->pos:I

    add-int/2addr v3, v1

    iput v3, v2, Lokio/Segment;->pos:I

    .line 541
    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v2, v2, Lokio/Segment;->pos:I

    iget-object v3, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v3, v3, Lokio/Segment;->limit:I

    if-ne v2, v3, :cond_0

    .line 542
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 543
    .local v0, "toRecycle":Lokio/Segment;
    invoke-virtual {v0}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v2

    iput-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 544
    sget-object v2, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v2, v0}, Lokio/SegmentPool;->recycle(Lokio/Segment;)V

    goto :goto_0

    .line 547
    .end local v0    # "toRecycle":Lokio/Segment;
    .end local v1    # "toSkip":I
    :cond_46
    return-void
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 816
    sget-object v0, Lokio/Timeout;->NONE:Lokio/Timeout;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 12

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 877
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_e

    .line 878
    const-string v4, "Buffer[size=0]"

    .line 892
    :goto_d
    return-object v4

    .line 881
    :cond_e
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x10

    cmp-long v4, v4, v6

    if-gtz v4, :cond_35

    .line 882
    invoke-virtual {p0}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object v4

    invoke-virtual {v4}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    move-result-object v0

    .line 883
    .local v0, "data":Lokio/ByteString;
    const-string v4, "Buffer[size=%s data=%s]"

    new-array v5, v10, [Ljava/lang/Object;

    iget-wide v6, p0, Lokio/Buffer;->size:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-virtual {v0}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_d

    .line 887
    .end local v0    # "data":Lokio/ByteString;
    :cond_35
    :try_start_35
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 888
    .local v2, "md5":Ljava/security/MessageDigest;
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v4, v4, Lokio/Segment;->data:[B

    iget-object v5, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v5, v5, Lokio/Segment;->pos:I

    iget-object v6, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v6, v6, Lokio/Segment;->limit:I

    iget-object v7, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget v7, v7, Lokio/Segment;->pos:I

    sub-int/2addr v6, v7

    invoke-virtual {v2, v4, v5, v6}, Ljava/security/MessageDigest;->update([BII)V

    .line 889
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v3, v4, Lokio/Segment;->next:Lokio/Segment;

    .local v3, "s":Lokio/Segment;
    :goto_53
    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eq v3, v4, :cond_66

    .line 890
    iget-object v4, v3, Lokio/Segment;->data:[B

    iget v5, v3, Lokio/Segment;->pos:I

    iget v6, v3, Lokio/Segment;->limit:I

    iget v7, v3, Lokio/Segment;->pos:I

    sub-int/2addr v6, v7

    invoke-virtual {v2, v4, v5, v6}, Ljava/security/MessageDigest;->update([BII)V

    .line 889
    iget-object v3, v3, Lokio/Segment;->next:Lokio/Segment;

    goto :goto_53

    .line 892
    :cond_66
    const-string v4, "Buffer[size=%s md5=%s]"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-wide v8, p0, Lokio/Buffer;->size:J

    .line 893
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v7

    invoke-static {v7}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v7

    invoke-virtual {v7}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    .line 892
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_86
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_35 .. :try_end_86} :catch_88

    move-result-object v4

    goto :goto_d

    .line 894
    .end local v2    # "md5":Ljava/security/MessageDigest;
    .end local v3    # "s":Lokio/Segment;
    :catch_88
    move-exception v1

    .line 895
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4
.end method

.method writableSegment(I)Lokio/Segment;
    .registers 5
    .param p1, "minimumCapacity"    # I

    .prologue
    const/16 v2, 0x800

    .line 665
    const/4 v1, 0x1

    if-lt p1, v1, :cond_7

    if-le p1, v2, :cond_d

    :cond_7
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 667
    :cond_d
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v1, :cond_24

    .line 668
    sget-object v1, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v1}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v1

    iput-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 669
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v2, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iput-object v0, v2, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v0, v1, Lokio/Segment;->next:Lokio/Segment;

    .line 676
    :cond_23
    :goto_23
    return-object v0

    .line 672
    :cond_24
    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v0, v1, Lokio/Segment;->prev:Lokio/Segment;

    .line 673
    .local v0, "tail":Lokio/Segment;
    iget v1, v0, Lokio/Segment;->limit:I

    add-int/2addr v1, p1

    if-le v1, v2, :cond_23

    .line 674
    sget-object v1, Lokio/SegmentPool;->INSTANCE:Lokio/SegmentPool;

    invoke-virtual {v1}, Lokio/SegmentPool;->take()Lokio/Segment;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-result-object v0

    goto :goto_23
.end method

.method public write(Lokio/ByteString;)Lokio/Buffer;
    .registers 5
    .param p1, "byteString"    # Lokio/ByteString;

    .prologue
    .line 550
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "byteString == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 551
    :cond_a
    iget-object v0, p1, Lokio/ByteString;->data:[B

    const/4 v1, 0x0

    iget-object v2, p1, Lokio/ByteString;->data:[B

    array-length v2, v2

    invoke-virtual {p0, v0, v1, v2}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public write([B)Lokio/Buffer;
    .registers 4
    .param p1, "source"    # [B

    .prologue
    .line 568
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 569
    :cond_a
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public write([BII)Lokio/Buffer;
    .registers 13
    .param p1, "source"    # [B
    .param p2, "offset"    # I
    .param p3, "byteCount"    # I

    .prologue
    .line 573
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 574
    :cond_a
    array-length v0, p1

    int-to-long v0, v0

    int-to-long v2, p2

    int-to-long v4, p3

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 576
    add-int v6, p2, p3

    .line 577
    .local v6, "limit":I
    :goto_13
    if-ge p2, v6, :cond_32

    .line 578
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v7

    .line 580
    .local v7, "tail":Lokio/Segment;
    sub-int v0, v6, p2

    iget v1, v7, Lokio/Segment;->limit:I

    rsub-int v1, v1, 0x800

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 581
    .local v8, "toCopy":I
    iget-object v0, v7, Lokio/Segment;->data:[B

    iget v1, v7, Lokio/Segment;->limit:I

    invoke-static {p1, p2, v0, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 583
    add-int/2addr p2, v8

    .line 584
    iget v0, v7, Lokio/Segment;->limit:I

    add-int/2addr v0, v8

    iput v0, v7, Lokio/Segment;->limit:I

    goto :goto_13

    .line 587
    .end local v7    # "tail":Lokio/Segment;
    .end local v8    # "toCopy":I
    :cond_32
    iget-wide v0, p0, Lokio/Buffer;->size:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 588
    return-object p0
.end method

.method public bridge synthetic write(Lokio/ByteString;)Lokio/BufferedSink;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->write(Lokio/ByteString;)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic write([B)Lokio/BufferedSink;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->write([B)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic write([BII)Lokio/BufferedSink;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2, p3}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public write(Lokio/Buffer;J)V
    .registers 14
    .param p1, "source"    # Lokio/Buffer;
    .param p2, "byteCount"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 730
    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 731
    :cond_c
    if-ne p1, p0, :cond_16

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == this"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 732
    :cond_16
    iget-wide v0, p1, Lokio/Buffer;->size:J

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lokio/Util;->checkOffsetAndCount(JJJ)V

    .line 734
    :goto_1c
    cmp-long v0, p2, v2

    if-lez v0, :cond_8a

    .line 736
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget v0, v0, Lokio/Segment;->limit:I

    iget-object v1, p1, Lokio/Buffer;->head:Lokio/Segment;

    iget v1, v1, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v0, p2, v0

    if-gez v0, :cond_4e

    .line 737
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-eqz v0, :cond_78

    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v9, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 738
    .local v9, "tail":Lokio/Segment;
    :goto_36
    if-eqz v9, :cond_45

    iget v0, v9, Lokio/Segment;->limit:I

    iget v1, v9, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    add-long/2addr v0, p2

    const-wide/16 v4, 0x800

    cmp-long v0, v0, v4

    if-lez v0, :cond_7a

    .line 741
    :cond_45
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    long-to-int v1, p2

    invoke-virtual {v0, v1}, Lokio/Segment;->split(I)Lokio/Segment;

    move-result-object v0

    iput-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 752
    .end local v9    # "tail":Lokio/Segment;
    :cond_4e
    iget-object v8, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 753
    .local v8, "segmentToMove":Lokio/Segment;
    iget v0, v8, Lokio/Segment;->limit:I

    iget v1, v8, Lokio/Segment;->pos:I

    sub-int/2addr v0, v1

    int-to-long v6, v0

    .line 754
    .local v6, "movedByteCount":J
    invoke-virtual {v8}, Lokio/Segment;->pop()Lokio/Segment;

    move-result-object v0

    iput-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    .line 755
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    if-nez v0, :cond_8b

    .line 756
    iput-object v8, p0, Lokio/Buffer;->head:Lokio/Segment;

    .line 757
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v1, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v4, p0, Lokio/Buffer;->head:Lokio/Segment;

    iput-object v4, v1, Lokio/Segment;->prev:Lokio/Segment;

    iput-object v4, v0, Lokio/Segment;->next:Lokio/Segment;

    .line 763
    :goto_6c
    iget-wide v0, p1, Lokio/Buffer;->size:J

    sub-long/2addr v0, v6

    iput-wide v0, p1, Lokio/Buffer;->size:J

    .line 764
    iget-wide v0, p0, Lokio/Buffer;->size:J

    add-long/2addr v0, v6

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 765
    sub-long/2addr p2, v6

    .line 766
    goto :goto_1c

    .line 737
    .end local v6    # "movedByteCount":J
    .end local v8    # "segmentToMove":Lokio/Segment;
    :cond_78
    const/4 v9, 0x0

    goto :goto_36

    .line 744
    .restart local v9    # "tail":Lokio/Segment;
    :cond_7a
    iget-object v0, p1, Lokio/Buffer;->head:Lokio/Segment;

    long-to-int v1, p2

    invoke-virtual {v0, v9, v1}, Lokio/Segment;->writeTo(Lokio/Segment;I)V

    .line 745
    iget-wide v0, p1, Lokio/Buffer;->size:J

    sub-long/2addr v0, p2

    iput-wide v0, p1, Lokio/Buffer;->size:J

    .line 746
    iget-wide v0, p0, Lokio/Buffer;->size:J

    add-long/2addr v0, p2

    iput-wide v0, p0, Lokio/Buffer;->size:J

    .line 767
    .end local v9    # "tail":Lokio/Segment;
    :cond_8a
    return-void

    .line 759
    .restart local v6    # "movedByteCount":J
    .restart local v8    # "segmentToMove":Lokio/Segment;
    :cond_8b
    iget-object v0, p0, Lokio/Buffer;->head:Lokio/Segment;

    iget-object v9, v0, Lokio/Segment;->prev:Lokio/Segment;

    .line 760
    .restart local v9    # "tail":Lokio/Segment;
    invoke-virtual {v9, v8}, Lokio/Segment;->push(Lokio/Segment;)Lokio/Segment;

    move-result-object v9

    .line 761
    invoke-virtual {v9}, Lokio/Segment;->compact()V

    goto :goto_6c
.end method

.method public writeAll(Lokio/Source;)J
    .registers 8
    .param p1, "source"    # Lokio/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 592
    if-nez p1, :cond_a

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "source == null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 593
    :cond_a
    const-wide/16 v2, 0x0

    .line 594
    .local v2, "totalBytesRead":J
    :goto_c
    const-wide/16 v4, 0x800

    invoke-interface {p1, p0, v4, v5}, Lokio/Source;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .local v0, "readCount":J
    const-wide/16 v4, -0x1

    cmp-long v4, v0, v4

    if-eqz v4, :cond_1a

    .line 595
    add-long/2addr v2, v0

    goto :goto_c

    .line 597
    :cond_1a
    return-wide v2
.end method

.method public writeByte(I)Lokio/Buffer;
    .registers 8
    .param p1, "b"    # I

    .prologue
    .line 601
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v0

    .line 602
    .local v0, "tail":Lokio/Segment;
    iget-object v1, v0, Lokio/Segment;->data:[B

    iget v2, v0, Lokio/Segment;->limit:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v0, Lokio/Segment;->limit:I

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 603
    iget-wide v2, p0, Lokio/Buffer;->size:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lokio/Buffer;->size:J

    .line 604
    return-object p0
.end method

.method public bridge synthetic writeByte(I)Lokio/BufferedSink;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeInt(I)Lokio/Buffer;
    .registers 10
    .param p1, "i"    # I

    .prologue
    .line 623
    const/4 v4, 0x4

    invoke-virtual {p0, v4}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 624
    .local v3, "tail":Lokio/Segment;
    iget-object v0, v3, Lokio/Segment;->data:[B

    .line 625
    .local v0, "data":[B
    iget v1, v3, Lokio/Segment;->limit:I

    .line 626
    .local v1, "limit":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .local v2, "limit":I
    ushr-int/lit8 v4, p1, 0x18

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 627
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    ushr-int/lit8 v4, p1, 0x10

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 628
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .restart local v2    # "limit":I
    ushr-int/lit8 v4, p1, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 629
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    and-int/lit16 v4, p1, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 630
    iput v1, v3, Lokio/Segment;->limit:I

    .line 631
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x4

    add-long/2addr v4, v6

    iput-wide v4, p0, Lokio/Buffer;->size:J

    .line 632
    return-object p0
.end method

.method public bridge synthetic writeInt(I)Lokio/BufferedSink;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeInt(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeShort(I)Lokio/Buffer;
    .registers 10
    .param p1, "s"    # I

    .prologue
    .line 608
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Lokio/Buffer;->writableSegment(I)Lokio/Segment;

    move-result-object v3

    .line 609
    .local v3, "tail":Lokio/Segment;
    iget-object v0, v3, Lokio/Segment;->data:[B

    .line 610
    .local v0, "data":[B
    iget v1, v3, Lokio/Segment;->limit:I

    .line 611
    .local v1, "limit":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "limit":I
    .local v2, "limit":I
    ushr-int/lit8 v4, p1, 0x8

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 612
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "limit":I
    .restart local v1    # "limit":I
    and-int/lit16 v4, p1, 0xff

    int-to-byte v4, v4

    aput-byte v4, v0, v2

    .line 613
    iput v1, v3, Lokio/Segment;->limit:I

    .line 614
    iget-wide v4, p0, Lokio/Buffer;->size:J

    const-wide/16 v6, 0x2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lokio/Buffer;->size:J

    .line 615
    return-object p0
.end method

.method public bridge synthetic writeShort(I)Lokio/BufferedSink;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;
    .registers 6
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 561
    if-nez p1, :cond_a

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "string == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 562
    :cond_a
    if-nez p2, :cond_14

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "charset == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 563
    :cond_14
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 564
    .local v0, "data":[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-virtual {p0, v0, v1, v2}, Lokio/Buffer;->write([BII)Lokio/Buffer;

    move-result-object v1

    return-object v1
.end method

.method public writeUtf8(Ljava/lang/String;)Lokio/Buffer;
    .registers 4
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 555
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "string == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 557
    :cond_a
    sget-object v0, Lokio/Util;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1, v0}, Lokio/Buffer;->writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    move-result-object v0

    return-object v0
.end method
