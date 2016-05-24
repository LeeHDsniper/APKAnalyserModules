.class public Lcom/getbase/floatingactionbutton/FloatingActionButton;
.super Landroid/widget/ImageButton;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getbase/floatingactionbutton/FloatingActionButton$TranslucentLayerDrawable;
    }
.end annotation


# instance fields
.field private mCircleSize:F

.field mColorDisabled:I

.field mColorNormal:I

.field mColorPressed:I

.field private mDrawableSize:I

.field private mIcon:I

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private mShadowOffset:F

.field private mShadowRadius:F

.field private mSize:I

.field mStrokeVisible:Z

.field mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 61
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 67
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 70
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 71
    invoke-virtual {p0, p1, p2}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 72
    return-void
.end method

.method private adjustColorBrightness(IF)I
    .registers 7
    .param p1, "argb"    # I
    .param p2, "factor"    # F

    .prologue
    const/4 v3, 0x2

    .line 355
    const/4 v1, 0x3

    new-array v0, v1, [F

    .line 356
    .local v0, "hsv":[F
    invoke-static {p1, v0}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 358
    aget v1, v0, v3

    mul-float/2addr v1, p2

    const/high16 v2, 0x3f800000

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    aput v1, v0, v3

    .line 360
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-static {v1, v0}, Landroid/graphics/Color;->HSVToColor(I[F)I

    move-result v1

    return v1
.end method

.method private createCircleDrawable(IF)Landroid/graphics/drawable/Drawable;
    .registers 14
    .param p1, "color"    # I
    .param p2, "strokeWidth"    # F

    .prologue
    const/4 v1, 0x1

    .line 288
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v6

    .line 289
    .local v6, "alpha":I
    invoke-direct {p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->opaque(I)I

    move-result v9

    .line 291
    .local v9, "opaqueColor":I
    new-instance v7, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v7, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 293
    .local v7, "fillDrawable":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v7}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v10

    .line 294
    .local v10, "paint":Landroid/graphics/Paint;
    invoke-virtual {v10, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 295
    invoke-virtual {v10, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 297
    const/4 v3, 0x2

    new-array v8, v3, [Landroid/graphics/drawable/Drawable;

    const/4 v3, 0x0

    aput-object v7, v8, v3

    .line 299
    invoke-direct {p0, v9, p2}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->createInnerStrokesDrawable(IF)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    aput-object v3, v8, v1

    .line 302
    .local v8, "layers":[Landroid/graphics/drawable/Drawable;
    const/16 v3, 0xff

    if-eq v6, v3, :cond_31

    iget-boolean v3, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mStrokeVisible:Z

    if-nez v3, :cond_42

    :cond_31
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v0, v8}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 306
    .local v0, "drawable":Landroid/graphics/drawable/LayerDrawable;
    :goto_36
    const/high16 v3, 0x40000000

    div-float v3, p2, v3

    float-to-int v2, v3

    .local v2, "halfStrokeWidth":I
    move v3, v2

    move v4, v2

    move v5, v2

    .line 307
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 309
    return-object v0

    .line 302
    .end local v0    # "drawable":Landroid/graphics/drawable/LayerDrawable;
    .end local v2    # "halfStrokeWidth":I
    :cond_42
    new-instance v0, Lcom/getbase/floatingactionbutton/FloatingActionButton$TranslucentLayerDrawable;

    invoke-direct {v0, v6, v8}, Lcom/getbase/floatingactionbutton/FloatingActionButton$TranslucentLayerDrawable;-><init>(I[Landroid/graphics/drawable/Drawable;)V

    goto :goto_36
.end method

.method private createFillDrawable(F)Landroid/graphics/drawable/StateListDrawable;
    .registers 7
    .param p1, "strokeWidth"    # F

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 280
    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 281
    .local v0, "drawable":Landroid/graphics/drawable/StateListDrawable;
    new-array v1, v4, [I

    const v2, -0x101009e

    aput v2, v1, v3

    iget v2, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorDisabled:I

    invoke-direct {p0, v2, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->createCircleDrawable(IF)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 282
    new-array v1, v4, [I

    const v2, 0x10100a7

    aput v2, v1, v3

    iget v2, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorPressed:I

    invoke-direct {p0, v2, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->createCircleDrawable(IF)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 283
    new-array v1, v3, [I

    iget v2, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorNormal:I

    invoke-direct {p0, v2, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->createCircleDrawable(IF)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 284
    return-object v0
.end method

.method private createInnerStrokesDrawable(IF)Landroid/graphics/drawable/Drawable;
    .registers 12
    .param p1, "color"    # I
    .param p2, "strokeWidth"    # F

    .prologue
    .line 381
    iget-boolean v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mStrokeVisible:Z

    if-nez v0, :cond_b

    .line 382
    new-instance v8, Landroid/graphics/drawable/ColorDrawable;

    const/4 v0, 0x0

    invoke-direct {v8, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 407
    :goto_a
    return-object v8

    .line 385
    :cond_b
    new-instance v8, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v0, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v0}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v8, v0}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 387
    .local v8, "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    invoke-direct {p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->darkenColor(I)I

    move-result v6

    .line 388
    .local v6, "bottomStrokeColor":I
    invoke-direct {p0, v6}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->halfTransparent(I)I

    move-result v5

    .line 389
    .local v5, "bottomStrokeColorHalfTransparent":I
    invoke-direct {p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->lightenColor(I)I

    move-result v2

    .line 390
    .local v2, "topStrokeColor":I
    invoke-direct {p0, v2}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->halfTransparent(I)I

    move-result v3

    .line 392
    .local v3, "topStrokeColorHalfTransparent":I
    invoke-virtual {v8}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v7

    .line 393
    .local v7, "paint":Landroid/graphics/Paint;
    const/4 v0, 0x1

    invoke-virtual {v7, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 394
    invoke-virtual {v7, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 395
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v7, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 396
    new-instance v0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;

    move-object v1, p0

    move v4, p1

    invoke-direct/range {v0 .. v6}, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;-><init>(Lcom/getbase/floatingactionbutton/FloatingActionButton;IIIII)V

    invoke-virtual {v8, v0}, Landroid/graphics/drawable/ShapeDrawable;->setShaderFactory(Landroid/graphics/drawable/ShapeDrawable$ShaderFactory;)V

    goto :goto_a
.end method

.method private createOuterStrokeDrawable(F)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p1, "strokeWidth"    # F

    .prologue
    .line 330
    new-instance v1, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v2, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v2}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 332
    .local v1, "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    .line 333
    .local v0, "paint":Landroid/graphics/Paint;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 334
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 335
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 336
    const/high16 v2, -0x1000000

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 337
    const v2, 0x3ca3d70a

    invoke-direct {p0, v2}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->opacityToAlpha(F)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 339
    return-object v1
.end method

.method private darkenColor(I)I
    .registers 3
    .param p1, "argb"    # I

    .prologue
    .line 347
    const v0, 0x3f666666

    invoke-direct {p0, p1, v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->adjustColorBrightness(IF)I

    move-result v0

    return v0
.end method

.method private halfTransparent(I)I
    .registers 6
    .param p1, "argb"    # I

    .prologue
    .line 364
    .line 365
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 366
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    .line 367
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    .line 368
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v3

    .line 364
    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    return v0
.end method

.method private lightenColor(I)I
    .registers 3
    .param p1, "argb"    # I

    .prologue
    .line 351
    const v0, 0x3f8ccccd

    invoke-direct {p0, p1, v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->adjustColorBrightness(IF)I

    move-result v0

    return v0
.end method

.method private opacityToAlpha(F)I
    .registers 3
    .param p1, "opacity"    # F

    .prologue
    .line 343
    const/high16 v0, 0x437f0000

    mul-float/2addr v0, p1

    float-to-int v0, v0

    return v0
.end method

.method private opaque(I)I
    .registers 5
    .param p1, "argb"    # I

    .prologue
    .line 373
    .line 374
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v0

    .line 375
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    .line 376
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    .line 373
    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    return v0
.end method

.method private setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 413
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 414
    invoke-virtual {p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 418
    :goto_9
    return-void

    .line 416
    :cond_a
    invoke-virtual {p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9
.end method

.method private updateCircleSize()V
    .registers 2

    .prologue
    .line 98
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mSize:I

    if-nez v0, :cond_d

    sget v0, Lcom/getbase/floatingactionbutton/R$dimen;->fab_size_normal:I

    :goto_6
    invoke-virtual {p0, v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mCircleSize:F

    .line 99
    return-void

    .line 98
    :cond_d
    sget v0, Lcom/getbase/floatingactionbutton/R$dimen;->fab_size_mini:I

    goto :goto_6
.end method

.method private updateDrawableSize()V
    .registers 4

    .prologue
    .line 94
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mCircleSize:F

    const/high16 v1, 0x40000000

    iget v2, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mShadowRadius:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mDrawableSize:I

    .line 95
    return-void
.end method


# virtual methods
.method getColor(I)I
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 201
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method public getColorDisabled()I
    .registers 2

    .prologue
    .line 175
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorDisabled:I

    return v0
.end method

.method public getColorNormal()I
    .registers 2

    .prologue
    .line 139
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorNormal:I

    return v0
.end method

.method public getColorPressed()I
    .registers 2

    .prologue
    .line 157
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorPressed:I

    return v0
.end method

.method getDimension(I)F
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 205
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    return v0
.end method

.method getIconDrawable()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 270
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    .line 271
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 275
    :goto_6
    return-object v0

    .line 272
    :cond_7
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIcon:I

    if-eqz v0, :cond_16

    .line 273
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIcon:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_6

    .line 275
    :cond_16
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_6
.end method

.method getLabelView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 217
    sget v0, Lcom/getbase/floatingactionbutton/R$id;->fab_label:I

    invoke-virtual {p0, v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    return-object v0
.end method

.method public getSize()I
    .registers 2

    .prologue
    .line 116
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mSize:I

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 221
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x0

    .line 75
    sget-object v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionButton:[I

    invoke-virtual {p1, p2, v1, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 76
    .local v0, "attr":Landroid/content/res/TypedArray;
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionButton_fab_colorNormal:I

    const v2, 0x1060013

    invoke-virtual {p0, v2}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorNormal:I

    .line 77
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionButton_fab_colorPressed:I

    const v2, 0x1060012

    invoke-virtual {p0, v2}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorPressed:I

    .line 78
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionButton_fab_colorDisabled:I

    const/high16 v2, 0x1060000

    invoke-virtual {p0, v2}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorDisabled:I

    .line 79
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionButton_fab_size:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mSize:I

    .line 80
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionButton_fab_icon:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIcon:I

    .line 81
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionButton_fab_title:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mTitle:Ljava/lang/String;

    .line 82
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->FloatingActionButton_fab_stroke_visible:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mStrokeVisible:Z

    .line 83
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 85
    invoke-direct {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateCircleSize()V

    .line 86
    sget v1, Lcom/getbase/floatingactionbutton/R$dimen;->fab_shadow_radius:I

    invoke-virtual {p0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mShadowRadius:F

    .line 87
    sget v1, Lcom/getbase/floatingactionbutton/R$dimen;->fab_shadow_offset:I

    invoke-virtual {p0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mShadowOffset:F

    .line 88
    invoke-direct {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateDrawableSize()V

    .line 90
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateBackground()V

    .line 91
    return-void
.end method

.method protected onMeasure(II)V
    .registers 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 226
    invoke-super {p0, p1, p2}, Landroid/widget/ImageButton;->onMeasure(II)V

    .line 227
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mDrawableSize:I

    iget v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mDrawableSize:I

    invoke-virtual {p0, v0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->setMeasuredDimension(II)V

    .line 228
    return-void
.end method

.method public setColorDisabled(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 183
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorDisabled:I

    if-eq v0, p1, :cond_9

    .line 184
    iput p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorDisabled:I

    .line 185
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateBackground()V

    .line 187
    :cond_9
    return-void
.end method

.method public setColorDisabledResId(I)V
    .registers 3
    .param p1, "colorDisabled"    # I

    .prologue
    .line 179
    invoke-virtual {p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->setColorDisabled(I)V

    .line 180
    return-void
.end method

.method public setColorNormal(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 147
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorNormal:I

    if-eq v0, p1, :cond_9

    .line 148
    iput p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorNormal:I

    .line 149
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateBackground()V

    .line 151
    :cond_9
    return-void
.end method

.method public setColorNormalResId(I)V
    .registers 3
    .param p1, "colorNormal"    # I

    .prologue
    .line 143
    invoke-virtual {p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->setColorNormal(I)V

    .line 144
    return-void
.end method

.method public setColorPressed(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 165
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorPressed:I

    if-eq v0, p1, :cond_9

    .line 166
    iput p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mColorPressed:I

    .line 167
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateBackground()V

    .line 169
    :cond_9
    return-void
.end method

.method public setColorPressedResId(I)V
    .registers 3
    .param p1, "colorPressed"    # I

    .prologue
    .line 161
    invoke-virtual {p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->setColorPressed(I)V

    .line 162
    return-void
.end method

.method public setIcon(I)V
    .registers 3
    .param p1, "icon"    # I

    .prologue
    .line 120
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIcon:I

    if-eq v0, p1, :cond_c

    .line 121
    iput p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIcon:I

    .line 122
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 123
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateBackground()V

    .line 125
    :cond_c
    return-void
.end method

.method public setIconDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "iconDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 128
    iget-object v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_c

    .line 129
    const/4 v0, 0x0

    iput v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIcon:I

    .line 130
    iput-object p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 131
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateBackground()V

    .line 133
    :cond_c
    return-void
.end method

.method public setSize(I)V
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 102
    const/4 v0, 0x1

    if-eq p1, v0, :cond_d

    if-eqz p1, :cond_d

    .line 103
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Use @FAB_SIZE constants only!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :cond_d
    iget v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mSize:I

    if-eq v0, p1, :cond_1c

    .line 107
    iput p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mSize:I

    .line 108
    invoke-direct {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateCircleSize()V

    .line 109
    invoke-direct {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateDrawableSize()V

    .line 110
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateBackground()V

    .line 112
    :cond_1c
    return-void
.end method

.method public setStrokeVisible(Z)V
    .registers 3
    .param p1, "visible"    # Z

    .prologue
    .line 190
    iget-boolean v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mStrokeVisible:Z

    if-eq v0, p1, :cond_9

    .line 191
    iput-boolean p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mStrokeVisible:Z

    .line 192
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->updateBackground()V

    .line 194
    :cond_9
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mTitle:Ljava/lang/String;

    .line 210
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getLabelView()Landroid/widget/TextView;

    move-result-object v0

    .line 211
    .local v0, "label":Landroid/widget/TextView;
    if-eqz v0, :cond_b

    .line 212
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    :cond_b
    return-void
.end method

.method public setVisibility(I)V
    .registers 3
    .param p1, "visibility"    # I

    .prologue
    .line 422
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getLabelView()Landroid/widget/TextView;

    move-result-object v0

    .line 423
    .local v0, "label":Landroid/widget/TextView;
    if-eqz v0, :cond_9

    .line 424
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 427
    :cond_9
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 428
    return-void
.end method

.method updateBackground()V
    .registers 16

    .prologue
    .line 231
    sget v1, Lcom/getbase/floatingactionbutton/R$dimen;->fab_stroke_width:I

    invoke-virtual {p0, v1}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getDimension(I)F

    move-result v14

    .line 232
    .local v14, "strokeWidth":F
    const/high16 v1, 0x40000000

    div-float v12, v14, v1

    .line 234
    .local v12, "halfStrokeWidth":F
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x4

    new-array v4, v1, [Landroid/graphics/drawable/Drawable;

    const/4 v6, 0x0

    .line 236
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    iget v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mSize:I

    if-nez v1, :cond_7a

    sget v1, Lcom/getbase/floatingactionbutton/R$drawable;->fab_bg_normal:I

    :goto_1a
    invoke-virtual {v7, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    aput-object v1, v4, v6

    const/4 v1, 0x1

    .line 237
    invoke-direct {p0, v14}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->createFillDrawable(F)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v6

    aput-object v6, v4, v1

    const/4 v1, 0x2

    .line 238
    invoke-direct {p0, v14}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->createOuterStrokeDrawable(F)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    aput-object v6, v4, v1

    const/4 v1, 0x3

    .line 239
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getIconDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    aput-object v6, v4, v1

    invoke-direct {v0, v4}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 242
    .local v0, "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    iget v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mCircleSize:F

    sget v4, Lcom/getbase/floatingactionbutton/R$dimen;->fab_icon_size:I

    invoke-virtual {p0, v4}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->getDimension(I)F

    move-result v4

    sub-float/2addr v1, v4

    float-to-int v1, v1

    div-int/lit8 v13, v1, 0x2

    .line 244
    .local v13, "iconOffset":I
    iget v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mShadowRadius:F

    float-to-int v2, v1

    .line 245
    .local v2, "circleInsetHorizontal":I
    iget v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mShadowRadius:F

    iget v4, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mShadowOffset:F

    sub-float/2addr v1, v4

    float-to-int v3, v1

    .line 246
    .local v3, "circleInsetTop":I
    iget v1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mShadowRadius:F

    iget v4, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton;->mShadowOffset:F

    add-float/2addr v1, v4

    float-to-int v5, v1

    .line 248
    .local v5, "circleInsetBottom":I
    const/4 v1, 0x1

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 254
    const/4 v7, 0x2

    int-to-float v1, v2

    sub-float/2addr v1, v12

    float-to-int v8, v1

    int-to-float v1, v3

    sub-float/2addr v1, v12

    float-to-int v9, v1

    int-to-float v1, v2

    sub-float/2addr v1, v12

    float-to-int v10, v1

    int-to-float v1, v5

    sub-float/2addr v1, v12

    float-to-int v11, v1

    move-object v6, v0

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 260
    const/4 v7, 0x3

    add-int v8, v2, v13

    add-int v9, v3, v13

    add-int v10, v2, v13

    add-int v11, v5, v13

    move-object v6, v0

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 266
    invoke-direct {p0, v0}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->setBackgroundCompat(Landroid/graphics/drawable/Drawable;)V

    .line 267
    return-void

    .line 236
    .end local v0    # "layerDrawable":Landroid/graphics/drawable/LayerDrawable;
    .end local v2    # "circleInsetHorizontal":I
    .end local v3    # "circleInsetTop":I
    .end local v5    # "circleInsetBottom":I
    .end local v13    # "iconOffset":I
    :cond_7a
    sget v1, Lcom/getbase/floatingactionbutton/R$drawable;->fab_bg_mini:I

    goto :goto_1a
.end method
