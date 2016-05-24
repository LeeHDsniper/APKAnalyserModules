.class Lorg/apache/http/client/entity/DeflateInputStream$DeflateStream;
.super Ljava/util/zip/InflaterInputStream;
.source "DeflateInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/client/entity/DeflateInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DeflateStream"
.end annotation


# instance fields
.field private closed:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "inflater"    # Ljava/util/zip/Inflater;

    .prologue
    .line 213
    invoke-direct {p0, p1, p2}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    .line 210
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/client/entity/DeflateInputStream$DeflateStream;->closed:Z

    .line 214
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    iget-boolean v0, p0, Lorg/apache/http/client/entity/DeflateInputStream$DeflateStream;->closed:Z

    if-eqz v0, :cond_5

    .line 224
    :goto_4
    return-void

    .line 221
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/client/entity/DeflateInputStream$DeflateStream;->closed:Z

    .line 222
    iget-object v0, p0, Lorg/apache/http/client/entity/DeflateInputStream$DeflateStream;->inf:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 223
    invoke-super {p0}, Ljava/util/zip/InflaterInputStream;->close()V

    goto :goto_4
.end method
