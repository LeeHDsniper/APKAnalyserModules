.class public abstract Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;
.super Landroid/widget/ImageView;
.source "ImageViewTouchBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;,
        Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;,
        Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;
    }
.end annotation


# static fields
.field protected static DEBUG:Z


# instance fields
.field protected mBaseMatrix:Landroid/graphics/Matrix;

.field protected mBitmapChanged:Z

.field protected mBitmapRect:Landroid/graphics/RectF;

.field protected mBitmapRectTmp:Landroid/graphics/RectF;

.field protected mCenter:Landroid/graphics/PointF;

.field protected mCenterRect:Landroid/graphics/RectF;

.field private mCurrentAnimation:Lcom/nineoldandroids/animation/Animator;

.field protected mDefaultAnimationDuration:I

.field protected final mDisplayMatrix:Landroid/graphics/Matrix;

.field private mDrawableChangeListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;

.field protected mLayoutRunnable:Ljava/lang/Runnable;

.field protected final mMatrixValues:[F

.field protected mMaxFlingVelocity:I

.field protected mMaxZoom:F

.field protected mMaxZoomDefined:Z

.field protected mMinFlingVelocity:I

.field protected mMinZoom:F

.field protected mMinZoomDefined:Z

.field protected mNextMatrix:Landroid/graphics/Matrix;

.field private mOnLayoutChangeListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;

.field protected mScaleType:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

.field protected mScaleTypeChanged:Z

.field protected mScrollPoint:Landroid/graphics/PointF;

.field protected mSuppMatrix:Landroid/graphics/Matrix;

.field protected mUserScaled:Z

.field protected mViewPort:Landroid/graphics/RectF;

.field protected mViewPortOld:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 76
    const/4 v0, 0x0

    sput-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 109
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 110
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 113
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 114
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/high16 v1, -0x40800000

    .line 117
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 79
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    .line 80
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    .line 82
    const/4 v0, 0x0

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mLayoutRunnable:Ljava/lang/Runnable;

    .line 83
    const/4 v0, 0x0

    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mUserScaled:Z

    .line 84
    iput v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    .line 85
    iput v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    .line 89
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mDisplayMatrix:Landroid/graphics/Matrix;

    .line 90
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMatrixValues:[F

    .line 91
    sget-object v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleType:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    .line 97
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCenter:Landroid/graphics/PointF;

    .line 98
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRect:Landroid/graphics/RectF;

    .line 99
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRectTmp:Landroid/graphics/RectF;

    .line 100
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCenterRect:Landroid/graphics/RectF;

    .line 101
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScrollPoint:Landroid/graphics/PointF;

    .line 102
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    .line 103
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPortOld:Landroid/graphics/RectF;

    .line 118
    invoke-virtual {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 119
    return-void
.end method


# virtual methods
.method protected _setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V
    .registers 11
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "initial_matrix"    # Landroid/graphics/Matrix;
    .param p3, "min_zoom"    # F
    .param p4, "max_zoom"    # F

    .prologue
    const/high16 v5, 0x3f800000

    const/4 v4, 0x0

    const/4 v3, 0x1

    const/high16 v2, -0x40800000

    .line 477
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 478
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 480
    cmpl-float v0, p3, v2

    if-eqz v0, :cond_86

    cmpl-float v0, p4, v2

    if-eqz v0, :cond_86

    .line 481
    invoke-static {p3, p4}, Ljava/lang/Math;->min(FF)F

    move-result p3

    .line 482
    invoke-static {p3, p4}, Ljava/lang/Math;->max(FF)F

    move-result p4

    .line 484
    iput p3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    .line 485
    iput p4, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    .line 487
    iput-boolean v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoomDefined:Z

    .line 488
    iput-boolean v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoomDefined:Z

    .line 490
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDisplayType()Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    move-result-object v0

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_TO_SCREEN:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    if-eq v0, v1, :cond_36

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDisplayType()Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    move-result-object v0

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    if-ne v0, v1, :cond_4a

    .line 492
    :cond_36
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    cmpl-float v0, v0, v5

    if-ltz v0, :cond_40

    .line 493
    iput-boolean v4, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoomDefined:Z

    .line 494
    iput v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    .line 497
    :cond_40
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    cmpg-float v0, v0, v5

    if-gtz v0, :cond_4a

    .line 498
    iput-boolean v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoomDefined:Z

    .line 499
    iput v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    .line 510
    :cond_4a
    :goto_4a
    if-eqz p2, :cond_53

    .line 511
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0, p2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mNextMatrix:Landroid/graphics/Matrix;

    .line 513
    :cond_53
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_7d

    .line 514
    const-string v0, "ImageViewTouchBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mMinZoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mMaxZoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    :cond_7d
    iput-boolean v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    .line 518
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->updateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 519
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->requestLayout()V

    .line 520
    return-void

    .line 503
    :cond_86
    iput v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    .line 504
    iput v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    .line 506
    iput-boolean v4, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoomDefined:Z

    .line 507
    iput-boolean v4, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoomDefined:Z

    goto :goto_4a
.end method

.method protected center(ZZ)V
    .registers 7
    .param p1, "horizontal"    # Z
    .param p2, "vertical"    # Z

    .prologue
    const/4 v3, 0x0

    .line 759
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 760
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_8

    .line 769
    :cond_7
    :goto_7
    return-void

    .line 764
    :cond_8
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v2, p1, p2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getCenter(Landroid/graphics/Matrix;ZZ)Landroid/graphics/RectF;

    move-result-object v1

    .line 766
    .local v1, "rect":Landroid/graphics/RectF;
    iget v2, v1, Landroid/graphics/RectF;->left:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_1a

    iget v2, v1, Landroid/graphics/RectF;->top:F

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_7

    .line 767
    :cond_1a
    iget v2, v1, Landroid/graphics/RectF;->left:F

    iget v3, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0, v2, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->postTranslate(FF)V

    goto :goto_7
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 145
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 146
    return-void
.end method

.method protected computeMaxZoom()F
    .registers 8

    .prologue
    .line 573
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 574
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_9

    .line 575
    const/high16 v3, 0x3f800000

    .line 584
    :cond_8
    :goto_8
    return v3

    .line 577
    :cond_9
    iget-object v4, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget-object v5, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    div-float v2, v4, v5

    .line 578
    .local v2, "fw":F
    iget-object v4, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget-object v5, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    div-float v1, v4, v5

    .line 579
    .local v1, "fh":F
    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v4

    const/high16 v5, 0x40800000

    mul-float v3, v4, v5

    .line 581
    .local v3, "scale":F
    sget-boolean v4, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v4, :cond_8

    .line 582
    const-string v4, "ImageViewTouchBase"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "computeMaxZoom: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8
.end method

.method protected computeMinZoom()F
    .registers 6

    .prologue
    const/high16 v2, 0x3f800000

    .line 588
    sget-boolean v3, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v3, :cond_d

    .line 589
    const-string v3, "ImageViewTouchBase"

    const-string v4, "computeMinZoom"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 592
    :cond_d
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 593
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_15

    move v1, v2

    .line 604
    :cond_14
    :goto_14
    return v1

    .line 597
    :cond_15
    iget-object v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale(Landroid/graphics/Matrix;)F

    move-result v1

    .line 599
    .local v1, "scale":F
    div-float v3, v2, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 600
    sget-boolean v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v2, :cond_14

    .line 601
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "computeMinZoom: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_14
.end method

.method protected fireOnDrawableChangeListener(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 550
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mDrawableChangeListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;

    if-eqz v0, :cond_9

    .line 551
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mDrawableChangeListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;

    invoke-interface {v0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;->onDrawableChanged(Landroid/graphics/drawable/Drawable;)V

    .line 553
    :cond_9
    return-void
.end method

.method protected fireOnLayoutChangeListener(IIII)V
    .registers 11
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 544
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mOnLayoutChangeListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;

    if-eqz v0, :cond_e

    .line 545
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mOnLayoutChangeListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;

    const/4 v1, 0x1

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-interface/range {v0 .. v5}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;->onLayoutChanged(ZIIII)V

    .line 547
    :cond_e
    return-void
.end method

.method public getBaseScale()F
    .registers 2

    .prologue
    .line 755
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale(Landroid/graphics/Matrix;)F

    move-result v0

    return v0
.end method

.method public getBitmapChanged()Z
    .registers 2

    .prologue
    .line 122
    iget-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    return v0
.end method

.method public getBitmapRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 727
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getBitmapRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method protected getBitmapRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .registers 5
    .param p1, "supportMatrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 731
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getImageViewMatrix(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object v0

    .line 732
    .local v0, "m":Landroid/graphics/Matrix;
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRectTmp:Landroid/graphics/RectF;

    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 733
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRectTmp:Landroid/graphics/RectF;

    return-object v1
.end method

.method protected getCenter()Landroid/graphics/PointF;
    .registers 2

    .prologue
    .line 818
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCenter:Landroid/graphics/PointF;

    return-object v0
.end method

.method protected getCenter(Landroid/graphics/Matrix;ZZ)Landroid/graphics/RectF;
    .registers 15
    .param p1, "supportMatrix"    # Landroid/graphics/Matrix;
    .param p2, "horizontal"    # Z
    .param p3, "vertical"    # Z

    .prologue
    const/high16 v10, 0x40000000

    const/4 v9, 0x0

    .line 772
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 774
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v2, :cond_f

    .line 775
    new-instance v6, Landroid/graphics/RectF;

    invoke-direct {v6, v9, v9, v9, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 802
    :goto_e
    return-object v6

    .line 778
    :cond_f
    iget-object v6, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCenterRect:Landroid/graphics/RectF;

    invoke-virtual {v6, v9, v9, v9, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 779
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getBitmapRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v4

    .line 780
    .local v4, "rect":Landroid/graphics/RectF;
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v3

    .line 781
    .local v3, "height":F
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v5

    .line 782
    .local v5, "width":F
    const/4 v0, 0x0

    .local v0, "deltaX":F
    const/4 v1, 0x0

    .line 783
    .local v1, "deltaY":F
    if-eqz p3, :cond_3f

    .line 784
    iget-object v6, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    cmpg-float v6, v3, v6

    if-gez v6, :cond_64

    .line 785
    iget-object v6, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    sub-float/2addr v6, v3

    div-float/2addr v6, v10

    iget v7, v4, Landroid/graphics/RectF;->top:F

    iget-object v8, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->top:F

    sub-float/2addr v7, v8

    sub-float v1, v6, v7

    .line 792
    :cond_3f
    :goto_3f
    if-eqz p2, :cond_5c

    .line 793
    iget-object v6, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    cmpg-float v6, v5, v6

    if-gez v6, :cond_8a

    .line 794
    iget-object v6, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    sub-float/2addr v6, v5

    div-float/2addr v6, v10

    iget v7, v4, Landroid/graphics/RectF;->left:F

    iget-object v8, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->left:F

    sub-float/2addr v7, v8

    sub-float v0, v6, v7

    .line 801
    :cond_5c
    :goto_5c
    iget-object v6, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCenterRect:Landroid/graphics/RectF;

    invoke-virtual {v6, v0, v1, v9, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 802
    iget-object v6, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCenterRect:Landroid/graphics/RectF;

    goto :goto_e

    .line 786
    :cond_64
    iget v6, v4, Landroid/graphics/RectF;->top:F

    iget-object v7, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_77

    .line 787
    iget v6, v4, Landroid/graphics/RectF;->top:F

    iget-object v7, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    sub-float/2addr v6, v7

    neg-float v1, v6

    goto :goto_3f

    .line 788
    :cond_77
    iget v6, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v7, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->bottom:F

    cmpg-float v6, v6, v7

    if-gez v6, :cond_3f

    .line 789
    iget-object v6, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    iget v7, v4, Landroid/graphics/RectF;->bottom:F

    sub-float v1, v6, v7

    goto :goto_3f

    .line 795
    :cond_8a
    iget v6, v4, Landroid/graphics/RectF;->left:F

    iget-object v7, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->left:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_9d

    .line 796
    iget v6, v4, Landroid/graphics/RectF;->left:F

    iget-object v7, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->left:F

    sub-float/2addr v6, v7

    neg-float v0, v6

    goto :goto_5c

    .line 797
    :cond_9d
    iget v6, v4, Landroid/graphics/RectF;->right:F

    iget-object v7, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->right:F

    cmpg-float v6, v6, v7

    if-gez v6, :cond_5c

    .line 798
    iget-object v6, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    iget v7, v4, Landroid/graphics/RectF;->right:F

    sub-float v0, v6, v7

    goto :goto_5c
.end method

.method protected getDefaultScale(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)F
    .registers 4
    .param p1, "type"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    .prologue
    const/high16 v0, 0x3f800000

    .line 405
    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_TO_SCREEN:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    if-ne p1, v1, :cond_7

    .line 413
    :goto_6
    return v0

    .line 408
    :cond_7
    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    if-ne p1, v1, :cond_18

    .line 410
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale(Landroid/graphics/Matrix;)F

    move-result v1

    div-float v1, v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    goto :goto_6

    .line 413
    :cond_18
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale(Landroid/graphics/Matrix;)F

    move-result v1

    div-float/2addr v0, v1

    goto :goto_6
.end method

.method public getDisplayMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 691
    new-instance v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    return-object v0
.end method

.method public getDisplayType()Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleType:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    return-object v0
.end method

.method public getImageViewMatrix()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 646
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getImageViewMatrix(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getImageViewMatrix(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .registers 4
    .param p1, "supportMatrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 650
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mDisplayMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 651
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mDisplayMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 652
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mDisplayMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getMaxScale()F
    .registers 3

    .prologue
    .line 613
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    const/high16 v1, -0x40800000

    cmpl-float v0, v0, v1

    if-nez v0, :cond_e

    .line 614
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->computeMaxZoom()F

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    .line 616
    :cond_e
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    return v0
.end method

.method public getMinScale()F
    .registers 4

    .prologue
    .line 625
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_1e

    .line 626
    const-string v0, "ImageViewTouchBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getMinScale, mMinZoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 629
    :cond_1e
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    const/high16 v1, -0x40800000

    cmpl-float v0, v0, v1

    if-nez v0, :cond_2c

    .line 630
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->computeMinZoom()F

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    .line 633
    :cond_2c
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_4a

    .line 634
    const-string v0, "ImageViewTouchBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mMinZoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 637
    :cond_4a
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    return v0
.end method

.method protected getProperBaseMatrix(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;Landroid/graphics/RectF;)V
    .registers 14
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "matrix"    # Landroid/graphics/Matrix;
    .param p3, "rect"    # Landroid/graphics/RectF;

    .prologue
    const/high16 v9, 0x40000000

    .line 695
    iget-object v7, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v5

    .line 696
    .local v5, "w":F
    iget-object v7, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v0

    .line 699
    .local v0, "h":F
    invoke-virtual {p2}, Landroid/graphics/Matrix;->reset()V

    .line 701
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float v6, v7, v5

    .line 702
    .local v6, "widthScale":F
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v7

    div-float v1, v7, v0

    .line 703
    .local v1, "heightScale":F
    invoke-static {v6, v1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 704
    .local v2, "scale":F
    invoke-virtual {p2, v2, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 705
    iget v7, p3, Landroid/graphics/RectF;->left:F

    iget v8, p3, Landroid/graphics/RectF;->top:F

    invoke-virtual {p2, v7, v8}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 707
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    move-result v7

    mul-float v8, v5, v2

    sub-float/2addr v7, v8

    div-float v4, v7, v9

    .line 708
    .local v4, "tw":F
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    move-result v7

    mul-float v8, v0, v2

    sub-float/2addr v7, v8

    div-float v3, v7, v9

    .line 709
    .local v3, "th":F
    invoke-virtual {p2, v4, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 710
    invoke-virtual {p0, p2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->printMatrix(Landroid/graphics/Matrix;)V

    .line 711
    return-void
.end method

.method public getRotation()F
    .registers 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Override"
        }
    .end annotation

    .prologue
    .line 742
    const/4 v0, 0x0

    return v0
.end method

.method public getScale()F
    .registers 2

    .prologue
    .line 751
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale(Landroid/graphics/Matrix;)F

    move-result v0

    return v0
.end method

.method protected getScale(Landroid/graphics/Matrix;)F
    .registers 3
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 737
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    return v0
.end method

.method protected getValue(Landroid/graphics/Matrix;I)F
    .registers 4
    .param p1, "matrix"    # Landroid/graphics/Matrix;
    .param p2, "whichValue"    # I

    .prologue
    .line 714
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 715
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMatrixValues:[F

    aget v0, v0, p2

    return v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 134
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 135
    .local v0, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    iput v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinFlingVelocity:I

    .line 136
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxFlingVelocity:I

    .line 137
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x10e0000

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mDefaultAnimationDuration:I

    .line 138
    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 139
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 5
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 359
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 361
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_3d

    .line 362
    const-string v0, "ImageViewTouchBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onConfigurationChanged. scale: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 364
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", minScale: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMinScale()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mUserScaled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mUserScaled:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 362
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    :cond_3d
    iget-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mUserScaled:Z

    if-eqz v0, :cond_58

    .line 368
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v0

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMinScale()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x3dcccccd

    cmpl-float v0, v0, v1

    if-lez v0, :cond_77

    const/4 v0, 0x1

    :goto_56
    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mUserScaled:Z

    .line 371
    :cond_58
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_76

    .line 372
    const-string v0, "ImageViewTouchBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mUserScaled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mUserScaled:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    :cond_76
    return-void

    .line 368
    :cond_77
    const/4 v0, 0x0

    goto :goto_56
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1013
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    if-ne v1, v2, :cond_12

    .line 1014
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1015
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_11

    .line 1016
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1021
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_11
    :goto_11
    return-void

    .line 1019
    :cond_12
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    goto :goto_11
.end method

.method protected onDrawableChanged(Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 536
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_35

    .line 537
    const-string v0, "ImageViewTouchBase"

    const-string v1, "onDrawableChanged"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    const-string v0, "ImageViewTouchBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "scale: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", minScale: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMinScale()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 540
    :cond_35
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->fireOnDrawableChangeListener(Landroid/graphics/drawable/Drawable;)V

    .line 541
    return-void
.end method

.method protected onImageMatrixChanged()V
    .registers 1

    .prologue
    .line 675
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 26
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 190
    sget-boolean v16, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v16, :cond_40

    .line 191
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "onLayout: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ", bitmapChanged: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ", scaleChanged: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleTypeChanged:Z

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    :cond_40
    const/4 v6, 0x0

    .line 195
    .local v6, "deltaX":F
    const/4 v7, 0x0

    .line 197
    .local v7, "deltaY":F
    if-eqz p1, :cond_a0

    .line 198
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPortOld:Landroid/graphics/RectF;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 199
    move/from16 v0, p2

    int-to-float v0, v0

    move/from16 v16, v0

    move/from16 v0, p3

    int-to-float v0, v0

    move/from16 v17, v0

    move/from16 v0, p4

    int-to-float v0, v0

    move/from16 v18, v0

    move/from16 v0, p5

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v16

    move/from16 v2, v17

    move/from16 v3, v18

    move/from16 v4, v19

    invoke-virtual {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->onViewPortChanged(FFFF)V

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/RectF;->width()F

    move-result v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPortOld:Landroid/graphics/RectF;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->width()F

    move-result v17

    sub-float v6, v16, v17

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/RectF;->height()F

    move-result v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPortOld:Landroid/graphics/RectF;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->height()F

    move-result v17

    sub-float v7, v16, v17

    .line 205
    :cond_a0
    invoke-super/range {p0 .. p5}, Landroid/widget/ImageView;->onLayout(ZIIII)V

    .line 207
    move-object/from16 v0, p0

    iget-object v14, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mLayoutRunnable:Ljava/lang/Runnable;

    .line 209
    .local v14, "r":Ljava/lang/Runnable;
    if-eqz v14, :cond_b4

    .line 210
    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mLayoutRunnable:Ljava/lang/Runnable;

    .line 211
    invoke-interface {v14}, Ljava/lang/Runnable;->run()V

    .line 214
    :cond_b4
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 216
    .local v8, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v8, :cond_439

    .line 218
    if-nez p1, :cond_cc

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleTypeChanged:Z

    move/from16 v16, v0

    if-nez v16, :cond_cc

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_31d

    .line 220
    :cond_cc
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_105

    .line 221
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mUserScaled:Z

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Matrix;->reset()V

    .line 223
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoomDefined:Z

    move/from16 v16, v0

    if-nez v16, :cond_f5

    .line 224
    const/high16 v16, -0x40800000

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    .line 226
    :cond_f5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoomDefined:Z

    move/from16 v16, v0

    if-nez v16, :cond_105

    .line 227
    const/high16 v16, -0x40800000

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    .line 231
    :cond_105
    const/high16 v15, 0x3f800000

    .line 234
    .local v15, "scale":F
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDisplayType()Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDefaultScale(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)F

    move-result v10

    .line 235
    .local v10, "old_default_scale":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale(Landroid/graphics/Matrix;)F

    move-result v11

    .line 236
    .local v11, "old_matrix_scale":F
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v13

    .line 237
    .local v13, "old_scale":F
    const/high16 v16, 0x3f800000

    const/high16 v17, 0x3f800000

    div-float v17, v17, v11

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->min(FF)F

    move-result v12

    .line 239
    .local v12, "old_min_scale":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v8, v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getProperBaseMatrix(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 241
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale(Landroid/graphics/Matrix;)F

    move-result v9

    .line 243
    .local v9, "new_matrix_scale":F
    sget-boolean v16, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v16, :cond_1be

    .line 244
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "old matrix scale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "new matrix scale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "old min scale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "old scale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    :cond_1be
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    move/from16 v16, v0

    if-nez v16, :cond_1ce

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleTypeChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_335

    .line 253
    :cond_1ce
    sget-boolean v16, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v16, :cond_20c

    .line 254
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "display type: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDisplayType()Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "newMatrix: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mNextMatrix:Landroid/graphics/Matrix;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    :cond_20c
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mNextMatrix:Landroid/graphics/Matrix;

    move-object/from16 v16, v0

    if-eqz v16, :cond_31e

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mNextMatrix:Landroid/graphics/Matrix;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 260
    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mNextMatrix:Landroid/graphics/Matrix;

    .line 261
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v15

    .line 267
    :goto_22f
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 269
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v16

    cmpl-float v16, v15, v16

    if-eqz v16, :cond_273

    .line 270
    sget-boolean v16, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v16, :cond_26e

    .line 271
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "scale != getScale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " != "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    :cond_26e
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->zoomTo(F)V

    .line 313
    :cond_273
    :goto_273
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMaxScale()F

    move-result v16

    cmpl-float v16, v15, v16

    if-gtz v16, :cond_283

    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMinScale()F

    move-result v16

    cmpg-float v16, v15, v16

    if-gez v16, :cond_288

    .line 316
    :cond_283
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->zoomTo(F)V

    .line 319
    :cond_288
    const/16 v16, 0x1

    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v16

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->center(ZZ)V

    .line 321
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_2a2

    .line 322
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->onDrawableChanged(Landroid/graphics/drawable/Drawable;)V

    .line 324
    :cond_2a2
    if-nez p1, :cond_2b4

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    move/from16 v16, v0

    if-nez v16, :cond_2b4

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleTypeChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_2c1

    .line 325
    :cond_2b4
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    invoke-virtual {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->onLayoutChanged(IIII)V

    .line 328
    :cond_2c1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleTypeChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_2d1

    .line 329
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleTypeChanged:Z

    .line 331
    :cond_2d1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_2e1

    .line 332
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    .line 335
    :cond_2e1
    sget-boolean v16, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v16, :cond_31d

    .line 336
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "scale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ", minScale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMinScale()F

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ", maxScale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMaxScale()F

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    .end local v9    # "new_matrix_scale":F
    .end local v10    # "old_default_scale":F
    .end local v11    # "old_matrix_scale":F
    .end local v12    # "old_min_scale":F
    .end local v13    # "old_scale":F
    .end local v15    # "scale":F
    :cond_31d
    :goto_31d
    return-void

    .line 263
    .restart local v9    # "new_matrix_scale":F
    .restart local v10    # "old_default_scale":F
    .restart local v11    # "old_matrix_scale":F
    .restart local v12    # "old_min_scale":F
    .restart local v13    # "old_scale":F
    .restart local v15    # "scale":F
    :cond_31e
    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Matrix;->reset()V

    .line 264
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDisplayType()Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDefaultScale(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)F

    move-result v15

    goto/16 :goto_22f

    .line 276
    :cond_335
    if-eqz p1, :cond_273

    .line 280
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoomDefined:Z

    move/from16 v16, v0

    if-nez v16, :cond_347

    .line 281
    const/high16 v16, -0x40800000

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    .line 283
    :cond_347
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoomDefined:Z

    move/from16 v16, v0

    if-nez v16, :cond_357

    .line 284
    const/high16 v16, -0x40800000

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    .line 287
    :cond_357
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 288
    neg-float v0, v6

    move/from16 v16, v0

    neg-float v0, v7

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, v16

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->postTranslate(FF)V

    .line 290
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mUserScaled:Z

    move/from16 v16, v0

    if-nez v16, :cond_3fc

    .line 291
    invoke-virtual/range {p0 .. p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDisplayType()Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDefaultScale(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)F

    move-result v15

    .line 292
    sget-boolean v16, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v16, :cond_3a3

    .line 293
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "!userScaled. scale="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    :cond_3a3
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->zoomTo(F)V

    .line 306
    :goto_3a8
    sget-boolean v16, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v16, :cond_273

    .line 307
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "old min scale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "old scale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "new scale: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_273

    .line 297
    :cond_3fc
    sub-float v16, v13, v12

    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->abs(F)F

    move-result v16

    move/from16 v0, v16

    float-to-double v0, v0

    move-wide/from16 v16, v0

    const-wide v18, 0x3fb999999999999aL

    cmpl-double v16, v16, v18

    if-lez v16, :cond_414

    .line 298
    div-float v16, v11, v9

    mul-float v15, v16, v13

    .line 300
    :cond_414
    sget-boolean v16, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v16, :cond_432

    .line 301
    const-string v16, "ImageViewTouchBase"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "userScaled. scale="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    :cond_432
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->zoomTo(F)V

    goto/16 :goto_3a8

    .line 341
    .end local v9    # "new_matrix_scale":F
    .end local v10    # "old_default_scale":F
    .end local v11    # "old_matrix_scale":F
    .end local v12    # "old_min_scale":F
    .end local v13    # "old_scale":F
    .end local v15    # "scale":F
    :cond_439
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_446

    .line 342
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->onDrawableChanged(Landroid/graphics/drawable/Drawable;)V

    .line 344
    :cond_446
    if-nez p1, :cond_458

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    move/from16 v16, v0

    if-nez v16, :cond_458

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleTypeChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_465

    .line 345
    :cond_458
    move-object/from16 v0, p0

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p5

    invoke-virtual {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->onLayoutChanged(IIII)V

    .line 348
    :cond_465
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_475

    .line 349
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapChanged:Z

    .line 351
    :cond_475
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleTypeChanged:Z

    move/from16 v16, v0

    if-eqz v16, :cond_31d

    .line 352
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleTypeChanged:Z

    goto/16 :goto_31d
.end method

.method protected onLayoutChanged(IIII)V
    .registers 7
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 566
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_b

    .line 567
    const-string v0, "ImageViewTouchBase"

    const-string v1, "onLayoutChanged"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    :cond_b
    invoke-virtual {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->fireOnLayoutChangeListener(IIII)V

    .line 570
    return-void
.end method

.method protected onViewPortChanged(FFFF)V
    .registers 7
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F

    .prologue
    .line 183
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 184
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCenter:Landroid/graphics/PointF;

    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 185
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCenter:Landroid/graphics/PointF;

    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 186
    return-void
.end method

.method protected onZoom(F)V
    .registers 2
    .param p1, "scale"    # F

    .prologue
    .line 865
    return-void
.end method

.method protected panBy(DD)V
    .registers 12
    .param p1, "dx"    # D
    .param p3, "dy"    # D

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 881
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 882
    .local v0, "rect":Landroid/graphics/RectF;
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScrollPoint:Landroid/graphics/PointF;

    double-to-float v2, p1

    double-to-float v3, p3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 883
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScrollPoint:Landroid/graphics/PointF;

    invoke-virtual {p0, v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->updateRect(Landroid/graphics/RectF;Landroid/graphics/PointF;)V

    .line 885
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScrollPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    cmpl-float v1, v1, v4

    if-nez v1, :cond_22

    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScrollPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    cmpl-float v1, v1, v4

    if-eqz v1, :cond_30

    .line 886
    :cond_22
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScrollPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScrollPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0, v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->postTranslate(FF)V

    .line 887
    invoke-virtual {p0, v5, v5}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->center(ZZ)V

    .line 889
    :cond_30
    return-void
.end method

.method protected postScale(FFF)V
    .registers 5
    .param p1, "scale"    # F
    .param p2, "centerX"    # F
    .param p3, "centerY"    # F

    .prologue
    .line 813
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 814
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 815
    return-void
.end method

.method protected postTranslate(FF)V
    .registers 5
    .param p1, "deltaX"    # F
    .param p2, "deltaY"    # F

    .prologue
    const/4 v1, 0x0

    .line 806
    cmpl-float v0, p1, v1

    if-nez v0, :cond_9

    cmpl-float v0, p2, v1

    if-eqz v0, :cond_15

    .line 807
    :cond_9
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 808
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 810
    :cond_15
    return-void
.end method

.method public printMatrix(Landroid/graphics/Matrix;)V
    .registers 9
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 719
    const/4 v4, 0x0

    invoke-virtual {p0, p1, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    .line 720
    .local v0, "scalex":F
    const/4 v4, 0x4

    invoke-virtual {p0, p1, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getValue(Landroid/graphics/Matrix;I)F

    move-result v1

    .line 721
    .local v1, "scaley":F
    const/4 v4, 0x2

    invoke-virtual {p0, p1, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getValue(Landroid/graphics/Matrix;I)F

    move-result v2

    .line 722
    .local v2, "tx":F
    const/4 v4, 0x5

    invoke-virtual {p0, p1, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getValue(Landroid/graphics/Matrix;I)F

    move-result v3

    .line 723
    .local v3, "ty":F
    const-string v4, "ImageViewTouchBase"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "matrix: { x: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", y: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", scalex: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", scaley: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " }"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 724
    return-void
.end method

.method public resetMatrix()V
    .registers 5

    .prologue
    .line 385
    sget-boolean v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v1, :cond_b

    .line 386
    const-string v1, "ImageViewTouchBase"

    const-string v2, "resetMatrix"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 388
    :cond_b
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    .line 390
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDisplayType()Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    move-result-object v1

    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getDefaultScale(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)F

    move-result v0

    .line 391
    .local v0, "scale":F
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 393
    sget-boolean v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v1, :cond_4b

    .line 394
    const-string v1, "ImageViewTouchBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "default scale: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", scale: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    :cond_4b
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v1

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_56

    .line 398
    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->zoomTo(F)V

    .line 401
    :cond_56
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->postInvalidate()V

    .line 402
    return-void
.end method

.method public scrollBy(FF)V
    .registers 7
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 877
    float-to-double v0, p1

    float-to-double v2, p2

    invoke-virtual {p0, v0, v1, v2, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->panBy(DD)V

    .line 878
    return-void
.end method

.method protected scrollBy(FFJ)V
    .registers 12
    .param p1, "distanceX"    # F
    .param p2, "distanceY"    # F
    .param p3, "durationMs"    # J

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 915
    new-array v2, v3, [F

    aput v6, v2, v4

    aput p1, v2, v5

    invoke-static {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v2

    invoke-virtual {v2, p3, p4}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    .line 916
    .local v0, "anim1":Lcom/nineoldandroids/animation/ValueAnimator;
    new-array v2, v3, [F

    aput v6, v2, v4

    aput p2, v2, v5

    invoke-static {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v2

    invoke-virtual {v2, p3, p4}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v1

    .line 918
    .local v1, "anim2":Lcom/nineoldandroids/animation/ValueAnimator;
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->stopAllAnimations()V

    .line 920
    new-instance v2, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v2}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    iput-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCurrentAnimation:Lcom/nineoldandroids/animation/Animator;

    .line 921
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCurrentAnimation:Lcom/nineoldandroids/animation/Animator;

    check-cast v2, Lcom/nineoldandroids/animation/AnimatorSet;

    new-array v3, v3, [Lcom/nineoldandroids/animation/Animator;

    aput-object v0, v3, v4

    aput-object v1, v3, v5

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/animation/AnimatorSet;->playTogether([Lcom/nineoldandroids/animation/Animator;)V

    .line 925
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCurrentAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v2, p3, p4}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 926
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCurrentAnimation:Lcom/nineoldandroids/animation/Animator;

    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/animation/Animator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 927
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCurrentAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v2}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 929
    new-instance v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;

    invoke-direct {v2, p0, v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;Lcom/nineoldandroids/animation/ValueAnimator;Lcom/nineoldandroids/animation/ValueAnimator;)V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 946
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCurrentAnimation:Lcom/nineoldandroids/animation/Animator;

    new-instance v3, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$3;

    invoke-direct {v3, p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$3;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;)V

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/animation/Animator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 972
    return-void
.end method

.method public setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V
    .registers 5
    .param p1, "type"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    .prologue
    .line 152
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleType:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    if-eq p1, v0, :cond_2b

    .line 153
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_20

    .line 154
    const-string v0, "ImageViewTouchBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDisplayType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :cond_20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mUserScaled:Z

    .line 157
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleType:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    .line 158
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mScaleTypeChanged:Z

    .line 159
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->requestLayout()V

    .line 161
    :cond_2b
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/high16 v1, -0x40800000

    .line 430
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 431
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "matrix"    # Landroid/graphics/Matrix;
    .param p3, "min_zoom"    # F
    .param p4, "max_zoom"    # F

    .prologue
    .line 441
    if-eqz p1, :cond_b

    .line 442
    new-instance v0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    invoke-direct {v0, p1}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v0, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V

    .line 446
    :goto_a
    return-void

    .line 444
    :cond_b
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V

    goto :goto_a
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/high16 v1, -0x40800000

    .line 450
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V

    .line 451
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V
    .registers 12
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "initial_matrix"    # Landroid/graphics/Matrix;
    .param p3, "min_zoom"    # F
    .param p4, "max_zoom"    # F

    .prologue
    .line 462
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getWidth()I

    move-result v6

    .line 464
    .local v6, "viewWidth":I
    if-gtz v6, :cond_13

    .line 465
    new-instance v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$1;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mLayoutRunnable:Ljava/lang/Runnable;

    .line 474
    :goto_12
    return-void

    .line 473
    :cond_13
    invoke-virtual {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->_setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V

    goto :goto_12
.end method

.method public setImageMatrix(Landroid/graphics/Matrix;)V
    .registers 5
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 657
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    .line 658
    .local v0, "current":Landroid/graphics/Matrix;
    const/4 v1, 0x0

    .line 660
    .local v1, "needUpdate":Z
    if-nez p1, :cond_d

    invoke-virtual {v0}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v2

    if-eqz v2, :cond_15

    :cond_d
    if-eqz p1, :cond_16

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_16

    .line 661
    :cond_15
    const/4 v1, 0x1

    .line 664
    :cond_16
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 665
    if-eqz v1, :cond_1e

    .line 666
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->onImageMatrixChanged()V

    .line 668
    :cond_1e
    return-void
.end method

.method public setImageResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 419
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 420
    return-void
.end method

.method protected setMaxScale(F)V
    .registers 5
    .param p1, "value"    # F

    .prologue
    .line 176
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_1c

    .line 177
    const-string v0, "ImageViewTouchBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMaxZoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    :cond_1c
    iput p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMaxZoom:F

    .line 180
    return-void
.end method

.method protected setMinScale(F)V
    .registers 5
    .param p1, "value"    # F

    .prologue
    .line 168
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_1c

    .line 169
    const-string v0, "ImageViewTouchBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMinZoom: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    :cond_1c
    iput p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mMinZoom:F

    .line 173
    return-void
.end method

.method public setOnDrawableChangedListener(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;

    .prologue
    .line 126
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mDrawableChangeListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;

    .line 127
    return-void
.end method

.method public setOnLayoutChangeListener(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;

    .prologue
    .line 130
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mOnLayoutChangeListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;

    .line 131
    return-void
.end method

.method protected stopAllAnimations()V
    .registers 2

    .prologue
    .line 908
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCurrentAnimation:Lcom/nineoldandroids/animation/Animator;

    if-eqz v0, :cond_c

    .line 909
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCurrentAnimation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    .line 910
    const/4 v0, 0x0

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mCurrentAnimation:Lcom/nineoldandroids/animation/Animator;

    .line 912
    :cond_c
    return-void
.end method

.method protected updateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "newDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v3, 0x0

    .line 523
    if-eqz p1, :cond_13

    .line 524
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 528
    :goto_12
    return-void

    .line 526
    :cond_13
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->setEmpty()V

    goto :goto_12
.end method

.method protected updateRect(Landroid/graphics/RectF;Landroid/graphics/PointF;)V
    .registers 3
    .param p1, "bitmapRect"    # Landroid/graphics/RectF;
    .param p2, "scrollRect"    # Landroid/graphics/PointF;

    .prologue
    .line 892
    if-nez p1, :cond_2

    .line 905
    :cond_2
    return-void
.end method

.method protected zoomTo(F)V
    .registers 6
    .param p1, "scale"    # F

    .prologue
    .line 822
    sget-boolean v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v1, :cond_1c

    .line 823
    const-string v1, "ImageViewTouchBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "zoomTo: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 826
    :cond_1c
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMaxScale()F

    move-result v1

    cmpl-float v1, p1, v1

    if-lez v1, :cond_28

    .line 827
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMaxScale()F

    move-result p1

    .line 829
    :cond_28
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMinScale()F

    move-result v1

    cmpg-float v1, p1, v1

    if-gez v1, :cond_34

    .line 830
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMinScale()F

    move-result p1

    .line 833
    :cond_34
    sget-boolean v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v1, :cond_50

    .line 834
    const-string v1, "ImageViewTouchBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sanitized scale: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 837
    :cond_50
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    .line 838
    .local v0, "center":Landroid/graphics/PointF;
    iget v1, v0, Landroid/graphics/PointF;->x:F

    iget v2, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0, p1, v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->zoomTo(FFF)V

    .line 839
    return-void
.end method

.method protected zoomTo(FFF)V
    .registers 8
    .param p1, "scale"    # F
    .param p2, "centerX"    # F
    .param p3, "centerY"    # F

    .prologue
    const/4 v3, 0x1

    .line 853
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMaxScale()F

    move-result v2

    cmpl-float v2, p1, v2

    if-lez v2, :cond_d

    .line 854
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMaxScale()F

    move-result p1

    .line 857
    :cond_d
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v1

    .line 858
    .local v1, "oldScale":F
    div-float v0, p1, v1

    .line 859
    .local v0, "deltaScale":F
    invoke-virtual {p0, v0, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->postScale(FFF)V

    .line 860
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v2

    invoke-virtual {p0, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->onZoom(F)V

    .line 861
    invoke-virtual {p0, v3, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->center(ZZ)V

    .line 862
    return-void
.end method

.method protected zoomTo(FFFJ)V
    .registers 16
    .param p1, "scale"    # F
    .param p2, "centerX"    # F
    .param p3, "centerY"    # F
    .param p4, "durationMs"    # J

    .prologue
    const/4 v9, 0x1

    .line 975
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMaxScale()F

    move-result v7

    cmpl-float v7, p1, v7

    if-lez v7, :cond_d

    .line 976
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getMaxScale()F

    move-result p1

    .line 979
    :cond_d
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getScale()F

    move-result v5

    .line 981
    .local v5, "oldScale":F
    new-instance v4, Landroid/graphics/Matrix;

    iget-object v7, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-direct {v4, v7}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 982
    .local v4, "m":Landroid/graphics/Matrix;
    invoke-virtual {v4, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 983
    invoke-virtual {p0, v4, v9, v9}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getCenter(Landroid/graphics/Matrix;ZZ)Landroid/graphics/RectF;

    move-result-object v6

    .line 985
    .local v6, "rect":Landroid/graphics/RectF;
    move v3, p1

    .line 986
    .local v3, "finalScale":F
    iget v7, v6, Landroid/graphics/RectF;->left:F

    mul-float/2addr v7, p1

    add-float v1, p2, v7

    .line 987
    .local v1, "destX":F
    iget v7, v6, Landroid/graphics/RectF;->top:F

    mul-float/2addr v7, p1

    add-float v2, p3, v7

    .line 989
    .local v2, "destY":F
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->stopAllAnimations()V

    .line 991
    const/4 v7, 0x2

    new-array v7, v7, [F

    const/4 v8, 0x0

    aput v5, v7, v8

    aput v3, v7, v9

    invoke-static {v7}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    .line 992
    .local v0, "animation":Lcom/nineoldandroids/animation/ValueAnimator;
    invoke-virtual {v0, p4, p5}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 993
    new-instance v7, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v8, 0x3f800000

    invoke-direct {v7, v8}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v7}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 994
    new-instance v7, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$4;

    invoke-direct {v7, p0, v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$4;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;FF)V

    invoke-virtual {v0, v7}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1002
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 1003
    return-void
.end method

.method public zoomTo(FJ)V
    .registers 12
    .param p1, "scale"    # F
    .param p2, "durationMs"    # J

    .prologue
    .line 848
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getCenter()Landroid/graphics/PointF;

    move-result-object v6

    .line 849
    .local v6, "center":Landroid/graphics/PointF;
    iget v2, v6, Landroid/graphics/PointF;->x:F

    iget v3, v6, Landroid/graphics/PointF;->y:F

    move-object v0, p0

    move v1, p1

    move-wide v4, p2

    invoke-virtual/range {v0 .. v5}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->zoomTo(FFFJ)V

    .line 850
    return-void
.end method
