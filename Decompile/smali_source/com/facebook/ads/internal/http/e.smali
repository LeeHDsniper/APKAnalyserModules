.class Lcom/facebook/ads/internal/http/e;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/apache/http/HttpEntity;


# static fields
.field private static final d:[C


# instance fields
.field a:Ljava/io/ByteArrayOutputStream;

.field b:Z

.field c:Z

.field private e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/http/e;->d:[C

    return-void
.end method

.method public constructor <init>()V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/ads/internal/http/e;->e:Ljava/lang/String;

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v1, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    iput-boolean v0, p0, Lcom/facebook/ads/internal/http/e;->b:Z

    iput-boolean v0, p0, Lcom/facebook/ads/internal/http/e;->c:Z

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    :goto_1c
    const/16 v3, 0x1e

    if-ge v0, v3, :cond_31

    sget-object v3, Lcom/facebook/ads/internal/http/e;->d:[C

    sget-object v4, Lcom/facebook/ads/internal/http/e;->d:[C

    array-length v4, v4

    invoke-virtual {v2, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    aget-char v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    :cond_31
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/ads/internal/http/e;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 4

    iget-boolean v0, p0, Lcom/facebook/ads/internal/http/e;->c:Z

    if-nez v0, :cond_28

    :try_start_4
    iget-object v0, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "--"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/ads/internal/http/e;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_28} :catch_2c

    :cond_28
    :goto_28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/ads/internal/http/e;->c:Z

    return-void

    :catch_2c
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_28
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-virtual {p0}, Lcom/facebook/ads/internal/http/e;->a()V

    :try_start_3
    iget-object v0, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Content-Disposition: form-data; name=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\"\r\n\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    iget-object v0, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    iget-object v0, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\r\n--"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/ads/internal/http/e;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_52} :catch_53

    :goto_52
    return-void

    :catch_53
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_52
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Z)V
    .registers 10

    invoke-virtual {p0}, Lcom/facebook/ads/internal/http/e;->a()V

    :try_start_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Content-Type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Content-Disposition: form-data; name=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\"; filename=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\"\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    iget-object v1, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->write([B)V

    iget-object v0, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    const-string v1, "Content-Transfer-Encoding: binary\r\n\r\n"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    const/16 v0, 0x1000

    new-array v0, v0, [B

    :goto_60
    invoke-virtual {p3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_76

    iget-object v2, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_6d
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_6d} :catch_6e
    .catchall {:try_start_3 .. :try_end_6d} :catchall_af

    goto :goto_60

    :catch_6e
    move-exception v0

    :try_start_6f
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_72
    .catchall {:try_start_6f .. :try_end_72} :catchall_af

    :try_start_72
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_75} :catch_aa

    :goto_75
    return-void

    :cond_76
    if-nez p5, :cond_9c

    :try_start_78
    iget-object v0, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\r\n--"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/ads/internal/http/e;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    :cond_9c
    iget-object v0, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->flush()V
    :try_end_a1
    .catch Ljava/io/IOException; {:try_start_78 .. :try_end_a1} :catch_6e
    .catchall {:try_start_78 .. :try_end_a1} :catchall_af

    :try_start_a1
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_a4
    .catch Ljava/io/IOException; {:try_start_a1 .. :try_end_a4} :catch_a5

    goto :goto_75

    :catch_a5
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_75

    :catch_aa
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_75

    :catchall_af
    move-exception v0

    :try_start_b0
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_b0 .. :try_end_b3} :catch_b4

    :goto_b3
    throw v0

    :catch_b4
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_b3
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;Z)V
    .registers 11

    const-string v4, "application/octet-stream"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/facebook/ads/internal/http/e;->a(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Z)V

    return-void
.end method

.method public b()V
    .registers 4

    iget-boolean v0, p0, Lcom/facebook/ads/internal/http/e;->b:Z

    if-eqz v0, :cond_5

    :goto_4
    return-void

    :cond_5
    :try_start_5
    iget-object v0, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\r\n--"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/facebook/ads/internal/http/e;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "--\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_29} :catch_2d

    :goto_29
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/ads/internal/http/e;->b:Z

    goto :goto_4

    :catch_2d
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_29
.end method

.method public consumeContent()V
    .registers 3

    invoke-virtual {p0}, Lcom/facebook/ads/internal/http/e;->isStreaming()Z

    move-result v0

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Streaming entity does not implement #consumeContent()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    return-void
.end method

.method public getContent()Ljava/io/InputStream;
    .registers 3

    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getContentEncoding()Lorg/apache/http/Header;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    invoke-virtual {p0}, Lcom/facebook/ads/internal/http/e;->b()V

    iget-object v0, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getContentType()Lorg/apache/http/Header;
    .registers 5

    new-instance v0, Lorg/apache/http/message/BasicHeader;

    const-string v1, "Content-Type"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "multipart/form-data; boundary="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/ads/internal/http/e;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public isChunked()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public isRepeatable()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public isStreaming()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/internal/http/e;->a:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method
