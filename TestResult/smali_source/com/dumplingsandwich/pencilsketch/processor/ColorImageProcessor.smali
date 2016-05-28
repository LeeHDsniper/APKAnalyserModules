.class public Lcom/dumplingsandwich/pencilsketch/processor/ColorImageProcessor;
.super Ljava/lang/Object;
.source "ColorImageProcessor.java"


# direct methods
.method public static addPhotoFrame(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 27
    .param p0, "original"    # Landroid/graphics/Bitmap;
    .param p1, "frame"    # Landroid/graphics/Bitmap;

    .prologue
    .line 80
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v14

    .line 81
    .local v14, "height":I
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    .line 83
    .local v10, "width":I
    if-le v10, v14, :cond_25

    .line 85
    new-instance v6, Landroid/graphics/Matrix;

    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    .line 86
    .local v6, "left_mat":Landroid/graphics/Matrix;
    const/high16 v1, -0x3d4c0000

    invoke-virtual {v6, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 87
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    const/4 v7, 0x1

    move-object/from16 v1, p1

    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 89
    .end local v6    # "left_mat":Landroid/graphics/Matrix;
    :cond_25
    const/4 v1, 0x1

    move-object/from16 v0, p1

    invoke-static {v0, v10, v14, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 91
    mul-int v1, v10, v14

    new-array v8, v1, [I

    .line 92
    .local v8, "pixels":[I
    mul-int v1, v10, v14

    new-array v0, v1, [I

    move-object/from16 v16, v0

    .line 93
    .local v16, "frame_pixels":[I
    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v7, p0

    move v13, v10

    invoke-virtual/range {v7 .. v14}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 94
    const/16 v17, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v15, p1

    move/from16 v18, v10

    move/from16 v21, v10

    move/from16 v22, v14

    invoke-virtual/range {v15 .. v22}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 97
    const/16 v24, 0x0

    .local v24, "i":I
    :goto_52
    mul-int v1, v14, v10

    move/from16 v0, v24

    if-ge v0, v1, :cond_68

    .line 99
    aget v1, v16, v24

    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v23

    .line 100
    .local v23, "a":I
    if-nez v23, :cond_63

    .line 97
    :goto_60
    add-int/lit8 v24, v24, 0x1

    goto :goto_52

    .line 103
    :cond_63
    aget v1, v16, v24

    aput v1, v8, v24

    goto :goto_60

    .line 106
    .end local v23    # "a":I
    :cond_68
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v8, v10, v14, v1}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method public static flipImage(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .registers 9
    .param p0, "bmp"    # Landroid/graphics/Bitmap;
    .param p1, "type"    # I

    .prologue
    const/high16 v3, 0x3f800000

    const/high16 v2, -0x40800000

    const/4 v6, 0x1

    const/4 v1, 0x0

    .line 22
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 23
    .local v5, "matrix":Landroid/graphics/Matrix;
    const/4 v0, 0x2

    if-ne p1, v0, :cond_20

    .line 24
    invoke-virtual {v5, v3, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 25
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    move-object v0, p0

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 33
    .end local p0    # "bmp":Landroid/graphics/Bitmap;
    :cond_1f
    :goto_1f
    return-object p0

    .line 27
    .restart local p0    # "bmp":Landroid/graphics/Bitmap;
    :cond_20
    if-ne p1, v6, :cond_1f

    .line 28
    invoke-virtual {v5, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 29
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    move-object v0, p0

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_1f
.end method

.method public static getHsvData(Landroid/graphics/Bitmap;)[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    .registers 12
    .param p0, "original"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    .line 38
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    .line 39
    .local v7, "height":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 41
    .local v3, "width":I
    mul-int v0, v3, v7

    new-array v1, v0, [I

    .line 42
    .local v1, "pixelsSrc":[I
    mul-int v0, v3, v7

    new-array v9, v0, [Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    .local v9, "hsvPixels":[Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    move-object v0, p0

    move v4, v2

    move v5, v2

    move v6, v3

    .line 43
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 45
    const/4 v0, 0x3

    new-array v8, v0, [F

    .line 46
    .local v8, "hsv":[F
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1c
    mul-int v0, v3, v7

    if-ge v10, v0, :cond_37

    .line 48
    aget v0, v1, v10

    invoke-static {v0, v8}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 49
    new-instance v0, Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;

    aget v4, v8, v2

    const/4 v5, 0x1

    aget v5, v8, v5

    const/4 v6, 0x2

    aget v6, v8, v6

    invoke-direct {v0, v4, v5, v6}, Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;-><init>(FFF)V

    aput-object v0, v9, v10

    .line 46
    add-int/lit8 v10, v10, 0x1

    goto :goto_1c

    .line 52
    :cond_37
    return-object v9
.end method

.method public static replaceIlluminationLayer([Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 12
    .param p0, "hsvPixelsOriginal"    # [Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
    .param p1, "grayscaleLayer"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    .line 56
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    .line 57
    .local v7, "height":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 59
    .local v3, "width":I
    mul-int v0, v3, v7

    new-array v1, v0, [I

    .local v1, "pixels":[I
    move-object v0, p1

    move v4, v2

    move v5, v2

    move v6, v3

    .line 60
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 62
    const/4 v0, 0x3

    new-array v8, v0, [F

    .line 63
    .local v8, "hsv":[F
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_18
    mul-int v0, v3, v7

    if-ge v9, v0, :cond_3f

    .line 65
    aget-object v0, p0, v9

    iget v0, v0, Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;->h:F

    aput v0, v8, v2

    .line 66
    const/4 v0, 0x1

    aget-object v4, p0, v9

    iget v4, v4, Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;->s:F

    aput v4, v8, v0

    .line 67
    const/4 v0, 0x2

    aget v4, v1, v9

    invoke-static {v4}, Landroid/graphics/Color;->red(I)I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x437f0000

    div-float/2addr v4, v5

    aput v4, v8, v0

    .line 69
    invoke-static {v8}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v0

    aput v0, v1, v9

    .line 63
    add-int/lit8 v9, v9, 0x1

    goto :goto_18

    .line 75
    :cond_3f
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v3, v7, v0}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static rotateImage(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;
    .registers 9
    .param p0, "bmp"    # Landroid/graphics/Bitmap;
    .param p1, "degree"    # F

    .prologue
    const/4 v1, 0x0

    .line 16
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 17
    .local v5, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v5, p1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 18
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p0

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
