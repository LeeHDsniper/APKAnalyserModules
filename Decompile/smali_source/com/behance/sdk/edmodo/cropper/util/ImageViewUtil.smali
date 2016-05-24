.class public Lcom/behance/sdk/edmodo/cropper/util/ImageViewUtil;
.super Ljava/lang/Object;
.source "ImageViewUtil.java"


# direct methods
.method public static getBitmapRectCenterInside(IIII)Landroid/graphics/Rect;
    .registers 5
    .param p0, "bitmapWidth"    # I
    .param p1, "bitmapHeight"    # I
    .param p2, "viewWidth"    # I
    .param p3, "viewHeight"    # I

    .prologue
    .line 59
    invoke-static {p0, p1, p2, p3}, Lcom/behance/sdk/edmodo/cropper/util/ImageViewUtil;->getBitmapRectCenterInsideHelper(IIII)Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method

.method public static getBitmapRectCenterInside(Landroid/graphics/Bitmap;Landroid/view/View;)Landroid/graphics/Rect;
    .registers 7
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 36
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 37
    .local v1, "bitmapWidth":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 38
    .local v0, "bitmapHeight":I
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    .line 39
    .local v3, "viewWidth":I
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 41
    .local v2, "viewHeight":I
    invoke-static {v1, v0, v3, v2}, Lcom/behance/sdk/edmodo/cropper/util/ImageViewUtil;->getBitmapRectCenterInsideHelper(IIII)Landroid/graphics/Rect;

    move-result-object v4

    return-object v4
.end method

.method private static getBitmapRectCenterInsideHelper(IIII)Landroid/graphics/Rect;
    .registers 22
    .param p0, "bitmapWidth"    # I
    .param p1, "bitmapHeight"    # I
    .param p2, "viewWidth"    # I
    .param p3, "viewHeight"    # I

    .prologue
    .line 82
    const-wide/high16 v12, 0x7ff0000000000000L

    .line 83
    .local v12, "viewToBitmapWidthRatio":D
    const-wide/high16 v10, 0x7ff0000000000000L

    .line 88
    .local v10, "viewToBitmapHeightRatio":D
    move/from16 v0, p2

    int-to-double v14, v0

    move/from16 v0, p0

    int-to-double v0, v0

    move-wide/from16 v16, v0

    div-double v12, v14, v16

    .line 91
    move/from16 v0, p3

    int-to-double v14, v0

    move/from16 v0, p1

    int-to-double v0, v0

    move-wide/from16 v16, v0

    div-double v10, v14, v16

    .line 96
    const-wide/high16 v14, 0x7ff0000000000000L

    cmpl-double v9, v12, v14

    if-nez v9, :cond_24

    const-wide/high16 v14, 0x7ff0000000000000L

    cmpl-double v9, v10, v14

    if-eqz v9, :cond_6c

    .line 98
    :cond_24
    cmpg-double v9, v12, v10

    if-gtz v9, :cond_5d

    .line 99
    move/from16 v0, p2

    int-to-double v6, v0

    .line 100
    .local v6, "resultWidth":D
    move/from16 v0, p1

    int-to-double v14, v0

    mul-double/2addr v14, v6

    move/from16 v0, p0

    int-to-double v0, v0

    move-wide/from16 v16, v0

    div-double v4, v14, v16

    .line 115
    .local v4, "resultHeight":D
    :goto_36
    move/from16 v0, p2

    int-to-double v14, v0

    cmpl-double v9, v6, v14

    if-nez v9, :cond_73

    .line 116
    const/4 v3, 0x0

    .line 117
    .local v3, "resultX":I
    move/from16 v0, p3

    int-to-double v14, v0

    sub-double/2addr v14, v4

    const-wide/high16 v16, 0x4000000000000000L

    div-double v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->round(D)J

    move-result-wide v14

    long-to-int v8, v14

    .line 127
    .local v8, "resultY":I
    :goto_4b
    new-instance v2, Landroid/graphics/Rect;

    .line 129
    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v14

    double-to-int v9, v14

    add-int/2addr v9, v3

    .line 130
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v14

    double-to-int v14, v14

    add-int/2addr v14, v8

    invoke-direct {v2, v3, v8, v9, v14}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 132
    .local v2, "result":Landroid/graphics/Rect;
    return-object v2

    .line 103
    .end local v2    # "result":Landroid/graphics/Rect;
    .end local v3    # "resultX":I
    .end local v4    # "resultHeight":D
    .end local v6    # "resultWidth":D
    .end local v8    # "resultY":I
    :cond_5d
    move/from16 v0, p3

    int-to-double v4, v0

    .line 104
    .restart local v4    # "resultHeight":D
    move/from16 v0, p0

    int-to-double v14, v0

    mul-double/2addr v14, v4

    move/from16 v0, p1

    int-to-double v0, v0

    move-wide/from16 v16, v0

    div-double v6, v14, v16

    .restart local v6    # "resultWidth":D
    goto :goto_36

    .line 110
    .end local v4    # "resultHeight":D
    .end local v6    # "resultWidth":D
    :cond_6c
    move/from16 v0, p1

    int-to-double v4, v0

    .line 111
    .restart local v4    # "resultHeight":D
    move/from16 v0, p0

    int-to-double v6, v0

    .restart local v6    # "resultWidth":D
    goto :goto_36

    .line 118
    :cond_73
    move/from16 v0, p3

    int-to-double v14, v0

    cmpl-double v9, v4, v14

    if-nez v9, :cond_89

    .line 119
    move/from16 v0, p2

    int-to-double v14, v0

    sub-double/2addr v14, v6

    const-wide/high16 v16, 0x4000000000000000L

    div-double v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->round(D)J

    move-result-wide v14

    long-to-int v3, v14

    .line 120
    .restart local v3    # "resultX":I
    const/4 v8, 0x0

    .restart local v8    # "resultY":I
    goto :goto_4b

    .line 123
    .end local v3    # "resultX":I
    .end local v8    # "resultY":I
    :cond_89
    move/from16 v0, p2

    int-to-double v14, v0

    sub-double/2addr v14, v6

    const-wide/high16 v16, 0x4000000000000000L

    div-double v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->round(D)J

    move-result-wide v14

    long-to-int v3, v14

    .line 124
    .restart local v3    # "resultX":I
    move/from16 v0, p3

    int-to-double v14, v0

    sub-double/2addr v14, v4

    const-wide/high16 v16, 0x4000000000000000L

    div-double v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->round(D)J

    move-result-wide v14

    long-to-int v8, v14

    .restart local v8    # "resultY":I
    goto :goto_4b
.end method
