.class public Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;
.super Ljava/lang/Object;
.source "BaseImageDecoder.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/decode/ImageDecoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;,
        Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;
    }
.end annotation


# instance fields
.field protected final loggingEnabled:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2
    .param p1, "loggingEnabled"    # Z

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->loggingEnabled:Z

    .line 58
    return-void
.end method

.method private canDefineExifParams(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 114
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x5

    if-lt v0, v1, :cond_17

    const-string v0, "image/jpeg"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ofUri(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object v0

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    if-ne v0, v1, :cond_17

    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method


# virtual methods
.method protected considerExactScaleAndOrientatiton(Landroid/graphics/Bitmap;Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;IZ)Landroid/graphics/Bitmap;
    .registers 16
    .param p1, "subsampledBitmap"    # Landroid/graphics/Bitmap;
    .param p2, "decodingInfo"    # Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;
    .param p3, "rotation"    # I
    .param p4, "flipHorizontal"    # Z

    .prologue
    .line 183
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 185
    .local v5, "m":Landroid/graphics/Matrix;
    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageScaleType()Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    move-result-object v9

    .line 186
    .local v9, "scaleType":Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;
    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-eq v9, v0, :cond_11

    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY_STRETCHED:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-ne v9, v0, :cond_5e

    .line 187
    :cond_11
    new-instance v10, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-direct {v10, v0, v1, p3}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(III)V

    .line 188
    .local v10, "srcSize":Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getTargetSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v1

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getViewScaleType()Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    move-result-object v2

    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY_STRETCHED:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-ne v9, v0, :cond_b0

    const/4 v0, 0x1

    :goto_2b
    invoke-static {v10, v1, v2, v0}, Lcom/nostra13/universalimageloader/utils/ImageSizeUtils;->computeImageScale(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;Z)F

    move-result v8

    .line 190
    .local v8, "scale":F
    const/high16 v0, 0x3f800000

    invoke-static {v8, v0}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_5e

    .line 191
    invoke-virtual {v5, v8, v8}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 193
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->loggingEnabled:Z

    if-eqz v0, :cond_5e

    .line 194
    const-string v0, "Scale subsampled image (%1$s) to %2$s (scale = %3$.5f) [%4$s]"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v10, v1, v2

    const/4 v2, 0x1

    invoke-virtual {v10, v8}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->scale(F)Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/nostra13/universalimageloader/utils/L;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 199
    .end local v8    # "scale":F
    .end local v10    # "srcSize":Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    :cond_5e
    if-eqz p4, :cond_7a

    .line 200
    const/high16 v0, -0x40800000

    const/high16 v1, 0x3f800000

    invoke-virtual {v5, v0, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 202
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->loggingEnabled:Z

    if-eqz v0, :cond_7a

    const-string v0, "Flip image horizontally [%s]"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/nostra13/universalimageloader/utils/L;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 205
    :cond_7a
    if-eqz p3, :cond_9a

    .line 206
    int-to-float v0, p3

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 208
    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->loggingEnabled:Z

    if-eqz v0, :cond_9a

    const-string v0, "Rotate image on %1$d\u00b0 [%2$s]"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/nostra13/universalimageloader/utils/L;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 211
    :cond_9a
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 213
    .local v7, "finalBitmap":Landroid/graphics/Bitmap;
    if-eq v7, p1, :cond_af

    .line 214
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 216
    :cond_af
    return-object v7

    .line 188
    .end local v7    # "finalBitmap":Landroid/graphics/Bitmap;
    .restart local v10    # "srcSize":Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    :cond_b0
    const/4 v0, 0x0

    goto/16 :goto_2b
.end method

.method public decode(Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Landroid/graphics/Bitmap;
    .registers 10
    .param p1, "decodingInfo"    # Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->getImageStream(Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Ljava/io/InputStream;

    move-result-object v3

    .line 76
    .local v3, "imageStream":Ljava/io/InputStream;
    :try_start_4
    invoke-virtual {p0, v3, p1}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->defineImageSizeAndRotation(Ljava/io/InputStream;Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;

    move-result-object v2

    .line 77
    .local v2, "imageInfo":Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;
    invoke-virtual {p0, v3, p1}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->resetStream(Ljava/io/InputStream;Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Ljava/io/InputStream;

    move-result-object v3

    .line 78
    iget-object v4, v2, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;->imageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {p0, v4, p1}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->prepareDecodingOptions(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v1

    .line 79
    .local v1, "decodingOptions":Landroid/graphics/BitmapFactory$Options;
    const/4 v4, 0x0

    invoke-static {v3, v4, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_16
    .catchall {:try_start_4 .. :try_end_16} :catchall_2c

    move-result-object v0

    .line 81
    .local v0, "decodedBitmap":Landroid/graphics/Bitmap;
    invoke-static {v3}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 84
    if-nez v0, :cond_31

    .line 85
    const-string v4, "Image can\'t be decoded [%s]"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageKey()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 90
    :goto_2b
    return-object v0

    .line 81
    .end local v0    # "decodedBitmap":Landroid/graphics/Bitmap;
    .end local v1    # "decodingOptions":Landroid/graphics/BitmapFactory$Options;
    .end local v2    # "imageInfo":Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;
    :catchall_2c
    move-exception v4

    invoke-static {v3}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v4

    .line 87
    .restart local v0    # "decodedBitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "decodingOptions":Landroid/graphics/BitmapFactory$Options;
    .restart local v2    # "imageInfo":Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;
    :cond_31
    iget-object v4, v2, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;->exif:Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    iget v4, v4, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;->rotation:I

    iget-object v5, v2, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;->exif:Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    iget-boolean v5, v5, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;->flipHorizontal:Z

    invoke-virtual {p0, v0, p1, v4, v5}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->considerExactScaleAndOrientatiton(Landroid/graphics/Bitmap;Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_2b
.end method

.method protected defineExifOrientation(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;
    .registers 10
    .param p1, "imageUri"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 119
    const/4 v4, 0x0

    .line 120
    .local v4, "rotation":I
    const/4 v3, 0x0

    .line 122
    .local v3, "flip":Z
    :try_start_3
    new-instance v1, Landroid/media/ExifInterface;

    sget-object v5, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v5, p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->crop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 123
    .local v1, "exif":Landroid/media/ExifInterface;
    const-string v5, "Orientation"

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_14} :catch_2d

    move-result v2

    .line 124
    .local v2, "exifOrientation":I
    packed-switch v2, :pswitch_data_3a

    .line 149
    .end local v1    # "exif":Landroid/media/ExifInterface;
    .end local v2    # "exifOrientation":I
    :goto_18
    new-instance v5, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    invoke-direct {v5, v4, v3}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;-><init>(IZ)V

    return-object v5

    .line 126
    .restart local v1    # "exif":Landroid/media/ExifInterface;
    .restart local v2    # "exifOrientation":I
    :pswitch_1e
    const/4 v3, 0x1

    .line 128
    :pswitch_1f
    const/4 v4, 0x0

    .line 129
    goto :goto_18

    .line 131
    :pswitch_21
    const/4 v3, 0x1

    .line 133
    :pswitch_22
    const/16 v4, 0x5a

    .line 134
    goto :goto_18

    .line 136
    :pswitch_25
    const/4 v3, 0x1

    .line 138
    :pswitch_26
    const/16 v4, 0xb4

    .line 139
    goto :goto_18

    .line 141
    :pswitch_29
    const/4 v3, 0x1

    .line 143
    :pswitch_2a
    const/16 v4, 0x10e

    goto :goto_18

    .line 146
    .end local v1    # "exif":Landroid/media/ExifInterface;
    .end local v2    # "exifOrientation":I
    :catch_2d
    move-exception v0

    .line 147
    .local v0, "e":Ljava/io/IOException;
    const-string v5, "Can\'t read EXIF tags from file [%s]"

    new-array v6, v7, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-static {v5, v6}, Lcom/nostra13/universalimageloader/utils/L;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_18

    .line 124
    nop

    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_1f
        :pswitch_1e
        :pswitch_26
        :pswitch_25
        :pswitch_29
        :pswitch_22
        :pswitch_21
        :pswitch_2a
    .end packed-switch
.end method

.method protected defineImageSizeAndRotation(Ljava/io/InputStream;Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;
    .registers 11
    .param p1, "imageStream"    # Ljava/io/InputStream;
    .param p2, "decodingInfo"    # Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 100
    .local v2, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 101
    const/4 v3, 0x0

    invoke-static {p1, v3, v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 104
    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageUri()Ljava/lang/String;

    move-result-object v1

    .line 105
    .local v1, "imageUri":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->shouldConsiderExifParams()Z

    move-result v3

    if-eqz v3, :cond_33

    iget-object v3, v2, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    invoke-direct {p0, v1, v3}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->canDefineExifParams(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_33

    .line 106
    invoke-virtual {p0, v1}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->defineExifOrientation(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    move-result-object v0

    .line 110
    .local v0, "exif":Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;
    :goto_22
    new-instance v3, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;

    new-instance v4, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v7, v0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;->rotation:I

    invoke-direct {v4, v5, v6, v7}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(III)V

    invoke-direct {v3, v4, v0}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;-><init>(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;)V

    return-object v3

    .line 108
    .end local v0    # "exif":Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;
    :cond_33
    new-instance v0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;-><init>()V

    .restart local v0    # "exif":Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;
    goto :goto_22
.end method

.method protected getImageStream(Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Ljava/io/InputStream;
    .registers 5
    .param p1, "decodingInfo"    # Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getDownloader()Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getExtraForDownloader()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader;->getStream(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method protected prepareDecodingOptions(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Landroid/graphics/BitmapFactory$Options;
    .registers 12
    .param p1, "imageSize"    # Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .param p2, "decodingInfo"    # Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 153
    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageScaleType()Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    move-result-object v3

    .line 155
    .local v3, "scaleType":Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;
    sget-object v7, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->NONE:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-ne v3, v7, :cond_39

    .line 156
    invoke-static {p1}, Lcom/nostra13/universalimageloader/utils/ImageSizeUtils;->computeMinImageSampleSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)I

    move-result v2

    .line 162
    .local v2, "scale":I
    :goto_e
    if-le v2, v5, :cond_32

    iget-boolean v7, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->loggingEnabled:Z

    if-eqz v7, :cond_32

    .line 163
    const-string v7, "Subsample original image (%1$s) to %2$s (scale = %3$d) [%4$s]"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    aput-object p1, v8, v6

    invoke-virtual {p1, v2}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->scaleDown(I)Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v6

    aput-object v6, v8, v5

    const/4 v5, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v8, v5

    const/4 v5, 0x3

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getImageKey()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v8, v5

    invoke-static {v7, v8}, Lcom/nostra13/universalimageloader/utils/L;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 166
    :cond_32
    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getDecodingOptions()Landroid/graphics/BitmapFactory$Options;

    move-result-object v0

    .line 167
    .local v0, "decodingOptions":Landroid/graphics/BitmapFactory$Options;
    iput v2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 168
    return-object v0

    .line 158
    .end local v0    # "decodingOptions":Landroid/graphics/BitmapFactory$Options;
    .end local v2    # "scale":I
    :cond_39
    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getTargetSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v4

    .line 159
    .local v4, "targetSize":Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    sget-object v7, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->IN_SAMPLE_POWER_OF_2:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    if-ne v3, v7, :cond_4b

    move v1, v5

    .line 160
    .local v1, "powerOf2":Z
    :goto_42
    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->getViewScaleType()Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    move-result-object v7

    invoke-static {p1, v4, v7, v1}, Lcom/nostra13/universalimageloader/utils/ImageSizeUtils;->computeImageSampleSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;Z)I

    move-result v2

    .restart local v2    # "scale":I
    goto :goto_e

    .end local v1    # "powerOf2":Z
    .end local v2    # "scale":I
    :cond_4b
    move v1, v6

    .line 159
    goto :goto_42
.end method

.method protected resetStream(Ljava/io/InputStream;Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Ljava/io/InputStream;
    .registers 4
    .param p1, "imageStream"    # Ljava/io/InputStream;
    .param p2, "decodingInfo"    # Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 173
    :try_start_0
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 178
    :goto_3
    return-object p1

    .line 174
    :catch_4
    move-exception v0

    .line 175
    .local v0, "e":Ljava/io/IOException;
    invoke-static {p1}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 176
    invoke-virtual {p0, p2}, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;->getImageStream(Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;)Ljava/io/InputStream;

    move-result-object p1

    goto :goto_3
.end method
