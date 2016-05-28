.class public Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
.super Ljava/lang/Object;
.source "ImageInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final decodedSize:[I

.field exifTagList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/exif2/ExifTag;",
            ">;"
        }
    .end annotation
.end field

.field orientation:I

.field final originalSize:[I

.field palette:Landroid/support/v7/graphics/Palette;

.field uri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 129
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo$1;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo$1;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x2

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-array v0, v1, [I

    fill-array-data v0, :array_14

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->originalSize:[I

    .line 21
    new-array v0, v1, [I

    fill-array-data v0, :array_1c

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->decodedSize:[I

    .line 27
    return-void

    .line 19
    nop

    :array_14
    .array-data 4
        -0x1
        -0x1
    .end array-data

    .line 21
    :array_1c
    .array-data 4
        -0x1
        -0x1
    .end array-data
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x2

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-array v0, v1, [I

    fill-array-data v0, :array_32

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->originalSize:[I

    .line 21
    new-array v0, v1, [I

    fill-array-data v0, :array_3a

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->decodedSize:[I

    .line 30
    const-class v0, Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->uri:Landroid/net/Uri;

    .line 31
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->originalSize:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readIntArray([I)V

    .line 32
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->decodedSize:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readIntArray([I)V

    .line 33
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->orientation:I

    .line 34
    return-void

    .line 19
    nop

    :array_32
    .array-data 4
        -0x1
        -0x1
    .end array-data

    .line 21
    :array_3a
    .array-data 4
        -0x1
        -0x1
    .end array-data
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 118
    const/4 v0, 0x0

    return v0
.end method

.method public getExifTagList()Ljava/util/List;
    .registers 2
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
    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->exifTagList:Ljava/util/List;

    return-object v0
.end method

.method public getOrientation()I
    .registers 2

    .prologue
    .line 99
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->orientation:I

    return v0
.end method

.method public getOriginalSize()[I
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->originalSize:[I

    return-object v0
.end method

.method public getPalette()Landroid/support/v7/graphics/Palette;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->palette:Landroid/support/v7/graphics/Palette;

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->uri:Landroid/net/Uri;

    return-object v0
.end method

.method public setDecodedSize(II)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 85
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->decodedSize:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 86
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->decodedSize:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 87
    return-void
.end method

.method public setExifTagList(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/exif2/ExifTag;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, "tags":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/exif2/ExifTag;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->exifTagList:Ljava/util/List;

    .line 54
    return-void
.end method

.method public setOrientation(I)V
    .registers 2
    .param p1, "orientation"    # I

    .prologue
    .line 66
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->orientation:I

    .line 67
    return-void
.end method

.method public setOriginalSize(II)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->originalSize:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 71
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->originalSize:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 72
    return-void
.end method

.method public setPalette(Landroid/support/v7/graphics/Palette;)V
    .registers 2
    .param p1, "palette"    # Landroid/support/v7/graphics/Palette;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->palette:Landroid/support/v7/graphics/Palette;

    .line 38
    return-void
.end method

.method public setUri(Landroid/net/Uri;)V
    .registers 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->uri:Landroid/net/Uri;

    .line 46
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v6, 0x1

    const/4 v0, 0x0

    .line 104
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "ImageInfo{uri:%s, orientation:%d, originalSize:%dx%d, decodedSize:%dx%d, tags:%d}"

    const/4 v3, 0x7

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->uri:Landroid/net/Uri;

    aput-object v4, v3, v0

    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->orientation:I

    .line 108
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->originalSize:[I

    aget v5, v5, v0

    .line 109
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->originalSize:[I

    aget v5, v5, v6

    .line 110
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->decodedSize:[I

    aget v5, v5, v0

    .line 111
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->decodedSize:[I

    aget v5, v5, v6

    .line 112
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x6

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->exifTagList:Ljava/util/List;

    if-eqz v5, :cond_4c

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->exifTagList:Ljava/util/List;

    .line 113
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :cond_4c
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v4

    .line 104
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 123
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->uri:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->originalSize:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 125
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->decodedSize:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 126
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->orientation:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 127
    return-void
.end method
