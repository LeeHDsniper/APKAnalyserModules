.class Landroid/support/v4/view/MarginLayoutParamsCompatJellybeanMr1;
.super Ljava/lang/Object;
.source "MarginLayoutParamsCompatJellybeanMr1.java"


# direct methods
.method public static getMarginEnd(Landroid/view/ViewGroup$MarginLayoutParams;)I
    .registers 2
    .param p0, "lp"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .prologue
    .line 28
    invoke-virtual {p0}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v0

    return v0
.end method

.method public static getMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;)I
    .registers 2
    .param p0, "lp"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .prologue
    .line 24
    invoke-virtual {p0}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v0

    return v0
.end method
