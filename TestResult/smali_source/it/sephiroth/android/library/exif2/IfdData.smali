.class Lit/sephiroth/android/library/exif2/IfdData;
.super Ljava/lang/Object;
.source "IfdData.java"


# static fields
.field private static final sIfds:[I


# instance fields
.field private final mExifTags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Short;",
            "Lit/sephiroth/android/library/exif2/ExifTag;",
            ">;"
        }
    .end annotation
.end field

.field private final mIfdId:I

.field private mOffsetToNextIfd:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lit/sephiroth/android/library/exif2/IfdData;->sIfds:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
    .end array-data
.end method

.method constructor <init>(I)V
    .registers 3
    .param p1, "ifdId"    # I

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/exif2/IfdData;->mExifTags:Ljava/util/Map;

    .line 33
    const/4 v0, 0x0

    iput v0, p0, Lit/sephiroth/android/library/exif2/IfdData;->mOffsetToNextIfd:I

    .line 45
    iput p1, p0, Lit/sephiroth/android/library/exif2/IfdData;->mIfdId:I

    .line 46
    return-void
.end method

.method protected static getIfds()[I
    .registers 1

    .prologue
    .line 49
    sget-object v0, Lit/sephiroth/android/library/exif2/IfdData;->sIfds:[I

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 13
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 99
    if-ne p0, p1, :cond_5

    .line 121
    :cond_4
    :goto_4
    return v7

    .line 102
    :cond_5
    if-nez p1, :cond_9

    move v7, v8

    .line 103
    goto :goto_4

    .line 105
    :cond_9
    instance-of v9, p1, Lit/sephiroth/android/library/exif2/IfdData;

    if-eqz v9, :cond_52

    move-object v1, p1

    .line 106
    check-cast v1, Lit/sephiroth/android/library/exif2/IfdData;

    .line 107
    .local v1, "data":Lit/sephiroth/android/library/exif2/IfdData;
    invoke-virtual {v1}, Lit/sephiroth/android/library/exif2/IfdData;->getId()I

    move-result v9

    iget v10, p0, Lit/sephiroth/android/library/exif2/IfdData;->mIfdId:I

    if-ne v9, v10, :cond_52

    invoke-virtual {v1}, Lit/sephiroth/android/library/exif2/IfdData;->getTagCount()I

    move-result v9

    invoke-virtual {p0}, Lit/sephiroth/android/library/exif2/IfdData;->getTagCount()I

    move-result v10

    if-ne v9, v10, :cond_52

    .line 108
    invoke-virtual {v1}, Lit/sephiroth/android/library/exif2/IfdData;->getAllTags()[Lit/sephiroth/android/library/exif2/ExifTag;

    move-result-object v6

    .line 109
    .local v6, "tags":[Lit/sephiroth/android/library/exif2/ExifTag;
    move-object v0, v6

    .local v0, "arr$":[Lit/sephiroth/android/library/exif2/ExifTag;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_29
    if-ge v2, v3, :cond_4

    aget-object v4, v0, v2

    .line 110
    .local v4, "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifTag;->getTagId()S

    move-result v9

    invoke-static {v9}, Lit/sephiroth/android/library/exif2/ExifInterface;->isOffsetTag(S)Z

    move-result v9

    if-eqz v9, :cond_3a

    .line 109
    :cond_37
    add-int/lit8 v2, v2, 0x1

    goto :goto_29

    .line 113
    :cond_3a
    iget-object v9, p0, Lit/sephiroth/android/library/exif2/IfdData;->mExifTags:Ljava/util/Map;

    invoke-virtual {v4}, Lit/sephiroth/android/library/exif2/ExifTag;->getTagId()S

    move-result v10

    invoke-static {v10}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lit/sephiroth/android/library/exif2/ExifTag;

    .line 114
    .local v5, "tag2":Lit/sephiroth/android/library/exif2/ExifTag;
    invoke-virtual {v4, v5}, Lit/sephiroth/android/library/exif2/ExifTag;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_37

    move v7, v8

    .line 115
    goto :goto_4

    .end local v0    # "arr$":[Lit/sephiroth/android/library/exif2/ExifTag;
    .end local v1    # "data":Lit/sephiroth/android/library/exif2/IfdData;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "tag":Lit/sephiroth/android/library/exif2/ExifTag;
    .end local v5    # "tag2":Lit/sephiroth/android/library/exif2/ExifTag;
    .end local v6    # "tags":[Lit/sephiroth/android/library/exif2/ExifTag;
    :cond_52
    move v7, v8

    .line 121
    goto :goto_4
.end method

.method protected getAllTags()[Lit/sephiroth/android/library/exif2/ExifTag;
    .registers 3

    .prologue
    .line 148
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/IfdData;->mExifTags:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    iget-object v1, p0, Lit/sephiroth/android/library/exif2/IfdData;->mExifTags:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    new-array v1, v1, [Lit/sephiroth/android/library/exif2/ExifTag;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lit/sephiroth/android/library/exif2/ExifTag;

    return-object v0
.end method

.method protected getId()I
    .registers 2

    .prologue
    .line 141
    iget v0, p0, Lit/sephiroth/android/library/exif2/IfdData;->mIfdId:I

    return v0
.end method

.method protected getOffsetToNextIfd()I
    .registers 2

    .prologue
    .line 83
    iget v0, p0, Lit/sephiroth/android/library/exif2/IfdData;->mOffsetToNextIfd:I

    return v0
.end method

.method protected getTag(S)Lit/sephiroth/android/library/exif2/ExifTag;
    .registers 4
    .param p1, "tagId"    # S

    .prologue
    .line 57
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/IfdData;->mExifTags:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/exif2/ExifTag;

    return-object v0
.end method

.method protected getTagCount()I
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/IfdData;->mExifTags:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method protected removeTag(S)V
    .registers 4
    .param p1, "tagId"    # S

    .prologue
    .line 76
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/IfdData;->mExifTags:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    return-void
.end method

.method protected setOffsetToNextIfd(I)V
    .registers 2
    .param p1, "offset"    # I

    .prologue
    .line 90
    iput p1, p0, Lit/sephiroth/android/library/exif2/IfdData;->mOffsetToNextIfd:I

    .line 91
    return-void
.end method

.method protected setTag(Lit/sephiroth/android/library/exif2/ExifTag;)Lit/sephiroth/android/library/exif2/ExifTag;
    .registers 4
    .param p1, "tag"    # Lit/sephiroth/android/library/exif2/ExifTag;

    .prologue
    .line 64
    iget v0, p0, Lit/sephiroth/android/library/exif2/IfdData;->mIfdId:I

    invoke-virtual {p1, v0}, Lit/sephiroth/android/library/exif2/ExifTag;->setIfd(I)V

    .line 65
    iget-object v0, p0, Lit/sephiroth/android/library/exif2/IfdData;->mExifTags:Ljava/util/Map;

    invoke-virtual {p1}, Lit/sephiroth/android/library/exif2/ExifTag;->getTagId()S

    move-result v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/exif2/ExifTag;

    return-object v0
.end method
