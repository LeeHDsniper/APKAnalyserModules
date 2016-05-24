.class public Lcom/dumplingsandwich/pencilsketch/processor/GrayscaleImageProcessor;
.super Ljava/lang/Object;
.source "GrayscaleImageProcessor.java"


# direct methods
.method public static grayscaleBaseSketch(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 20
    .param p0, "bmp"    # Landroid/graphics/Bitmap;

    .prologue
    .line 12
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    .line 13
    .local v5, "width":I
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    .line 14
    .local v9, "height":I
    mul-int v2, v5, v9

    new-array v3, v2, [I

    .line 15
    .local v3, "pixSrc":[I
    mul-int v2, v5, v9

    new-array v11, v2, [I

    .line 17
    .local v11, "pixNvt":[I
    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p0

    move v8, v5

    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 19
    const/16 v18, 0x0

    .local v18, "pos":I
    :goto_1b
    mul-int v2, v9, v5

    move/from16 v0, v18

    if-ge v0, v2, :cond_42

    .line 20
    aget v2, v3, v18

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v2

    aget v4, v3, v18

    invoke-static {v4}, Landroid/graphics/Color;->green(I)I

    move-result v4

    add-int/2addr v2, v4

    aget v4, v3, v18

    invoke-static {v4}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    add-int/2addr v2, v4

    div-int/lit8 v2, v2, 0x3

    aput v2, v3, v18

    .line 21
    aget v2, v3, v18

    rsub-int v2, v2, 0xff

    aput v2, v11, v18

    .line 19
    add-int/lit8 v18, v18, 0x1

    goto :goto_1b

    .line 24
    :cond_42
    const-wide/high16 v12, 0x4049000000000000L

    const-wide/high16 v14, 0x4049000000000000L

    move/from16 v16, v5

    move/from16 v17, v9

    invoke-static/range {v11 .. v17}, Lcom/dumplingsandwich/pencilsketch/processor/ImageProcessorHelper;->gaussGray([IDDII)I

    .line 26
    const/16 v18, 0x0

    :goto_4f
    mul-int v2, v9, v5

    move/from16 v0, v18

    if-ge v0, v2, :cond_6d

    .line 27
    aget v2, v3, v18

    shl-int/lit8 v10, v2, 0x8

    .line 28
    .local v10, "clr":I
    aget v2, v11, v18

    rsub-int v2, v2, 0x100

    div-int/2addr v10, v2

    .line 29
    const/16 v2, 0xff

    invoke-static {v10, v2}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 31
    invoke-static {v10, v10, v10}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    aput v2, v3, v18

    .line 26
    add-int/lit8 v18, v18, 0x1

    goto :goto_4f

    .line 35
    .end local v10    # "clr":I
    :cond_6d
    const/4 v11, 0x0

    .line 37
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v5, v9, v2}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    return-object v2
.end method

.method public static grayscaleCrossHatchSketch(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;
    .registers 32
    .param p0, "original"    # Landroid/graphics/Bitmap;
    .param p1, "mask"    # Landroid/graphics/Bitmap;
    .param p2, "factor"    # F

    .prologue
    .line 81
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v17

    .line 82
    .local v17, "height":I
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v13

    .line 84
    .local v13, "width":I
    move/from16 v0, v17

    if-le v13, v0, :cond_27

    .line 86
    new-instance v9, Landroid/graphics/Matrix;

    invoke-direct {v9}, Landroid/graphics/Matrix;-><init>()V

    .line 87
    .local v9, "left_mat":Landroid/graphics/Matrix;
    const/high16 v4, -0x3d4c0000

    invoke-virtual {v9, v4}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 88
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    const/4 v10, 0x1

    move-object/from16 v4, p1

    invoke-static/range {v4 .. v10}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 90
    .end local v9    # "left_mat":Landroid/graphics/Matrix;
    :cond_27
    const/4 v4, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v13, v1, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 92
    mul-int v4, v13, v17

    new-array v11, v4, [I

    .line 93
    .local v11, "pixels":[I
    mul-int v4, v13, v17

    new-array v0, v4, [I

    move-object/from16 v19, v0

    .line 94
    .local v19, "mask_pixels":[I
    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v10, p0

    move/from16 v16, v13

    invoke-virtual/range {v10 .. v17}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 95
    const/16 v20, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v18, p1

    move/from16 v21, v13

    move/from16 v24, v13

    move/from16 v25, v17

    invoke-virtual/range {v18 .. v25}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 98
    const/16 v27, 0x0

    .local v27, "i":I
    :goto_57
    mul-int v4, v17, v13

    move/from16 v0, v27

    if-ge v0, v4, :cond_ad

    .line 100
    aget v4, v11, v27

    invoke-static {v4}, Landroid/graphics/Color;->red(I)I

    move-result v4

    int-to-double v4, v4

    const-wide v6, 0x3fd322d0e5604189L

    mul-double/2addr v4, v6

    aget v6, v11, v27

    invoke-static {v6}, Landroid/graphics/Color;->green(I)I

    move-result v6

    int-to-double v6, v6

    const-wide v14, 0x3fe2c8b439581062L

    mul-double/2addr v6, v14

    add-double/2addr v4, v6

    aget v6, v11, v27

    invoke-static {v6}, Landroid/graphics/Color;->blue(I)I

    move-result v6

    int-to-double v6, v6

    const-wide v14, 0x3fbd2f1a9fbe76c9L

    mul-double/2addr v6, v14

    add-double/2addr v4, v6

    double-to-int v0, v4

    move/from16 v26, v0

    .line 101
    .local v26, "grayscaleValue":I
    aget v4, v19, v27

    invoke-static {v4}, Landroid/graphics/Color;->red(I)I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3f800000

    sub-float v5, v5, p2

    mul-float/2addr v4, v5

    move/from16 v0, v26

    int-to-float v5, v0

    mul-float v5, v5, p2

    add-float/2addr v4, v5

    float-to-int v0, v4

    move/from16 v28, v0

    .line 102
    .local v28, "maskedValue":I
    move/from16 v0, v28

    move/from16 v1, v28

    move/from16 v2, v28

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    aput v4, v11, v27

    .line 98
    add-int/lit8 v27, v27, 0x1

    goto :goto_57

    .line 106
    .end local v26    # "grayscaleValue":I
    .end local v28    # "maskedValue":I
    :cond_ad
    const/16 v19, 0x0

    .line 108
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, v17

    invoke-static {v11, v13, v0, v4}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    return-object v4
.end method

.method public static grayscaleEdgeSketch(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 15
    .param p0, "grayscaleBaseLayer"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    .line 41
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    .line 42
    .local v7, "height":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 44
    .local v3, "width":I
    filled-new-array {v7, v3}, [I

    move-result-object v0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v4, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [[I

    .line 45
    .local v10, "grayscale_2D":[[I
    mul-int v0, v3, v7

    new-array v1, v0, [I

    .local v1, "pixels_1D":[I
    move-object v0, p0

    move v4, v2

    move v5, v2

    move v6, v3

    .line 46
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 47
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_21
    if-ge v11, v7, :cond_39

    .line 49
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_24
    if-ge v12, v3, :cond_36

    .line 51
    aget-object v0, v10, v11

    mul-int v2, v11, v3

    add-int/2addr v2, v12

    aget v2, v1, v2

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v2

    aput v2, v0, v12

    .line 49
    add-int/lit8 v12, v12, 0x1

    goto :goto_24

    .line 47
    :cond_36
    add-int/lit8 v11, v11, 0x1

    goto :goto_21

    .line 57
    .end local v12    # "j":I
    :cond_39
    const/4 v11, 0x1

    :goto_3a
    add-int/lit8 v0, v7, -0x1

    if-ge v11, v0, :cond_d1

    .line 59
    const/4 v12, 0x1

    .restart local v12    # "j":I
    :goto_3f
    add-int/lit8 v0, v3, -0x1

    if-ge v12, v0, :cond_cd

    .line 61
    add-int/lit8 v0, v11, 0x1

    aget-object v0, v10, v0

    add-int/lit8 v2, v12, -0x1

    aget v0, v0, v2

    add-int/lit8 v2, v11, 0x1

    aget-object v2, v10, v2

    aget v2, v2, v12

    add-int/2addr v0, v2

    add-int/lit8 v2, v11, 0x1

    aget-object v2, v10, v2

    add-int/lit8 v4, v12, 0x1

    aget v2, v2, v4

    add-int/2addr v0, v2

    add-int/lit8 v2, v11, -0x1

    aget-object v2, v10, v2

    add-int/lit8 v4, v12, -0x1

    aget v2, v2, v4

    sub-int/2addr v0, v2

    add-int/lit8 v2, v11, -0x1

    aget-object v2, v10, v2

    aget v2, v2, v12

    sub-int/2addr v0, v2

    add-int/lit8 v2, v11, -0x1

    aget-object v2, v10, v2

    add-int/lit8 v4, v12, 0x1

    aget v2, v2, v4

    sub-int/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v8

    .line 62
    .local v8, "delta_x":I
    add-int/lit8 v0, v11, -0x1

    aget-object v0, v10, v0

    add-int/lit8 v2, v12, 0x1

    aget v0, v0, v2

    aget-object v2, v10, v11

    add-int/lit8 v4, v12, 0x1

    aget v2, v2, v4

    add-int/2addr v0, v2

    add-int/lit8 v2, v11, 0x1

    aget-object v2, v10, v2

    add-int/lit8 v4, v12, 0x1

    aget v2, v2, v4

    add-int/2addr v0, v2

    add-int/lit8 v2, v11, -0x1

    aget-object v2, v10, v2

    add-int/lit8 v4, v12, -0x1

    aget v2, v2, v4

    sub-int/2addr v0, v2

    aget-object v2, v10, v11

    add-int/lit8 v4, v12, -0x1

    aget v2, v2, v4

    sub-int/2addr v0, v2

    add-int/lit8 v2, v11, 0x1

    aget-object v2, v10, v2

    add-int/lit8 v4, v12, -0x1

    aget v2, v2, v4

    sub-int/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v9

    .line 63
    .local v9, "delta_y":I
    mul-int v0, v8, v8

    mul-int v2, v9, v9

    add-int/2addr v0, v2

    int-to-double v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-int v13, v4

    .line 65
    .local v13, "value":I
    const/16 v0, 0xff

    if-le v13, v0, :cond_be

    .line 66
    const/16 v13, 0xff

    .line 68
    :cond_be
    rsub-int v13, v13, 0xff

    .line 70
    mul-int v0, v11, v3

    add-int/2addr v0, v12

    invoke-static {v13, v13, v13}, Landroid/graphics/Color;->rgb(III)I

    move-result v2

    aput v2, v1, v0

    .line 59
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_3f

    .line 57
    .end local v8    # "delta_x":I
    .end local v9    # "delta_y":I
    .end local v13    # "value":I
    :cond_cd
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_3a

    .line 75
    .end local v12    # "j":I
    :cond_d1
    const/4 v10, 0x0

    check-cast v10, [[I

    .line 77
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v3, v7, v0}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
