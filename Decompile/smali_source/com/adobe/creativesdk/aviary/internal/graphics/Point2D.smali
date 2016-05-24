.class public final Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;
.super Ljava/lang/Object;
.source "Point2D.java"


# direct methods
.method public static angle360(D)D
    .registers 6
    .param p0, "angle"    # D

    .prologue
    const-wide v2, 0x4076800000000000L

    .line 49
    const-wide/16 v0, 0x0

    cmpg-double v0, p0, v0

    if-gez v0, :cond_15

    .line 50
    const-wide v0, -0x3f89800000000000L

    rem-double v0, p0, v0

    add-double p0, v0, v2

    .line 54
    :goto_14
    return-wide p0

    .line 52
    :cond_15
    rem-double/2addr p0, v2

    goto :goto_14
.end method

.method public static angleBetweenPoints(FFFFF)D
    .registers 13
    .param p0, "x1"    # F
    .param p1, "y1"    # F
    .param p2, "x2"    # F
    .param p3, "y2"    # F
    .param p4, "snapAngle"    # F

    .prologue
    .line 36
    cmpl-float v4, p0, p2

    if-nez v4, :cond_b

    cmpl-float v4, p1, p3

    if-nez v4, :cond_b

    .line 37
    const-wide/16 v4, 0x0

    .line 45
    :goto_a
    return-wide v4

    .line 40
    :cond_b
    sub-float v4, p0, p2

    float-to-double v4, v4

    sub-float v6, p1, p3

    float-to-double v6, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    .line 41
    .local v2, "gradiant":D
    const/4 v4, 0x0

    cmpl-float v4, p4, v4

    if-lez v4, :cond_25

    .line 42
    float-to-double v4, p4

    div-double v4, v2, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    long-to-float v4, v4

    mul-float/2addr v4, p4

    float-to-double v4, v4

    goto :goto_a

    .line 44
    :cond_25
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->degrees(D)D

    move-result-wide v0

    .line 45
    .local v0, "angle":D
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angle360(D)D

    move-result-wide v4

    goto :goto_a
.end method

.method public static angleBetweenPoints(Landroid/graphics/PointF;Landroid/graphics/PointF;)D
    .registers 4
    .param p0, "pt0"    # Landroid/graphics/PointF;
    .param p1, "pt1"    # Landroid/graphics/PointF;

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angleBetweenPoints(Landroid/graphics/PointF;Landroid/graphics/PointF;F)D

    move-result-wide v0

    return-wide v0
.end method

.method public static angleBetweenPoints(Landroid/graphics/PointF;Landroid/graphics/PointF;F)D
    .registers 7
    .param p0, "pt0"    # Landroid/graphics/PointF;
    .param p1, "pt1"    # Landroid/graphics/PointF;
    .param p2, "snapAngle"    # F

    .prologue
    .line 77
    iget v0, p0, Landroid/graphics/PointF;->x:F

    iget v1, p0, Landroid/graphics/PointF;->y:F

    iget v2, p1, Landroid/graphics/PointF;->x:F

    iget v3, p1, Landroid/graphics/PointF;->y:F

    invoke-static {v0, v1, v2, v3, p2}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angleBetweenPoints(FFFFF)D

    move-result-wide v0

    return-wide v0
.end method

