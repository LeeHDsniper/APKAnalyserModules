.class public Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;
.super Ljava/lang/Object;
.source "AspectRatioUtil.java"


# direct methods
.method public static calculateAspectRatio(FFFF)F
    .registers 7
    .param p0, "left"    # F
    .param p1, "top"    # F
    .param p2, "right"    # F
    .param p3, "bottom"    # F

    .prologue
    .line 28
    sub-float v2, p2, p0

    .line 29
    .local v2, "width":F
    sub-float v1, p3, p1

    .line 30
    .local v1, "height":F
    div-float v0, v2, v1

    .line 32
    .local v0, "aspectRatio":F
    return v0
.end method

.method public static calculateAspectRatio(Landroid/graphics/Rect;)F
    .registers 4
    .param p0, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 40
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 42
    .local v0, "aspectRatio":F
    return v0
.end method

.method public static calculateBottom(FFFF)F
    .registers 7
    .param p0, "left"    # F
    .param p1, "top"    # F
    .param p2, "right"    # F
    .param p3, "targetAspectRatio"    # F

    .prologue
    .line 97
    sub-float v1, p2, p0

    .line 102
    .local v1, "width":F
    div-float v2, v1, p3

    add-float v0, v2, p1

    .line 104
    .local v0, "bottom":F
    return v0
.end method

.method public static calculateHeight(FFF)F
    .registers 5
    .param p0, "left"    # F
    .param p1, "right"    # F
    .param p2, "targetAspectRatio"    # F

    .prologue
    .line 125
    sub-float v1, p1, p0

    .line 126
    .local v1, "width":F
    div-float v0, v1, p2

    .line 128
    .local v0, "height":F
    return v0
.end method

.method public static calculateLeft(FFFF)F
    .registers 7
    .param p0, "top"    # F
    .param p1, "right"    # F
    .param p2, "bottom"    # F
    .param p3, "targetAspectRatio"    # F

    .prologue
    .line 51
    sub-float v0, p2, p0

    .line 55
    .local v0, "height":F
    mul-float v2, p3, v0

    sub-float v1, p1, v2

    .line 57
    .local v1, "left":F
    return v1
.end method

.method public static calculateRight(FFFF)F
    .registers 7
    .param p0, "left"    # F
    .param p1, "top"    # F
    .param p2, "bottom"    # F
    .param p3, "targetAspectRatio"    # F

    .prologue
    .line 82
    sub-float v0, p2, p1

    .line 86
    .local v0, "height":F
    mul-float v2, p3, v0

    add-float v1, v2, p0

    .line 88
    .local v1, "right":F
    return v1
.end method

.method public static calculateTop(FFFF)F
    .registers 7
    .param p0, "left"    # F
    .param p1, "right"    # F
    .param p2, "bottom"    # F
    .param p3, "targetAspectRatio"    # F

    .prologue
    .line 66
    sub-float v1, p1, p0

    .line 71
    .local v1, "width":F
    div-float v2, v1, p3

    sub-float v0, p2, v2

    .line 73
    .local v0, "top":F
    return v0
.end method

.method public static calculateWidth(FFF)F
    .registers 5
    .param p0, "top"    # F
    .param p1, "bottom"    # F
    .param p2, "targetAspectRatio"    # F

    .prologue
    .line 113
    sub-float v0, p1, p0

    .line 114
    .local v0, "height":F
    mul-float v1, p2, v0

    .line 116
    .local v1, "width":F
    return v1
.end method
