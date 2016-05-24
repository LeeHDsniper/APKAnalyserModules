.class public Lcom/behance/sdk/project/modules/ImageModule;
.super Lcom/behance/sdk/project/modules/BaseModule;
.source "ImageModule.java"


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;

.field private static final serialVersionUID:J = 0x4e38aef794224c43L


# instance fields
.field private albumName:Ljava/lang/String;

.field private transient bitmap:Landroid/graphics/Bitmap;

.field private defaultThumbnailRotationApplied:Z

.field private file:Ljava/io/File;

.field private height:I

.field private id:J

.field private rotation:I

.field private sizeInBytes:J

.field private transient thumbnail:Landroid/graphics/Bitmap;

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    const-class v0, Lcom/behance/sdk/project/modules/ImageModule;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/project/modules/ImageModule;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;)V
    .registers 7
    .param p1, "id"    # J
    .param p3, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 64
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/BaseModule;-><init>()V

    .line 53
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->id:J

    .line 60
    iput v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    .line 61
    iput-boolean v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->defaultThumbnailRotationApplied:Z

    .line 65
    iput-wide p1, p0, Lcom/behance/sdk/project/modules/ImageModule;->id:J

    .line 66
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/behance/sdk/project/modules/ImageModule;->setFile(Ljava/io/File;)V

    .line 67
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/ImageModule;->computeImageDimensions()V

    .line 68
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getDefaultOrientation()V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 5
    .param p1, "imageFile"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x0

    .line 71
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/BaseModule;-><init>()V

    .line 53
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->id:J

    .line 60
    iput v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    .line 61
    iput-boolean v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->defaultThumbnailRotationApplied:Z

    .line 72
    invoke-direct {p0, p1}, Lcom/behance/sdk/project/modules/ImageModule;->setFile(Ljava/io/File;)V

    .line 73
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/ImageModule;->computeImageDimensions()V

    .line 74
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getDefaultOrientation()V

    .line 75
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/project/modules/ImageModule;)Landroid/graphics/Bitmap;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$002(Lcom/behance/sdk/project/modules/ImageModule;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/project/modules/ImageModule;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$100(Lcom/behance/sdk/project/modules/ImageModule;Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
    .registers 3
    .param p0, "x0"    # Lcom/behance/sdk/project/modules/ImageModule;
    .param p1, "x1"    # Landroid/widget/ImageView;
    .param p2, "x2"    # Landroid/graphics/Bitmap;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/project/modules/ImageModule;->setImageViewLayerType(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method private computeImageDimensions()V
    .registers 5

    .prologue
    .line 78
    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    if-eqz v1, :cond_38

    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_38

    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_38

    .line 79
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 80
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 81
    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 82
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-direct {p0, v1}, Lcom/behance/sdk/project/modules/ImageModule;->setWidth(I)V

    .line 83
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {p0, v1}, Lcom/behance/sdk/project/modules/ImageModule;->setHeight(I)V

    .line 84
    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/behance/sdk/project/modules/ImageModule;->setSizeInBytes(J)V

    .line 86
    .end local v0    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_38
    return-void
.end method

.method private equalObject(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "first"    # Ljava/lang/Object;
    .param p2, "second"    # Ljava/lang/Object;

    .prologue
    .line 258
    if-ne p1, p2, :cond_4

    .line 259
    const/4 v0, 0x1

    .line 263
    :goto_3
    return v0

    .line 260
    :cond_4
    if-eqz p1, :cond_8

    if-eqz p2, :cond_c

    :cond_8
    if-nez p1, :cond_e

    if-eqz p2, :cond_e

    .line 261
    :cond_c
    const/4 v0, 0x0

    goto :goto_3

    .line 263
    :cond_e
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method private getDefaultOrientation()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 142
    iget-boolean v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->defaultThumbnailRotationApplied:Z

    if-eqz v3, :cond_a

    iget-object v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    if-nez v3, :cond_22

    .line 144
    :cond_a
    :try_start_a
    new-instance v1, Landroid/media/ExifInterface;

    iget-object v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 145
    .local v1, "exif":Landroid/media/ExifInterface;
    const-string v3, "Orientation"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v2

    .line 146
    .local v2, "exifOrientation":I
    packed-switch v2, :pswitch_data_40

    .line 160
    :goto_1f
    :pswitch_1f
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->defaultThumbnailRotationApplied:Z

    .line 165
    .end local v1    # "exif":Landroid/media/ExifInterface;
    .end local v2    # "exifOrientation":I
    :cond_22
    :goto_22
    return-void

    .line 148
    .restart local v1    # "exif":Landroid/media/ExifInterface;
    .restart local v2    # "exifOrientation":I
    :pswitch_23
    const/4 v3, 0x0

    iput v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_26} :catch_27

    goto :goto_1f

    .line 161
    .end local v1    # "exif":Landroid/media/ExifInterface;
    .end local v2    # "exifOrientation":I
    :catch_27
    move-exception v0

    .line 162
    .local v0, "e":Ljava/io/IOException;
    sget-object v3, Lcom/behance/sdk/project/modules/ImageModule;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v4, "Exception while getting the default orientation"

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_22

    .line 151
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "exif":Landroid/media/ExifInterface;
    .restart local v2    # "exifOrientation":I
    :pswitch_34
    const/4 v3, 0x1

    :try_start_35
    iput v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    goto :goto_1f

    .line 154
    :pswitch_38
    const/4 v3, 0x2

    iput v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    goto :goto_1f

    .line 157
    :pswitch_3c
    const/4 v3, 0x3

    iput v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_3f} :catch_27

    goto :goto_1f

    .line 146
    :pswitch_data_40
    .packed-switch 0x1
        :pswitch_23
        :pswitch_1f
        :pswitch_38
        :pswitch_1f
        :pswitch_1f
        :pswitch_34
        :pswitch_1f
        :pswitch_3c
    .end packed-switch
.end method

.method private getFilePath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getImageUrl()Ljava/lang/String;
    .registers 4

    .prologue
    .line 354
    iget-object v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 355
    .local v0, "fromFile":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 356
    .local v1, "imageUrl":Ljava/lang/String;
    return-object v1
.end method

.method private getThumbNailFromFile()Landroid/graphics/Bitmap;
    .registers 12

    .prologue
    const/4 v10, 0x1

    .line 190
    const/16 v7, 0x190

    .line 191
    .local v7, "targetW":I
    const/16 v6, 0x190

    .line 194
    .local v6, "targetH":I
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 195
    .local v2, "bmOptions":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v10, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 196
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getFilePath()Ljava/lang/String;

    move-result-object v0

    .line 198
    .local v0, "absolutePath":Ljava/lang/String;
    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 199
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 200
    .local v4, "photoW":I
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 203
    .local v3, "photoH":I
    div-int v8, v4, v7

    div-int v9, v3, v6

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 206
    .local v5, "scaleFactor":I
    const/4 v8, 0x0

    iput-boolean v8, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 207
    iput v5, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 208
    iput-boolean v10, v2, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 210
    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 211
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    return-object v1
.end method

.method private savebitmap(Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/io/File;
    .registers 8
    .param p1, "bmp"    # Landroid/graphics/Bitmap;
    .param p2, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 310
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    .line 311
    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    .line 312
    .local v0, "extStorageDirectory":Ljava/lang/String;
    const/4 v2, 0x0

    .line 313
    .local v2, "outStream":Ljava/io/OutputStream;
    new-instance v1, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_temp"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    .local v1, "newFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 315
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 317
    :cond_2a
    new-instance v2, Ljava/io/FileOutputStream;

    .end local v2    # "outStream":Ljava/io/OutputStream;
    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 318
    .restart local v2    # "outStream":Ljava/io/OutputStream;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {p1, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 319
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 320
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 321
    return-object v1
.end method

.method private setFile(Ljava/io/File;)V
    .registers 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 123
    iput-object p1, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    .line 124
    return-void
.end method

.method private setHeight(I)V
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 338
    iput p1, p0, Lcom/behance/sdk/project/modules/ImageModule;->height:I

    .line 339
    return-void
.end method

.method private setImageViewLayerType(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "loadedBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x800

    .line 404
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    if-gt v0, v1, :cond_f

    .line 405
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-le v0, v1, :cond_14

    .line 406
    :cond_f
    const/4 v0, 0x1

    invoke-virtual {p1, v0, v2}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 410
    :goto_13
    return-void

    .line 408
    :cond_14
    const/4 v0, 0x2

    invoke-virtual {p1, v0, v2}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_13
.end method

.method private setWidth(I)V
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 330
    iput p1, p0, Lcom/behance/sdk/project/modules/ImageModule;->width:I

    .line 331
    return-void
.end method

.method private updateThumbnailForDefaultRotation()V
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 168
    iget v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    if-lez v0, :cond_2d

    .line 169
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 171
    .local v5, "matrix":Landroid/graphics/Matrix;
    iget v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    mul-int/lit8 v0, v0, 0x5a

    int-to-float v0, v0

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 172
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 173
    .local v7, "updatedThumbnail":Landroid/graphics/Bitmap;
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 174
    iput-object v7, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    .line 176
    .end local v5    # "matrix":Landroid/graphics/Matrix;
    .end local v7    # "updatedThumbnail":Landroid/graphics/Bitmap;
    :cond_2d
    return-void
.end method

.method private updateThumbnailForRotation(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 10
    .param p1, "thumbnailBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v1, 0x0

    .line 180
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 182
    .local v5, "matrix":Landroid/graphics/Matrix;
    const/high16 v0, 0x42b40000

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 183
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p1

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 184
    .local v7, "updatedThumbnail":Landroid/graphics/Bitmap;
    return-object v7
.end method


# virtual methods
.method public clear()V
    .registers 1

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/behance/sdk/project/modules/ImageModule;->clearRotation()V

    .line 92
    return-void
.end method

.method public clearRotation()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 291
    iput v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    .line 292
    iput-boolean v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->defaultThumbnailRotationApplied:Z

    .line 293
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getDefaultOrientation()V

    .line 294
    invoke-virtual {p0}, Lcom/behance/sdk/project/modules/ImageModule;->recycleBitmaps()V

    .line 295
    return-void
.end method

.method public displayImage(Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V
    .registers 4
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "listener"    # Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    .prologue
    .line 350
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKImageLoaderUtils;->getDefaultImageLoaderOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/behance/sdk/project/modules/ImageModule;->displayImage(Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 351
    return-void
.end method

.method public displayImage(Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .registers 7
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "listener"    # Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;
    .param p3, "options"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    .prologue
    .line 361
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getImageUrl()Ljava/lang/String;

    move-result-object v0

    .line 362
    .local v0, "imageUrl":Ljava/lang/String;
    iget-object v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;

    if-nez v2, :cond_12

    .line 363
    move-object v1, p0

    .line 364
    .local v1, "module":Lcom/behance/sdk/project/modules/ImageModule;
    new-instance v2, Lcom/behance/sdk/project/modules/ImageModule$1;

    invoke-direct {v2, p0, p2, v1, p1}, Lcom/behance/sdk/project/modules/ImageModule$1;-><init>(Lcom/behance/sdk/project/modules/ImageModule;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/behance/sdk/project/modules/ImageModule;Landroid/widget/ImageView;)V

    invoke-static {v0, p1, v2, p3}, Lcom/behance/sdk/util/BehanceSDKImageLoaderUtils;->displayImageFromCacheOrLoadFromServer(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 401
    .end local v1    # "module":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_11
    :goto_11
    return-void

    .line 395
    :cond_12
    iget-object v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0, p1, v2}, Lcom/behance/sdk/project/modules/ImageModule;->setImageViewLayerType(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)V

    .line 396
    iget-object v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 397
    if-eqz p2, :cond_11

    .line 398
    iget-object v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;

    invoke-interface {p2, v0, p1, v2}, Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;->onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V

    goto :goto_11
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 248
    if-ne p0, p1, :cond_5

    .line 253
    :cond_4
    :goto_4
    return v1

    .line 250
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 251
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 252
    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    .line 253
    .local v0, "objLocalImage":Lcom/behance/sdk/project/modules/ImageModule;
    iget-wide v4, p0, Lcom/behance/sdk/project/modules/ImageModule;->id:J

    iget-wide v6, v0, Lcom/behance/sdk/project/modules/ImageModule;->id:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_44

    iget-object v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    iget-object v4, v0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    invoke-direct {p0, v3, v4}, Lcom/behance/sdk/project/modules/ImageModule;->equalObject(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_44

    iget-object v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->albumName:Ljava/lang/String;

    iget-object v4, v0, Lcom/behance/sdk/project/modules/ImageModule;->albumName:Ljava/lang/String;

    invoke-direct {p0, v3, v4}, Lcom/behance/sdk/project/modules/ImageModule;->equalObject(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_44

    iget v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    iget v4, v0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    if-ne v3, v4, :cond_44

    iget v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->width:I

    iget v4, v0, Lcom/behance/sdk/project/modules/ImageModule;->width:I

    if-ne v3, v4, :cond_44

    iget v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->height:I

    iget v4, v0, Lcom/behance/sdk/project/modules/ImageModule;->height:I

    if-eq v3, v4, :cond_4

    :cond_44
    move v1, v2

    goto :goto_4
.end method

.method public getAlbumName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->albumName:Ljava/lang/String;

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    return-object v0
.end method

.method public getFileForUpload()Ljava/io/File;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 298
    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    .line 299
    .local v1, "finalImageFile":Ljava/io/File;
    iget v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    if-lez v3, :cond_22

    .line 300
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getImageUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/behance/sdk/util/BehanceSDKImageLoaderUtils;->getImageBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 301
    .local v0, "decodeFile":Landroid/graphics/Bitmap;
    invoke-static {v0, p0}, Lcom/behance/sdk/util/BehanceSDKImageLoaderUtils;->updateBitmapForRotation(Landroid/graphics/Bitmap;Lcom/behance/sdk/project/modules/ImageModule;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 302
    .local v2, "updateBitmapForRotation":Landroid/graphics/Bitmap;
    iget-object v3, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/behance/sdk/project/modules/ImageModule;->savebitmap(Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 303
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 304
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 306
    .end local v0    # "decodeFile":Landroid/graphics/Bitmap;
    .end local v2    # "updateBitmapForRotation":Landroid/graphics/Bitmap;
    :cond_22
    return-object v1
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 334
    iget v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->height:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRotation()I
    .registers 2

    .prologue
    .line 287
    iget v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    return v0
.end method

.method public getSizeInBytes()J
    .registers 3

    .prologue
    .line 342
    iget-wide v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->sizeInBytes:J

    return-wide v0
.end method

.method public getThumbNail(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 128
    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 129
    :cond_c
    const/4 v0, 0x0

    .line 130
    .local v0, "tempThumbnail":Landroid/graphics/Bitmap;
    iget-wide v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->id:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-eqz v1, :cond_29

    .line 131
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-wide v2, p0, Lcom/behance/sdk/project/modules/ImageModule;->id:J

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-static {v1, v2, v3, v4, v5}, Landroid/provider/MediaStore$Images$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 135
    :cond_21
    :goto_21
    iput-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    .line 136
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/ImageModule;->updateThumbnailForDefaultRotation()V

    .line 138
    .end local v0    # "tempThumbnail":Landroid/graphics/Bitmap;
    :cond_26
    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    return-object v1

    .line 132
    .restart local v0    # "tempThumbnail":Landroid/graphics/Bitmap;
    :cond_29
    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->file:Ljava/io/File;

    if-eqz v1, :cond_21

    .line 133
    invoke-direct {p0}, Lcom/behance/sdk/project/modules/ImageModule;->getThumbNailFromFile()Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_21
.end method

.method public getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    .registers 2

    .prologue
    .line 96
    sget-object v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    return-object v0
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 326
    iget v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->width:I

    return v0
.end method

.method public recycleBitmaps()V
    .registers 1

    .prologue
    .line 267
    invoke-virtual {p0}, Lcom/behance/sdk/project/modules/ImageModule;->recycleThumbnailBitmap()V

    .line 268
    invoke-virtual {p0}, Lcom/behance/sdk/project/modules/ImageModule;->recycleImageBitmap()V

    .line 270
    return-void
.end method

.method public recycleImageBitmap()V
    .registers 2

    .prologue
    .line 273
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_14

    .line 274
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 275
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->bitmap:Landroid/graphics/Bitmap;

    .line 277
    :cond_14
    return-void
.end method

.method public recycleThumbnailBitmap()V
    .registers 2

    .prologue
    .line 280
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_14

    .line 281
    iget-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 282
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    .line 284
    :cond_14
    return-void
.end method

.method public rotateImage()V
    .registers 4

    .prologue
    .line 215
    iget v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_14

    .line 216
    const/4 v1, 0x0

    iput v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    .line 219
    :goto_8
    iget-object v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    invoke-direct {p0, v1}, Lcom/behance/sdk/project/modules/ImageModule;->updateThumbnailForRotation(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 220
    .local v0, "thumbnailForRotation":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Lcom/behance/sdk/project/modules/ImageModule;->recycleBitmaps()V

    .line 221
    iput-object v0, p0, Lcom/behance/sdk/project/modules/ImageModule;->thumbnail:Landroid/graphics/Bitmap;

    .line 222
    return-void

    .line 218
    .end local v0    # "thumbnailForRotation":Landroid/graphics/Bitmap;
    :cond_14
    iget v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/behance/sdk/project/modules/ImageModule;->rotation:I

    goto :goto_8
.end method

.method public setAlbumName(Ljava/lang/String;)V
    .registers 2
    .param p1, "albumName"    # Ljava/lang/String;

    .prologue
    .line 235
    iput-object p1, p0, Lcom/behance/sdk/project/modules/ImageModule;->albumName:Ljava/lang/String;

    .line 236
    return-void
.end method

.method public setSizeInBytes(J)V
    .registers 4
    .param p1, "sizeInBytes"    # J

    .prologue
    .line 346
    iput-wide p1, p0, Lcom/behance/sdk/project/modules/ImageModule;->sizeInBytes:J

    .line 347
    return-void
.end method
