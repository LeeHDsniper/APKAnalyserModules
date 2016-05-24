.class public Lorg/apache/http/entity/StringEntity;
.super Lorg/apache/http/entity/AbstractHttpEntity;
.source "StringEntity.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field protected final content:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 151
    sget-object v0, Lorg/apache/http/entity/ContentType;->DEFAULT_TEXT:Lorg/apache/http/entity/ContentType;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Lorg/apache/http/entity/ContentType;)V

    .line 152
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 121
    sget-object v0, Lorg/apache/http/entity/ContentType;->TEXT_PLAIN:Lorg/apache/http/entity/ContentType;

    invoke-virtual {v0}, Lorg/apache/http/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Lorg/apache/http/entity/ContentType;)V

    .line 122
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 99
    invoke-direct {p0}, Lorg/apache/http/entity/AbstractHttpEntity;-><init>()V

    .line 100
    const-string v2, "Source string"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 101
    if-eqz p2, :cond_2f

    move-object v1, p2

    .line 102
    .local v1, "mt":Ljava/lang/String;
    :goto_b
    if-eqz p3, :cond_32

    move-object v0, p3

    .line 103
    .local v0, "cs":Ljava/lang/String;
    :goto_e
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/entity/StringEntity;->content:[B

    .line 104
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; charset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/http/entity/StringEntity;->setContentType(Ljava/lang/String;)V

    .line 105
    return-void

    .line 101
    .end local v0    # "cs":Ljava/lang/String;
    .end local v1    # "mt":Ljava/lang/String;
    :cond_2f
    const-string v1, "text/plain"

    goto :goto_b

    .line 102
    .restart local v1    # "mt":Ljava/lang/String;
    :cond_32
    const-string v0, "ISO-8859-1"

    goto :goto_e
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .registers 4
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 137
    sget-object v0, Lorg/apache/http/entity/ContentType;->TEXT_PLAIN:Lorg/apache/http/entity/ContentType;

    invoke-virtual {v0}, Lorg/apache/http/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Lorg/apache/http/entity/ContentType;)V

    .line 138
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/http/entity/ContentType;)V
    .registers 7
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "contentType"    # Lorg/apache/http/entity/ContentType;

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/apache/http/entity/AbstractHttpEntity;-><init>()V

    .line 66
    const-string v2, "Source string"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 67
    if-eqz p2, :cond_26

    invoke-virtual {p2}, Lorg/apache/http/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    .line 68
    .local v0, "charset":Ljava/nio/charset/Charset;
    :goto_e
    if-nez v0, :cond_12

    .line 69
    sget-object v0, Lorg/apache/http/protocol/HTTP;->DEF_CONTENT_CHARSET:Ljava/nio/charset/Charset;

    .line 72
    :cond_12
    :try_start_12
    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/entity/StringEntity;->content:[B
    :try_end_1c
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_12 .. :try_end_1c} :catch_28

    .line 77
    if-eqz p2, :cond_25

    .line 78
    invoke-virtual {p2}, Lorg/apache/http/entity/ContentType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/http/entity/StringEntity;->setContentType(Ljava/lang/String;)V

    .line 80
    :cond_25
    return-void

    .line 67
    .end local v0    # "charset":Ljava/nio/charset/Charset;
    :cond_26
    const/4 v0, 0x0

    goto :goto_e

    .line 73
    .restart local v0    # "charset":Ljava/nio/charset/Charset;
    :catch_28
    move-exception v1

    .line 75
    .local v1, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/nio/charset/UnsupportedCharsetException;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/nio/charset/UnsupportedCharsetException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 183
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getContent()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/apache/http/entity/StringEntity;->content:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 159
    iget-object v0, p0, Lorg/apache/http/entity/StringEntity;->content:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 155
    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .registers 2

    .prologue
    .line 178
    const/4 v0, 0x0

    return v0
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
    .line 167
    const-string v0, "Output stream"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 168
    iget-object v0, p0, Lorg/apache/http/entity/StringEntity;->content:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 169
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 170
    return-void
.end method
