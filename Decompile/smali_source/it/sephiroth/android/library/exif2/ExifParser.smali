.class Lit/sephiroth/android/library/exif2/ExifParser;
.super Ljava/lang/Object;
.source "ExifParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/exif2/ExifParser$Section;,
        Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;,
        Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;,
        Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;
    }
.end annotation


# static fields
.field private static final TAG_EXIF_IFD:S

.field private static final TAG_GPS_IFD:S

.field private static final TAG_INTEROPERABILITY_IFD:S

.field private static final TAG_JPEG_INTERCHANGE_FORMAT:S

.field private static final TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:S

.field private static final TAG_STRIP_BYTE_COUNTS:S

.field private static final TAG_STRIP_OFFSETS:S

.field private static final US_ASCII:Ljava/nio/charset/Charset;

.field static final deftabs:[[I

.field static final std_chrominance_quant_tbl:[I

.field static final std_luminance_quant_tbl:[I


# instance fields
.field private final mByteArray:[B

.field private final mByteBuffer:Ljava/nio/ByteBuffer;

.field private final mCorrespondingEvent:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mDataAboveIfd0:[B

.field private mIfd0Position:I

.field private mIfdStartOffset:I

.field private mIfdType:I

.field private mImageEvent:Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;

.field private mImageLength:I

.field private mImageWidth:I

.field private final mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

.field private mJpegSizeTag:Lit/sephiroth/android/library/exif2/ExifTag;

.field private mNeedToParseOffsetsInCurrentIfd:Z

.field private mNumOfTagInIfd:I

.field private final mOptions:I

.field private mProcess:S

.field private mQualityGuess:I

.field private mSections:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/exif2/ExifParser$Section;",
            ">;"
        }
    .end annotation
.end field

.field private mStripSizeTag:Lit/sephiroth/android/library/exif2/ExifTag;

.field private mTag:Lit/sephiroth/android/library/exif2/ExifTag;

.field private final mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

.field private mUncompressedDataPosition:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/16 v1, 0x40

    .line 76
    const-string v0, "US-ASCII"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lit/sephiroth/android/library/exif2/ExifParser;->US_ASCII:Ljava/nio/charset/Charset;

    .line 77
    sget v0, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_EXIF_IFD:I

    invoke-static {v0}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_EXIF_IFD:S

    .line 78
    sget v0, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_GPS_IFD:I

    invoke-static {v0}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_GPS_IFD:S

    .line 79
    sget v0, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-static {v0}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_INTEROPERABILITY_IFD:S

    .line 80
    sget v0, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-static {v0}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_JPEG_INTERCHANGE_FORMAT:S

    .line 81
    sget v0, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-static {v0}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:S

    .line 82
    sget v0, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-static {v0}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_STRIP_OFFSETS:S

    .line 83
    sget v0, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-static {v0}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_STRIP_BYTE_COUNTS:S

    .line 110
    new-array v0, v1, [I

    fill-array-data v0, :array_60

    sput-object v0, Lit/sephiroth/android/library/exif2/ExifParser;->std_luminance_quant_tbl:[I

    .line 113
    new-array v0, v1, [I

    fill-array-data v0, :array_e4

    sput-object v0, Lit/sephiroth/android/library/exif2/ExifParser;->std_chrominance_quant_tbl:[I

    .line 118
    const/4 v0, 0x2

    new-array v0, v0, [[I

    const/4 v1, 0x0

    sget-object v2, Lit/sephiroth/android/library/exif2/ExifParser;->std_luminance_quant_tbl:[I

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lit/sephiroth/android/library/exif2/ExifParser;->std_chrominance_quant_tbl:[I

    aput-object v2, v0, v1

    sput-object v0, Lit/sephiroth/android/library/exif2/ExifParser;->deftabs:[[I

    .line 119
    return-void

    .line 110
    :array_60
    .array-data 4
        0x10
        0xb
        0xc
        0xe
        0xc
        0xa
        0x10
        0xe
        0xd
        0xe
        0x12
        0x11
        0x10
        0x13
        0x18
        0x28
        0x1a
        0x18
        0x16
        0x16
        0x18
        0x31
        0x23
        0x25
        0x1d
        0x28
        0x3a
        0x33
        0x3d
        0x3c
        0x39
        0x33
        0x38
        0x37
        0x40
        0x48
        0x5c
        0x4e
        0x40
        0x44
        0x57
        0x45
        0x37
        0x38
        0x50
        0x6d
        0x51
        0x57
        0x5f
        0x62
        0x67
        0x68
        0x67
        0x3e
        0x4d
        0x71
        0x79
        0x70
        0x64
        0x78
        0x5c
        0x65
        0x67
        0x63
    .end array-data

    .line 113
    :array_e4
    .array-data 4
        0x11
        0x12
        0x12
        0x18
        0x15
        0x18
        0x2f
        0x1a
        0x1a
        0x2f
        0x63
        0x42
        0x38
        0x42
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
        0x63
    .end array-data
.end method

.method private constructor <init>(Ljava/io/InputStream;ILit/sephiroth/android/library/exif2/ExifInterface;)V
    .registers 9
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "options"    # I
    .param p3, "iRef"    # Lit/sephiroth/android/library/exif2/ExifInterface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    iput-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    .line 88
    iput v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdStartOffset:I

    .line 89
    iput v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mNumOfTagInIfd:I

    .line 101
    iput-short v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mProcess:S

    .line 103
    iput v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mUncompressedDataPosition:I

    .line 157
    const/16 v2, 0x8

    new-array v2, v2, [B

    iput-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteArray:[B

    .line 158
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteArray:[B

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    iput-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 122
    if-nez p1, :cond_2b

    .line 123
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Null argument inputStream to ExifParser"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 126
    :cond_2b
    const-string v2, "ExifParser"

    const-string v3, "Reading exif..."

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mSections:Ljava/util/List;

    .line 129
    iput-object p3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    .line 130
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/exif2/ExifParser;->seekTiffData(Ljava/io/InputStream;)Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    move-result-object v2

    iput-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    .line 131
    iput p2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mOptions:I

    .line 135
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    if-nez v2, :cond_48

    .line 155
    :cond_47
    :goto_47
    return-void

    .line 139
    :cond_48
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-direct {p0, v2}, Lit/sephiroth/android/library/exif2/ExifParser;->parseTiffHeader(Lit/sephiroth/android/library/exif2/CountedDataInputStream;)V

    .line 141
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v2}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readUnsignedInt()J

    move-result-wide v0

    .line 142
    .local v0, "offset":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_73

    .line 143
    new-instance v2, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid offset "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 145
    :cond_73
    long-to-int v2, v0

    iput v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfd0Position:I

    .line 146
    iput v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdType:I

    .line 148
    invoke-direct {p0, v4}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v2

    if-nez v2, :cond_84

    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->needToParseOffsetsInCurrentIfd()Z

    move-result v2

    if-eqz v2, :cond_47

    .line 149
    :cond_84
    invoke-direct {p0, v4, v0, v1}, Lit/sephiroth/android/library/exif2/ExifParser;->registerIfd(IJ)V

    .line 150
    const-wide/16 v2, 0x8

    cmp-long v2, v0, v2

    if-eqz v2, :cond_47

    .line 151
    long-to-int v2, v0

    add-int/lit8 v2, v2, -0x8

    new-array v2, v2, [B

    iput-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mDataAboveIfd0:[B

    .line 152
    iget-object v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mDataAboveIfd0:[B

    invoke-virtual {p0, v2}, Lit/sephiroth/android/library/exif2/ExifParser;->read([B)I

    goto :goto_47
.end method

.method static Get16m([BI)I
    .registers 5
    .param p0, "data"    # [B
    .param p1, "position"    # I

    .prologue
    .line 342
    aget-byte v2, p0, p1

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v0, v2, 0x8

    .line 343
    .local v0, "b1":I
    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    and-int/lit16 v1, v2, 0xff

    .line 344
    .local v1, "b2":I
    or-int v2, v0, v1

    return v2
.end method

.method private checkOffsetOrImageTag(Lit/sephiroth/android/library/exif2/ExifTag;)V
    .registers 12
    .param p1, "tag"    # Lit/sephiroth/android/library/exif2/ExifTag;

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x2

    const/4 v7, 0x3

    const/4 v6, 0x0

    .line 800
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v3

    if-nez v3, :cond_b

    .line 850
    :cond_a
    :goto_a
    return-void

    .line 803
    :cond_b
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getTagId()S

    move-result v2

    .line 804
    .local v2, "tid":S
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getIfd()I

    move-result v1

    .line 805
    .local v1, "ifd":I
    sget-short v3, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_EXIF_IFD:S

    if-ne v2, v3, :cond_33

    sget v3, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_EXIF_IFD:I

    invoke-virtual {p0, v1, v3}, Lit/sephiroth/android/library/exif2/ExifParser;->checkAllowed(II)Z

    move-result v3

    if-eqz v3, :cond_33

    .line 806
    invoke-direct {p0, v8}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v3

    if-nez v3, :cond_2b

    invoke-direct {p0, v7}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 807
    :cond_2b
    invoke-virtual {p1, v6}, Lit/sephiroth/android/library/exif2/ExifTag;->getValueAt(I)J

    move-result-wide v4

    invoke-direct {p0, v8, v4, v5}, Lit/sephiroth/android/library/exif2/ExifParser;->registerIfd(IJ)V

    goto :goto_a

    .line 810
    :cond_33
    sget-short v3, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_GPS_IFD:S

    if-ne v2, v3, :cond_4d

    sget v3, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_GPS_IFD:I

    invoke-virtual {p0, v1, v3}, Lit/sephiroth/android/library/exif2/ExifParser;->checkAllowed(II)Z

    move-result v3

    if-eqz v3, :cond_4d

    .line 811
    invoke-direct {p0, v9}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 812
    invoke-virtual {p1, v6}, Lit/sephiroth/android/library/exif2/ExifTag;->getValueAt(I)J

    move-result-wide v4

    invoke-direct {p0, v9, v4, v5}, Lit/sephiroth/android/library/exif2/ExifParser;->registerIfd(IJ)V

    goto :goto_a

    .line 815
    :cond_4d
    sget-short v3, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_INTEROPERABILITY_IFD:S

    if-ne v2, v3, :cond_67

    sget v3, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-virtual {p0, v1, v3}, Lit/sephiroth/android/library/exif2/ExifParser;->checkAllowed(II)Z

    move-result v3

    if-eqz v3, :cond_67

    .line 816
    invoke-direct {p0, v7}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 817
    invoke-virtual {p1, v6}, Lit/sephiroth/android/library/exif2/ExifTag;->getValueAt(I)J

    move-result-wide v4

    invoke-direct {p0, v7, v4, v5}, Lit/sephiroth/android/library/exif2/ExifParser;->registerIfd(IJ)V

    goto :goto_a

    .line 820
    :cond_67
    sget-short v3, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_JPEG_INTERCHANGE_FORMAT:S

    if-ne v2, v3, :cond_81

    sget v3, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-virtual {p0, v1, v3}, Lit/sephiroth/android/library/exif2/ExifParser;->checkAllowed(II)Z

    move-result v3

    if-eqz v3, :cond_81

    .line 821
    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->isThumbnailRequested()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 822
    invoke-virtual {p1, v6}, Lit/sephiroth/android/library/exif2/ExifTag;->getValueAt(I)J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Lit/sephiroth/android/library/exif2/ExifParser;->registerCompressedImage(J)V

    goto :goto_a

    .line 825
    :cond_81
    sget-short v3, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:S

    if-ne v2, v3, :cond_97

    sget v3, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-virtual {p0, v1, v3}, Lit/sephiroth/android/library/exif2/ExifParser;->checkAllowed(II)Z

    move-result v3

    if-eqz v3, :cond_97

    .line 826
    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->isThumbnailRequested()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 827
    iput-object p1, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mJpegSizeTag:Lit/sephiroth/android/library/exif2/ExifTag;

    goto/16 :goto_a

    .line 830
    :cond_97
    sget-short v3, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_STRIP_OFFSETS:S

    if-ne v2, v3, :cond_e2

    sget v3, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-virtual {p0, v1, v3}, Lit/sephiroth/android/library/exif2/ExifParser;->checkAllowed(II)Z

    move-result v3

    if-eqz v3, :cond_e2

    .line 831
    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->isThumbnailRequested()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 832
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->hasValue()Z

    move-result v3

    if-eqz v3, :cond_ce

    .line 833
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b0
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v3

    if-ge v0, v3, :cond_a

    .line 834
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataType()S

    move-result v3

    if-ne v3, v7, :cond_c6

    .line 835
    invoke-virtual {p1, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->getValueAt(I)J

    move-result-wide v4

    invoke-direct {p0, v0, v4, v5}, Lit/sephiroth/android/library/exif2/ExifParser;->registerUncompressedStrip(IJ)V

    .line 833
    :goto_c3
    add-int/lit8 v0, v0, 0x1

    goto :goto_b0

    .line 838
    :cond_c6
    invoke-virtual {p1, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->getValueAt(I)J

    move-result-wide v4

    invoke-direct {p0, v0, v4, v5}, Lit/sephiroth/android/library/exif2/ExifParser;->registerUncompressedStrip(IJ)V

    goto :goto_c3

    .line 843
    .end local v0    # "i":I
    :cond_ce
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getOffset()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-instance v5, Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;

    invoke-direct {v5, p1, v6}, Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;-><init>(Lit/sephiroth/android/library/exif2/ExifTag;Z)V

    invoke-virtual {v3, v4, v5}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_a

    .line 847
    :cond_e2
    sget-short v3, Lit/sephiroth/android/library/exif2/ExifParser;->TAG_STRIP_BYTE_COUNTS:S

    if-ne v2, v3, :cond_a

    sget v3, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-virtual {p0, v1, v3}, Lit/sephiroth/android/library/exif2/ExifParser;->checkAllowed(II)Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->isThumbnailRequested()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->hasValue()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 848
    iput-object p1, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mStripSizeTag:Lit/sephiroth/android/library/exif2/ExifTag;

    goto/16 :goto_a
.end method

.method private isIfdRequested(I)Z
    .registers 5
    .param p1, "ifdType"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 434
    packed-switch p1, :pswitch_data_30

    move v0, v1

    .line 446
    :cond_6
    :goto_6
    return v0

    .line 436
    :pswitch_7
    iget v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mOptions:I

    and-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_6

    move v0, v1

    goto :goto_6

    .line 438
    :pswitch_f
    iget v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mOptions:I

    and-int/lit8 v2, v2, 0x2

    if-nez v2, :cond_6

    move v0, v1

    goto :goto_6

    .line 440
    :pswitch_17
    iget v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mOptions:I

    and-int/lit8 v2, v2, 0x4

    if-nez v2, :cond_6

    move v0, v1

    goto :goto_6

    .line 442
    :pswitch_1f
    iget v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mOptions:I

    and-int/lit8 v2, v2, 0x8

    if-nez v2, :cond_6

    move v0, v1

    goto :goto_6

    .line 444
    :pswitch_27
    iget v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mOptions:I

    and-int/lit8 v2, v2, 0x10

    if-nez v2, :cond_6

    move v0, v1

    goto :goto_6

    .line 434
    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_7
        :pswitch_f
        :pswitch_17
        :pswitch_27
        :pswitch_1f
    .end packed-switch
.end method

.method private isThumbnailRequested()Z
    .registers 2

    .prologue
    .line 478
    iget v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mOptions:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private needToParseOffsetsInCurrentIfd()Z
    .registers 5

    .prologue
    const/4 v3, 0x3

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 450
    iget v2, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdType:I

    packed-switch v2, :pswitch_data_30

    .line 460
    :cond_8
    :goto_8
    return v0

    .line 452
    :pswitch_9
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v2

    if-nez v2, :cond_23

    const/4 v2, 0x4

    invoke-direct {p0, v2}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v2

    if-nez v2, :cond_23

    invoke-direct {p0, v3}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v2

    if-nez v2, :cond_23

    invoke-direct {p0, v1}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v2

    if-eqz v2, :cond_8

    :cond_23
    move v0, v1

    goto :goto_8

    .line 455
    :pswitch_25
    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->isThumbnailRequested()Z

    move-result v0

    goto :goto_8

    .line 458
    :pswitch_2a
    invoke-direct {p0, v3}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v0

    goto :goto_8

    .line 450
    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_9
        :pswitch_25
        :pswitch_2a
    .end packed-switch
.end method

.method protected static parse(Ljava/io/InputStream;ILit/sephiroth/android/library/exif2/ExifInterface;)Lit/sephiroth/android/library/exif2/ExifParser;
    .registers 4
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .param p1, "options"    # I
    .param p2, "iRef"    # Lit/sephiroth/android/library/exif2/ExifInterface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;
        }
    .end annotation

    .prologue
    .line 488
    new-instance v0, Lit/sephiroth/android/library/exif2/ExifParser;

    invoke-direct {v0, p0, p1, p2}, Lit/sephiroth/android/library/exif2/ExifParser;-><init>(Ljava/io/InputStream;ILit/sephiroth/android/library/exif2/ExifInterface;)V

    return-object v0
.end method

.method private parseTiffHeader(Lit/sephiroth/android/library/exif2/CountedDataInputStream;)V
    .registers 5
    .param p1, "stream"    # Lit/sephiroth/android/library/exif2/CountedDataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;
        }
    .end annotation

    .prologue
    .line 417
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readShort()S

    move-result v0

    .line 418
    .local v0, "byteOrder":S
    const/16 v1, 0x4949

    if-ne v1, v0, :cond_1d

    .line 419
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v1}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->setByteOrder(Ljava/nio/ByteOrder;)V

    .line 428
    :goto_d
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readShort()S

    move-result v1

    const/16 v2, 0x2a

    if-eq v1, v2, :cond_2f

    .line 429
    new-instance v1, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;

    const-string v2, "Invalid TIFF header"

    invoke-direct {v1, v2}, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 421
    :cond_1d
    const/16 v1, 0x4d4d

    if-ne v1, v0, :cond_27

    .line 422
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v1}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->setByteOrder(Ljava/nio/ByteOrder;)V

    goto :goto_d

    .line 425
    :cond_27
    new-instance v1, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;

    const-string v2, "Invalid TIFF header"

    invoke-direct {v1, v2}, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 431
    :cond_2f
    return-void
.end method

.method private process_M_DQT([BI)V
    .registers 25
    .param p1, "data"    # [B
    .param p2, "length"    # I

    .prologue
    .line 358
    const/4 v2, 0x2

    .line 361
    .local v2, "a":I
    const-wide/16 v8, 0x0

    .line 362
    .local v8, "cumsf":D
    const/4 v7, 0x0

    .line 363
    .local v7, "reftable":[I
    const/4 v4, 0x1

    .line 365
    .local v4, "allones":I
    :goto_5
    move-object/from16 v0, p1

    array-length v15, v0

    if-ge v2, v15, :cond_7c

    .line 366
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "a":I
    .local v3, "a":I
    aget-byte v5, p1, v2

    .line 367
    .local v5, "c":I
    and-int/lit8 v12, v5, 0xf

    .line 369
    .local v12, "tableindex":I
    const/4 v15, 0x2

    if-ge v12, v15, :cond_17

    .line 370
    sget-object v15, Lit/sephiroth/android/library/exif2/ExifParser;->deftabs:[[I

    aget-object v7, v15, v12

    .line 374
    :cond_17
    const/4 v6, 0x0

    .local v6, "coefindex":I
    :goto_18
    const/16 v15, 0x40

    if-ge v6, v15, :cond_4c

    .line 376
    shr-int/lit8 v15, v5, 0x4

    if-eqz v15, :cond_47

    .line 378
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "a":I
    .restart local v2    # "a":I
    aget-byte v13, p1, v3

    .line 379
    .local v13, "temp":I
    mul-int/lit16 v13, v13, 0x100

    .line 380
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "a":I
    .restart local v3    # "a":I
    aget-byte v15, p1, v2

    add-int v14, v15, v13

    .local v14, "val":I
    move v2, v3

    .line 385
    .end local v3    # "a":I
    .end local v13    # "temp":I
    .restart local v2    # "a":I
    :goto_2d
    if-eqz v7, :cond_43

    .line 388
    const-wide/high16 v18, 0x4059000000000000L

    int-to-double v0, v14

    move-wide/from16 v20, v0

    mul-double v18, v18, v20

    aget v15, v7, v6

    int-to-double v0, v15

    move-wide/from16 v20, v0

    div-double v16, v18, v20

    .line 389
    .local v16, "x":D
    add-double v8, v8, v16

    .line 391
    const/4 v15, 0x1

    if-eq v14, v15, :cond_43

    const/4 v4, 0x0

    .line 374
    .end local v16    # "x":D
    :cond_43
    add-int/lit8 v6, v6, 0x1

    move v3, v2

    .end local v2    # "a":I
    .restart local v3    # "a":I
    goto :goto_18

    .line 383
    .end local v14    # "val":I
    :cond_47
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "a":I
    .restart local v2    # "a":I
    aget-byte v14, p1, v3

    .restart local v14    # "val":I
    goto :goto_2d

    .line 395
    .end local v2    # "a":I
    .end local v14    # "val":I
    .restart local v3    # "a":I
    :cond_4c
    if-eqz v7, :cond_7d

    .line 397
    const-wide/high16 v18, 0x4050000000000000L

    div-double v8, v8, v18

    .line 398
    if-eqz v4, :cond_65

    .line 399
    const-wide/high16 v10, 0x4059000000000000L

    .line 408
    .local v10, "qual":D
    :goto_56
    if-nez v12, :cond_63

    .line 409
    const-wide/high16 v18, 0x3fe0000000000000L

    add-double v18, v18, v10

    move-wide/from16 v0, v18

    double-to-int v15, v0

    move-object/from16 v0, p0

    iput v15, v0, Lit/sephiroth/android/library/exif2/ExifParser;->mQualityGuess:I

    :cond_63
    move v2, v3

    .line 412
    .end local v3    # "a":I
    .restart local v2    # "a":I
    goto :goto_5

    .line 401
    .end local v2    # "a":I
    .end local v10    # "qual":D
    .restart local v3    # "a":I
    :cond_65
    const-wide/high16 v18, 0x4059000000000000L

    cmpg-double v15, v8, v18

    if-gtz v15, :cond_74

    .line 402
    const-wide/high16 v18, 0x4069000000000000L

    sub-double v18, v18, v8

    const-wide/high16 v20, 0x4000000000000000L

    div-double v10, v18, v20

    .restart local v10    # "qual":D
    goto :goto_56

    .line 405
    .end local v10    # "qual":D
    :cond_74
    const-wide v18, 0x40b3880000000000L

    div-double v10, v18, v8

    .restart local v10    # "qual":D
    goto :goto_56

    .line 414
    .end local v3    # "a":I
    .end local v5    # "c":I
    .end local v6    # "coefindex":I
    .end local v10    # "qual":D
    .end local v12    # "tableindex":I
    .restart local v2    # "a":I
    :cond_7c
    return-void

    .end local v2    # "a":I
    .restart local v3    # "a":I
    .restart local v5    # "c":I
    .restart local v6    # "coefindex":I
    .restart local v12    # "tableindex":I
    :cond_7d
    move v2, v3

    .end local v3    # "a":I
    .restart local v2    # "a":I
    goto :goto_5
.end method

.method private process_M_SOFn([BI)V
    .registers 5
    .param p1, "data"    # [B
    .param p2, "marker"    # I

    .prologue
    .line 348
    array-length v0, p1

    const/4 v1, 0x7

    if-le v0, v1, :cond_12

    .line 351
    const/4 v0, 0x3

    invoke-static {p1, v0}, Lit/sephiroth/android/library/exif2/ExifParser;->Get16m([BI)I

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mImageLength:I

    .line 352
    const/4 v0, 0x5

    invoke-static {p1, v0}, Lit/sephiroth/android/library/exif2/ExifParser;->Get16m([BI)I

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mImageWidth:I

    .line 354
    :cond_12
    int-to-short v0, p2

    iput-short v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mProcess:S

    .line 355
    return-void
.end method

.method private readBytes(Ljava/io/InputStream;[BII)I
    .registers 9
    .param p1, "dataStream"    # Ljava/io/InputStream;
    .param p2, "data"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 329
    const/4 v0, 0x0

    .line 331
    .local v0, "count":I
    const/16 v3, 0x400

    invoke-static {v3, p4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 333
    .local v1, "max_length":I
    :goto_7
    invoke-virtual {p1, p2, p3, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .local v2, "n":I
    if-lez v2, :cond_16

    .line 334
    add-int/2addr v0, v2

    .line 335
    add-int/2addr p3, v2

    .line 336
    sub-int v3, p4, v0

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_7

    .line 338
    :cond_16
    return v0
.end method

.method private readInt([BI)I
    .registers 5
    .param p1, "b"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 161
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 162
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x4

    invoke-virtual {v0, p1, p2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 163
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 164
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    return v0
.end method

.method private readShort([BI)S
    .registers 5
    .param p1, "b"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 168
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 169
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x2

    invoke-virtual {v0, p1, p2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 170
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 171
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    return v0
.end method

.method private readTag()Lit/sephiroth/android/library/exif2/ExifTag;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;
        }
    .end annotation

    .prologue
    .line 749
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readShort()S

    move-result v1

    .line 750
    .local v1, "tagId":S
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readShort()S

    move-result v2

    .line 751
    .local v2, "dataFormat":S
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readUnsignedInt()J

    move-result-wide v10

    .line 752
    .local v10, "numOfComp":J
    const-wide/32 v4, 0x7fffffff

    cmp-long v3, v10, v4

    if-lez v3, :cond_21

    .line 753
    new-instance v3, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;

    const-string v4, "Number of component is larger then Integer.MAX_VALUE"

    invoke-direct {v3, v4}, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 756
    :cond_21
    invoke-static {v2}, Lit/sephiroth/android/library/exif2/ExifTag;->isValidType(S)Z

    move-result v3

    if-nez v3, :cond_4c

    .line 757
    const-string v3, "ExifParser"

    const-string v4, "Tag %04x: Invalid data type %d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v14

    aput-object v14, v5, v9

    const/4 v9, 0x1

    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v14

    aput-object v14, v5, v9

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 758
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    const-wide/16 v4, 0x4

    invoke-virtual {v3, v4, v5}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->skip(J)J

    .line 759
    const/4 v0, 0x0

    .line 791
    :goto_4b
    return-object v0

    .line 762
    :cond_4c
    new-instance v0, Lit/sephiroth/android/library/exif2/ExifTag;

    long-to-int v3, v10

    iget v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdType:I

    long-to-int v5, v10

    if-eqz v5, :cond_74

    const/4 v5, 0x1

    :goto_55
    invoke-direct/range {v0 .. v5}, Lit/sephiroth/android/library/exif2/ExifTag;-><init>(SSIIZ)V

    .line 763
    .local v0, "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    invoke-virtual {v0}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataSize()I

    move-result v7

    .line 764
    .local v7, "dataSize":I
    const/4 v3, 0x4

    if-le v7, v3, :cond_96

    .line 765
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readUnsignedInt()J

    move-result-wide v12

    .line 766
    .local v12, "offset":J
    const-wide/32 v4, 0x7fffffff

    cmp-long v3, v12, v4

    if-lez v3, :cond_76

    .line 767
    new-instance v3, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;

    const-string v4, "offset is larger then Integer.MAX_VALUE"

    invoke-direct {v3, v4}, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 762
    .end local v0    # "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    .end local v7    # "dataSize":I
    .end local v12    # "offset":J
    :cond_74
    const/4 v5, 0x0

    goto :goto_55

    .line 771
    .restart local v0    # "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    .restart local v7    # "dataSize":I
    .restart local v12    # "offset":J
    :cond_76
    iget v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfd0Position:I

    int-to-long v4, v3

    cmp-long v3, v12, v4

    if-gez v3, :cond_91

    const/4 v3, 0x7

    if-ne v2, v3, :cond_91

    .line 772
    long-to-int v3, v10

    new-array v6, v3, [B

    .line 773
    .local v6, "buf":[B
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mDataAboveIfd0:[B

    long-to-int v4, v12

    add-int/lit8 v4, v4, -0x8

    const/4 v5, 0x0

    long-to-int v9, v10

    invoke-static {v3, v4, v6, v5, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 774
    invoke-virtual {v0, v6}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([B)Z

    goto :goto_4b

    .line 777
    .end local v6    # "buf":[B
    :cond_91
    long-to-int v3, v12

    invoke-virtual {v0, v3}, Lit/sephiroth/android/library/exif2/ExifTag;->setOffset(I)V

    goto :goto_4b

    .line 781
    .end local v12    # "offset":J
    :cond_96
    invoke-virtual {v0}, Lit/sephiroth/android/library/exif2/ExifTag;->hasDefinedCount()Z

    move-result v8

    .line 783
    .local v8, "defCount":Z
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lit/sephiroth/android/library/exif2/ExifTag;->setHasDefinedCount(Z)V

    .line 785
    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/exif2/ExifParser;->readFullTagValue(Lit/sephiroth/android/library/exif2/ExifTag;)V

    .line 786
    invoke-virtual {v0, v8}, Lit/sephiroth/android/library/exif2/ExifTag;->setHasDefinedCount(Z)V

    .line 787
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    rsub-int/lit8 v4, v7, 0x4

    int-to-long v4, v4

    invoke-virtual {v3, v4, v5}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->skip(J)J

    .line 789
    iget-object v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v3}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->getReadByteCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x4

    invoke-virtual {v0, v3}, Lit/sephiroth/android/library/exif2/ExifTag;->setOffset(I)V

    goto :goto_4b
.end method

.method private registerCompressedImage(J)V
    .registers 8
    .param p1, "offset"    # J

    .prologue
    .line 741
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    long-to-int v1, p1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 742
    return-void
.end method

.method private registerIfd(IJ)V
    .registers 8
    .param p1, "ifdType"    # I
    .param p2, "offset"    # J

    .prologue
    .line 467
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    long-to-int v1, p2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;

    invoke-direct {p0, p1}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v3

    invoke-direct {v2, p1, v3}, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;-><init>(IZ)V

    invoke-virtual {v0, v1, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 468
    return-void
.end method

.method private registerUncompressedStrip(IJ)V
    .registers 8
    .param p1, "stripIndex"    # I
    .param p2, "offset"    # J

    .prologue
    .line 745
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    long-to-int v1, p2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;

    const/4 v3, 0x4

    invoke-direct {v2, v3, p1}, Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 746
    return-void
.end method

.method private seekTiffData(Ljava/io/InputStream;)Lit/sephiroth/android/library/exif2/CountedDataInputStream;
    .registers 26
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;
        }
    .end annotation

    .prologue
    .line 175
    new-instance v6, Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    move-object/from16 v0, p1

    invoke-direct {v6, v0}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 176
    .local v6, "dataStream":Lit/sephiroth/android/library/exif2/CountedDataInputStream;
    const/16 v17, 0x0

    .line 178
    .local v17, "tiffStream":Lit/sephiroth/android/library/exif2/CountedDataInputStream;
    invoke-virtual {v6}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readUnsignedByte()I

    move-result v3

    .line 179
    .local v3, "a":I
    invoke-virtual {v6}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readUnsignedByte()I

    move-result v4

    .line 181
    .local v4, "b":I
    const/16 v18, 0xff

    move/from16 v0, v18

    if-ne v3, v0, :cond_1d

    const/16 v18, 0xd8

    move/from16 v0, v18

    if-eq v4, v0, :cond_3b

    .line 182
    :cond_1d
    const-string v18, "ExifParser"

    const-string v19, "invalid jpeg header"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    const/16 v18, 0x0

    .line 255
    :goto_26
    return-object v18

    .line 246
    .local v5, "data":[B
    .local v7, "got":I
    .local v10, "ignore":Z
    .local v11, "itemlen":I
    .local v12, "lh":B
    .local v13, "ll":B
    .local v14, "marker":I
    .local v15, "prev":I
    .local v16, "section":Lit/sephiroth/android/library/exif2/ExifParser$Section;
    :sswitch_27
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v11}, Lit/sephiroth/android/library/exif2/ExifParser;->process_M_DQT([BI)V

    .line 307
    :cond_2c
    :goto_2c
    :sswitch_2c
    if-nez v10, :cond_1b6

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/exif2/ExifParser;->mSections:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    .end local v5    # "data":[B
    .end local v7    # "got":I
    .end local v10    # "ignore":Z
    .end local v11    # "itemlen":I
    .end local v12    # "lh":B
    .end local v13    # "ll":B
    .end local v14    # "marker":I
    .end local v15    # "prev":I
    .end local v16    # "section":Lit/sephiroth/android/library/exif2/ExifParser$Section;
    :cond_3b
    :goto_3b
    const/4 v15, 0x0

    .line 195
    .restart local v15    # "prev":I
    const/4 v3, 0x0

    .line 196
    :goto_3d
    invoke-virtual {v6}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readUnsignedByte()I

    move-result v14

    .line 197
    .restart local v14    # "marker":I
    const/16 v18, 0xff

    move/from16 v0, v18

    if-eq v14, v0, :cond_a4

    const/16 v18, 0xff

    move/from16 v0, v18

    if-ne v15, v0, :cond_a4

    .line 201
    const/16 v18, 0xa

    move/from16 v0, v18

    if-le v3, v0, :cond_79

    .line 202
    const-string v18, "ExifParser"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Extraneous "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    add-int/lit8 v20, v3, -0x1

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " padding bytes before section "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    :cond_79
    new-instance v16, Lit/sephiroth/android/library/exif2/ExifParser$Section;

    invoke-direct/range {v16 .. v16}, Lit/sephiroth/android/library/exif2/ExifParser$Section;-><init>()V

    .line 206
    .restart local v16    # "section":Lit/sephiroth/android/library/exif2/ExifParser$Section;
    move-object/from16 v0, v16

    iput v14, v0, Lit/sephiroth/android/library/exif2/ExifParser$Section;->type:I

    .line 209
    invoke-virtual {v6}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readByte()B

    move-result v12

    .line 210
    .restart local v12    # "lh":B
    invoke-virtual {v6}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readByte()B

    move-result v13

    .line 211
    .restart local v13    # "ll":B
    and-int/lit16 v0, v12, 0xff

    move/from16 v18, v0

    shl-int/lit8 v18, v18, 0x8

    and-int/lit16 v0, v13, 0xff

    move/from16 v19, v0

    or-int v11, v18, v19

    .line 213
    .restart local v11    # "itemlen":I
    const/16 v18, 0x2

    move/from16 v0, v18

    if-ge v11, v0, :cond_a8

    .line 214
    new-instance v18, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;

    const-string v19, "Invalid marker"

    invoke-direct/range {v18 .. v19}, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 198
    .end local v11    # "itemlen":I
    .end local v12    # "lh":B
    .end local v13    # "ll":B
    .end local v16    # "section":Lit/sephiroth/android/library/exif2/ExifParser$Section;
    :cond_a4
    move v15, v14

    .line 195
    add-int/lit8 v3, v3, 0x1

    goto :goto_3d

    .line 217
    .restart local v11    # "itemlen":I
    .restart local v12    # "lh":B
    .restart local v13    # "ll":B
    .restart local v16    # "section":Lit/sephiroth/android/library/exif2/ExifParser$Section;
    :cond_a8
    move-object/from16 v0, v16

    iput v11, v0, Lit/sephiroth/android/library/exif2/ExifParser$Section;->size:I

    .line 219
    new-array v5, v11, [B

    .line 220
    .restart local v5    # "data":[B
    const/16 v18, 0x0

    aput-byte v12, v5, v18

    .line 221
    const/16 v18, 0x1

    aput-byte v13, v5, v18

    .line 226
    const/16 v18, 0x2

    add-int/lit8 v19, v11, -0x2

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-direct {v0, v6, v5, v1, v2}, Lit/sephiroth/android/library/exif2/ExifParser;->readBytes(Ljava/io/InputStream;[BII)I

    move-result v7

    .line 228
    .restart local v7    # "got":I
    add-int/lit8 v18, v11, -0x2

    move/from16 v0, v18

    if-eq v7, v0, :cond_f1

    .line 229
    new-instance v18, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Premature end of file? Expecting "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    add-int/lit8 v20, v11, -0x2

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ", received "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 232
    :cond_f1
    move-object/from16 v0, v16

    iput-object v5, v0, Lit/sephiroth/android/library/exif2/ExifParser$Section;->data:[B

    .line 235
    const/4 v10, 0x0

    .line 237
    .restart local v10    # "ignore":Z
    sparse-switch v14, :sswitch_data_1f2

    .line 303
    const-string v18, "ExifParser"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Unknown marker: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "0x%2X"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ", length: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2c

    .line 240
    :sswitch_135
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/exif2/ExifParser;->mSections:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    invoke-virtual {v6}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->getReadByteCount()I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lit/sephiroth/android/library/exif2/ExifParser;->mUncompressedDataPosition:I

    move-object/from16 v18, v17

    .line 242
    goto/16 :goto_26

    .line 254
    :sswitch_150
    const-string v18, "ExifParser"

    const-string v19, "No image in jpeg!"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    const/16 v18, 0x0

    goto/16 :goto_26

    .line 259
    :sswitch_15b
    const/4 v10, 0x1

    .line 260
    goto/16 :goto_2c

    .line 263
    :sswitch_15e
    const/16 v18, 0x10

    move/from16 v0, v18

    if-ge v11, v0, :cond_2c

    .line 264
    const/4 v10, 0x1

    goto/16 :goto_2c

    .line 284
    :sswitch_167
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v14}, Lit/sephiroth/android/library/exif2/ExifParser;->process_M_SOFn([BI)V

    goto/16 :goto_2c

    .line 288
    :sswitch_16e
    const/16 v18, 0x8

    move/from16 v0, v18

    if-lt v11, v0, :cond_2c

    .line 289
    const/16 v18, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v5, v1}, Lit/sephiroth/android/library/exif2/ExifParser;->readInt([BI)I

    move-result v8

    .line 290
    .local v8, "header":I
    const/16 v18, 0x6

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v5, v1}, Lit/sephiroth/android/library/exif2/ExifParser;->readShort([BI)S

    move-result v9

    .line 292
    .local v9, "headerTail":S
    const v18, 0x45786966

    move/from16 v0, v18

    if-ne v8, v0, :cond_1ad

    if-nez v9, :cond_1ad

    .line 293
    new-instance v17, Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    .end local v17    # "tiffStream":Lit/sephiroth/android/library/exif2/CountedDataInputStream;
    new-instance v18, Ljava/io/ByteArrayInputStream;

    const/16 v19, 0x8

    add-int/lit8 v20, v11, -0x8

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v5, v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-direct/range {v17 .. v18}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 294
    .restart local v17    # "tiffStream":Lit/sephiroth/android/library/exif2/CountedDataInputStream;
    add-int/lit8 v18, v11, -0x6

    invoke-virtual/range {v17 .. v18}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->setEnd(I)V

    .line 295
    const/4 v10, 0x0

    goto/16 :goto_2c

    .line 297
    :cond_1ad
    const-string v18, "ExifParser"

    const-string v19, "Image cotains XMP section"

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2c

    .line 312
    .end local v8    # "header":I
    .end local v9    # "headerTail":S
    :cond_1b6
    const-string v18, "ExifParser"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "ignoring marker: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "0x%2X"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ", length: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3b

    .line 237
    :sswitch_data_1f2
    .sparse-switch
        0xc0 -> :sswitch_167
        0xc1 -> :sswitch_167
        0xc2 -> :sswitch_167
        0xc3 -> :sswitch_167
        0xc4 -> :sswitch_2c
        0xc5 -> :sswitch_167
        0xc6 -> :sswitch_167
        0xc7 -> :sswitch_167
        0xc9 -> :sswitch_167
        0xca -> :sswitch_167
        0xcb -> :sswitch_167
        0xcd -> :sswitch_167
        0xce -> :sswitch_167
        0xcf -> :sswitch_167
        0xd9 -> :sswitch_150
        0xda -> :sswitch_135
        0xdb -> :sswitch_27
        0xe0 -> :sswitch_15e
        0xe1 -> :sswitch_16e
        0xed -> :sswitch_2c
        0xfe -> :sswitch_15b
    .end sparse-switch
.end method

.method private skipTo(I)V
    .registers 6
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 718
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->skipTo(J)V

    .line 720
    :goto_6
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_22

    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->firstKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, p1, :cond_22

    .line 721
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->pollFirstEntry()Ljava/util/Map$Entry;

    goto :goto_6

    .line 723
    :cond_22
    return-void
.end method


# virtual methods
.method public checkAllowed(II)Z
    .registers 5
    .param p1, "ifd"    # I
    .param p2, "tagId"    # I

    .prologue
    .line 857
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    invoke-virtual {v1}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    .line 858
    .local v0, "info":I
    if-nez v0, :cond_e

    .line 859
    const/4 v1, 0x0

    .line 861
    :goto_d
    return v1

    :cond_e
    invoke-static {v0, p1}, Lit/sephiroth/android/library/exif2/ExifInterface;->isIfdAllowed(II)Z

    move-result v1

    goto :goto_d
.end method

.method protected getByteOrder()Ljava/nio/ByteOrder;
    .registers 2

    .prologue
    .line 1031
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v0}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    .line 1032
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected getCompressedImageSize()I
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 711
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mJpegSizeTag:Lit/sephiroth/android/library/exif2/ExifTag;

    if-nez v1, :cond_6

    .line 714
    :goto_5
    return v0

    :cond_6
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mJpegSizeTag:Lit/sephiroth/android/library/exif2/ExifTag;

    invoke-virtual {v1, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->getValueAt(I)J

    move-result-wide v0

    long-to-int v0, v0

    goto :goto_5
.end method

.method protected getCurrentIfd()I
    .registers 2

    .prologue
    .line 686
    iget v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdType:I

    return v0
.end method

.method public getImageLength()I
    .registers 2

    .prologue
    .line 1048
    iget v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mImageLength:I

    return v0
.end method

.method public getImageWidth()I
    .registers 2

    .prologue
    .line 1040
    iget v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mImageWidth:I

    return v0
.end method

.method public getJpegProcess()S
    .registers 2

    .prologue
    .line 1044
    iget-short v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mProcess:S

    return v0
.end method

.method public getQualityGuess()I
    .registers 2

    .prologue
    .line 1036
    iget v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mQualityGuess:I

    return v0
.end method

.method public getSections()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/exif2/ExifParser$Section;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1052
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mSections:Ljava/util/List;

    return-object v0
.end method

.method protected getStripIndex()I
    .registers 2

    .prologue
    .line 694
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mImageEvent:Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;

    iget v0, v0, Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;->stripIndex:I

    return v0
.end method

.method protected getStripSize()I
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 702
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mStripSizeTag:Lit/sephiroth/android/library/exif2/ExifTag;

    if-nez v1, :cond_6

    .line 703
    :goto_5
    return v0

    :cond_6
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mStripSizeTag:Lit/sephiroth/android/library/exif2/ExifTag;

    invoke-virtual {v1, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->getValueAt(I)J

    move-result-wide v0

    long-to-int v0, v0

    goto :goto_5
.end method

.method protected getTag()Lit/sephiroth/android/library/exif2/ExifTag;
    .registers 2

    .prologue
    .line 666
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    return-object v0
.end method

.method public getUncompressedDataPosition()I
    .registers 2

    .prologue
    .line 1056
    iget v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mUncompressedDataPosition:I

    return v0
.end method

.method public isDefinedTag(II)Z
    .registers 5
    .param p1, "ifdId"    # I
    .param p2, "tagId"    # I

    .prologue
    .line 853
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mInterface:Lit/sephiroth/android/library/exif2/ExifInterface;

    invoke-virtual {v0}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v0

    int-to-short v1, p2

    invoke-static {p1, v1}, Lit/sephiroth/android/library/exif2/ExifInterface;->defineTag(IS)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    if-eqz v0, :cond_13

    const/4 v0, 0x1

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method protected next()I
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;
        }
    .end annotation

    .prologue
    .line 515
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    if-nez v9, :cond_6

    .line 516
    const/4 v9, 0x5

    .line 603
    :goto_5
    return v9

    .line 519
    :cond_6
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v9}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->getReadByteCount()I

    move-result v6

    .line 520
    .local v6, "offset":I
    iget v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdStartOffset:I

    add-int/lit8 v9, v9, 0x2

    iget v10, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mNumOfTagInIfd:I

    mul-int/lit8 v10, v10, 0xc

    add-int v1, v9, v10

    .line 521
    .local v1, "endOfTags":I
    if-ge v6, v1, :cond_32

    .line 522
    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readTag()Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v9

    iput-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    .line 523
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    if-nez v9, :cond_27

    .line 524
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->next()I

    move-result v9

    goto :goto_5

    .line 526
    :cond_27
    iget-boolean v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mNeedToParseOffsetsInCurrentIfd:Z

    if-eqz v9, :cond_30

    .line 527
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    invoke-direct {p0, v9}, Lit/sephiroth/android/library/exif2/ExifParser;->checkOffsetOrImageTag(Lit/sephiroth/android/library/exif2/ExifTag;)V

    .line 529
    :cond_30
    const/4 v9, 0x1

    goto :goto_5

    .line 531
    :cond_32
    if-ne v6, v1, :cond_53

    .line 533
    iget v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdType:I

    if-nez v9, :cond_bf

    .line 534
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readUnsignedLong()J

    move-result-wide v4

    .line 535
    .local v4, "ifdOffset":J
    const/4 v9, 0x1

    invoke-direct {p0, v9}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v9

    if-nez v9, :cond_49

    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->isThumbnailRequested()Z

    move-result v9

    if-eqz v9, :cond_53

    .line 536
    :cond_49
    const-wide/16 v10, 0x0

    cmp-long v9, v4, v10

    if-eqz v9, :cond_53

    .line 537
    const/4 v9, 0x1

    invoke-direct {p0, v9, v4, v5}, Lit/sephiroth/android/library/exif2/ExifParser;->registerIfd(IJ)V

    .line 558
    .end local v4    # "ifdOffset":J
    :cond_53
    :goto_53
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v9}, Ljava/util/TreeMap;->size()I

    move-result v9

    if-eqz v9, :cond_19b

    .line 559
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v9}, Ljava/util/TreeMap;->pollFirstEntry()Ljava/util/Map$Entry;

    move-result-object v2

    .line 560
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Object;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    .line 563
    .local v3, "event":Ljava/lang/Object;
    :try_start_65
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-direct {p0, v9}, Lit/sephiroth/android/library/exif2/ExifParser;->skipTo(I)V
    :try_end_72
    .catch Ljava/io/IOException; {:try_start_65 .. :try_end_72} :catch_121

    .line 569
    instance-of v9, v3, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;

    if-eqz v9, :cond_16c

    move-object v9, v3

    .line 570
    check-cast v9, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;

    iget v9, v9, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;->ifd:I

    iput v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdType:I

    .line 571
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v9}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readUnsignedShort()I

    move-result v9

    iput v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mNumOfTagInIfd:I

    .line 572
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iput v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdStartOffset:I

    .line 574
    iget v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mNumOfTagInIfd:I

    mul-int/lit8 v9, v9, 0xc

    iget v10, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdStartOffset:I

    add-int/2addr v9, v10

    add-int/lit8 v9, v9, 0x2

    iget-object v10, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v10}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->getEnd()I

    move-result v10

    if-le v9, v10, :cond_158

    .line 575
    const-string v9, "ExifParser"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Invalid size of IFD "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdType:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    const/4 v9, 0x5

    goto/16 :goto_5

    .line 542
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Object;>;"
    .end local v3    # "event":Ljava/lang/Object;
    :cond_bf
    const/4 v7, 0x4

    .line 544
    .local v7, "offsetSize":I
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v9}, Ljava/util/TreeMap;->size()I

    move-result v9

    if-lez v9, :cond_e0

    .line 545
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v9}, Ljava/util/TreeMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget-object v10, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v10}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->getReadByteCount()I

    move-result v10

    sub-int v7, v9, v10

    .line 547
    :cond_e0
    const/4 v9, 0x4

    if-ge v7, v9, :cond_fd

    .line 548
    const-string v9, "ExifParser"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Invalid size of link to next IFD: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_53

    .line 551
    :cond_fd
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readUnsignedLong()J

    move-result-wide v4

    .line 552
    .restart local v4    # "ifdOffset":J
    const-wide/16 v10, 0x0

    cmp-long v9, v4, v10

    if-eqz v9, :cond_53

    .line 553
    const-string v9, "ExifParser"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Invalid link to next IFD: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_53

    .line 564
    .end local v4    # "ifdOffset":J
    .end local v7    # "offsetSize":I
    .restart local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Object;>;"
    .restart local v3    # "event":Ljava/lang/Object;
    :catch_121
    move-exception v0

    .line 565
    .local v0, "e":Ljava/io/IOException;
    const-string v9, "ExifParser"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Failed to skip to data at: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " for "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", the file may be broken."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_53

    .line 579
    .end local v0    # "e":Ljava/io/IOException;
    :cond_158
    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->needToParseOffsetsInCurrentIfd()Z

    move-result v9

    iput-boolean v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mNeedToParseOffsetsInCurrentIfd:Z

    .line 580
    check-cast v3, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;

    .end local v3    # "event":Ljava/lang/Object;
    iget-boolean v9, v3, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;->isRequested:Z

    if-eqz v9, :cond_167

    .line 581
    const/4 v9, 0x0

    goto/16 :goto_5

    .line 584
    :cond_167
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->skipRemainingTagsInCurrentIfd()V

    goto/16 :goto_53

    .line 587
    .restart local v3    # "event":Ljava/lang/Object;
    :cond_16c
    instance-of v9, v3, Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;

    if-eqz v9, :cond_17a

    .line 588
    check-cast v3, Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;

    .end local v3    # "event":Ljava/lang/Object;
    iput-object v3, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mImageEvent:Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;

    .line 589
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mImageEvent:Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;

    iget v9, v9, Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;->type:I

    goto/16 :goto_5

    .restart local v3    # "event":Ljava/lang/Object;
    :cond_17a
    move-object v8, v3

    .line 592
    check-cast v8, Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;

    .line 593
    .local v8, "tagEvent":Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;
    iget-object v9, v8, Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;->tag:Lit/sephiroth/android/library/exif2/ExifTag;

    iput-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    .line 594
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    invoke-virtual {v9}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataType()S

    move-result v9

    const/4 v10, 0x7

    if-eq v9, v10, :cond_194

    .line 595
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    invoke-virtual {p0, v9}, Lit/sephiroth/android/library/exif2/ExifParser;->readFullTagValue(Lit/sephiroth/android/library/exif2/ExifTag;)V

    .line 596
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    invoke-direct {p0, v9}, Lit/sephiroth/android/library/exif2/ExifParser;->checkOffsetOrImageTag(Lit/sephiroth/android/library/exif2/ExifTag;)V

    .line 598
    :cond_194
    iget-boolean v9, v8, Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;->isRequested:Z

    if-eqz v9, :cond_53

    .line 599
    const/4 v9, 0x2

    goto/16 :goto_5

    .line 603
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Object;>;"
    .end local v3    # "event":Ljava/lang/Object;
    .end local v8    # "tagEvent":Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;
    :cond_19b
    const/4 v9, 0x5

    goto/16 :goto_5
.end method

.method protected read([B)I
    .registers 3
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 474
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->read([B)I

    move-result v0

    return v0
.end method

.method protected readFullTagValue(Lit/sephiroth/android/library/exif2/ExifTag;)V
    .registers 14
    .param p1, "tag"    # Lit/sephiroth/android/library/exif2/ExifTag;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 866
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataType()S

    move-result v7

    .line 867
    .local v7, "type":S
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v1

    .line 870
    .local v1, "componentCount":I
    const/high16 v9, 0x66000000

    if-lt v1, v9, :cond_14

    new-instance v9, Ljava/io/IOException;

    const-string v10, "size out of bounds"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 872
    :cond_14
    const/4 v9, 0x2

    if-eq v7, v9, :cond_1d

    const/4 v9, 0x7

    if-eq v7, v9, :cond_1d

    const/4 v9, 0x1

    if-ne v7, v9, :cond_8e

    .line 874
    :cond_1d
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getComponentCount()I

    move-result v6

    .line 875
    .local v6, "size":I
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v9}, Ljava/util/TreeMap;->size()I

    move-result v9

    if-lez v9, :cond_8e

    .line 876
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v9}, Ljava/util/TreeMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget-object v10, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v10}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->getReadByteCount()I

    move-result v10

    add-int/2addr v10, v6

    if-ge v9, v10, :cond_8e

    .line 877
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v9}, Ljava/util/TreeMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    .line 878
    .local v3, "event":Ljava/lang/Object;
    instance-of v9, v3, Lit/sephiroth/android/library/exif2/ExifParser$ImageEvent;

    if-eqz v9, :cond_96

    .line 880
    const-string v9, "ExifParser"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Thumbnail overlaps value for tag: \n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 881
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v9}, Ljava/util/TreeMap;->pollFirstEntry()Ljava/util/Map$Entry;

    move-result-object v2

    .line 882
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Object;>;"
    const-string v9, "ExifParser"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Invalid thumbnail offset: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 899
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Object;>;"
    .end local v3    # "event":Ljava/lang/Object;
    .end local v6    # "size":I
    :cond_8e
    :goto_8e
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getDataType()S

    move-result v9

    packed-switch v9, :pswitch_data_1b0

    .line 953
    :goto_95
    :pswitch_95
    return-void

    .line 886
    .restart local v3    # "event":Ljava/lang/Object;
    .restart local v6    # "size":I
    :cond_96
    instance-of v9, v3, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;

    if-eqz v9, :cond_106

    .line 887
    const-string v9, "ExifParser"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Ifd "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    check-cast v3, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;

    .end local v3    # "event":Ljava/lang/Object;
    iget v11, v3, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;->ifd:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " overlaps value for tag: \n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 892
    :cond_c4
    :goto_c4
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v9}, Ljava/util/TreeMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget-object v10, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v10}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->getReadByteCount()I

    move-result v10

    sub-int v6, v9, v10

    .line 893
    const-string v9, "ExifParser"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Invalid size of tag: \n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " setting count to: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 894
    invoke-virtual {p1, v6}, Lit/sephiroth/android/library/exif2/ExifTag;->forceSetComponentCount(I)V

    goto :goto_8e

    .line 889
    .restart local v3    # "event":Ljava/lang/Object;
    :cond_106
    instance-of v9, v3, Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;

    if-eqz v9, :cond_c4

    .line 890
    const-string v9, "ExifParser"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Tag value for tag: \n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    check-cast v3, Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;

    .end local v3    # "event":Ljava/lang/Object;
    iget-object v11, v3, Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;->tag:Lit/sephiroth/android/library/exif2/ExifTag;

    invoke-virtual {v11}, Lit/sephiroth/android/library/exif2/ExifTag;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " overlaps value for tag: \n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c4

    .line 902
    .end local v6    # "size":I
    :pswitch_139
    new-array v0, v1, [B

    .line 903
    .local v0, "buf":[B
    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/exif2/ExifParser;->read([B)I

    .line 904
    invoke-virtual {p1, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([B)Z

    goto/16 :goto_95

    .line 908
    .end local v0    # "buf":[B
    :pswitch_143
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/exif2/ExifParser;->readString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue(Ljava/lang/String;)Z

    goto/16 :goto_95

    .line 911
    :pswitch_14c
    new-array v8, v1, [J

    .line 912
    .local v8, "value":[J
    const/4 v4, 0x0

    .local v4, "i":I
    array-length v5, v8

    .local v5, "n":I
    :goto_150
    if-ge v4, v5, :cond_15b

    .line 913
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readUnsignedLong()J

    move-result-wide v10

    aput-wide v10, v8, v4

    .line 912
    add-int/lit8 v4, v4, 0x1

    goto :goto_150

    .line 915
    :cond_15b
    invoke-virtual {p1, v8}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([J)Z

    goto/16 :goto_95

    .line 919
    .end local v4    # "i":I
    .end local v5    # "n":I
    .end local v8    # "value":[J
    :pswitch_160
    new-array v8, v1, [Lit/sephiroth/android/library/exif2/Rational;

    .line 920
    .local v8, "value":[Lit/sephiroth/android/library/exif2/Rational;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    array-length v5, v8

    .restart local v5    # "n":I
    :goto_164
    if-ge v4, v5, :cond_16f

    .line 921
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readUnsignedRational()Lit/sephiroth/android/library/exif2/Rational;

    move-result-object v9

    aput-object v9, v8, v4

    .line 920
    add-int/lit8 v4, v4, 0x1

    goto :goto_164

    .line 923
    :cond_16f
    invoke-virtual {p1, v8}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([Lit/sephiroth/android/library/exif2/Rational;)Z

    goto/16 :goto_95

    .line 927
    .end local v4    # "i":I
    .end local v5    # "n":I
    .end local v8    # "value":[Lit/sephiroth/android/library/exif2/Rational;
    :pswitch_174
    new-array v8, v1, [I

    .line 928
    .local v8, "value":[I
    const/4 v4, 0x0

    .restart local v4    # "i":I
    array-length v5, v8

    .restart local v5    # "n":I
    :goto_178
    if-ge v4, v5, :cond_183

    .line 929
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readUnsignedShort()I

    move-result v9

    aput v9, v8, v4

    .line 928
    add-int/lit8 v4, v4, 0x1

    goto :goto_178

    .line 931
    :cond_183
    invoke-virtual {p1, v8}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([I)Z

    goto/16 :goto_95

    .line 935
    .end local v4    # "i":I
    .end local v5    # "n":I
    .end local v8    # "value":[I
    :pswitch_188
    new-array v8, v1, [I

    .line 936
    .restart local v8    # "value":[I
    const/4 v4, 0x0

    .restart local v4    # "i":I
    array-length v5, v8

    .restart local v5    # "n":I
    :goto_18c
    if-ge v4, v5, :cond_197

    .line 937
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readLong()I

    move-result v9

    aput v9, v8, v4

    .line 936
    add-int/lit8 v4, v4, 0x1

    goto :goto_18c

    .line 939
    :cond_197
    invoke-virtual {p1, v8}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([I)Z

    goto/16 :goto_95

    .line 943
    .end local v4    # "i":I
    .end local v5    # "n":I
    .end local v8    # "value":[I
    :pswitch_19c
    new-array v8, v1, [Lit/sephiroth/android/library/exif2/Rational;

    .line 944
    .local v8, "value":[Lit/sephiroth/android/library/exif2/Rational;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    array-length v5, v8

    .restart local v5    # "n":I
    :goto_1a0
    if-ge v4, v5, :cond_1ab

    .line 945
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readRational()Lit/sephiroth/android/library/exif2/Rational;

    move-result-object v9

    aput-object v9, v8, v4

    .line 944
    add-int/lit8 v4, v4, 0x1

    goto :goto_1a0

    .line 947
    :cond_1ab
    invoke-virtual {p1, v8}, Lit/sephiroth/android/library/exif2/ExifTag;->setValue([Lit/sephiroth/android/library/exif2/Rational;)Z

    goto/16 :goto_95

    .line 899
    :pswitch_data_1b0
    .packed-switch 0x1
        :pswitch_139
        :pswitch_143
        :pswitch_174
        :pswitch_14c
        :pswitch_160
        :pswitch_95
        :pswitch_139
        :pswitch_95
        :pswitch_188
        :pswitch_19c
    .end packed-switch
.end method

.method protected readLong()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1015
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v0}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readInt()I

    move-result v0

    return v0
.end method

.method protected readRational()Lit/sephiroth/android/library/exif2/Rational;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1022
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readLong()I

    move-result v1

    .line 1023
    .local v1, "nomi":I
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readLong()I

    move-result v0

    .line 1024
    .local v0, "denomi":I
    new-instance v2, Lit/sephiroth/android/library/exif2/Rational;

    int-to-long v4, v1

    int-to-long v6, v0

    invoke-direct {v2, v4, v5, v6, v7}, Lit/sephiroth/android/library/exif2/Rational;-><init>(JJ)V

    return-object v2
.end method

.method protected readString(I)Ljava/lang/String;
    .registers 3
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 968
    sget-object v0, Lit/sephiroth/android/library/exif2/ExifParser;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1, v0}, Lit/sephiroth/android/library/exif2/ExifParser;->readString(ILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected readString(ILjava/nio/charset/Charset;)Ljava/lang/String;
    .registers 4
    .param p1, "n"    # I
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 977
    if-lez p1, :cond_9

    .line 978
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v0, p1, p2}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readString(ILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    .line 981
    :goto_8
    return-object v0

    :cond_9
    const-string v0, ""

    goto :goto_8
.end method

.method protected readUnsignedLong()J
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 998
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readLong()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method protected readUnsignedRational()Lit/sephiroth/android/library/exif2/Rational;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1006
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readUnsignedLong()J

    move-result-wide v2

    .line 1007
    .local v2, "nomi":J
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readUnsignedLong()J

    move-result-wide v0

    .line 1008
    .local v0, "denomi":J
    new-instance v4, Lit/sephiroth/android/library/exif2/Rational;

    invoke-direct {v4, v2, v3, v0, v1}, Lit/sephiroth/android/library/exif2/Rational;-><init>(JJ)V

    return-object v4
.end method

.method protected readUnsignedShort()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 990
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v0}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->readShort()S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method

.method protected registerForTagValue(Lit/sephiroth/android/library/exif2/ExifTag;)V
    .registers 6
    .param p1, "tag"    # Lit/sephiroth/android/library/exif2/ExifTag;

    .prologue
    .line 735
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getOffset()I

    move-result v0

    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v1}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->getReadByteCount()I

    move-result v1

    if-lt v0, v1, :cond_1f

    .line 736
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getOffset()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;

    const/4 v3, 0x1

    invoke-direct {v2, p1, v3}, Lit/sephiroth/android/library/exif2/ExifParser$ExifTagEvent;-><init>(Lit/sephiroth/android/library/exif2/ExifTag;Z)V

    invoke-virtual {v0, v1, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 738
    :cond_1f
    return-void
.end method

.method protected skipRemainingTagsInCurrentIfd()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lit/sephiroth/android/library/exif2/ExifInvalidFormatException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 614
    iget v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdStartOffset:I

    add-int/lit8 v4, v4, 0x2

    iget v5, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mNumOfTagInIfd:I

    mul-int/lit8 v5, v5, 0xc

    add-int v0, v4, v5

    .line 615
    .local v0, "endOfTags":I
    iget-object v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTiffStream:Lit/sephiroth/android/library/exif2/CountedDataInputStream;

    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/CountedDataInputStream;->getReadByteCount()I

    move-result v1

    .line 616
    .local v1, "offset":I
    if-le v1, v0, :cond_14

    .line 639
    :cond_13
    :goto_13
    return-void

    .line 619
    :cond_14
    iget-boolean v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mNeedToParseOffsetsInCurrentIfd:Z

    if-eqz v4, :cond_2c

    .line 620
    :cond_18
    :goto_18
    if-ge v1, v0, :cond_2f

    .line 621
    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readTag()Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v4

    iput-object v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    .line 622
    add-int/lit8 v1, v1, 0xc

    .line 623
    iget-object v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    if-eqz v4, :cond_18

    .line 626
    iget-object v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mTag:Lit/sephiroth/android/library/exif2/ExifTag;

    invoke-direct {p0, v4}, Lit/sephiroth/android/library/exif2/ExifParser;->checkOffsetOrImageTag(Lit/sephiroth/android/library/exif2/ExifTag;)V

    goto :goto_18

    .line 630
    :cond_2c
    invoke-direct {p0, v0}, Lit/sephiroth/android/library/exif2/ExifParser;->skipTo(I)V

    .line 632
    :cond_2f
    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->readUnsignedLong()J

    move-result-wide v2

    .line 634
    .local v2, "ifdOffset":J
    iget v4, p0, Lit/sephiroth/android/library/exif2/ExifParser;->mIfdType:I

    if-nez v4, :cond_13

    invoke-direct {p0, v6}, Lit/sephiroth/android/library/exif2/ExifParser;->isIfdRequested(I)Z

    move-result v4

    if-nez v4, :cond_43

    invoke-direct {p0}, Lit/sephiroth/android/library/exif2/ExifParser;->isThumbnailRequested()Z

    move-result v4

    if-eqz v4, :cond_13

    .line 635
    :cond_43
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_13

    .line 636
    invoke-direct {p0, v6, v2, v3}, Lit/sephiroth/android/library/exif2/ExifParser;->registerIfd(IJ)V

    goto :goto_13
.end method
