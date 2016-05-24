.class public Lorg/apache/http/impl/io/SessionInputBufferImpl;
.super Ljava/lang/Object;
.source "SessionInputBufferImpl.java"

# interfaces
.implements Lorg/apache/http/io/BufferInfo;
.implements Lorg/apache/http/io/SessionInputBuffer;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final buffer:[B

.field private bufferlen:I

.field private bufferpos:I

.field private cbuf:Ljava/nio/CharBuffer;

.field private final constraints:Lorg/apache/http/config/MessageConstraints;

.field private final decoder:Ljava/nio/charset/CharsetDecoder;

.field private instream:Ljava/io/InputStream;

.field private final linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

.field private final metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

.field private final minChunkLimit:I


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/io/HttpTransportMetricsImpl;I)V
    .registers 9
    .param p1, "metrics"    # Lorg/apache/http/impl/io/HttpTransportMetricsImpl;
    .param p2, "buffersize"    # I

    .prologue
    const/4 v4, 0x0

    .line 111
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p2

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/impl/io/SessionInputBufferImpl;-><init>(Lorg/apache/http/impl/io/HttpTransportMetricsImpl;IILorg/apache/http/config/MessageConstraints;Ljava/nio/charset/CharsetDecoder;)V

    .line 112
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/io/HttpTransportMetricsImpl;IILorg/apache/http/config/MessageConstraints;Ljava/nio/charset/CharsetDecoder;)V
    .registers 8
    .param p1, "metrics"    # Lorg/apache/http/impl/io/HttpTransportMetricsImpl;
    .param p2, "buffersize"    # I
    .param p3, "minChunkLimit"    # I
    .param p4, "constraints"    # Lorg/apache/http/config/MessageConstraints;
    .param p5, "chardecoder"    # Ljava/nio/charset/CharsetDecoder;

    .prologue
    const/4 v1, 0x0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    const-string v0, "HTTP transport metrcis"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    const-string v0, "Buffer size"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->positive(ILjava/lang/String;)I

    .line 98
    iput-object p1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    .line 99
    new-array v0, p2, [B

    iput-object v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    .line 100
    iput v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    .line 101
    iput v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    .line 102
    if-ltz p3, :cond_2a

    .end local p3    # "minChunkLimit":I
    :goto_1a
    iput p3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->minChunkLimit:I

    .line 103
    if-eqz p4, :cond_2d

    .end local p4    # "constraints":Lorg/apache/http/config/MessageConstraints;
    :goto_1e
    iput-object p4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->constraints:Lorg/apache/http/config/MessageConstraints;

    .line 104
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    invoke-direct {v0, p2}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    .line 105
    iput-object p5, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    .line 106
    return-void

    .line 102
    .restart local p3    # "minChunkLimit":I
    .restart local p4    # "constraints":Lorg/apache/http/config/MessageConstraints;
    :cond_2a
    const/16 p3, 0x200

    goto :goto_1a

    .line 103
    .end local p3    # "minChunkLimit":I
    :cond_2d
    sget-object p4, Lorg/apache/http/config/MessageConstraints;->DEFAULT:Lorg/apache/http/config/MessageConstraints;

    goto :goto_1e
.end method

.method private appendDecoded(Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I
    .registers 8
    .param p1, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "bbuf"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 347
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-nez v2, :cond_8

    .line 348
    const/4 v0, 0x0

    .line 362
    :goto_7
    return v0

    .line 350
    :cond_8
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    if-nez v2, :cond_14

    .line 351
    const/16 v2, 0x400

    invoke-static {v2}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    .line 353
    :cond_14
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    invoke-virtual {v2}, Ljava/nio/charset/CharsetDecoder;->reset()Ljava/nio/charset/CharsetDecoder;

    .line 354
    const/4 v0, 0x0

    .line 355
    .local v0, "len":I
    :goto_1a
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 356
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    iget-object v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    const/4 v4, 0x1

    invoke-virtual {v2, p2, v3, v4}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v1

    .line 357
    .local v1, "result":Ljava/nio/charset/CoderResult;
    invoke-direct {p0, v1, p1, p2}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->handleDecodingResult(Ljava/nio/charset/CoderResult;Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result v2

    add-int/2addr v0, v2

    .line 358
    goto :goto_1a

    .line 359
    .end local v1    # "result":Ljava/nio/charset/CoderResult;
    :cond_2f
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    iget-object v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v2, v3}, Ljava/nio/charset/CharsetDecoder;->flush(Ljava/nio/CharBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v1

    .line 360
    .restart local v1    # "result":Ljava/nio/charset/CoderResult;
    invoke-direct {p0, v1, p1, p2}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->handleDecodingResult(Ljava/nio/charset/CoderResult;Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result v2

    add-int/2addr v0, v2

    .line 361
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v2}, Ljava/nio/CharBuffer;->clear()Ljava/nio/Buffer;

    goto :goto_7
.end method

.method private handleDecodingResult(Ljava/nio/charset/CoderResult;Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I
    .registers 6
    .param p1, "result"    # Ljava/nio/charset/CoderResult;
    .param p2, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p3, "bbuf"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 369
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->isError()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 370
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 372
    :cond_9
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    .line 373
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->remaining()I

    move-result v0

    .line 374
    .local v0, "len":I
    :goto_14
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 375
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->get()C

    move-result v1

    invoke-virtual {p2, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(C)V

    goto :goto_14

    .line 377
    :cond_26
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->cbuf:Ljava/nio/CharBuffer;

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->compact()Ljava/nio/CharBuffer;

    .line 378
    return v0
.end method

.method private lineFromLineBuffer(Lorg/apache/http/util/CharArrayBuffer;)I
    .registers 7
    .param p1, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 303
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v1

    .line 304
    .local v1, "len":I
    if-lez v1, :cond_27

    .line 305
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v2, v3}, Lorg/apache/http/util/ByteArrayBuffer;->byteAt(I)I

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_17

    .line 306
    add-int/lit8 v1, v1, -0x1

    .line 309
    :cond_17
    if-lez v1, :cond_27

    .line 310
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v2, v3}, Lorg/apache/http/util/ByteArrayBuffer;->byteAt(I)I

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_27

    .line 311
    add-int/lit8 v1, v1, -0x1

    .line 315
    :cond_27
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    if-nez v2, :cond_36

    .line 316
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {p1, v2, v4, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Lorg/apache/http/util/ByteArrayBuffer;II)V

    .line 321
    :goto_30
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->clear()V

    .line 322
    return v1

    .line 318
    :cond_36
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->buffer()[B

    move-result-object v2

    invoke-static {v2, v4, v1}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 319
    .local v0, "bbuf":Ljava/nio/ByteBuffer;
    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->appendDecoded(Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result v1

    goto :goto_30
.end method

.method private lineFromReadBuffer(Lorg/apache/http/util/CharArrayBuffer;I)I
    .registers 9
    .param p1, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 327
    move v3, p2

    .line 328
    .local v3, "pos":I
    iget v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    .line 330
    .local v2, "off":I
    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    .line 331
    if-le v3, v2, :cond_15

    iget-object v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    add-int/lit8 v5, v3, -0x1

    aget-byte v4, v4, v5

    const/16 v5, 0xd

    if-ne v4, v5, :cond_15

    .line 333
    add-int/lit8 v3, v3, -0x1

    .line 335
    :cond_15
    sub-int v1, v3, v2

    .line 336
    .local v1, "len":I
    iget-object v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->decoder:Ljava/nio/charset/CharsetDecoder;

    if-nez v4, :cond_21

    .line 337
    iget-object v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    invoke-virtual {p1, v4, v2, v1}, Lorg/apache/http/util/CharArrayBuffer;->append([BII)V

    .line 342
    :goto_20
    return v1

    .line 339
    :cond_21
    iget-object v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    invoke-static {v4, v2, v1}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 340
    .local v0, "bbuf":Ljava/nio/ByteBuffer;
    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->appendDecoded(Lorg/apache/http/util/CharArrayBuffer;Ljava/nio/ByteBuffer;)I

    move-result v1

    goto :goto_20
.end method

.method private locateLF()I
    .registers 4

    .prologue
    .line 223
    iget v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    .local v0, "i":I
    :goto_2
    iget v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    if-ge v0, v1, :cond_12

    .line 224
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    aget-byte v1, v1, v0

    const/16 v2, 0xa

    if-ne v1, v2, :cond_f

    .line 228
    .end local v0    # "i":I
    :goto_e
    return v0

    .line 223
    .restart local v0    # "i":I
    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 228
    :cond_12
    const/4 v0, -0x1

    goto :goto_e
.end method

.method private streamRead([BII)I
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->instream:Ljava/io/InputStream;

    const-string v1, "Input stream"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->instream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method


# virtual methods
.method public available()I
    .registers 3

    .prologue
    .line 131
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->capacity()I

    move-result v0

    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->length()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bind(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "instream"    # Ljava/io/InputStream;

    .prologue
    .line 115
    iput-object p1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->instream:Ljava/io/InputStream;

    .line 116
    return-void
.end method

.method public capacity()I
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    array-length v0, v0

    return v0
.end method

.method public clear()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 167
    iput v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    .line 168
    iput v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    .line 169
    return-void
.end method

.method public fillBuffer()I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v3, -0x1

    .line 141
    iget v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    if-lez v4, :cond_1b

    .line 142
    iget v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    iget v5, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    sub-int v1, v4, v5

    .line 143
    .local v1, "len":I
    if-lez v1, :cond_17

    .line 144
    iget-object v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    iget v5, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    iget-object v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    invoke-static {v4, v5, v6, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 146
    :cond_17
    iput v7, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    .line 147
    iput v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    .line 150
    .end local v1    # "len":I
    :cond_1b
    iget v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    .line 151
    .local v2, "off":I
    iget-object v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    array-length v4, v4

    sub-int v1, v4, v2

    .line 152
    .restart local v1    # "len":I
    iget-object v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    invoke-direct {p0, v4, v2, v1}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->streamRead([BII)I

    move-result v0

    .line 153
    .local v0, "l":I
    if-ne v0, v3, :cond_2c

    move v0, v3

    .line 158
    .end local v0    # "l":I
    :goto_2b
    return v0

    .line 156
    .restart local v0    # "l":I
    :cond_2c
    add-int v3, v2, v0

    iput v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    .line 157
    iget-object v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    int-to-long v4, v0

    invoke-virtual {v3, v4, v5}, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;->incrementBytesTransferred(J)V

    goto :goto_2b
.end method

.method public getMetrics()Lorg/apache/http/io/HttpTransportMetrics;
    .registers 2

    .prologue
    .line 396
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    return-object v0
.end method

.method public hasBufferedData()Z
    .registers 3

    .prologue
    .line 163
    iget v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    iget v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    if-ge v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isBound()Z
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->instream:Ljava/io/InputStream;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isDataAvailable(I)Z
    .registers 3
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 392
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v0

    return v0
.end method

.method public length()I
    .registers 3

    .prologue
    .line 127
    iget v0, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    iget v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 173
    :cond_1
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v2

    if-nez v2, :cond_e

    .line 174
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->fillBuffer()I

    move-result v0

    .line 175
    .local v0, "noRead":I
    if-ne v0, v1, :cond_1

    .line 179
    .end local v0    # "noRead":I
    :goto_d
    return v1

    :cond_e
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    iget v2, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    goto :goto_d
.end method

.method public read([B)I
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 216
    if-nez p1, :cond_4

    .line 219
    :goto_3
    return v0

    :cond_4
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->read([BII)I

    move-result v0

    goto :goto_3
.end method

.method public read([BII)I
    .registers 10
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 183
    if-nez p1, :cond_5

    .line 184
    const/4 v0, 0x0

    .line 211
    :goto_4
    return v0

    .line 186
    :cond_5
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v3

    if-eqz v3, :cond_21

    .line 187
    iget v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    iget v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    sub-int/2addr v3, v4

    invoke-static {p3, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 188
    .local v0, "chunk":I
    iget-object v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    iget v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    invoke-static {v3, v4, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 189
    iget v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    add-int/2addr v3, v0

    iput v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    goto :goto_4

    .line 194
    .end local v0    # "chunk":I
    :cond_21
    iget v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->minChunkLimit:I

    if-le p3, v3, :cond_33

    .line 195
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->streamRead([BII)I

    move-result v2

    .line 196
    .local v2, "read":I
    if-lez v2, :cond_31

    .line 197
    iget-object v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    int-to-long v4, v2

    invoke-virtual {v3, v4, v5}, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;->incrementBytesTransferred(J)V

    :cond_31
    move v0, v2

    .line 199
    goto :goto_4

    .line 202
    .end local v2    # "read":I
    :cond_33
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v3

    if-nez v3, :cond_40

    .line 203
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->fillBuffer()I

    move-result v1

    .line 204
    .local v1, "noRead":I
    if-ne v1, v0, :cond_33

    goto :goto_4

    .line 208
    .end local v1    # "noRead":I
    :cond_40
    iget v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    iget v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    sub-int/2addr v3, v4

    invoke-static {p3, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 209
    .restart local v0    # "chunk":I
    iget-object v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    iget v4, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    invoke-static {v3, v4, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 210
    iget v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    add-int/2addr v3, v0

    iput v3, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    goto :goto_4
.end method

.method public readLine(Lorg/apache/http/util/CharArrayBuffer;)I
    .registers 11
    .param p1, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 247
    const-string v6, "Char array buffer"

    invoke-static {p1, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 248
    const/4 v3, 0x0

    .line 249
    .local v3, "noRead":I
    const/4 v4, 0x1

    .line 250
    .local v4, "retry":Z
    :cond_8
    if-eqz v4, :cond_6a

    .line 252
    invoke-direct {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->locateLF()I

    move-result v0

    .line 253
    .local v0, "i":I
    if-eq v0, v5, :cond_49

    .line 255
    iget-object v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/http/util/ByteArrayBuffer;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1d

    .line 257
    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->lineFromReadBuffer(Lorg/apache/http/util/CharArrayBuffer;I)I

    move-result v5

    .line 284
    .end local v0    # "i":I
    :cond_1c
    :goto_1c
    return v5

    .line 259
    .restart local v0    # "i":I
    :cond_1d
    const/4 v4, 0x0

    .line 260
    add-int/lit8 v6, v0, 0x1

    iget v7, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    sub-int v1, v6, v7

    .line 261
    .local v1, "len":I
    iget-object v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    iget-object v7, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    iget v8, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    invoke-virtual {v6, v7, v8, v1}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 262
    add-int/lit8 v6, v0, 0x1

    iput v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    .line 275
    .end local v1    # "len":I
    :cond_31
    :goto_31
    iget-object v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->constraints:Lorg/apache/http/config/MessageConstraints;

    invoke-virtual {v6}, Lorg/apache/http/config/MessageConstraints;->getMaxLineLength()I

    move-result v2

    .line 276
    .local v2, "maxLineLen":I
    if-lez v2, :cond_8

    iget-object v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v6

    if-lt v6, v2, :cond_8

    .line 277
    new-instance v5, Lorg/apache/http/MessageConstraintException;

    const-string v6, "Maximum line length limit exceeded"

    invoke-direct {v5, v6}, Lorg/apache/http/MessageConstraintException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 265
    .end local v2    # "maxLineLen":I
    :cond_49
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v6

    if-eqz v6, :cond_62

    .line 266
    iget v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    iget v7, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    sub-int v1, v6, v7

    .line 267
    .restart local v1    # "len":I
    iget-object v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    iget-object v7, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->buffer:[B

    iget v8, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    invoke-virtual {v6, v7, v8, v1}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 268
    iget v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferlen:I

    iput v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->bufferpos:I

    .line 270
    .end local v1    # "len":I
    :cond_62
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->fillBuffer()I

    move-result v3

    .line 271
    if-ne v3, v5, :cond_31

    .line 272
    const/4 v4, 0x0

    goto :goto_31

    .line 280
    .end local v0    # "i":I
    :cond_6a
    if-ne v3, v5, :cond_74

    iget-object v6, p0, Lorg/apache/http/impl/io/SessionInputBufferImpl;->linebuffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v6}, Lorg/apache/http/util/ByteArrayBuffer;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1c

    .line 284
    :cond_74
    invoke-direct {p0, p1}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->lineFromLineBuffer(Lorg/apache/http/util/CharArrayBuffer;)I

    move-result v5

    goto :goto_1c
.end method

.method public readLine()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 382
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v2, 0x40

    invoke-direct {v0, v2}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 383
    .local v0, "charbuffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/io/SessionInputBufferImpl;->readLine(Lorg/apache/http/util/CharArrayBuffer;)I

    move-result v1

    .line 384
    .local v1, "l":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_13

    .line 385
    invoke-virtual {v0}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 387
    :goto_12
    return-object v2

    :cond_13
    const/4 v2, 0x0

    goto :goto_12
.end method
