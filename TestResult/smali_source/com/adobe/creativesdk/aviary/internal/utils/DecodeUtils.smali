.class public final Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;
.super Ljava/lang/Object;
.source "DecodeUtils.java"


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 34
    const-string v0, "DecodeUtils"

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public static computeSampleSize(IIIIILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)I
    .registers 16
    .param p0, "bitmapW"    # I
    .param p1, "bitmapH"    # I
    .param p2, "maxW"    # I
    .param p3, "maxH"    # I
    .param p4, "orientation"    # I
    .param p5, "imageInfo"    # Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .prologue
    .line 229
    if-eqz p4, :cond_6

    const/16 v3, 0xb4

    if-ne p4, v3, :cond_1f

    .line 230
    :cond_6
    int-to-double v4, p0

    .line 231
    .local v4, "w":D
    int-to-double v0, p1

    .line 237
    .local v0, "h":D
    :goto_8
    if-eqz p5, :cond_f

    .line 238
    double-to-int v3, v4

    double-to-int v6, v0

    invoke-virtual {p5, v3, v6}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->setOriginalSize(II)V

    .line 241
    :cond_f
    int-to-double v6, p2

    div-double v6, v4, v6

    int-to-double v8, p3

    div-double v8, v0, v8

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v2, v6

    .line 242
    .local v2, "sampleSize":I
    return v2

    .line 233
    .end local v0    # "h":D
    .end local v2    # "sampleSize":I
    .end local v4    # "w":D
    :cond_1f
    int-to-double v4, p1

    .line 234
    .restart local v4    # "w":D
    int-to-double v0, p0

    .restart local v0    # "h":D
    goto :goto_8
.end method

