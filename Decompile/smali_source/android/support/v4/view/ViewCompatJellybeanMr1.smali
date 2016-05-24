.class Landroid/support/v4/view/ViewCompatJellybeanMr1;
.super Ljava/lang/Object;
.source "ViewCompatJellybeanMr1.java"


# direct methods
.method public static getLayoutDirection(Landroid/view/View;)I
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v0

    return v0
.end method

.method public static getPaddingEnd(Landroid/view/View;)I
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    move-result v0

    return v0
.end method

.method public static getPaddingStart(Landroid/view/View;)I
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    move-result v0

    return v0
.end method

.method public static getWindowSystemUiVisibility(Landroid/view/View;)I
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getWindowSystemUiVisibility()I

    move-result v0

    return v0
.end method

.method public static isPaddingRelative(Landroid/view/View;)Z
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->isPaddingRelative()Z

    move-result v0

    return v0
.end method

.method public static setLayerPaint(Landroid/view/View;Landroid/graphics/Paint;)V
    .registers 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 36
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayerPaint(Landroid/graphics/Paint;)V

    .line 37
    return-void
.end method

.method public static setPaddingRelative(Landroid/view/View;IIII)V
    .registers 5
    .param p0, "view"    # Landroid/view/View;
    .param p1, "start"    # I
    .param p2, "top"    # I
    .param p3, "end"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 56
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/view/View;->setPaddingRelative(IIII)V

    .line 57
    return-void
.end method
