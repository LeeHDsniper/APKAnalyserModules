.class Landroid/support/v4/graphics/drawable/DrawableCompatLollipop;
.super Ljava/lang/Object;
.source "DrawableCompatLollipop.java"


# direct methods
.method public static setHotspot(Landroid/graphics/drawable/Drawable;FF)V
    .registers 3
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 30
    invoke-virtual {p0, p1, p2}, Landroid/graphics/drawable/Drawable;->setHotspot(FF)V

    .line 31
    return-void
.end method

.method public static setHotspotBounds(Landroid/graphics/drawable/Drawable;IIII)V
    .registers 5
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setHotspotBounds(IIII)V

    .line 36
    return-void
.end method

.method public static setTint(Landroid/graphics/drawable/Drawable;I)V
    .registers 3
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p1, "tint"    # I

    .prologue
    .line 39
    instance-of v0, p0, Landroid/support/v4/graphics/drawable/DrawableWrapperLollipop;

    if-eqz v0, :cond_8

    .line 42
    invoke-static {p0, p1}, Landroid/support/v4/graphics/drawable/DrawableCompatBase;->setTint(Landroid/graphics/drawable/Drawable;I)V

    .line 47
    :goto_7
    return-void

    .line 45
    :cond_8
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    goto :goto_7
.end method

.method public static setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 50
    instance-of v0, p0, Landroid/support/v4/graphics/drawable/DrawableWrapperLollipop;

    if-eqz v0, :cond_8

    .line 53
    invoke-static {p0, p1}, Landroid/support/v4/graphics/drawable/DrawableCompatBase;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 58
    :goto_7
    return-void

    .line 56
    :cond_8
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_7
.end method

.method public static setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V
    .registers 3
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 61
    instance-of v0, p0, Landroid/support/v4/graphics/drawable/DrawableWrapperLollipop;

    if-eqz v0, :cond_8

    .line 64
    invoke-static {p0, p1}, Landroid/support/v4/graphics/drawable/DrawableCompatBase;->setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 69
    :goto_7
    return-void

    .line 67
    :cond_8
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_7
.end method

.method public static wrapForTinting(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 72
    instance-of v0, p0, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_a

    .line 75
    new-instance v0, Landroid/support/v4/graphics/drawable/DrawableWrapperLollipop;

    invoke-direct {v0, p0}, Landroid/support/v4/graphics/drawable/DrawableWrapperLollipop;-><init>(Landroid/graphics/drawable/Drawable;)V

    move-object p0, v0

    .line 77
    .end local p0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_a
    return-object p0
.end method