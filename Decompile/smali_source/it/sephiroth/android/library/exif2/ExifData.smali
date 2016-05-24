.class Lit/sephiroth/android/library/exif2/ExifData;
.super Ljava/lang/Object;
.source "ExifData.java"


# static fields
.field private static final USER_COMMENT_ASCII:[B

.field private static final USER_COMMENT_JIS:[B

.field private static final USER_COMMENT_UNICODE:[B


# instance fields
.field private imageLength:I

.field private imageWidth:I

.field private jpegProcess:S

.field private final mByteOrder:Ljava/nio/ByteOrder;

.field private final mIfdDatas:[Lit/sephiroth/android/library/exif2/IfdData;

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

.field private mStripBytes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[B>;"
        }
    .end annotation
.end field

.field private mThumbnail:[B

.field public mUncompressedDataPosition:I

.field private qualityGuess:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/16 v1, 0x8

    .line 36
    new-array v0, v1, [B

    fill-array-data v0, :array_18

    sput-object v0, Lit/sephiroth/android/library/exif2/ExifData;->USER_COMMENT_ASCII:[B

    .line 37
    new-array v0, v1, [B

    fill-array-data v0, :array_20

    sput-object v0, Lit/sephiroth/android/library/exif2/ExifData;->USER_COMMENT_JIS:[B

    .line 38
    new-array v0, v1, [B

    fill-array-data v0, :array_28

    sput-object v0, Lit/sephiroth/android/library/exif2/ExifData;->USER_COMMENT_UNICODE:[B

    return-void

    .line 36
    :array_18
    .array-data 1
        0x41t
        0x53t
        0x43t
        0x49t
        0x49t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 37
    :array_20
    .array-data 1
        0x4at
        0x49t
        0x53t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 38
    :array_28
    .array-data 1
        0x55t
        0x4et
        0x49t
        0x43t
        0x4ft
        0x44t
        0x45t
        0x0t
    .end array-data
.end method

.method constructor <init>(Ljava/nio/ByteOrder;)V
    .registers 5
    .param p1, "order"    # Ljava/nio/ByteOrder;

    .prologue
    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x5

    new-array v0, v0, [Lit/sephiroth/android/library/exif2/IfdData;

    iput-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mIfdDatas:[Lit/sephiroth/android/library/exif2/IfdData;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    .line 45
    iput v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->qualityGuess:I

    .line 46
    iput v2, p0, Lit/sephiroth/android/library/exif2/ExifData;->imageLength:I

    iput v2, p0, Lit/sephiroth/android/library/exif2/ExifData;->imageWidth:I

    .line 47
    iput-short v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->jpegProcess:S

    .line 48
    iput v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mUncompressedDataPosition:I

    .line 51
    iput-object p1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    .line 52
    return-void
.end method


# virtual methods
.method protected addIfdData(Lit/sephiroth/android/library/exif2/IfdData;)V
    .registers 4
    .param p1, "data"    # Lit/sephiroth/android/library/exif2/IfdData;

    .prologue
    .line 128
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mIfdDatas:[Lit/sephiroth/android/library/exif2/IfdData;

    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/IfdData;->getId()I

    move-result v1

    aput-object p1, v0, v1

    .line 129
    return-void
.end method

.method protected addTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;
    .registers 4
    .param p1, "tag"    # Lit/sephiroth/android/library/exif2/ExifTag;

    .prologue
    .line 145
    if-eqz p1, :cond_b

    .line 146
    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getIfd()I

    move-result v0

    .line 147
    .local v0, "ifd":I
    invoke-virtual {p0, p1, v0}, Lit/sephiroth/android/library/exif2/ExifData;->addTag(Lit/sephiroth/android/library/exif2/ExifTag;I)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v1

    .line 149
    .end local v0    # "ifd":I
    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method protected addTag(Lit/sephiroth/android/library/exif2/ExifTag;I)Lit/sephiroth/android/library/exif2/ExifTag;
    .registers 5
    .param p1, "tag"    # Lit/sephiroth/android/library/exif2/ExifTag;
    .param p2, "ifdId"    # I

    .prologue
    .line 157
    if-eqz p1, :cond_11

    invoke-static {p2}, Lit/sephiroth/android/library/exif2/ExifTag;->isValidIfd(I)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 158
    invoke-virtual {p0, p2}, Lit/sephiroth/android/library/exif2/ExifData;->getOrCreateIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v0

    .line 159
    .local v0, "ifdData":Lit/sephiroth/android/library/exif2/IfdData;
    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/exif2/IfdData;->setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v1

    .line 161
    .end local v0    # "ifdData":Lit/sephiroth/android/library/exif2/IfdData;
    :goto_10
    return-object v1

    :cond_11
    const/4 v1, 0x0

    goto :goto_10
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 310
    if-ne p0, p1, :cond_6

    move v4, v6

    .line 337
    :goto_5
    return v4

    .line 313
    :cond_6
    if-nez p1, :cond_a

    move v4, v7

    .line 314
    goto :goto_5

    .line 316
    :cond_a
    instance-of v4, p1, Lit/sephiroth/android/library/exif2/ExifData;

    if-eqz v4, :cond_72

    move-object v0, p1

    .line 317
    check-cast v0, Lit/sephiroth/android/library/exif2/ExifData;

    .line 318
    .local v0, "data":Lit/sephiroth/android/library/exif2/ExifData;
    iget-object v4, v0, Lit/sephiroth/android/library/exif2/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    iget-object v5, p0, Lit/sephiroth/android/library/exif2/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    if-ne v4, v5, :cond_2f

    iget-object v4, v0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget-object v5, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v4, v5, :cond_2f

    iget-object v4, v0, Lit/sephiroth/android/library/exif2/ExifData;->mThumbnail:[B

    iget-object v5, p0, Lit/sephiroth/android/library/exif2/ExifData;->mThumbnail:[B

    invoke-static {v4, v5}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-nez v4, :cond_31

    :cond_2f
    move v4, v7

    .line 321
    goto :goto_5

    .line 323
    :cond_31
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_32
    iget-object v4, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_55

    .line 324
    iget-object v4, v0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    iget-object v5, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    invoke-static {v4, v5}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-nez v4, :cond_52

    move v4, v7

    .line 325
    goto :goto_5

    .line 323
    :cond_52
    add-int/lit8 v1, v1, 0x1

    goto :goto_32

    .line 328
    :cond_55
    const/4 v1, 0x0

    :goto_56
    const/4 v4, 0x5

    if-ge v1, v4, :cond_70

    .line 329
    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v2

    .line 330
    .local v2, "ifd1":Lit/sephiroth/android/library/exif2/IfdData;
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/exif2/ExifData;->getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;

    move-result-object v3

    .line 331
    .local v3, "ifd2":Lit/sephiroth/android/library/exif2/IfdData;
    if-eq v2, v3, :cond_6d

    if-eqz v2, :cond_6d

    invoke-virtual {v2, v3}, Lit/sephiroth/android/library/exif2/IfdData;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6d

    move v4, v7

    .line 332
    goto :goto_5

    .line 328
    :cond_6d
    add-int/lit8 v1, v1, 0x1

    goto :goto_56

    .end local v2    # "ifd1":Lit/sephiroth/android/library/exif2/IfdData;
    .end local v3    # "ifd2":Lit/sephiroth/android/library/exif2/IfdData;
    :cond_70
    move v4, v6

    .line 335
    goto :goto_5

    .end local v0    # "data":Lit/sephiroth/android/library/exif2/ExifData;
    .end local v1    # "i":I
    :cond_72
    move v4, v7

    .line 337
    goto :goto_5
.end method

.method protected getAllTags()Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/exif2/ExifTag;",
            ">;"
        }
    .end annotation

    .prologue
    .line 248
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 249
    .local v7, "ret":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lit/sephiroth/android/library/exif2/ExifTag;>;"
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mIfdDatas:[Lit/sephiroth/android/library/exif2/IfdData;

    .local v0, "arr$":[Lit/sephiroth/android/library/exif2/IfdData;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    move v4, v3

    .end local v0    # "arr$":[Lit/sephiroth/android/library/exif2/IfdData;
    .end local v3    # "i$":I
    .end local v5    # "len$":I
    .local v4, "i$":I
    :goto_a
    if-ge v4, v5, :cond_27

    aget-object v2, v0, v4

    .line 250
    .local v2, "d":Lit/sephiroth/android/library/exif2/IfdData;
    if-eqz v2, :cond_23

    .line 251
    invoke-virtual {v2}, Lit/sephiroth/android/library/exif2/IfdData;->getAllTags()[Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v9

    .line 252
    .local v9, "tags":[Lit/sephiroth/android/library/exif2/ExifTag;
    if-eqz v9, :cond_23

    .line 253
    move-object v1, v9

    .local v1, "arr$":[Lit/sephiroth/android/library/exif2/ExifTag;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v3, 0x0

    .end local v4    # "i$":I
    .restart local v3    # "i$":I
    :goto_19
    if-ge v3, v6, :cond_23

    aget-object v8, v1, v3

    .line 254
    .local v8, "t":Lit/sephiroth/android/library/exif2/ExifTag;
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 253
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 249
    .end local v1    # "arr$":[Lit/sephiroth/android/library/exif2/ExifTag;
    .end local v3    # "i$":I
    .end local v6    # "len$":I
    .end local v8    # "t":Lit/sephiroth/android/library/exif2/ExifTag;
    .end local v9    # "tags":[Lit/sephiroth/android/library/exif2/ExifTag;
    :cond_23
    add-int/lit8 v3, v4, 0x1

    .restart local v3    # "i$":I
    move v4, v3

    .end local v3    # "i$":I
    .restart local v4    # "i$":I
    goto :goto_a

    .line 259
    .end local v2    # "d":Lit/sephiroth/android/library/exif2/IfdData;
    :cond_27
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-nez v10, :cond_2e

    .line 260
    const/4 v7, 0x0

    .line 262
    .end local v7    # "ret":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lit/sephiroth/android/library/exif2/ExifTag;>;"
    :cond_2e
    return-object v7
.end method

.method protected getByteOrder()Ljava/nio/ByteOrder;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mByteOrder:Ljava/nio/ByteOrder;

    return-object v0
.end method

.method protected getCompressedThumbnail()[B
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mThumbnail:[B

    return-object v0
.end method

.method protected getIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;
    .registers 3
    .param p1, "ifdId"    # I

    .prologue
    .line 345
    invoke-static {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->isValidIfd(I)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 346
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mIfdDatas:[Lit/sephiroth/android/library/exif2/IfdData;

    aget-object v0, v0, p1

    .line 348
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getImageSize()[I
    .registers 4

    .prologue
    .line 365
    const/4 v0, 0x2

    new-array v0, v0, [I

    const/4 v1, 0x0

    iget v2, p0, Lit/sephiroth/android/library/exif2/ExifData;->imageWidth:I

    aput v2, v0, v1

    const/4 v1, 0x1

    iget v2, p0, Lit/sephiroth/android/library/exif2/ExifData;->imageLength:I

    aput v2, v0, v1

    return-object v0
.end method

.method protected getOrCreateIfdData(I)Lit/sephiroth/android/library/exif2/IfdData;
    .registers 4
    .param p1, "ifdId"    # I

    .prologue
    .line 169
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mIfdDatas:[Lit/sephiroth/android/library/exif2/IfdData;

    aget-object v0, v1, p1

    .line 170
    .local v0, "ifdData":Lit/sephiroth/android/library/exif2/IfdData;
    if-nez v0, :cond_f

    .line 171
    new-instance v0, Lit/sephiroth/android/library/exif2/IfdData;

    .end local v0    # "ifdData":Lit/sephiroth/android/library/exif2/IfdData;
    invoke-direct {v0, p1}, Lit/sephiroth/android/library/exif2/IfdData;-><init>(I)V

    .line 172
    .restart local v0    # "ifdData":Lit/sephiroth/android/library/exif2/IfdData;
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mIfdDatas:[Lit/sephiroth/android/library/exif2/IfdData;

    aput-object v0, v1, p1

    .line 174
    :cond_f
    return-object v0
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
    .line 381
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mSections:Ljava/util/List;

    return-object v0
.end method

.method protected getStrip(I)[B
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 106
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method protected getStripCount()I
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method protected getTag(SI)Lit/sephiroth/android/library/exif2/ExifTag;
    .registers 5
    .param p1, "tag"    # S
    .param p2, "ifd"    # I

    .prologue
    .line 136
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mIfdDatas:[Lit/sephiroth/android/library/exif2/IfdData;

    aget-object v0, v1, p2

    .line 137
    .local v0, "ifdData":Lit/sephiroth/android/library/exif2/IfdData;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return-object v1

    :cond_8
    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/exif2/IfdData;->getTag(S)Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v1

    goto :goto_7
.end method

.method protected hasCompressedThumbnail()Z
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mThumbnail:[B

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected hasUncompressedStrip()Z
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected removeTag(SI)V
    .registers 5
    .param p1, "tagId"    # S
    .param p2, "ifdId"    # I

    .prologue
    .line 194
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mIfdDatas:[Lit/sephiroth/android/library/exif2/IfdData;

    aget-object v0, v1, p2

    .line 195
    .local v0, "ifdData":Lit/sephiroth/android/library/exif2/IfdData;
    if-nez v0, :cond_7

    .line 199
    :goto_6
    return-void

    .line 198
    :cond_7
    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/exif2/IfdData;->removeTag(S)V

    goto :goto_6
.end method

.method protected setCompressedThumbnail([B)V
    .registers 2
    .param p1, "thumbnail"    # [B

    .prologue
    .line 68
    iput-object p1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mThumbnail:[B

    .line 69
    return-void
.end method

.method protected setImageSize(II)V
    .registers 3
    .param p1, "imageWidth"    # I
    .param p2, "imageLength"    # I

    .prologue
    .line 360
    iput p1, p0, Lit/sephiroth/android/library/exif2/ExifData;->imageWidth:I

    .line 361
    iput p2, p0, Lit/sephiroth/android/library/exif2/ExifData;->imageLength:I

    .line 362
    return-void
.end method

.method public setJpegProcess(S)V
    .registers 2
    .param p1, "jpegProcess"    # S

    .prologue
    .line 369
    iput-short p1, p0, Lit/sephiroth/android/library/exif2/ExifData;->jpegProcess:S

    .line 370
    return-void
.end method

.method protected setQualityGuess(I)V
    .registers 2
    .param p1, "qualityGuess"    # I

    .prologue
    .line 352
    iput p1, p0, Lit/sephiroth/android/library/exif2/ExifData;->qualityGuess:I

    .line 353
    return-void
.end method

.method public setSections(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/exif2/ExifParser$Section;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 377
    .local p1, "sections":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/exif2/ExifParser$Section;>;"
    iput-object p1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mSections:Ljava/util/List;

    .line 378
    return-void
.end method

.method protected setStripBytes(I[B)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "strip"    # [B

    .prologue
    .line 82
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_e

    .line 83
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v1, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 91
    :goto_d
    return-void

    .line 86
    :cond_e
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, "i":I
    :goto_14
    if-ge v0, p1, :cond_1f

    .line 87
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 89
    :cond_1f
    iget-object v1, p0, Lit/sephiroth/android/library/exif2/ExifData;->mStripBytes:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d
.end method
