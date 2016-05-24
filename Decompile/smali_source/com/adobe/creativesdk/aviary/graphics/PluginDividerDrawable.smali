.class public Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "PluginDividerDrawable.java"


# instance fields
.field private mBounds:Landroid/graphics/Rect;

.field private mFillColor:I

.field private mHeight:I

.field private mLabel:Ljava/lang/String;

.field private mMaxHeight:I

.field private mMetrics:Landroid/graphics/Paint$FontMetrics;

.field private mStrokeColor:I

.field private mStrokeWidth:I

.field private mTextDivider:F

.field private mTextPaint:Landroid/graphics/Paint;

.field private mTextSize:F

.field private mTextStrokePaint:Landroid/graphics/Paint;

.field private mTextY:I

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "styleid"    # I
    .param p3, "textId"    # I

    .prologue
    .line 37
    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "styleid"    # I
    .param p3, "string"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 40
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 22
    const/high16 v4, 0x41200000

    iput v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextSize:F

    .line 135
    iput v6, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextY:I

    .line 43
    const/4 v4, 0x0

    sget-object v5, Lcom/aviary/android/feather/sdk/R$styleable;->ContentSectionHeaderDrawable:[I

    invoke-virtual {p1, v4, v5, v6, p2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 45
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->ContentSectionHeaderDrawable_android_textColor:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mFillColor:I

    .line 46
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->ContentSectionHeaderDrawable_adobe_strokeSize:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mStrokeWidth:I

    .line 47
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->ContentSectionHeaderDrawable_adobe_strokeColor:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mStrokeColor:I

    .line 48
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->ContentSectionHeaderDrawable_adobe_textPerc:I

    const v5, 0x3f666666

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextDivider:F

    .line 50
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->ContentSectionHeaderDrawable_fontFamily:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 51
    .local v2, "fontname":Ljava/lang/String;
    const-string v4, "Drawable"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fontname: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    :try_start_52
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/adobe/android/ui/utils/TypefaceUtils;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;
    :try_end_59
    .catch Ljava/lang/Throwable; {:try_start_52 .. :try_end_59} :catch_ab

    move-result-object v1

    .line 60
    .local v1, "font":Landroid/graphics/Typeface;
    :goto_5a
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 62
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mLabel:Ljava/lang/String;

    .line 64
    new-instance v4, Landroid/graphics/Paint;

    const/16 v5, 0x181

    invoke-direct {v4, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextPaint:Landroid/graphics/Paint;

    .line 65
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextPaint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mFillColor:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 66
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 68
    if-eqz v1, :cond_7d

    .line 69
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 72
    :cond_7d
    new-instance v4, Landroid/graphics/Paint;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextPaint:Landroid/graphics/Paint;

    invoke-direct {v4, v5}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextStrokePaint:Landroid/graphics/Paint;

    .line 73
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextStrokePaint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mStrokeColor:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 74
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextStrokePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 75
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextStrokePaint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mStrokeWidth:I

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 77
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mBounds:Landroid/graphics/Rect;

    .line 78
    new-instance v4, Landroid/graphics/Paint$FontMetrics;

    invoke-direct {v4}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mMetrics:Landroid/graphics/Paint$FontMetrics;

    .line 79
    return-void

    .line 55
    .end local v1    # "font":Landroid/graphics/Typeface;
    :catch_ab
    move-exception v3

    .line 56
    .local v3, "t":Ljava/lang/Throwable;
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 57
    .restart local v1    # "font":Landroid/graphics/Typeface;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_5a
.end method


# virtual methods
.method public clearColorFilter()V
    .registers 1

    .prologue
    .line 103
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    .line 155
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->save(I)I

    move-result v1

    .line 156
    .local v1, "saveCount":I
    const/high16 v2, -0x3d4c0000

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->rotate(F)V

    .line 157
    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mHeight:I

    neg-int v2, v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mHeight:I

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextY:I

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 159
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mMaxHeight:I

    if-le v2, v3, :cond_48

    .line 160
    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mMaxHeight:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float v0, v2, v3

    .line 161
    .local v0, "diff":F
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1, v0, v0, v2, v3}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 164
    .end local v0    # "diff":F
    :cond_48
    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mStrokeWidth:I

    if-lez v2, :cond_53

    .line 165
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mLabel:Ljava/lang/String;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v5, v5, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 167
    :cond_53
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mLabel:Ljava/lang/String;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v5, v5, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 168
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 170
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 107
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 112
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    return v0
.end method

.method public getMinimumHeight()I
    .registers 2

    .prologue
    .line 117
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v0

    return v0
.end method

.method public getMinimumWidth()I
    .registers 2

    .prologue
    .line 122
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 93
    const/4 v0, -0x3

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 127
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 129
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mWidth:I

    .line 130
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mHeight:I

    .line 132
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->onTextBoundsChanged()V

    .line 133
    return-void
.end method

.method protected final onTextBoundsChanged()V
    .registers 7

    .prologue
    const/high16 v5, 0x40000000

    .line 139
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mWidth:I

    int-to-float v0, v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextDivider:F

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextSize:F

    .line 141
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 142
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextStrokePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 143
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mLabel:Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mLabel:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mMetrics:Landroid/graphics/Paint$FontMetrics;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    .line 147
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mWidth:I

    int-to-float v0, v0

    div-float/2addr v0, v5

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextSize:F

    div-float/2addr v1, v5

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mMetrics:Landroid/graphics/Paint$FontMetrics;

    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->bottom:F

    div-float/2addr v1, v5

    sub-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mTextY:I

    .line 148
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mHeight:I

    int-to-double v0, v0

    const-wide v2, 0x3feccccccccccccdL

    mul-double/2addr v0, v2

    double-to-int v0, v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;->mMaxHeight:I

    .line 150
    return-void
.end method

.method public setAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 97
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 100
    return-void
.end method
