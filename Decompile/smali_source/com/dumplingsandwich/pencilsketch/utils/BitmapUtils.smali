.class public Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;
.super Ljava/lang/Object;
.source "BitmapUtils.java"


# direct methods
.method public static decodeBitmapFile(Landroid/content/Context;Ljava/lang/String;II)Landroid/graphics/Bitmap;
    .registers 22
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "w"    # I
    .param p3, "h"    # I

    .prologue
    .line 23
    invoke-static/range {p1 .. p1}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->necessaryRotation(Ljava/lang/String;)I

    move-result v11

    .line 25
    .local v11, "rotate":I
    new-instance v9, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v9}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 26
    .local v9, "o":Landroid/graphics/BitmapFactory$Options;
    const/4 v3, 0x1

    iput-boolean v3, v9, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 28
    move-object/from16 v0, p1

    invoke-static {v0, v9}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 29
    const/4 v12, 0x1

    .line 31
    .local v12, "scale":I
    iget v3, v9, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v4, v9, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lt v3, v4, :cond_22

    iget v3, v9, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move/from16 v0, p2

    if-le v3, v0, :cond_22

    .line 32
    iget v3, v9, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int v12, v3, p2

    .line 33
    :cond_22
    iget v3, v9, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v4, v9, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-le v3, v4, :cond_51

    iget v3, v9, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move/from16 v0, p3

    if-le v3, v0, :cond_51

    .line 34
    const-wide/high16 v4, 0x4000000000000000L

    move/from16 v0, p3

    int-to-double v14, v0

    iget v3, v9, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-double v0, v3

    move-wide/from16 v16, v0

    div-double v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->log(D)D

    move-result-wide v14

    const-wide/high16 v16, 0x3fe0000000000000L

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->log(D)D

    move-result-wide v16

    div-double v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->round(D)J

    move-result-wide v14

    long-to-int v3, v14

    int-to-double v14, v3

    invoke-static {v4, v5, v14, v15}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-int v12, v4

    .line 37
    :cond_51
    new-instance v10, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v10}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 38
    .local v10, "o2":Landroid/graphics/BitmapFactory$Options;
    iput v12, v10, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 39
    move-object/from16 v0, p1

    invoke-static {v0, v10}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 42
    .local v2, "image":Landroid/graphics/Bitmap;
    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 43
    .local v7, "matrix":Landroid/graphics/Matrix;
    int-to-float v3, v11

    invoke-virtual {v7, v3}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 44
    if-nez v2, :cond_6b

    .line 45
    const/4 v3, 0x0

    .line 47
    :goto_6a
    return-object v3

    :cond_6b
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    const/4 v8, 0x1

    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v3

    goto :goto_6a
.end method

.method public static decodeBitmapStream(Landroid/content/Context;Landroid/content/Intent;II)Landroid/graphics/Bitmap;
    .registers 20
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "data"    # Landroid/content/Intent;
    .param p2, "w"    # I
    .param p3, "h"    # I

    .prologue
    .line 52
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 53
    .local v3, "o":Landroid/graphics/BitmapFactory$Options;
    const/4 v9, 0x1

    iput-boolean v9, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 55
    const/4 v5, 0x0

    .line 56
    .local v5, "result":Landroid/graphics/Bitmap;
    const/4 v7, 0x0

    .line 57
    .local v7, "stream_1":Ljava/io/InputStream;
    const/4 v8, 0x0

    .line 60
    .local v8, "stream_2":Ljava/io/InputStream;
    :try_start_b
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v7

    .line 61
    const/4 v9, 0x0

    invoke-static {v7, v9, v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 62
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 64
    const/4 v6, 0x1

    .line 66
    .local v6, "scale":I
    iget v9, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v10, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lt v9, v10, :cond_2f

    iget v9, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    move/from16 v0, p2

    if-le v9, v0, :cond_2f

    .line 67
    iget v9, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int v6, v9, p2

    .line 68
    :cond_2f
    iget v9, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v10, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-le v9, v10, :cond_5a

    iget v9, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move/from16 v0, p3

    if-le v9, v0, :cond_5a

    .line 69
    const-wide/high16 v10, 0x4000000000000000L

    move/from16 v0, p3

    int-to-double v12, v0

    iget v9, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-double v14, v9

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->log(D)D

    move-result-wide v12

    const-wide/high16 v14, 0x3fe0000000000000L

    invoke-static {v14, v15}, Ljava/lang/Math;->log(D)D

    move-result-wide v14

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->round(D)J

    move-result-wide v12

    long-to-int v9, v12

    int-to-double v12, v9

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    double-to-int v6, v10

    .line 72
    :cond_5a
    new-instance v4, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v4}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 73
    .local v4, "o2":Landroid/graphics/BitmapFactory$Options;
    iput v6, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 75
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v8

    .line 76
    const/4 v9, 0x0

    invoke-static {v8, v9, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 77
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_75} :catch_76

    .line 84
    .end local v4    # "o2":Landroid/graphics/BitmapFactory$Options;
    .end local v6    # "scale":I
    :goto_75
    return-object v5

    .line 79
    :catch_76
    move-exception v2

    .line 81
    .local v2, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    goto :goto_75
