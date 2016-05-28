.class public final Lcom/adobe/android/ui/utils/UIUtils;
.super Ljava/lang/Object;
.source "UIUtils.java"


# static fields
.field public static final AT_LEAST_16:Z

.field public static final AT_LEAST_21:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 29
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v0, v3, :cond_14

    move v0, v1

    :goto_9
    sput-boolean v0, Lcom/adobe/android/ui/utils/UIUtils;->AT_LEAST_21:Z

    .line 30
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v0, v3, :cond_16

    :goto_11
    sput-boolean v1, Lcom/adobe/android/ui/utils/UIUtils;->AT_LEAST_16:Z

    return-void

    :cond_14
    move v0, v2

    .line 29
    goto :goto_9

    :cond_16
    move v1, v2

    .line 30
    goto :goto_11
.end method

.method public static checkBits(II)Z
    .registers 3
    .param p0, "status"    # I
    .param p1, "checkBit"    # I

    .prologue
    .line 36
    and-int v0, p0, p1

    if-ne v0, p1, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static clearDrawableTint(Landroid/graphics/drawable/Drawable;)Z
    .registers 2
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 231
    sget-boolean v0, Lcom/adobe/android/ui/utils/UIUtils;->AT_LEAST_21:Z

    if-eqz v0, :cond_a

    .line 232
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 236
    :goto_8
    const/4 v0, 0x1

    return v0

    .line 234
    :cond_a
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    goto :goto_8
.end method

