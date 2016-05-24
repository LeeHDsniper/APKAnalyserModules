.class public Lorg/apache/http/impl/io/SessionOutputBufferImpl;
.super Ljava/lang/Object;
.source "SessionOutputBufferImpl.java"

# interfaces
.implements Lorg/apache/http/io/BufferInfo;
.implements Lorg/apache/http/io/SessionOutputBuffer;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final CRLF:[B


# instance fields
.field private bbuf:Ljava/nio/ByteBuffer;

.field private final buffer:Lorg/apache/http/util/ByteArrayBuffer;

.field private final encoder:Ljava/nio/charset/CharsetEncoder;

.field private final fragementSizeHint:I

.field private final metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

.field private outstream:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->CRLF:[B

    return-void

    nop

    :array_a
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method

.method public constructor <init>(Lorg/apache/http/impl/io/HttpTransportMetricsImpl;I)V
    .registers 4
    .param p1, "metrics"    # Lorg/apache/http/impl/io/HttpTransportMetricsImpl;
    .param p2, "buffersize"    # I

    .prologue
    .line 98
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p2, v0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;-><init>(Lorg/apache/http/impl/io/HttpTransportMetricsImpl;IILjava/nio/charset/CharsetEncoder;)V

    .line 99
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/io/HttpTransportMetricsImpl;IILjava/nio/charset/CharsetEncoder;)V
    .registers 6
    .param p1, "metrics"    # Lorg/apache/http/impl/io/HttpTransportMetricsImpl;
    .param p2, "buffersize"    # I
    .param p3, "fragementSizeHint"    # I
    .param p4, "charencoder"    # Ljava/nio/charset/CharsetEncoder;

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    const-string v0, "Buffer size"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->positive(ILjava/lang/String;)I

    .line 88
    const-string v0, "HTTP transport metrcis"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 89
    iput-object p1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    .line 90
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    invoke-direct {v0, p2}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    .line 91
    if-ltz p3, :cond_1d

    .end local p3    # "fragementSizeHint":I
    :goto_18
    iput p3, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->fragementSizeHint:I

    .line 92
    iput-object p4, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->encoder:Ljava/nio/charset/CharsetEncoder;

    .line 93
    return-void

    .line 91
    .restart local p3    # "fragementSizeHint":I
    :cond_1d
    const/4 p3, 0x0

    goto :goto_18
.end method

.method private flushBuffer()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v0

    .line 134
    .local v0, "len":I
    if-lez v0, :cond_1d

    .line 135
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/http/util/ByteArrayBuffer;->buffer()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2, v0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->streamWrite([BII)V

    .line 136
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/http/util/ByteArrayBuffer;->clear()V

    .line 137
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;->incrementBytesTransferred(J)V

    .line 139
    :cond_1d
    return-void
.end method

.method private flushStream()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->outstream:Ljava/io/OutputStream;

    if-eqz v0, :cond_9

    .line 128
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->outstream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 130
    :cond_9
    return-void
.end method

.method private handleEncodingResult(Ljava/nio/charset/CoderResult;)V
    .registers 3
    .param p1, "result"    # Ljava/nio/charset/CoderResult;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 269
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->isError()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 270
    invoke-virtual {p1}, Ljava/nio/charset/CoderResult;->throwException()V

    .line 272
    :cond_9
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 273
    :goto_e
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 274
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->write(I)V

    goto :goto_e

    .line 276
    :cond_20
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    .line 277
    return-void
.end method

.method private streamWrite([BII)V
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
    .line 122
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->outstream:Ljava/io/OutputStream;

    const-string v1, "Output stream"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 123
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->outstream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 124
    return-void
.end method

.method private writeEncoded(Ljava/nio/CharBuffer;)V
    .registers 6
    .param p1, "cbuf"    # Ljava/nio/CharBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 252
    invoke-virtual {p1}, Ljava/nio/CharBuffer;->hasRemaining()Z

    move-result v1

    if-nez v1, :cond_7

    .line 266
    :goto_6
    return-void

    .line 255
    :cond_7
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->bbuf:Ljava/nio/ByteBuffer;

    if-nez v1, :cond_13

    .line 256
    const/16 v1, 0x400

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->bbuf:Ljava/nio/ByteBuffer;

    .line 258
    :cond_13
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->encoder:Ljava/nio/charset/CharsetEncoder;

    invoke-virtual {v1}, Ljava/nio/charset/CharsetEncoder;->reset()Ljava/nio/charset/CharsetEncoder;

    .line 259
    :goto_18
    invoke-virtual {p1}, Ljava/nio/CharBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 260
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->encoder:Ljava/nio/charset/CharsetEncoder;

    iget-object v2, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->bbuf:Ljava/nio/ByteBuffer;

    const/4 v3, 0x1

    invoke-virtual {v1, p1, v2, v3}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;Ljava/nio/ByteBuffer;Z)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 261
    .local v0, "result":Ljava/nio/charset/CoderResult;
    invoke-direct {p0, v0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->handleEncodingResult(Ljava/nio/charset/CoderResult;)V

    goto :goto_18

    .line 263
    .end local v0    # "result":Ljava/nio/charset/CoderResult;
    :cond_2b
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->encoder:Ljava/nio/charset/CharsetEncoder;

    iget-object v2, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetEncoder;->flush(Ljava/nio/ByteBuffer;)Ljava/nio/charset/CoderResult;

    move-result-object v0

    .line 264
    .restart local v0    # "result":Ljava/nio/charset/CoderResult;
    invoke-direct {p0, v0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->handleEncodingResult(Ljava/nio/charset/CoderResult;)V

    .line 265
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->bbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    goto :goto_6
.end method


# virtual methods
.method public available()I
    .registers 3

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->capacity()I

    move-result v0

    invoke-virtual {p0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->length()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bind(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "outstream"    # Ljava/io/OutputStream;

    .prologue
    .line 102
    iput-object p1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->outstream:Ljava/io/OutputStream;

    .line 103
    return-void
.end method

.method public capacity()I
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->capacity()I

    move-result v0

    return v0
.end method

.method public flush()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-direct {p0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->flushBuffer()V

    .line 143
    invoke-direct {p0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->flushStream()V

    .line 144
    return-void
.end method

.method public getMetrics()Lorg/apache/http/io/HttpTransportMetrics;
    .registers 2

    .prologue
    .line 280
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    return-object v0
.end method

.method public isBound()Z
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->outstream:Ljava/io/OutputStream;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public length()I
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v0

    return v0
.end method

.method public write(I)V
    .registers 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 179
    iget v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->fragementSizeHint:I

    if-lez v0, :cond_15

    .line 180
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->isFull()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 181
    invoke-direct {p0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->flushBuffer()V

    .line 183
    :cond_f
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v0, p1}, Lorg/apache/http/util/ByteArrayBuffer;->append(I)V

    .line 188
    :goto_14
    return-void

    .line 185
    :cond_15
    invoke-direct {p0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->flushBuffer()V

    .line 186
    iget-object v0, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->outstream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_14
.end method

.method public write([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    if-nez p1, :cond_3

    .line 176
    :goto_2
    return-void

    .line 175
    :cond_3
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->write([BII)V

    goto :goto_2
.end method

.method public write([BII)V
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    if-nez p1, :cond_3

    .line 169
    :goto_2
    return-void

    .line 153
    :cond_3
    iget v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->fragementSizeHint:I

    if-gt p3, v1, :cond_f

    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/http/util/ByteArrayBuffer;->capacity()I

    move-result v1

    if-le p3, v1, :cond_1c

    .line 155
    :cond_f
    invoke-direct {p0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->flushBuffer()V

    .line 157
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->streamWrite([BII)V

    .line 158
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->metrics:Lorg/apache/http/impl/io/HttpTransportMetricsImpl;

    int-to-long v2, p3

    invoke-virtual {v1, v2, v3}, Lorg/apache/http/impl/io/HttpTransportMetricsImpl;->incrementBytesTransferred(J)V

    goto :goto_2

    .line 161
    :cond_1c
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/http/util/ByteArrayBuffer;->capacity()I

    move-result v1

    iget-object v2, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v2

    sub-int v0, v1, v2

    .line 162
    .local v0, "freecapacity":I
    if-le p3, v0, :cond_2f

    .line 164
    invoke-direct {p0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->flushBuffer()V

    .line 167
    :cond_2f
    iget-object v1, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v1, p1, p2, p3}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    goto :goto_2
.end method

.method public writeLine(Ljava/lang/String;)V
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    if-nez p1, :cond_3

    .line 214
    :goto_2
    return-void

    .line 203
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_25

    .line 204
    iget-object v2, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->encoder:Ljava/nio/charset/CharsetEncoder;

    if-nez v2, :cond_1e

    .line 205
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_25

    .line 206
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->write(I)V

    .line 205
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 209
    .end local v1    # "i":I
    :cond_1e
    invoke-static {p1}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object v0

    .line 210
    .local v0, "cbuf":Ljava/nio/CharBuffer;
    invoke-direct {p0, v0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->writeEncoded(Ljava/nio/CharBuffer;)V

    .line 213
    .end local v0    # "cbuf":Ljava/nio/CharBuffer;
    :cond_25
    sget-object v2, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->CRLF:[B

    invoke-virtual {p0, v2}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->write([B)V

    goto :goto_2
.end method

.method public writeLine(Lorg/apache/http/util/CharArrayBuffer;)V
    .registers 9
    .param p1, "charbuffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    if-nez p1, :cond_3

    .line 249
    :goto_2
    return-void

    .line 229
    :cond_3
    iget-object v4, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->encoder:Ljava/nio/charset/CharsetEncoder;

    if-nez v4, :cond_35

    .line 230
    const/4 v2, 0x0

    .line 231
    .local v2, "off":I
    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v3

    .line 232
    .local v3, "remaining":I
    :goto_c
    if-lez v3, :cond_45

    .line 233
    iget-object v4, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v4}, Lorg/apache/http/util/ByteArrayBuffer;->capacity()I

    move-result v4

    iget-object v5, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v5}, Lorg/apache/http/util/ByteArrayBuffer;->length()I

    move-result v5

    sub-int v1, v4, v5

    .line 234
    .local v1, "chunk":I
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 235
    if-lez v1, :cond_27

    .line 236
    iget-object v4, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v4, p1, v2, v1}, Lorg/apache/http/util/ByteArrayBuffer;->append(Lorg/apache/http/util/CharArrayBuffer;II)V

    .line 238
    :cond_27
    iget-object v4, p0, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->buffer:Lorg/apache/http/util/ByteArrayBuffer;

    invoke-virtual {v4}, Lorg/apache/http/util/ByteArrayBuffer;->isFull()Z

    move-result v4

    if-eqz v4, :cond_32

    .line 239
    invoke-direct {p0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->flushBuffer()V

    .line 241
    :cond_32
    add-int/2addr v2, v1

    .line 242
    sub-int/2addr v3, v1

    .line 243
    goto :goto_c

    .line 245
    .end local v1    # "chunk":I
    .end local v2    # "off":I
    .end local v3    # "remaining":I
    :cond_35
    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->buffer()[C

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v6

    invoke-static {v4, v5, v6}, Ljava/nio/CharBuffer;->wrap([CII)Ljava/nio/CharBuffer;

    move-result-object v0

    .line 246
    .local v0, "cbuf":Ljava/nio/CharBuffer;
    invoke-direct {p0, v0}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->writeEncoded(Ljava/nio/CharBuffer;)V

    .line 248
    .end local v0    # "cbuf":Ljava/nio/CharBuffer;
    :cond_45
    sget-object v4, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->CRLF:[B

    invoke-virtual {p0, v4}, Lorg/apache/http/impl/io/SessionOutputBufferImpl;->write([B)V

    goto :goto_2
.end method
