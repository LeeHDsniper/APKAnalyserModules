.class public Lorg/apache/http/client/entity/DeflateDecompressingEntity;
.super Lorg/apache/http/client/entity/DecompressingEntity;
.source "DeflateDecompressingEntity.java"


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;)V
    .registers 2
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lorg/apache/http/client/entity/DecompressingEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 62
    return-void
.end method


# virtual methods
.method decorate(Ljava/io/InputStream;)Ljava/io/InputStream;
    .registers 3
    .param p1, "wrapped"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    new-instance v0, Lorg/apache/http/client/entity/DeflateInputStream;

    invoke-direct {v0, p1}, Lorg/apache/http/client/entity/DeflateInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method public bridge synthetic getContent()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-super {p0}, Lorg/apache/http/client/entity/DecompressingEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getContentEncoding()Lorg/apache/http/Header;
    .registers 2

    .prologue
    .line 83
    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 93
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public bridge synthetic writeTo(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "x0"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-super {p0, p1}, Lorg/apache/http/client/entity/DecompressingEntity;->writeTo(Ljava/io/OutputStream;)V

    return-void
.end method
