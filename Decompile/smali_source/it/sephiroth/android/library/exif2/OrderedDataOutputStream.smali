.class Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;
.super Ljava/io/FilterOutputStream;
.source "OrderedDataOutputStream.java"


# instance fields
.field private final mByteBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 26
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 30
    return-void
.end method


# virtual methods
.method public setByteOrder(Ljava/nio/ByteOrder;)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;
    .registers 3
    .param p1, "order"    # Ljava/nio/ByteOrder;

    .prologue
    .line 33
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 34
    return-object p0
.end method

.method public writeInt(I)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;
    .registers 4
    .param p1, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 52
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 53
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->out:Ljava/io/OutputStream;

    iget-object v1, p0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 54
    return-object p0
.end method

.method public writeRational(Lit/sephiroth/android/library/exif2/Rational;)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;
    .registers 4
    .param p1, "rational"    # Lit/sephiroth/android/library/exif2/Rational;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/Rational;->getNumerator()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeInt(I)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 46
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/Rational;->getDenominator()J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->writeInt(I)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;

    .line 47
    return-object p0
.end method

.method public writeShort(S)Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;
    .registers 6
    .param p1, "value"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 39
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 40
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->out:Ljava/io/OutputStream;

    iget-object v1, p0, Lit/sephiroth/android/library/exif2/OrderedDataOutputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 41
    return-object p0
.end method
