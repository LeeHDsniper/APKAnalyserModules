.class public Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.source "ImageViewOverlay.java"


# instance fields
.field protected mBaseMatrix2:Landroid/graphics/Matrix;

.field mCanvasClipRect:Landroid/graphics/RectF;

.field protected mDisplayMatrix2:Landroid/graphics/Matrix;

.field protected mDrawMatrix2:Landroid/graphics/Matrix;

.field private final mLayoutMatrixTemp:Landroid/graphics/Matrix;

.field protected mMatrix2:Landroid/graphics/Matrix;

.field protected mOverlayBitmapRect:Landroid/graphics/RectF;

.field private mOverlayChanged:Z

.field protected mOverlayDrawable:Landroid/graphics/drawable/Drawable;

.field private mOverlayDrawableHeight:I

.field private mOverlayDrawableWidth:I

.field protected mOverlayTempDrawable:Landroid/graphics/drawable/Drawable;

.field protected mSuppMatrix2:Landroid/graphics/Matrix;

.field private mTempViewPort:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mBaseMatrix2:Landroid/graphics/Matrix;

    .line 26
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mSuppMatrix2:Landroid/graphics/Matrix;

    .line 27
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mDisplayMatrix2:Landroid/graphics/Matrix;

    .line 28
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mMatrix2:Landroid/graphics/Matrix;

    .line 29
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayBitmapRect:Landroid/graphics/RectF;

    .line 30
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mCanvasClipRect:Landroid/graphics/RectF;

    .line 31
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    .line 34
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mLayoutMatrixTemp:Landroid/graphics/Matrix;

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mBaseMatrix2:Landroid/graphics/Matrix;

    .line 26
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mSuppMatrix2:Landroid/graphics/Matrix;

    .line 27
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mDisplayMatrix2:Landroid/graphics/Matrix;

    .line 28
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mMatrix2:Landroid/graphics/Matrix;

    .line 29
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayBitmapRect:Landroid/graphics/RectF;

    .line 30
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mCanvasClipRect:Landroid/graphics/RectF;

    .line 31
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    .line 34
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mLayoutMatrixTemp:Landroid/graphics/Matrix;

    .line 42
    return-void
.end method

.method private configureBounds2()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 169
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v4, :cond_7

    .line 191
    :goto_6
    return-void

    .line 173
    :cond_7
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawableWidth:I

    .line 174
    .local v1, "dwidth":I
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawableHeight:I

    .line 176
    .local v0, "dheight":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getWidth()I

    move-result v3

    .line 177
    .local v3, "vwidth":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getHeight()I

    move-result v2

    .line 179
    .local v2, "vheight":I
    if-lez v1, :cond_17

    if-gtz v0, :cond_1f

    .line 180
    :cond_17
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v5, v5, v3, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 181
    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mDrawMatrix2:Landroid/graphics/Matrix;

    goto :goto_6

    .line 183
    :cond_1f
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v5, v5, v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 185
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {v4}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 186
    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mDrawMatrix2:Landroid/graphics/Matrix;

    goto :goto_6

    .line 188
    :cond_2f
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mMatrix2:Landroid/graphics/Matrix;

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mDrawMatrix2:Landroid/graphics/Matrix;

    goto :goto_6
.end method


