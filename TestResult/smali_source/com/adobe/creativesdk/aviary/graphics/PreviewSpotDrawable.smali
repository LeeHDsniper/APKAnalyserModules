.class public Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "PreviewSpotDrawable.java"


# instance fields
.field protected final mBackgroundColor:I

.field protected final mBackgroundColorSelected:I

.field private mBackgroundRadius:I

.field protected mChecked:Z

.field private mColor:I

.field protected mDrawRadius:F

.field protected final mDstRect:Landroid/graphics/Rect;

.field private mPadding:I

.field protected final mPaint:Landroid/graphics/Paint;

.field protected mPressed:Z

.field protected mRadius:F

.field private mRadiusDirty:Z

.field protected mRadiusFixed:Z

.field protected final mStrokeColor:I

.field protected mStrokeColorChecked:I

.field protected final mStrokeWidth:I

.field private mStyle:Landroid/graphics/Paint$Style;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x0

    .line 39
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 26
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDstRect:Landroid/graphics/Rect;

    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    .line 42
    .local v1, "theme":Landroid/content/res/Resources$Theme;
    const/4 v2, 0x0

    sget-object v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewSpotDrawable:[I

    sget v4, Lcom/aviary/android/feather/sdk/R$style;->AdobeImageWidget_StrokePreviewSpotStyle:I

    .line 43
    invoke-virtual {v1, v2, v3, v5, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 45
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewSpotDrawable_adobe_strokeSize:I

    const/16 v3, 0x14

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStrokeWidth:I

    .line 46
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewSpotDrawable_adobe_strokeColorSelected:I

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStrokeColorChecked:I

    .line 47
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewSpotDrawable_adobe_strokeColor:I

    const/high16 v3, -0x1000000

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStrokeColor:I

    .line 48
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewSpotDrawable_adobe_backgroundColor:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mBackgroundColor:I

    .line 49
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewSpotDrawable_adobe_backgroundColorSelected:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mBackgroundColorSelected:I

    .line 50
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewSpotDrawable_adobe_radius:I

    const/high16 v3, 0x3f000000

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadius:F

    .line 51
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewSpotDrawable_android_padding:I

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPadding:I

    .line 52
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStyle:Landroid/graphics/Paint$Style;

    .line 54
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 56
    new-instance v2, Landroid/graphics/Paint;

    const/4 v3, 0x7

    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPaint:Landroid/graphics/Paint;

    .line 57
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 58
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPaint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStrokeWidth:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 59
    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadius:F

    iput v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDrawRadius:F

    .line 60
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadiusDirty:Z

    .line 61
    return-void
.end method

.method private evaluateRadius(Landroid/graphics/Rect;)V
    .registers 10
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 122
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 123
    .local v0, "minSize":I
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadiusFixed:Z

    if-nez v1, :cond_29

    .line 124
    div-int/lit8 v1, v0, 0x2

    int-to-float v1, v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadius:F

    mul-float/2addr v1, v2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDrawRadius:F

    .line 128
    :goto_18
    div-int/lit8 v1, v0, 0x2

    int-to-double v2, v1

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPadding:I

    int-to-double v4, v1

    const-wide/high16 v6, 0x3ffc000000000000L

    mul-double/2addr v4, v6

    sub-double/2addr v2, v4

    double-to-int v1, v2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mBackgroundRadius:I

    .line 129
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadiusDirty:Z

    .line 130
    return-void

    .line 126
    :cond_29
    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadius:F

    iput v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDrawRadius:F

    goto :goto_18
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 134
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 136
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadiusDirty:Z

    if-eqz v0, :cond_e

    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->evaluateRadius(Landroid/graphics/Rect;)V

    .line 141
    :cond_e
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->drawBackground(Landroid/graphics/Canvas;)V

    .line 142
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->drawForeground(Landroid/graphics/Canvas;)V

    .line 143
    return-void
.end method

.method protected drawBackground(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 156
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mChecked:Z

    if-eqz v1, :cond_2b

    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mBackgroundColorSelected:I

    .line 157
    .local v0, "bgColor":I
    :goto_6
    if-eqz v0, :cond_2a

    .line 158
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 159
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 160
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mBackgroundRadius:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 162
    :cond_2a
    return-void

    .line 156
    .end local v0    # "bgColor":I
    :cond_2b
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mBackgroundColor:I

    goto :goto_6
.end method

.method protected drawForeground(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStyle:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStyle:Landroid/graphics/Paint$Style;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    if-ne v0, v1, :cond_2a

    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 152
    :goto_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mDrawRadius:F

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 153
    return-void

    .line 150
    :cond_2a
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPaint:Landroid/graphics/Paint;

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mChecked:Z

    if-eqz v0, :cond_36

    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStrokeColorChecked:I

    :goto_32
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_14

    :cond_36
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStrokeColor:I

    goto :goto_32
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 171
    const/4 v0, -0x3

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 166
    const/4 v0, 0x1

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 2
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 117
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 118
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->evaluateRadius(Landroid/graphics/Rect;)V

    .line 119
    return-void
.end method

.method protected onStateChange([I)Z
    .registers 9
    .param p1, "state"    # [I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 182
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mChecked:Z

    .line 183
    .local v0, "checked":Z
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPressed:Z

    .line 185
    .local v2, "pressed":Z
    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mChecked:Z

    .line 186
    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPressed:Z

    .line 188
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    array-length v5, p1

    if-ge v1, v5, :cond_2a

    .line 189
    aget v5, p1, v1

    const v6, 0x10100a7

    if-ne v5, v6, :cond_17

    .line 190
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPressed:Z

    .line 193
    :cond_17
    aget v5, p1, v1

    const v6, 0x10100a1

    if-eq v5, v6, :cond_25

    aget v5, p1, v1

    const v6, 0x10100a0

    if-ne v5, v6, :cond_27

    .line 194
    :cond_25
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mChecked:Z

    .line 188
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 197
    :cond_2a
    iget-boolean v5, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mChecked:Z

    if-ne v0, v5, :cond_32

    iget-boolean v5, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mPressed:Z

    if-eq v2, v5, :cond_33

    :cond_32
    move v3, v4

    :cond_33
    return v3
.end method

.method public setAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 175
    return-void
.end method

.method public setColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 99
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mColor:I

    if-eq v0, p1, :cond_9

    .line 100
    iput p1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mColor:I

    .line 101
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->invalidateSelf()V

    .line 103
    :cond_9
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 178
    return-void
.end method

.method public setRadius(F)V
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 87
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadius:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 88
    iput p1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadius:F

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mRadiusDirty:Z

    .line 90
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->invalidateSelf()V

    .line 92
    :cond_e
    return-void
.end method

.method public setSelectedTint(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 71
    iput p1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStrokeColorChecked:I

    .line 72
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->invalidateSelf()V

    .line 73
    return-void
.end method

.method public setStyle(Landroid/graphics/Paint$Style;)V
    .registers 3
    .param p1, "style"    # Landroid/graphics/Paint$Style;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStyle:Landroid/graphics/Paint$Style;

    if-eq v0, p1, :cond_9

    .line 77
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStyle:Landroid/graphics/Paint$Style;

    .line 78
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->invalidateSelf()V

    .line 80
    :cond_9
    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .registers 4
    .param p1, "tint"    # Landroid/content/res/ColorStateList;

    .prologue
    const/4 v1, 0x0

    .line 65
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 66
    const/4 v0, 0x1

    new-array v0, v0, [I

    aput v1, v0, v1

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStrokeColorChecked:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->mStrokeColorChecked:I

    .line 67
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->invalidateSelf()V

    .line 68
    return-void
.end method
