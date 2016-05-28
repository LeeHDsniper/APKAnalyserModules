.class public Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;
.super Ljava/io/InputStream;
.source "ContentLengthInputStream.java"


# instance fields
.field private final length:I

.field private final stream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 3
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "length"    # I

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->stream:Ljava/io/InputStream;

    .line 35
    iput p2, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->length:I

    .line 36
    return-void
.end method


# virtual methods
.method public available()I
    .registers 2

    .prologue
    .line 40
    iget v0, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->length:I

    return v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->stream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 46
    return-void
.end method

.method public mark(I)V
    .registers 3
    .param p1, "readLimit"    # I

    .prologue
    .line 50
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->stream:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 51
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->stream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    return v0
.end method

.method public read()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->stream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([B)I
    .registers 3
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->stream:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 5
    .param p1, "buffer"    # [B
    .param p2, "byteOffset"    # I
    .param p3, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->stream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public reset()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->stream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V

    .line 71
    return-void
.end method

.method public skip(J)J
    .registers 6
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;->stream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