# virtual methods
.method protected computeMinZoom()F
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_9

    .line 214
    invoke-super {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->computeMinZoom()F

    move-result v0

    .line 216
    :goto_8
    return v0

    :cond_9
    const/high16 v0, 0x3f800000

    goto :goto_8
.end method

.method public generateResultBitmap(Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;)Landroid/graphics/Bitmap;
    .registers 12
    .param p1, "filter"    # Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongCall"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v9, 0x0

    .line 285
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v4, :cond_7

    .line 308
    :cond_6
    :goto_6
    return-object v0

    .line 289
    :cond_7
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 290
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_6

    .line 294
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getOverlayBitmapRect()Landroid/graphics/RectF;

    move-result-object v3

    .line 296
    .local v3, "rect":Landroid/graphics/RectF;
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v5

    float-to-int v5, v5

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 298
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v4

    .line 299
    invoke-virtual {v4, v9}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v4

    const-string v5, "previewsize"

    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    .line 300
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    int-to-float v8, v8

    invoke-direct {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 301
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v4

    invoke-virtual {v4, v9}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v4

    const-string v5, "bitmaprect"

    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;-><init>(Landroid/graphics/RectF;)V

    invoke-virtual {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 302
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v4

    invoke-virtual {v4, v9}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v4

    const-string v5, "overlayrect"

    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getOverlayBitmapRect()Landroid/graphics/RectF;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaRectParameter;-><init>(Landroid/graphics/RectF;)V

    invoke-virtual {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 303
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v4

    invoke-virtual {v4, v9}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v4

    const-string v5, "overlaysize"

    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawableWidth:I

    int-to-float v7, v7

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawableHeight:I

    int-to-float v8, v8

    invoke-direct {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 305
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 306
    .local v1, "canvas":Landroid/graphics/Canvas;
    iget v4, v3, Landroid/graphics/RectF;->left:F

    neg-float v4, v4

    iget v5, v3, Landroid/graphics/RectF;->top:F

    neg-float v5, v5

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 307
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->onDraw(Landroid/graphics/Canvas;)V

    goto/16 :goto_6
.end method

.method public getDisplayType()Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;
    .registers 2

    .prologue
    .line 52
    sget-object v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_TO_SCREEN:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    return-object v0
.end method

.method public getImageViewMatrix2()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mSuppMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getImageViewMatrix2(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getImageViewMatrix2(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .registers 4
    .param p1, "supportMatrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mDisplayMatrix2:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mBaseMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 195
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mDisplayMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 196
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mDisplayMatrix2:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getOverlayBitmapRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mSuppMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getOverlayBitmapRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method protected getOverlayBitmapRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .registers 8
    .param p1, "supportMatrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v5, 0x0

    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    .line 202
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_7

    .line 203
    const/4 v2, 0x0

    .line 208
    :goto_6
    return-object v2

    .line 205
    :cond_7
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getImageViewMatrix2(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object v1

    .line 206
    .local v1, "m":Landroid/graphics/Matrix;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 207
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 208
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayBitmapRect:Landroid/graphics/RectF;

    goto :goto_6
.end method

.method public getOverlayDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 280
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method protected getProperBaseMatrix(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;Landroid/graphics/RectF;)V
    .registers 14
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "matrix"    # Landroid/graphics/Matrix;
    .param p3, "rect"    # Landroid/graphics/RectF;

    .prologue
    const/high16 v9, 0x40000000

    .line 221
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v7, :cond_a

    .line 222
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getProperBaseMatrix(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 242
    :goto_9
    return-void

    .line 226
    :cond_a
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    int-to-float v5, v7

    .line 227
    .local v5, "w":F
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v7

    int-to-float v0, v7

    .line 230
    .local v0, "h":F
    invoke-virtual {p2}, Landroid/graphics/Matrix;->reset()V

    .line 232
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float v6, v7, v5

    .line 233
    .local v6, "widthScale":F
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v7

    div-float v1, v7, v0

    .line 234
    .local v1, "heightScale":F
    invoke-static {v6, v1}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 235
    .local v2, "scale":F
    invoke-virtual {p2, v2, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 236
    iget v7, p3, Landroid/graphics/RectF;->left:F

    iget v8, p3, Landroid/graphics/RectF;->top:F

    invoke-virtual {p2, v7, v8}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 238
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v7

    mul-float v8, v5, v2

    sub-float/2addr v7, v8

    div-float v4, v7, v9

    .line 239
    .local v4, "tw":F
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v7

    mul-float v8, v0, v2

    sub-float/2addr v7, v8

    div-float v3, v7, v9

    .line 240
    .local v3, "th":F
    invoke-virtual {p2, v4, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 241
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->printMatrix(Landroid/graphics/Matrix;)V

    goto :goto_9
.end method

.method protected getProperBaseMatrix2(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;Landroid/graphics/RectF;)V
    .registers 14
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "matrix"    # Landroid/graphics/Matrix;
    .param p3, "rect"    # Landroid/graphics/RectF;

    .prologue
    const/high16 v9, 0x40000000

    .line 129
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    int-to-float v5, v7

    .line 130
    .local v5, "w":F
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v7

    int-to-float v0, v7

    .line 133
    .local v0, "h":F
    invoke-virtual {p2}, Landroid/graphics/Matrix;->reset()V

    .line 135
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float v6, v7, v5

    .line 136
    .local v6, "widthScale":F
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v7

    div-float v1, v7, v0

    .line 137
    .local v1, "heightScale":F
    invoke-static {v6, v1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 138
    .local v2, "scale":F
    invoke-virtual {p2, v2, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 139
    iget v7, p3, Landroid/graphics/RectF;->left:F

    iget v8, p3, Landroid/graphics/RectF;->top:F

    invoke-virtual {p2, v7, v8}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 141
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v7

    mul-float v8, v5, v2

    sub-float/2addr v7, v8

    div-float v4, v7, v9

    .line 142
    .local v4, "tw":F
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v7

    mul-float v8, v0, v2

    sub-float/2addr v7, v8

    div-float v3, v7, v9

    .line 143
    .local v3, "th":F
    invoke-virtual {p2, v4, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 144
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->printMatrix(Landroid/graphics/Matrix;)V

    .line 145
    return-void
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 46
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 314
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    .line 315
    .local v0, "drawMatrix":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 318
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v1, :cond_b

    .line 347
    :cond_a
    :goto_a
    return-void

    .line 322
    :cond_b
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getSaveCount()I

    move-result v2

    .line 323
    .local v2, "saveCount":I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 325
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mCanvasClipRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    .line 327
    if-eqz v0, :cond_1c

    .line 328
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 330
    :cond_1c
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 331
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 333
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_a

    .line 336
    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawableWidth:I

    if-eqz v3, :cond_a

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawableHeight:I

    if-eqz v3, :cond_a

    .line 340
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mDrawMatrix2:Landroid/graphics/Matrix;

    if-eqz v3, :cond_a

    .line 341
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getSaveCount()I

    move-result v2

    .line 342
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 343
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mDrawMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 344
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 345
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_a
.end method

.method protected onLayout(ZIIII)V
    .registers 18
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 71
    const-string v7, "ImageViewTouchBase"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onLayout("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move/from16 v0, p4

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move/from16 v0, p5

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    int-to-float v8, p2

    int-to-float v9, p3

    move/from16 v0, p4

    int-to-float v10, v0

    move/from16 v0, p5

    int-to-float v11, v0

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/RectF;->set(FFFF)V

    .line 75
    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayChanged:Z

    if-eqz v7, :cond_6f

    .line 76
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayTempDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    .line 77
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayTempDrawable:Landroid/graphics/drawable/Drawable;

    .line 79
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_144

    .line 80
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    iput v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawableWidth:I

    .line 81
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v7

    iput v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawableHeight:I

    .line 86
    :goto_6c
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayChanged:Z

    .line 89
    :cond_6f
    if-nez p1, :cond_75

    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mBitmapChanged:Z

    if-eqz v7, :cond_113

    .line 90
    :cond_75
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 91
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_112

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_112

    .line 93
    const-string v7, "ImageViewTouchBase"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "bitmap size: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    sub-int v7, p4, p2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v8

    const/16 v9, 0x800

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 96
    .local v3, "dwidth":I
    sub-int v7, p5, p3

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    const/16 v9, 0x800

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 98
    .local v1, "dheight":I
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v7

    int-to-float v8, v3

    cmpl-float v7, v7, v8

    if-gtz v7, :cond_df

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v7

    int-to-float v8, v1

    cmpl-float v7, v7, v8

    if-lez v7, :cond_112

    .line 101
    :cond_df
    int-to-float v7, v3

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v8

    div-float v6, v7, v8

    .line 102
    .local v6, "widthScale":F
    int-to-float v7, v1

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->height()F

    move-result v8

    div-float v4, v7, v8

    .line 103
    .local v4, "heightScale":F
    invoke-static {v6, v4}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 105
    .local v5, "scale":F
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mLayoutMatrixTemp:Landroid/graphics/Matrix;

    invoke-virtual {v7}, Landroid/graphics/Matrix;->reset()V

    .line 106
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mLayoutMatrixTemp:Landroid/graphics/Matrix;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->centerX()F

    move-result v8

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    invoke-virtual {v9}, Landroid/graphics/RectF;->centerY()F

    move-result v9

    invoke-virtual {v7, v5, v5, v8, v9}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 107
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mLayoutMatrixTemp:Landroid/graphics/Matrix;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    invoke-virtual {v7, v8}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 110
    .end local v1    # "dheight":I
    .end local v3    # "dwidth":I
    .end local v4    # "heightScale":F
    .end local v5    # "scale":F
    .end local v6    # "widthScale":F
    :cond_112
    const/4 p1, 0x1

    .line 113
    .end local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_113
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_140

    .line 114
    if-nez p1, :cond_11d

    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mBitmapChanged:Z

    if-eqz v7, :cond_140

    .line 115
    :cond_11d
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mBaseMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {v7}, Landroid/graphics/Matrix;->reset()V

    .line 116
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mSuppMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {v7}, Landroid/graphics/Matrix;->reset()V

    .line 118
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mBaseMatrix2:Landroid/graphics/Matrix;

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    invoke-virtual {p0, v7, v8, v9}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getProperBaseMatrix2(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 119
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getImageViewMatrix2()Landroid/graphics/Matrix;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->setImageMatrix2(Landroid/graphics/Matrix;)V

    .line 121
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getOverlayBitmapRect()Landroid/graphics/RectF;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 125
    :cond_140
    invoke-super/range {p0 .. p5}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onLayout(ZIIII)V

    .line 126
    return-void

    .line 83
    :cond_144
    const/4 v7, 0x0

    iput v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawableWidth:I

    .line 84
    const/4 v7, 0x0

    iput v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawableHeight:I

    goto/16 :goto_6c
.end method

.method protected onViewPortChanged(FFFF)V
    .registers 11
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_f

    .line 58
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onViewPortChanged(FFFF)V

    .line 66
    :goto_7
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mCanvasClipRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 67
    return-void

    .line 60
    :cond_f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    float-to-double v0, v0

    .line 61
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    float-to-double v2, v1

    .line 62
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v1, v2

    int-to-float v1, v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    float-to-double v2, v2

    .line 63
    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v2, v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mTempViewPort:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    float-to-double v4, v3

    .line 64
    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v3, v4

    int-to-float v3, v3

    .line 60
    invoke-super {p0, v0, v1, v2, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onViewPortChanged(FFFF)V

    goto :goto_7
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "overlay"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    const/high16 v1, -0x40800000

    .line 245
    if-eqz p2, :cond_13

    .line 246
    new-instance v0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    invoke-direct {v0, p2}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayTempDrawable:Landroid/graphics/drawable/Drawable;

    .line 250
    :goto_c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayChanged:Z

    .line 251
    invoke-super {p0, p1, v2, v1, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 252
    return-void

    .line 248
    :cond_13
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayTempDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_c
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "overlay"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    const/high16 v1, -0x40800000

    .line 269
    if-eqz p2, :cond_13

    .line 270
    new-instance v0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    invoke-direct {v0, p2}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayTempDrawable:Landroid/graphics/drawable/Drawable;

    .line 274
    :goto_c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayChanged:Z

    .line 275
    invoke-super {p0, p1, v2, v1, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V

    .line 276
    return-void

    .line 272
    :cond_13
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayTempDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_c
.end method

.method public setImageMatrix2(Landroid/graphics/Matrix;)V
    .registers 3
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 148
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 149
    const/4 p1, 0x0

    .line 153
    :cond_9
    if-nez p1, :cond_13

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-eqz v0, :cond_1d

    :cond_13
    if-eqz p1, :cond_28

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    .line 154
    :cond_1d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mMatrix2:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 155
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->configureBounds2()V

    .line 156
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->invalidate()V

    .line 158
    :cond_28
    return-void
.end method

.method public updateImageOverlay(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "overlay"    # Landroid/graphics/Bitmap;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_6

    if-nez p1, :cond_7

    .line 266
    :cond_6
    :goto_6
    return-void

    .line 259
    :cond_7
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-ne v0, v1, :cond_2a

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    .line 260
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-ne v0, v1, :cond_2a

    .line 261
    new-instance v0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    invoke-direct {v0, p1}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    .line 262
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->invalidate()V

    goto :goto_6

    .line 264
    :cond_2a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;)V

    goto :goto_6
.end method