.method public static angleBetweenPoints([F[F)D
    .registers 7
    .param p0, "pt0"    # [F
    .param p1, "pt1"    # [F

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 22
    aget v0, p0, v2

    aget v1, p0, v3

    aget v2, p1, v2

    aget v3, p1, v3

    const/4 v4, 0x0

    invoke-static {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angleBetweenPoints(FFFFF)D

    move-result-wide v0

    return-wide v0
.end method

.method public static degrees(D)D
    .registers 4
    .param p0, "radians"    # D

    .prologue
    .line 87
    const-wide v0, 0x404ca5dc1a63c1f8L

    mul-double/2addr v0, p0

    return-wide v0
.end method

.method public static distance(FFFF)D
    .registers 10
    .param p0, "x2"    # F
    .param p1, "y2"    # F
    .param p2, "x1"    # F
    .param p3, "y1"    # F

    .prologue
    const-wide/high16 v4, 0x4000000000000000L

    .line 115
    sub-float v0, p0, p2

    float-to-double v0, v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    sub-float v2, p1, p3

    float-to-double v2, v2

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static distance(Landroid/graphics/PointF;Landroid/graphics/PointF;)D
    .registers 6
    .param p0, "pt1"    # Landroid/graphics/PointF;
    .param p1, "pt2"    # Landroid/graphics/PointF;

    .prologue
    .line 102
    iget v0, p0, Landroid/graphics/PointF;->x:F

    iget v1, p0, Landroid/graphics/PointF;->y:F

    iget v2, p1, Landroid/graphics/PointF;->x:F

    iget v3, p1, Landroid/graphics/PointF;->y:F

    invoke-static {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->distance(FFFF)D

    move-result-wide v0

    return-wide v0
.end method

.method public static distance([F[F)D
    .registers 6
    .param p0, "pt1"    # [F
    .param p1, "pt2"    # [F

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 98
    aget v0, p0, v2

    aget v1, p0, v3

    aget v2, p1, v2

    aget v3, p1, v3

    invoke-static {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->distance(FFFF)D

    move-result-wide v0

    return-wide v0
.end method

.method public static getLerp(Landroid/graphics/PointF;Landroid/graphics/PointF;FLandroid/graphics/PointF;)V
    .registers 8
    .param p0, "pt1"    # Landroid/graphics/PointF;
    .param p1, "pt2"    # Landroid/graphics/PointF;
    .param p2, "t"    # F
    .param p3, "dstPoint"    # Landroid/graphics/PointF;

    .prologue
    .line 310
    iget v0, p0, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->x:F

    iget v2, p0, Landroid/graphics/PointF;->x:F

    sub-float/2addr v1, v2

    mul-float/2addr v1, p2

    add-float/2addr v0, v1

    iget v1, p0, Landroid/graphics/PointF;->y:F

    iget v2, p1, Landroid/graphics/PointF;->y:F

    iget v3, p0, Landroid/graphics/PointF;->y:F

    sub-float/2addr v2, v3

    mul-float/2addr v2, p2

    add-float/2addr v1, v2

    invoke-virtual {p3, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 311
    return-void
.end method

.method public static grow(Landroid/graphics/RectF;FF)V
    .registers 6
    .param p0, "rect"    # Landroid/graphics/RectF;
    .param p1, "offsetX"    # F
    .param p2, "offsetY"    # F

    .prologue
    const/high16 v2, 0x40000000

    .line 321
    iget v0, p0, Landroid/graphics/RectF;->left:F

    div-float v1, p1, v2

    sub-float/2addr v0, v1

    iput v0, p0, Landroid/graphics/RectF;->left:F

    .line 322
    iget v0, p0, Landroid/graphics/RectF;->top:F

    div-float v1, p2, v2

    sub-float/2addr v0, v1

    iput v0, p0, Landroid/graphics/RectF;->top:F

    .line 324
    iget v0, p0, Landroid/graphics/RectF;->right:F

    div-float v1, p1, v2

    add-float/2addr v0, v1

    iput v0, p0, Landroid/graphics/RectF;->right:F

    .line 325
    iget v0, p0, Landroid/graphics/RectF;->bottom:F

    div-float v1, p2, v2

    add-float/2addr v0, v1

    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    .line 326
    return-void
.end method

.method public static hypotenuse(Landroid/graphics/RectF;)D
    .registers 7
    .param p0, "rect"    # Landroid/graphics/RectF;

    .prologue
    const-wide/high16 v4, 0x4000000000000000L

    .line 119
    iget v0, p0, Landroid/graphics/RectF;->right:F

    iget v1, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    iget v3, p0, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static intersection([Landroid/graphics/PointF;[Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 16
    .param p0, "a"    # [Landroid/graphics/PointF;
    .param p1, "b"    # [Landroid/graphics/PointF;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 229
    aget-object v8, p0, v9

    iget v0, v8, Landroid/graphics/PointF;->x:F

    .line 230
    .local v0, "x1":F
    aget-object v8, p0, v9

    iget v4, v8, Landroid/graphics/PointF;->y:F

    .line 231
    .local v4, "y1":F
    aget-object v8, p0, v10

    iget v1, v8, Landroid/graphics/PointF;->x:F

    .line 232
    .local v1, "x2":F
    aget-object v8, p0, v10

    iget v5, v8, Landroid/graphics/PointF;->y:F

    .line 234
    .local v5, "y2":F
    aget-object v8, p1, v9

    iget v2, v8, Landroid/graphics/PointF;->x:F

    .line 235
    .local v2, "x3":F
    aget-object v8, p1, v9

    iget v6, v8, Landroid/graphics/PointF;->y:F

    .line 236
    .local v6, "y3":F
    aget-object v8, p1, v10

    iget v3, v8, Landroid/graphics/PointF;->x:F

    .line 237
    .local v3, "x4":F
    aget-object v8, p1, v10

    iget v7, v8, Landroid/graphics/PointF;->y:F

    .line 239
    .local v7, "y4":F
    new-instance v8, Landroid/graphics/PointF;

    mul-float v9, v0, v5

    mul-float v10, v4, v1

    sub-float/2addr v9, v10

    sub-float v10, v2, v3

    mul-float/2addr v9, v10

    sub-float v10, v0, v1

    mul-float v11, v2, v7

    mul-float v12, v6, v3

    sub-float/2addr v11, v12

    mul-float/2addr v10, v11

    sub-float/2addr v9, v10

    sub-float v10, v0, v1

    sub-float v11, v6, v7

    mul-float/2addr v10, v11

    sub-float v11, v4, v5

    sub-float v12, v2, v3

    mul-float/2addr v11, v12

    sub-float/2addr v10, v11

    div-float/2addr v9, v10

    mul-float v10, v0, v5

    mul-float v11, v4, v1

    sub-float/2addr v10, v11

    sub-float v11, v6, v7

    mul-float/2addr v10, v11

    sub-float v11, v4, v5

    mul-float v12, v2, v7

    mul-float v13, v6, v3

    sub-float/2addr v12, v13

    mul-float/2addr v11, v12

    sub-float/2addr v10, v11

    sub-float v11, v0, v1

    sub-float v12, v6, v7

    mul-float/2addr v11, v12

    sub-float v12, v4, v5

    sub-float v13, v2, v3

    mul-float/2addr v12, v13

    sub-float/2addr v11, v12

    div-float/2addr v10, v11

    invoke-direct {v8, v9, v10}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v8
.end method

.method public static radians(D)D
    .registers 4
    .param p0, "degree"    # D

    .prologue
    .line 129
    const-wide v0, 0x3f91df46a2529d39L

    mul-double/2addr v0, p0

    return-wide v0
.end method

.method public static rotate(Landroid/graphics/PointF;D)V
    .registers 14
    .param p0, "point"    # Landroid/graphics/PointF;
    .param p1, "angle"    # D

    .prologue
    .line 189
    iget v4, p0, Landroid/graphics/PointF;->x:F

    .line 190
    .local v4, "x":F
    iget v5, p0, Landroid/graphics/PointF;->y:F

    .line 191
    .local v5, "y":F
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    .line 192
    .local v0, "ca":D
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    .line 193
    .local v2, "sa":D
    float-to-double v6, v4

    mul-double/2addr v6, v0

    float-to-double v8, v5

    mul-double/2addr v8, v2

    sub-double/2addr v6, v8

    double-to-float v6, v6

    iput v6, p0, Landroid/graphics/PointF;->x:F

    .line 194
    float-to-double v6, v4

    mul-double/2addr v6, v2

    float-to-double v8, v5

    mul-double/2addr v8, v0

    add-double/2addr v6, v8

    double-to-float v6, v6

    iput v6, p0, Landroid/graphics/PointF;->y:F

    .line 195
    return-void
.end method

.method public static rotate([Landroid/graphics/PointF;D)V
    .registers 6
    .param p0, "points"    # [Landroid/graphics/PointF;
    .param p1, "angle"    # D

    .prologue
    .line 139
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_c

    .line 140
    aget-object v1, p0, v0

    invoke-static {v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->rotate(Landroid/graphics/PointF;D)V

    .line 139
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 142
    :cond_c
    return-void
.end method

.method public static translate(Landroid/graphics/PointF;FF)V
    .registers 4
    .param p0, "point"    # Landroid/graphics/PointF;
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 218
    iget v0, p0, Landroid/graphics/PointF;->x:F

    add-float/2addr v0, p1

    iput v0, p0, Landroid/graphics/PointF;->x:F

    .line 219
    iget v0, p0, Landroid/graphics/PointF;->y:F

    add-float/2addr v0, p2

    iput v0, p0, Landroid/graphics/PointF;->y:F

    .line 220
    return-void
.end method

.method public static translate([Landroid/graphics/PointF;FF)V
    .registers 5
    .param p0, "points"    # [Landroid/graphics/PointF;
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 205
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_c

    .line 206
    aget-object v1, p0, v0

    invoke-static {v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->translate(Landroid/graphics/PointF;FF)V

    .line 205
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 208
    :cond_c
    return-void
.end method
