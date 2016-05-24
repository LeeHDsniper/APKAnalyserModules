.class abstract Lorg/apache/http/client/entity/DecompressingEntity;
.super Lorg/apache/http/entity/HttpEntityWrapper;
.source "DecompressingEntity.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x800


# instance fields
.field private content:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;)V
    .registers 2
    .param p1, "wrapped"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 63
    return-void
.end method

.method private getDecompressingStream()Ljava/io/InputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v2, p0, Lorg/apache/http/client/entity/DecompressingEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v2}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v1

    .line 70
    .local v1, "in":Ljava/io/InputStream;
    :try_start_6
    invoke-virtual {p0, v1}, Lorg/apache/http/client/entity/DecompressingEntity;->decorate(Ljava/io/InputStream;)Ljava/io/InputStream;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_9} :catch_b

    move-result-object v2

    return-object v2

    .line 71
    :catch_b
    move-exception v0

    .line 72
    .local v0, "ex":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 73
    throw v0
.end method


# virtual methods
.method abstract decorate(Ljava/io/InputStream;)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getContent()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lorg/apache/http/client/entity/DecompressingEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 83
    iget-object v0, p0, Lorg/apache/http/client/entity/DecompressingEntity;->content:Ljava/io/InputStream;

    if-nez v0, :cond_12

    .line 84
    invoke-direct {p0}, Lorg/apache/http/client/entity/DecompressingEntity;->getDecompressingStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/entity/DecompressingEntity;->content:Ljava/io/InputStream;

    .line 86
    :cond_12
    iget-object v0, p0, Lorg/apache/http/client/entity/DecompressingEntity;->content:Ljava/io/InputStream;

    .line 88
    :goto_14
    return-object v0

    :cond_15
    invoke-direct {p0}, Lorg/apache/http/client/entity/DecompressingEntity;->getDecompressingStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_14
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 6
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    const-string v3, "Output stream"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 98
    invoke-virtual {p0}, Lorg/apache/http/client/entity/DecompressingEntity;->getContent()Ljava/io/InputStream;

    move-result-object v1

    .line 100
    .local v1, "instream":Ljava/io/InputStream;
    const/16 v3, 0x800

    :try_start_b
    new-array v0, v3, [B

    .line 102
    .local v0, "buffer":[B
    :goto_d
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "l":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_1e

    .line 103
    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_18
    .catchall {:try_start_b .. :try_end_18} :catchall_19

    goto :goto_d

    .line 106
    .end local v0    # "buffer":[B
    .end local v2    # "l":I
    :catchall_19
    move-exception v3

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v3

    .restart local v0    # "buffer":[B
    .restart local v2    # "l":I
    :cond_1e
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 108
    return-void
.end method
