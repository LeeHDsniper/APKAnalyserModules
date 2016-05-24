.class Landroid/support/v4/widget/TextViewCompatJbMr1;
.super Ljava/lang/Object;
.source "TextViewCompatJbMr1.java"


# direct methods
.method public static setCompoundDrawablesRelative(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 7
    .param p0, "textView"    # Landroid/widget/TextView;
    .param p1, "start"    # Landroid/graphics/drawable/Drawable;
    .param p2, "top"    # Landroid/graphics/drawable/Drawable;
    .param p3, "end"    # Landroid/graphics/drawable/Drawable;
    .param p4, "bottom"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayoutDirection()I

    move-result v1

    if-ne v1, v0, :cond_10

    .line 31
    .local v0, "rtl":Z
    :goto_7
    if-eqz v0, :cond_12

    move-object v1, p3

    :goto_a
    if-eqz v0, :cond_14

    .end local p1    # "start":Landroid/graphics/drawable/Drawable;
    :goto_c
    invoke-virtual {p0, v1, p2, p1, p4}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 32
    return-void

    .line 30
    .end local v0    # "rtl":Z
    .restart local p1    # "start":Landroid/graphics/drawable/Drawable;
    :cond_10
    const/4 v0, 0x0

    goto :goto_7

    .restart local v0    # "rtl":Z
    :cond_12
    move-object v1, p1

    .line 31
    goto :goto_a

    :cond_14
    move-object p1, p3

    goto :goto_c
.end method
