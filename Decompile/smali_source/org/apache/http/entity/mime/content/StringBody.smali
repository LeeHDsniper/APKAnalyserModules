.class public Lorg/apache/http/entity/mime/content/StringBody;
.super Lorg/apache/http/entity/mime/content/AbstractContentBody;
.source "StringBody.java"


# instance fields
.field private final content:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 148
    const-string v0, "text/plain"

    sget-object v1, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    .line 149
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .registers 5
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 114
    invoke-static {p2, p3}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/ContentType;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;Lorg/apache/http/entity/ContentType;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 131
    const-string v0, "text/plain"

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    .line 132
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/http/entity/ContentType;)V
    .registers 7
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "contentType"    # Lorg/apache/http/entity/ContentType;

    .prologue
    .line 155
    invoke-direct {p0, p2}, Lorg/apache/http/entity/mime/content/AbstractContentBody;-><init>(Lorg/apache/http/entity/ContentType;)V

    .line 156
    invoke-virtual {p2}, Lorg/apache/http/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    .line 157
    .local v0, "charset":Ljava/nio/charset/Charset;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    .line 159
    .local v1, "csname":Ljava/lang/String;
    :goto_d
    :try_start_d
    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    iput-object v3, p0, Lorg/apache/http/entity/mime/content/StringBody;->content:[B
    :try_end_13
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_d .. :try_end_13} :catch_1b

    .line 164
    return-void

    .line 157
    .end local v1    # "csname":Ljava/lang/String;
    :cond_14
    sget-object v3, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v3}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 160
    .restart local v1    # "csname":Ljava/lang/String;
    :catch_1b
    move-exception v2

    .line 162
    .local v2, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Ljava/nio/charset/UnsupportedCharsetException;

    invoke-direct {v3, v1}, Ljava/nio/charset/UnsupportedCharsetException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static create(Ljava/lang/String;)Lorg/apache/http/entity/mime/content/StringBody;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 94
    invoke-static {p0, v0, v0}, Lorg/apache/http/entity/mime/content/StringBody;->create(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/mime/content/StringBody;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/mime/content/StringBody;
    .registers 7
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 68
    :try_start_0
    new-instance v1, Lorg/apache/http/entity/mime/content/StringBody;

    invoke-direct {v1, p0, p1, p2}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_5} :catch_6

    return-object v1

    .line 69
    :catch_6
    move-exception v0

    .line 70
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Charset "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not supported"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static create(Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/mime/content/StringBody;
    .registers 3
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/http/entity/mime/content/StringBody;->create(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)Lorg/apache/http/entity/mime/content/StringBody;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getContentLength()J
    .registers 3

    .prologue
    .line 189
    iget-object v0, p0, Lorg/apache/http/entity/mime/content/StringBody;->content:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getFilename()Ljava/lang/String;
    .registers 2

    .prologue
    .line 193
    const/4 v0, 0x0

    return-object v0
.end method

.method public getReader()Ljava/io/Reader;
    .registers 5

    .prologue
    .line 167
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/content/StringBody;->getContentType()Lorg/apache/http/entity/ContentType;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/http/entity/ContentType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    .line 168
    .local v0, "charset":Ljava/nio/charset/Charset;
    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/ByteArrayInputStream;

    iget-object v3, p0, Lorg/apache/http/entity/mime/content/StringBody;->content:[B

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    if-eqz v0, :cond_17

    .end local v0    # "charset":Ljava/nio/charset/Charset;
    :goto_13
    invoke-direct {v1, v2, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    return-object v1

    .restart local v0    # "charset":Ljava/nio/charset/Charset;
    :cond_17
    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    goto :goto_13
.end method

.method public getTransferEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 185
    const-string v0, "8bit"

    return-object v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    const-string v3, "Output stream"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 175
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v3, p0, Lorg/apache/http/entity/mime/content/StringBody;->content:[B

    invoke-direct {v0, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 176
    .local v0, "in":Ljava/io/InputStream;
    const/16 v3, 0x1000

    new-array v2, v3, [B

    .line 178
    .local v2, "tmp":[B
    :goto_10
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "l":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_1c

    .line 179
    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_10

    .line 181
    :cond_1c
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 182
    return-void
.end method
