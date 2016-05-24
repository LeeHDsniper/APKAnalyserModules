.class Landroid/support/v4/view/GravityCompatJellybeanMr1;
.super Ljava/lang/Object;
.source "GravityCompatJellybeanMr1.java"


# direct methods
.method public static apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V
    .registers 6
    .param p0, "gravity"    # I
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "container"    # Landroid/graphics/Rect;
    .param p4, "outRect"    # Landroid/graphics/Rect;
    .param p5, "layoutDirection"    # I

    .prologue
    .line 31
    invoke-static/range {p0 .. p5}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 32
    return-void
.end method

.method public static getAbsoluteGravity(II)I
    .registers 3
    .param p0, "gravity"    # I
    .param p1, "layoutDirection"    # I

    .prologue
    .line 26
    invoke-static {p0, p1}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v0

    return v0
.end method
