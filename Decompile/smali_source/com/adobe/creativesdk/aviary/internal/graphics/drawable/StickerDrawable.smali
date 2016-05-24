.class public Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;
.super Landroid/graphics/drawable/BitmapDrawable;
.source "StickerDrawable.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;


# instance fields
.field mBlurFilter:Landroid/graphics/BlurMaskFilter;

.field mDrawShadow:Z

.field mFlip:Z

.field mMirrorMatrix:Landroid/graphics/Matrix;

.field private mPackIdentifier:Ljava/lang/String;

.field mScaleX:F

.field mShadowBitmap:Landroid/graphics/Bitmap;

.field private mShadowBitmapPaint:Landroid/graphics/Paint;

.field mShadowPaint:Landroid/graphics/Paint;

.field private mStickerIdentifier:Ljava/lang/String;

.field mTempRect:Landroid/graphics/Rect;

.field private minHeight:F

.field private minWidth:F


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "identifier"    # Ljava/lang/String;
    .param p4, "packidentifier"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, p1, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 21
    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->minWidth:F

    .line 22
    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->minHeight:F

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mDrawShadow:Z

    .line 29
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mTempRect:Landroid/graphics/Rect;

    .line 30
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mMirrorMatrix:Landroid/graphics/Matrix;

    .line 31
    const/high16 v0, 0x3f800000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mScaleX:F

    .line 41
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mStickerIdentifier:Ljava/lang/String;

    .line 42
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mPackIdentifier:Ljava/lang/String;

    .line 43
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->initializeShadow()V

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "resources"    # Landroid/content/res/Resources;
    .param p2, "file"    # Ljava/lang/String;
    .param p3, "identifier"    # Ljava/lang/String;
    .param p4, "packidentifier"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-static {p2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method private initializeShadow()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 47
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mDrawShadow:Z

    if-eqz v1, :cond_3e

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mShadowBitmap:Landroid/graphics/Bitmap;

    if-nez v1, :cond_3e

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_3e

    .line 48
    new-instance v1, Landroid/graphics/BlurMaskFilter;

    const/high16 v2, 0x40a00000

    sget-object v3, Landroid/graphics/BlurMaskFilter$Blur;->OUTER:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v1, v2, v3}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mBlurFilter:Landroid/graphics/BlurMaskFilter;

    .line 49
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mShadowPaint:Landroid/graphics/Paint;

    .line 50
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mShadowPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mBlurFilter:Landroid/graphics/BlurMaskFilter;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 52
    const/4 v1, 0x2

    new-array v0, v1, [I

    .line 53
    .local v0, "offsetXY":[I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Bitmap;->extractAlpha(Landroid/graphics/Paint;[I)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mShadowBitmap:Landroid/graphics/Bitmap;

    .line 54
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mShadowBitmapPaint:Landroid/graphics/Paint;

    .line 56
    .end local v0    # "offsetXY":[I
    :cond_3e
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 109
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 110
    .local v0, "count":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 112
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mMirrorMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 113
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mMirrorMatrix:Landroid/graphics/Matrix;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mScaleX:F

    const/high16 v3, 0x3f800000

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->centerY()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 114
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mMirrorMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 116
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mDrawShadow:Z

    if-eqz v1, :cond_38

    .line 117
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mShadowBitmap:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mShadowBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 119
    :cond_38
    invoke-super {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 120
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 121
    return-void
.end method

.method public getAlpha()I
    .registers 2

    .prologue
    .line 68
    invoke-super {p0}, Landroid/graphics/drawable/BitmapDrawable;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getBitmapHeight()I
    .registers 2

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    return v0
.end method

.method public getBitmapWidth()I
    .registers 2

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    return v0
.end method

.method public getCurrentHeight()F
    .registers 2

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getIntrinsicHeight()I

    move-result v0

    int-to-float v0, v0

    return v0
.end method

.method public getCurrentWidth()F
    .registers 2

    .prologue
    .line 160
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->getIntrinsicWidth()I

    move-result v0

    int-to-float v0, v0

    return v0
.end method

.method public getHorizontalFlip()Z
    .registers 2

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mFlip:Z

    return v0
.end method

.method public getHorizontalFlipEnabled()Z
    .registers 2

    .prologue
    .line 104
    const/4 v0, 0x1

    return v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mStickerIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public getMinHeight()F
    .registers 2

    .prologue
    .line 155
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->minHeight:F

    return v0
.end method

.method public getMinWidth()F
    .registers 2

    .prologue
    .line 150
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->minWidth:F

    return v0
.end method

.method public getPackIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mPackIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public getScaleX()F
    .registers 2

    .prologue
    .line 87
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mScaleX:F

    return v0
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 60
    invoke-super {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;->setAlpha(I)V

    .line 61
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mShadowBitmapPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_c

    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mShadowBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 64
    :cond_c
    return-void
.end method

.method public setDropShadow(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mDrawShadow:Z

    .line 125
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->initializeShadow()V

    .line 126
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->invalidateSelf()V

    .line 127
    return-void
.end method

.method public setHorizontalFlip(Z)V
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 97
    if-eqz p1, :cond_c

    const/high16 v0, -0x40800000

    :goto_4
    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mScaleX:F

    .line 98
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mFlip:Z

    .line 99
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->invalidateSelf()V

    .line 100
    return-void

    .line 97
    :cond_c
    const/high16 v0, 0x3f800000

    goto :goto_4
.end method

.method public setMinSize(FF)V
    .registers 3
    .param p1, "w"    # F
    .param p2, "h"    # F

    .prologue
    .line 144
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->minWidth:F

    .line 145
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->minHeight:F

    .line 146
    return-void
.end method

.method public setScaleX(F)V
    .registers 2
    .param p1, "scaleX"    # F

    .prologue
    .line 81
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->mScaleX:F

    .line 82
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->invalidateSelf()V

    .line 83
    return-void
.end method

.method public validateSize(Landroid/graphics/RectF;)Z
    .registers 4
    .param p1, "rect"    # Landroid/graphics/RectF;

    .prologue
    .line 139
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->minWidth:F

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_16

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/StickerDrawable;->minHeight:F

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