.method public static getActionBarHeight(Landroid/content/Context;)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 58
    const/4 v3, 0x1

    new-array v0, v3, [I

    sget v3, Lcom/adobe/android/ui/R$attr;->actionBarSize:I

    aput v3, v0, v4

    .line 59
    .local v0, "attrs":[I
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 60
    .local v2, "styledAttributes":Landroid/content/res/TypedArray;
    const/4 v3, 0x0

    invoke-virtual {v2, v4, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v3

    float-to-int v1, v3

    .line 61
    .local v1, "size":I
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 62
    return v1
.end method

.method public static getStatusBarHeight(Landroid/content/Context;)I
    .registers 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 102
    const/4 v1, 0x0

    .line 103
    .local v1, "result":I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "status_bar_height"

    const-string v4, "dimen"

    const-string v5, "android"

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 104
    .local v0, "resourceId":I
    if-lez v0, :cond_19

    .line 105
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 107
    :cond_19
    return v1
.end method

.method public static getThemeColor(Landroid/content/Context;I)I
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resId"    # I

    .prologue
    const/4 v4, 0x0

    .line 88
    const/4 v3, 0x1

    new-array v0, v3, [I

    aput p1, v0, v4

    .line 89
    .local v0, "attrs":[I
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 90
    .local v2, "styledAttributes":Landroid/content/res/TypedArray;
    invoke-virtual {v2, v4, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 91
    .local v1, "color":I
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 92
    return v1
.end method

.method public static setDrawableTint(Landroid/graphics/drawable/Drawable;I)Z
    .registers 5
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p1, "color"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 220
    sget-boolean v0, Lcom/adobe/android/ui/utils/UIUtils;->AT_LEAST_21:Z

    if-eqz v0, :cond_9

    .line 221
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 225
    :goto_8
    return v2

    .line 224
    :cond_9
    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, p1, v1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_8
.end method

.method public static setIndeterminateProgressBarTint(Landroid/widget/ProgressBar;I)Z
    .registers 5
    .param p0, "progress"    # Landroid/widget/ProgressBar;
    .param p1, "color"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 248
    sget-boolean v1, Lcom/adobe/android/ui/utils/UIUtils;->AT_LEAST_21:Z

    if-eqz v1, :cond_d

    .line 249
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    .line 254
    :goto_b
    const/4 v1, 0x1

    return v1

    .line 251
    :cond_d
    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 252
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    new-instance v1, Landroid/graphics/PorterDuffColorFilter;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, p1, v2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_b
.end method

.method public static setLayerDrawableTint(Landroid/graphics/drawable/LayerDrawable;II)Z
    .registers 5
    .param p0, "layerDrawable"    # Landroid/graphics/drawable/LayerDrawable;
    .param p1, "id"    # I
    .param p2, "color"    # I

    .prologue
    .line 187
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 188
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_b

    .line 189
    invoke-static {v0, p2}, Lcom/adobe/android/ui/utils/UIUtils;->setDrawableTint(Landroid/graphics/drawable/Drawable;I)Z

    move-result v1

    .line 191
    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public static setSeekBarProgressTint(Landroid/widget/SeekBar;I)Z
    .registers 9
    .param p0, "seekBar"    # Landroid/widget/SeekBar;
    .param p1, "color"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const v6, 0x102000d

    const/4 v3, 0x0

    .line 150
    sget-boolean v4, Lcom/adobe/android/ui/utils/UIUtils;->AT_LEAST_16:Z

    if-nez v4, :cond_9

    .line 175
    :cond_8
    :goto_8
    return v3

    .line 154
    :cond_9
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 156
    .local v1, "progressDrawable":Landroid/graphics/drawable/Drawable;
    instance-of v4, v1, Landroid/graphics/drawable/StateListDrawable;

    if-eqz v4, :cond_34

    move-object v2, v1

    .line 157
    check-cast v2, Landroid/graphics/drawable/StateListDrawable;

    .line 158
    .local v2, "stateListDrawable":Landroid/graphics/drawable/StateListDrawable;
    const/4 v4, 0x1

    new-array v4, v4, [I

    const v5, 0x101009e

    aput v5, v4, v3

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/StateListDrawable;->setState([I)Z

    .line 159
    invoke-virtual {v2}, Landroid/graphics/drawable/StateListDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 161
    .local v0, "current":Landroid/graphics/drawable/Drawable;
    instance-of v4, v0, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v4, :cond_8

    .line 162
    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .end local v0    # "current":Landroid/graphics/drawable/Drawable;
    invoke-static {v0, v6, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setLayerDrawableTint(Landroid/graphics/drawable/LayerDrawable;II)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 163
    invoke-static {p0, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setSeekBarThumbTint(Landroid/widget/SeekBar;I)Z

    move-result v3

    goto :goto_8

    .line 166
    .end local v2    # "stateListDrawable":Landroid/graphics/drawable/StateListDrawable;
    :cond_34
    instance-of v4, v1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v4, :cond_43

    .line 167
    invoke-static {v1, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setDrawableTint(Landroid/graphics/drawable/Drawable;I)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 168
    invoke-static {p0, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setSeekBarThumbTint(Landroid/widget/SeekBar;I)Z

    move-result v3

    goto :goto_8

    .line 170
    :cond_43
    instance-of v4, v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v4, :cond_8

    .line 171
    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    .end local v1    # "progressDrawable":Landroid/graphics/drawable/Drawable;
    invoke-static {v1, v6, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setLayerDrawableTint(Landroid/graphics/drawable/LayerDrawable;II)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 172
    invoke-static {p0, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setSeekBarThumbTint(Landroid/widget/SeekBar;I)Z

    move-result v3

    goto :goto_8
.end method

.method public static setSeekBarThumbTint(Landroid/widget/SeekBar;I)Z
    .registers 4
    .param p0, "seekBar"    # Landroid/widget/SeekBar;
    .param p1, "color"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 203
    sget-boolean v0, Lcom/adobe/android/ui/utils/UIUtils;->AT_LEAST_21:Z

    if-eqz v0, :cond_d

    .line 204
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    .line 208
    :cond_b
    :goto_b
    const/4 v0, 0x0

    return v0

    .line 205
    :cond_d
    sget-boolean v0, Lcom/adobe/android/ui/utils/UIUtils;->AT_LEAST_16:Z

    if-eqz v0, :cond_b

    .line 206
    invoke-virtual {p0}, Landroid/widget/SeekBar;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_b
.end method

.method public static setViewBackgroundTint(Landroid/view/View;I)Z
    .registers 4
    .param p0, "view"    # Landroid/view/View;
    .param p1, "color"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 266
    sget-boolean v1, Lcom/adobe/android/ui/utils/UIUtils;->AT_LEAST_21:Z

    if-eqz v1, :cond_d

    .line 267
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 268
    const/4 v1, 0x1

    .line 275
    :goto_c
    return v1

    .line 270
    :cond_d
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 271
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_18

    .line 272
    invoke-static {v0, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setDrawableTint(Landroid/graphics/drawable/Drawable;I)Z

    move-result v1

    goto :goto_c

    .line 275
    :cond_18
    const/4 v1, 0x0

    goto :goto_c
.end method
