.class Lit/sephiroth/android/library/exif2/CountedDataInputStream;
.super Ljava/io/FilterInputStream;
.source "CountedDataInputStream.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mByteArray:[B

.field private final mByteBuffer:Ljava/nio/ByteBuffer;

.field private mCount:I

.field private mEnd:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    const-class v0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    const/4 v1, 0x0

    .line 36
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 30
    const/16 v0, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteArray:[B

    .line 31
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteArray:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 32
    iput v1, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    .line 33
    iput v1, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mEnd:I

    .line 37
    return-void
.end method


# virtual methods
.method public getByteOrder()Ljava/nio/ByteOrder;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    return-object v0
.end method

.method public getEnd()I
    .registers 2

    .prologue
    .line 44
    iget v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mEnd:I

    return v0
.end method

.method public getReadByteCount()I
    .registers 2

    .prologue
    .line 48
    iget v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    return v0
.end method

.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 61
    .local v0, "r":I
    iget v2, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    if-ltz v0, :cond_f

    const/4 v1, 0x1

    :goto_b
    add-int/2addr v1, v2

    iput v1, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    .line 62
    return v0

    .line 61
    :cond_f
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public read([B)I
    .registers 5
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 54
    .local v0, "r":I
    iget v2, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    if-ltz v0, :cond_f

    move v1, v0

    :goto_b
    add-int/2addr v1, v2

    iput v1, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    .line 55
    return v0

    .line 54
    :cond_f
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public read([BII)I
    .registers 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 68
    .local v0, "r":I
    iget v2, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    if-ltz v0, :cond_f

    move v1, v0

    :goto_b
    add-int/2addr v1, v2

    iput v1, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    .line 69
    return v0

    .line 68
    :cond_f
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public readByte()B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteArray:[B

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readOrThrow([BII)V

    .line 110
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 111
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    return v0
.end method

.method public readInt()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteArray:[B

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-virtual {p0, v0, v1, v2}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readOrThrow([BII)V

    .line 131
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 132
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    return v0
.end method

.method public readOrThrow([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readOrThrow([BII)V

    .line 149
    return-void
.end method

.method public readOrThrow([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    invoke-virtual {p0, p1, p2, p3}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->read([BII)I

    move-result v0

    .line 122
    .local v0, "r":I
    if-eq v0, p3, :cond_c

    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 123
    :cond_c
    return-void
.end method

.method public readShort()S
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteArray:[B

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, v0, v1, v2}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readOrThrow([BII)V

    .line 104
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 105
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    return v0
.end method

.method public readString(ILjava/nio/charset/Charset;)Ljava/lang/String;
    .registers 5
    .param p1, "n"    # I
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    new-array v0, p1, [B

    .line 153
    .local v0, "buf":[B
    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readOrThrow([B)V

    .line 154
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, p2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v1
.end method

.method public readUnsignedByte()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteArray:[B

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readOrThrow([BII)V

    .line 116
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 117
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public readUnsignedInt()J
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readInt()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method public readUnsignedShort()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readShort()S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method

.method public setByteOrder(Ljava/nio/ByteOrder;)V
    .registers 3
    .param p1, "order"    # Ljava/nio/ByteOrder;

    .prologue
    .line 95
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 96
    return-void
.end method

.method public setEnd(I)V
    .registers 2
    .param p1, "end"    # I

    .prologue
    .line 40
    iput p1, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mEnd:I

    .line 41
    return-void
.end method

.method public skip(J)J
    .registers 8
    .param p1, "length"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 75
    .local v0, "skip":J
    iget v2, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    int-to-long v2, v2

    add-long/2addr v2, v0

    long-to-int v2, v2

    iput v2, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    .line 76
    return-wide v0
.end method

.method public skipOrThrow(J)V
    .registers 6
    .param p1, "length"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-virtual {p0, p1, p2}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->skip(J)J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-eqz v0, :cond_e

    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 88
    :cond_e
    return-void
.end method

.method public skipTo(J)V
    .registers 10
    .param p1, "target"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    iget v4, p0, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->mCount:I

    int-to-long v0, v4

    .line 81
    .local v0, "cur":J
    sub-long v2, p1, v0

    .line 82
    .local v2, "diff":J
    sget-boolean v4, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->$assertionsDisabled:Z

    if-nez v4, :cond_15

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_15

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 83
    :cond_15
    invoke-virtual {p0, v2, v3}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->skipOrThrow(J)V

    .line 84
    return-void
.end method
