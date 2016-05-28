.class public Lorg/apache/http/client/entity/GzipCompressingEntity;
.super Lorg/apache/http/entity/HttpEntityWrapper;
.source "GzipCompressingEntity.java"


# static fields
.field private static final GZIP_CODEC:Ljava/lang/String; = "gzip"


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;)V
    .registers 2
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 80
    return-void
.end method


# virtual methods
.method public getContent()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getContentEncoding()Lorg/apache/http/Header;
    .registers 4

    .prologue
    .line 84
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    const-string v1, "Content-Encoding"

    const-string v2, "gzip"

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 89
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public isChunked()Z
    .registers 2

    .prologue
    .line 95
    const/4 v0, 0x1

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    const-string v1, "Output stream"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 106
    new-instance v0, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v0, p1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 108
    .local v0, "gzip":Ljava/util/zip/GZIPOutputStream;
    :try_start_a
    iget-object v1, p0, Lorg/apache/http/client/entity/GzipCompressingEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v1, v0}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_13

    .line 110
    invoke-virtual {v0}, Ljava/util/zip/GZIPOutputStream;->close()V

    .line 112
    return-void

    .line 110
    :catchall_13
    move-exception v1

    invoke-virtual {v0}, Ljava/util/zip/GZIPOutputStream;->close()V

    throw v1
.end method