.method public static decode(Landroid/content/Context;Landroid/net/Uri;IILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)Landroid/graphics/Bitmap;
    .registers 29
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "maxW"    # I
    .param p3, "maxH"    # I
    .param p4, "info"    # Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .prologue
    .line 49
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "decode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 52
    invoke-static/range {p4 .. p4}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 55
    const/4 v14, 0x0

    .line 56
    .local v14, "bitmap":Landroid/graphics/Bitmap;
    const/4 v2, 0x2

    new-array v0, v2, [I

    move-object/from16 v18, v0

    .line 59
    .local v18, "imageSize":[I
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->setUri(Landroid/net/Uri;)V

    .line 61
    invoke-static/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->openInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v23

    .line 62
    .local v23, "stream":Ljava/io/InputStream;
    if-nez v23, :cond_32

    .line 63
    const/4 v2, 0x0

    .line 127
    :goto_31
    return-object v2

    .line 67
    :cond_32
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "reading exif"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 68
    new-instance v17, Lit/sephiroth/android/library/exif2/ExifInterface;

    invoke-direct/range {v17 .. v17}, Lit/sephiroth/android/library/exif2/ExifInterface;-><init>()V

    .line 70
    .local v17, "exif":Lit/sephiroth/android/library/exif2/ExifInterface;
    const/16 v2, 0x3f

    :try_start_40
    move-object/from16 v0, v17

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/exif2/ExifInterface;->readExif(Ljava/io/InputStream;I)V

    .line 72
    invoke-virtual/range {v17 .. v17}, Lit/sephiroth/android/library/exif2/ExifInterface;->getImageSize()[I

    move-result-object v19

    .line 73
    .local v19, "imagesize":[I
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "(exif) image size: %dx%d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const/4 v7, 0x0

    aget v7, v19, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v5

    const/4 v5, 0x1

    const/4 v7, 0x1

    aget v7, v19, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_69} :catch_121

    .line 80
    .end local v19    # "imagesize":[I
    :goto_69
    invoke-virtual/range {v17 .. v17}, Lit/sephiroth/android/library/exif2/ExifInterface;->getAllTags()Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->setExifTagList(Ljava/util/List;)V

    .line 83
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/utils/ExifUtils;->getOrientation(Lit/sephiroth/android/library/exif2/ExifInterface;)I

    move-result v6

    .line 84
    .local v6, "orientation":I
    move-object/from16 v0, p4

    invoke-virtual {v0, v6}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->setOrientation(I)V

    .line 85
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "orientation: %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 88
    invoke-static/range {v23 .. v23}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 89
    invoke-static/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->openInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v23

    .line 91
    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->decodeImageBounds(Ljava/io/InputStream;[I)Z

    move-result v15

    .line 92
    .local v15, "decoded":Z
    invoke-static/range {v23 .. v23}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 94
    if-eqz v15, :cond_117

    .line 96
    const/4 v2, 0x0

    aget v2, v18, v2

    const/4 v3, 0x1

    aget v3, v18, v3

    move/from16 v0, p2

    int-to-double v4, v0

    const-wide v10, 0x3ff3333333333333L

    mul-double/2addr v4, v10

    double-to-int v4, v4

    move/from16 v0, p3

    int-to-double v10, v0

    const-wide v12, 0x3ff3333333333333L

    mul-double/2addr v10, v12

    double-to-int v5, v10

    move-object/from16 v7, p4

    invoke-static/range {v2 .. v7}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->computeSampleSize(IIIIILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)I

    move-result v22

    .line 102
    .local v22, "sampleSize":I
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->getDefaultOptions()Landroid/graphics/BitmapFactory$Options;

    move-result-object v9

    .line 106
    .local v9, "options":Landroid/graphics/BitmapFactory$Options;
    move/from16 v0, p2

    int-to-float v2, v0

    const/high16 v3, 0x3fc00000

    mul-float v21, v2, v3

    .line 107
    .local v21, "maxSampleW":F
    move/from16 v0, p3

    int-to-float v2, v0

    const/high16 v3, 0x3fc00000

    mul-float v20, v2, v3

    .line 109
    .local v20, "maxSampleH":F
    const/4 v2, 0x1

    aget v2, v18, v2

    int-to-float v2, v2

    const/high16 v3, 0x42c80000

    add-float v3, v3, v21

    cmpg-float v2, v2, v3

    if-gez v2, :cond_ef

    const/4 v2, 0x1

    aget v2, v18, v2

    int-to-float v2, v2

    cmpg-float v2, v2, v20

    if-gez v2, :cond_ef

    .line 110
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "try to use sample size = 1"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 111
    const/16 v22, 0x1

    .line 115
    :cond_ef
    move/from16 v0, v22

    iput v0, v9, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 116
    const/4 v13, 0x0

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move/from16 v10, p2

    move/from16 v11, p3

    move v12, v6

    invoke-static/range {v7 .. v13}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->decodeBitmap(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;IIII)Landroid/graphics/Bitmap;

    move-result-object v14

    .line 118
    if-eqz v14, :cond_117

    .line 119
    if-eqz p4, :cond_117

    .line 120
    invoke-virtual {v14}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v14}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    move-object/from16 v0, p4

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->setDecodedSize(II)V

    .line 121
    move-object/from16 v0, p4

    invoke-virtual {v0, v6}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->setOrientation(I)V

    .line 126
    .end local v9    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v20    # "maxSampleH":F
    .end local v21    # "maxSampleW":F
    .end local v22    # "sampleSize":I
    :cond_117
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "returning bitmap"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    move-object v2, v14

    .line 127
    goto/16 :goto_31

    .line 75
    .end local v6    # "orientation":I
    .end local v15    # "decoded":Z
    :catch_121
    move-exception v16

    .line 76
    .local v16, "e":Ljava/lang/Exception;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_69
.end method

.method static decodeBitmap(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;IIII)Landroid/graphics/Bitmap;
    .registers 21
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p3, "maxW"    # I
    .param p4, "maxH"    # I
    .param p5, "orientation"    # I
    .param p6, "pass"    # I

    .prologue
    .line 133
    const/4 v10, 0x0

    .line 136
    .local v10, "bitmap":Landroid/graphics/Bitmap;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "decodeBitmap: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p2

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", maxSize: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", pass: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p6

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 138
    const/16 v3, 0xa

    move/from16 v0, p6

    if-le v0, v3, :cond_49

    .line 139
    const/4 v3, 0x0

    .line 172
    :goto_48
    return-object v3

    .line 142
    :cond_49
    invoke-static {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->openInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v13

    .line 143
    .local v13, "stream":Ljava/io/InputStream;
    if-nez v13, :cond_51

    .line 144
    const/4 v3, 0x0

    goto :goto_48

    .line 146
    :cond_51
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "opened input stream"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 150
    const/4 v3, 0x0

    :try_start_59
    move-object/from16 v0, p2

    invoke-static {v13, v3, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 151
    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 153
    if-eqz v10, :cond_c8

    .line 154
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "loaded bitmap: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 155
    move/from16 v0, p3

    move/from16 v1, p4

    move/from16 v2, p5

    invoke-static {v10, v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->resizeBitmap(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 156
    .local v12, "newBitmap":Landroid/graphics/Bitmap;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "resized: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 157
    if-eq v10, v12, :cond_c7

    .line 158
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_c7
    .catch Ljava/lang/OutOfMemoryError; {:try_start_59 .. :try_end_c7} :catch_cb

    .line 160
    :cond_c7
    move-object v10, v12

    .end local v12    # "newBitmap":Landroid/graphics/Bitmap;
    :cond_c8
    :goto_c8
    move-object v3, v10

    .line 172
    goto/16 :goto_48

    .line 163
    :catch_cb
    move-exception v11

    .line 164
    .local v11, "error":Ljava/lang/OutOfMemoryError;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    invoke-virtual {v11}, Ljava/lang/OutOfMemoryError;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 165
    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 166
    if-eqz v10, :cond_dd

    .line 167
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->recycle()V

    .line 169
    :cond_dd
    move-object/from16 v0, p2

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p2

    iput v3, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 170
    add-int/lit8 v9, p6, 0x1

    move-object v3, p0

    move-object v4, p1

    move-object/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    invoke-static/range {v3 .. v9}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->decodeBitmap(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;IIII)Landroid/graphics/Bitmap;

    move-result-object v10

    goto :goto_c8
.end method

.method public static decodeImageBounds(Ljava/io/InputStream;[I)Z
    .registers 7
    .param p0, "stream"    # Ljava/io/InputStream;
    .param p1, "outSize"    # [I

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 213
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "decodeImageBounds"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 214
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 215
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 216
    const/4 v3, 0x0

    invoke-static {p0, v3, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 217
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v3, :cond_25

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v3, :cond_25

    .line 218
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    aput v3, p1, v2

    .line 219
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    aput v2, p1, v1

    .line 222
    :goto_24
    return v1

    :cond_25
    move v1, v2

    goto :goto_24
.end method

.method static getDefaultOptions()Landroid/graphics/BitmapFactory$Options;
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 362
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 363
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 364
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 365
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    .line 366
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 367
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 368
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    .line 369
    const/16 v1, 0x4000

    new-array v1, v1, [B

    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    .line 370
    return-object v0
.end method

.method static openContentInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 269
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "openContentInputStream: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 271
    sget-boolean v3, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_19:Z

    if-eqz v3, :cond_1c

    .line 273
    :try_start_11
    invoke-static {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->openParcelFileDescriptor(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_14
    .catch Ljava/io/FileNotFoundException; {:try_start_11 .. :try_end_14} :catch_18

    move-result-object v2

    .line 274
    .local v2, "is":Ljava/io/InputStream;
    if-eqz v2, :cond_1c

    .line 294
    .end local v2    # "is":Ljava/io/InputStream;
    :goto_17
    return-object v2

    .line 277
    :catch_18
    move-exception v0

    .line 278
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 283
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :cond_1c
    :try_start_1c
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_23
    .catch Ljava/io/FileNotFoundException; {:try_start_1c .. :try_end_23} :catch_25

    move-result-object v2

    goto :goto_17

    .line 284
    :catch_25
    move-exception v0

    .line 285
    .restart local v0    # "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 289
    invoke-static {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->getRealFilePath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 290
    .local v1, "filename":Ljava/lang/String;
    if-eqz v1, :cond_34

    .line 291
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->openFileInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_17

    .line 294
    :cond_34
    const/4 v2, 0x0

    goto :goto_17
.end method

.method static openFileInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 6
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 252
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "openFileInputStream: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 254
    :try_start_d
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_12
    .catch Ljava/io/FileNotFoundException; {:try_start_d .. :try_end_12} :catch_13

    .line 258
    :goto_12
    return-object v1

    .line 255
    :catch_13
    move-exception v0

    .line 256
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    .line 258
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public static openInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 184
    if-nez p1, :cond_4

    .line 185
    const/4 v2, 0x0

    .line 209
    :cond_3
    :goto_3
    return-object v2

    .line 187
    :cond_4
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "scheme":Ljava/lang/String;
    const/4 v2, 0x0

    .line 189
    .local v2, "stream":Ljava/io/InputStream;
    if-eqz v1, :cond_13

    const-string v3, "file"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4c

    .line 192
    :cond_13
    const-string v3, "file"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/android_asset/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_43

    .line 194
    :try_start_27
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v4

    const-string v5, "/android_asset/"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_3c} :catch_3e

    move-result-object v2

    goto :goto_3

    .line 195
    :catch_3e
    move-exception v0

    .line 196
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 200
    .end local v0    # "e":Ljava/io/IOException;
    :cond_43
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->openFileInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_3

    .line 202
    :cond_4c
    const-string v3, "content"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_59

    .line 204
    invoke-static {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->openContentInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_3

    .line 205
    :cond_59
    const-string v3, "http"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_69

    const-string v3, "https"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 207
    :cond_69
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->openRemoteInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_3
.end method

.method static openParcelFileDescriptor(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 299
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "openParcelFileDescriptor: %s"

    new-array v3, v5, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 301
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "r"

    invoke-virtual {v1, p1, v2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 302
    .local v0, "parcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "parcelFileDescriptor: %s"

    new-array v3, v5, [Ljava/lang/Object;

    aput-object v0, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 303
    new-instance v1, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    invoke-direct {v1, v0}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    return-object v1
.end method

.method static openRemoteInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    .registers 8
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v6, 0x0

    .line 315
    :try_start_1
    new-instance v3, Ljava/net/URL;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_a} :catch_33

    .line 323
    .local v3, "finalUrl":Ljava/net/URL;
    :try_start_a
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_10} :catch_39

    .line 329
    .local v1, "connection":Ljava/net/HttpURLConnection;
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 332
    :try_start_14
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_17} :catch_3f

    move-result v0

    .line 339
    .local v0, "code":I
    const/16 v5, 0x12d

    if-eq v0, v5, :cond_24

    const/16 v5, 0x12e

    if-eq v0, v5, :cond_24

    const/16 v5, 0x12f

    if-ne v0, v5, :cond_45

    .line 341
    :cond_24
    const-string v5, "Location"

    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 342
    .local v4, "newLocation":Ljava/lang/String;
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->openRemoteInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v5

    .line 349
    .end local v0    # "code":I
    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    .end local v3    # "finalUrl":Ljava/net/URL;
    .end local v4    # "newLocation":Ljava/lang/String;
    :goto_32
    return-object v5

    .line 316
    :catch_33
    move-exception v2

    .line 317
    .local v2, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v2}, Ljava/net/MalformedURLException;->printStackTrace()V

    move-object v5, v6

    .line 318
    goto :goto_32

    .line 324
    .end local v2    # "e":Ljava/net/MalformedURLException;
    .restart local v3    # "finalUrl":Ljava/net/URL;
    :catch_39
    move-exception v2

    .line 325
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    move-object v5, v6

    .line 326
    goto :goto_32

    .line 333
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "connection":Ljava/net/HttpURLConnection;
    :catch_3f
    move-exception v2

    .line 334
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    move-object v5, v6

    .line 335
    goto :goto_32

    .line 346
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "code":I
    :cond_45
    :try_start_45
    invoke-virtual {v3}, Ljava/net/URL;->getContent()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/InputStream;
    :try_end_4b
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_4b} :catch_4c

    goto :goto_32

    .line 347
    :catch_4c
    move-exception v2

    .line 348
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    move-object v5, v6

    .line 349
    goto :goto_32
.end method
