.class public final Lcom/adobe/creativesdk/aviary/internal/utils/MatrixUtils;
.super Ljava/lang/Object;
.source "MatrixUtils.java"


# direct methods
.method public static getScale(Landroid/graphics/Matrix;)[F
    .registers 5
    .param p0, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v3, 0x0

    .line 41
    const/16 v1, 0x9

    new-array v0, v1, [F

    .line 42
    .local v0, "points":[F
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 43
    const/4 v1, 0x2

    new-array v1, v1, [F

    aget v2, v0, v3

    aput v2, v1, v3

    const/4 v2, 0x1

    const/4 v3, 0x4

    aget v3, v0, v3

    aput v3, v1, v2

    return-object v1
.end method

.method public static mapPoints(Landroid/graphics/Matrix;[F)V
    .registers 10
    .param p0, "matrix"    # Landroid/graphics/Matrix;
    .param p1, "points"    # [F

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x1

    const/4 v5, 0x4

    const/4 v4, 0x2

    const/4 v3, 0x0

    .line 21
    const/16 v1, 0x9

    new-array v0, v1, [F

    fill-array-data v0, :array_3e

    .line 22
    .local v0, "m":[F
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 24
    aget v1, p1, v3

    aget v2, v0, v3

    mul-float/2addr v1, v2

    aget v2, v0, v4

    add-float/2addr v1, v2

    aput v1, p1, v3

    .line 25
    aget v1, p1, v6

    aget v2, v0, v5

    mul-float/2addr v1, v2

    const/4 v2, 0x5

    aget v2, v0, v2

    add-float/2addr v1, v2

    aput v1, p1, v6

    .line 27
    array-length v1, p1

    if-ne v1, v5, :cond_3c

    .line 28
    aget v1, p1, v4

    aget v2, v0, v3

    mul-float/2addr v1, v2

    aget v2, v0, v4

    add-float/2addr v1, v2

    aput v1, p1, v4

    .line 29
    aget v1, p1, v7

    aget v2, v0, v5

    mul-float/2addr v1, v2

    const/4 v2, 0x5

    aget v2, v0, v2

    add-float/2addr v1, v2

    aput v1, p1, v7

    .line 31
    :cond_3c
    return-void

    .line 21
    nop

    :array_3e
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method