.end method

.method public static decodeResource(Landroid/content/res/Resources;III)Landroid/graphics/Bitmap;
    .registers 14
    .param p0, "res"    # Landroid/content/res/Resources;
    .param p1, "id"    # I
    .param p2, "w"    # I
    .param p3, "h"    # I

    .prologue
    .line 185
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 186
    .local v1, "o":Landroid/graphics/BitmapFactory$Options;
    const/4 v4, 0x1

    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 188
    invoke-static {p0, p1, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 189
    const/4 v3, 0x1

    .line 191
    .local v3, "scale":I
    invoke-static {p2, p3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 192
    .local v0, "dimension":I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-gt v4, p3, :cond_18

    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-le v4, p2, :cond_3b

    .line 193
    :cond_18
    const-wide/high16 v4, 0x4000000000000000L

    int-to-double v6, v0

    iget v8, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v9, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-double v8, v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->log(D)D

    move-result-wide v6

    const-wide/high16 v8, 0x3fe0000000000000L

    invoke-static {v8, v9}, Ljava/lang/Math;->log(D)D

    move-result-wide v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v6

    long-to-int v6, v6

    int-to-double v6, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-int v3, v4

    .line 197
    :cond_3b
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 198
    .local v2, "o2":Landroid/graphics/BitmapFactory$Options;
    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 199
    invoke-static {p0, p1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v4

    return-object v4
.end method

.method public static necessaryRotation(Ljava/lang/String;)I
    .registers 7
    .param p0, "imageFile"    # Ljava/lang/String;

    .prologue
    .line 88
    const/4 v3, 0x0

    .line 91
    .local v3, "rotate":I
    :try_start_1
    new-instance v1, Landroid/media/ExifInterface;

    invoke-direct {v1, p0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 92
    .local v1, "exif":Landroid/media/ExifInterface;
    const-string v4, "Orientation"

    const/4 v5, 0x1

    invoke-virtual {v1, v4, v5}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_c} :catch_1a

    move-result v2

    .line 96
    .local v2, "orientation":I
    packed-switch v2, :pswitch_data_20

    .line 112
    .end local v1    # "exif":Landroid/media/ExifInterface;
    .end local v2    # "orientation":I
    :goto_10
    :pswitch_10
    return v3

    .line 98
    .restart local v1    # "exif":Landroid/media/ExifInterface;
    .restart local v2    # "orientation":I
    :pswitch_11
    const/16 v3, 0x10e

    .line 99
    goto :goto_10

    .line 101
    :pswitch_14
    const/16 v3, 0xb4

    .line 102
    goto :goto_10

    .line 104
    :pswitch_17
    const/16 v3, 0x5a

    goto :goto_10

    .line 107
    .end local v1    # "exif":Landroid/media/ExifInterface;
    .end local v2    # "orientation":I
    :catch_1a
    move-exception v0

    .line 109
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_10

    .line 96
    nop

    :pswitch_data_20
    .packed-switch 0x3
        :pswitch_14
        :pswitch_10
        :pswitch_10
        :pswitch_17
        :pswitch_10
        :pswitch_11
    .end packed-switch
.end method

.method public static saveImageOnPhone(Landroid/content/Context;Landroid/graphics/Bitmap;Z)Ljava/io/File;
    .registers 15
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "bm"    # Landroid/graphics/Bitmap;
    .param p2, "shouldScanMedia"    # Z

    .prologue
    const/4 v7, 0x0

    .line 116
    const/4 v5, 0x0

    .line 117
    .local v5, "outStream":Ljava/io/OutputStream;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 118
    .local v1, "extStorageDirectory":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    const-string v8, "Pencil_Sketch"

    invoke-direct {v4, v1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .local v4, "imageFolder":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->mkdir()Z

    .line 121
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "pencil_sketch_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ".jpg"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 123
    .local v3, "fileName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v4, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 126
    .local v2, "file":Ljava/io/File;
    :try_start_36
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3b
    .catch Ljava/io/FileNotFoundException; {:try_start_36 .. :try_end_3b} :catch_62
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_3b} :catch_68

    .line 127
    .end local v5    # "outStream":Ljava/io/OutputStream;
    .local v6, "outStream":Ljava/io/OutputStream;
    :try_start_3b
    sget-object v8, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v9, 0x64

    invoke-virtual {p1, v8, v9, v6}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 128
    invoke-virtual {v6}, Ljava/io/OutputStream;->flush()V

    .line 129
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 130
    if-eqz p2, :cond_60

    .line 132
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "image/jpeg"

    aput-object v11, v9, v10

    const/4 v10, 0x0

    invoke-static {p0, v8, v9, v10}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V
    :try_end_60
    .catch Ljava/io/FileNotFoundException; {:try_start_3b .. :try_end_60} :catch_71
    .catch Ljava/io/IOException; {:try_start_3b .. :try_end_60} :catch_6e

    :cond_60
    move-object v5, v6

    .line 146
    .end local v2    # "file":Ljava/io/File;
    .end local v6    # "outStream":Ljava/io/OutputStream;
    .restart local v5    # "outStream":Ljava/io/OutputStream;
    :goto_61
    return-object v2

    .line 136
    .restart local v2    # "file":Ljava/io/File;
    :catch_62
    move-exception v0

    .line 138
    .local v0, "e":Ljava/io/FileNotFoundException;
    :goto_63
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    move-object v2, v7

    .line 139
    goto :goto_61

    .line 140
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_68
    move-exception v0

    .line 142
    .local v0, "e":Ljava/io/IOException;
    :goto_69
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move-object v2, v7

    .line 143
    goto :goto_61

    .line 140
    .end local v0    # "e":Ljava/io/IOException;
    .end local v5    # "outStream":Ljava/io/OutputStream;
    .restart local v6    # "outStream":Ljava/io/OutputStream;
    :catch_6e
    move-exception v0

    move-object v5, v6

    .end local v6    # "outStream":Ljava/io/OutputStream;
    .restart local v5    # "outStream":Ljava/io/OutputStream;
    goto :goto_69

    .line 136
    .end local v5    # "outStream":Ljava/io/OutputStream;
    .restart local v6    # "outStream":Ljava/io/OutputStream;
    :catch_71
    move-exception v0

    move-object v5, v6

    .end local v6    # "outStream":Ljava/io/OutputStream;
    .restart local v5    # "outStream":Ljava/io/OutputStream;
    goto :goto_63
.end method

.method public static scaleBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .registers 11
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "screenWidth"    # I
    .param p2, "screenHeight"    # I

    .prologue
    const/16 v7, 0x366

    const/4 v6, 0x1

    .line 204
    if-eqz p0, :cond_2f

    .line 206
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    if-le v2, v3, :cond_30

    .line 208
    int-to-double v2, p2

    const-wide v4, 0x3fe3333333333333L

    mul-double/2addr v2, v4

    double-to-int v2, v2

    invoke-static {v2, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 209
    .local v0, "max_height":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-le v2, v0, :cond_2f

    .line 211
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    mul-int/2addr v2, v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    div-int/2addr v2, v3

    invoke-static {p0, v2, v0, v6}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 224
    .end local v0    # "max_height":I
    :cond_2f
    :goto_2f
    return-object p0

    .line 216
    :cond_30
    int-to-double v2, p1

    const-wide v4, 0x3feb333333333333L

    mul-double/2addr v2, v4

    double-to-int v2, v2

    invoke-static {v2, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 217
    .local v1, "max_width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-le v2, v1, :cond_2f

    .line 219
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    mul-int/2addr v2, v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    div-int/2addr v2, v3

    invoke-static {p0, v1, v2, v6}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_2f
.end method

.method public static shareImage(Landroid/content/Context;Landroid/graphics/Bitmap;)Ljava/io/File;
    .registers 14
    .param p0, "calling_context"    # Landroid/content/Context;
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v7, 0x0

    .line 150
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 151
    .local v1, "extStorageDirectory":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    const-string v8, "Pencil_Sketch"

    invoke-direct {v4, v1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .local v4, "imageFolder":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->mkdir()Z

    .line 154
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "pencil_sketch_"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ".jpg"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 155
    .local v3, "fileName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v4, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 158
    .local v2, "file":Ljava/io/File;
    :try_start_35
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 159
    .local v5, "outStream":Ljava/io/OutputStream;
    sget-object v8, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v9, 0x64

    invoke-virtual {p1, v8, v9, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 160
    invoke-virtual {v5}, Ljava/io/OutputStream;->flush()V

    .line 161
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V
    :try_end_47
    .catch Ljava/io/FileNotFoundException; {:try_start_35 .. :try_end_47} :catch_74
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_47} :catch_7a

    .line 172
    new-instance v6, Landroid/content/Intent;

    const-string v7, "android.intent.action.SEND"

    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 173
    .local v6, "shareIntent":Landroid/content/Intent;
    const-string v7, "image/jpeg"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 174
    const-string v7, "android.intent.extra.STREAM"

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 176
    const-string v7, "android.intent.extra.SUBJECT"

    const-string v8, "Great Pic from Pencil Sketch"

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 177
    const-string v7, "android.intent.extra.TEXT"

    const-string v8, "Pencil Sketch: https://play.google.com/store/apps/details?id=com.dumplingsandwich.pencilsketch"

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 179
    const-string v7, "Share Image"

    invoke-static {v6, v7}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {p0, v7}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 181
    .end local v2    # "file":Ljava/io/File;
    .end local v5    # "outStream":Ljava/io/OutputStream;
    .end local v6    # "shareIntent":Landroid/content/Intent;
    :goto_73
    return-object v2

    .line 162
    .restart local v2    # "file":Ljava/io/File;
    :catch_74
    move-exception v0

    .line 164
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    move-object v2, v7

    .line 165
    goto :goto_73

    .line 166
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_7a
    move-exception v0

    .line 168
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move-object v2, v7

    .line 169
    goto :goto_73
.end method
