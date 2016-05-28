.class public Lorg/apache/http/entity/BufferedHttpEntity;
.super Lorg/apache/http/entity/HttpEntityWrapper;
.source "BufferedHttpEntity.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final buffer:[B


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;)V
    .registers 6
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 62
    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->isRepeatable()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_1a

    .line 63
    :cond_13
    invoke-static {p1}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    .line 67
    :goto_19
    return-void

    .line 65
    :cond_1a
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    goto :goto_19
.end method


# virtual methods
.method public getContent()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    if-eqz v0, :cond_c

    .line 81
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 83
    :goto_b
    return-object v0

    :cond_c
    invoke-super {p0}, Lorg/apache/http/entity/HttpEntityWrapper;->getContent()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_b
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    if-eqz v0, :cond_9

    .line 72
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    array-length v0, v0

    int-to-long v0, v0

    .line 74
    :goto_8
    return-wide v0

    :cond_9
    invoke-super {p0}, Lorg/apache/http/entity/HttpEntityWrapper;->getContentLength()J

    move-result-wide v0

    goto :goto_8
.end method

.method public isChunked()Z
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    if-nez v0, :cond_c

    invoke-super {p0}, Lorg/apache/http/entity/HttpEntityWrapper;->isChunked()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 104
    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    if-nez v0, :cond_c

    invoke-super {p0}, Lorg/apache/http/entity/HttpEntityWrapper;->isStreaming()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    const-string v0, "Output stream"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 111
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    if-eqz v0, :cond_f

    .line 112
    iget-object v0, p0, Lorg/apache/http/entity/BufferedHttpEntity;->buffer:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 116
    :goto_e
    return-void

    .line 114
    :cond_f
    invoke-super {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;->writeTo(Ljava/io/OutputStream;)V

    goto :goto_e
.end method
