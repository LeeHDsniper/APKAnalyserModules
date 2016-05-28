.class public Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.source "ImageViewTiltiShiftTouch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;,
        Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;
    }
.end annotation


# instance fields
.field firstLine:Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

.field mActivePointerId:I

.field mActivePointerIndex:I

.field private mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

.field private mBitmapRect:Landroid/graphics/RectF;

.field private mBitmapRectSideLength:F

.field private mCenterMatrix:Landroid/graphics/Matrix;

.field private mCenterPoint:Landroid/graphics/PointF;

.field private mCurrentAngle:F

.field private mCurrentDistance:F

.field protected mCurrentScale:F

.field private mDefaultShapeSize:F

.field private mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;

.field private mDrawingCircle:Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

.field private mDrawingMatrix:Landroid/graphics/Matrix;

.field private mDrawingRect:Landroid/graphics/RectF;

.field private mDrawingRectLength:F

.field private mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

.field protected mFadeOutDuration:J

.field protected mFadeOutTimeout:I

.field private mFirstPointOriginal:Landroid/graphics/PointF;

.field mForeColor:I

.field private mInitializedTouch:Z

.field protected mInvertedMatrix:Landroid/graphics/Matrix;

.field private mMaxShapeSize:I

.field private mMinShapeSize:I

.field private mMinShapeSizePixels:F

.field private mNeedToResetWave:Z

.field mOldAngle:F

.field mOldCenter:Landroid/graphics/PointF;

.field mOldDistance:F

.field protected mPaint:Landroid/graphics/Paint;

.field protected mPaintAlpha:I

.field protected mPaintAlphaDefault:I

.field private mPath:Landroid/graphics/Path;

.field private mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

.field private mPoints:[F

.field private mSecondPointOriginal:Landroid/graphics/PointF;

.field private mShapeRect:Landroid/graphics/RectF;

.field private mShapeRectInverted:Landroid/graphics/RectF;

.field private mThisRectF:Landroid/graphics/RectF;

.field private mTiltShiftDrawMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

.field secondLine:Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 104
    sget v0, Lcom/aviary/android/feather/sdk/R$style;->AdobeImageWidget_TiltShiftView:I

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 105
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v2, 0x0

    .line 108
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeOutTimeout:I

    .line 43
    const/16 v0, 0xc8

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlpha:I

    .line 44
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlpha:I

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlphaDefault:I

    .line 45
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeOutDuration:J

    .line 47
    const/high16 v0, 0x3f800000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentScale:F

    .line 48
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInvertedMatrix:Landroid/graphics/Matrix;

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mForeColor:I

    .line 55
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldCenter:Landroid/graphics/PointF;

    .line 56
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldDistance:F

    .line 57
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldAngle:F

    .line 59
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    invoke-direct {v0, v2, v2, v2, v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->firstLine:Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    .line 60
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    invoke-direct {v0, v2, v2, v2, v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->secondLine:Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    .line 78
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->None:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mTiltShiftDrawMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    .line 84
    const/high16 v0, 0x42200000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMinShapeSizePixels:F

    .line 96
    const/16 v0, 0x8

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    .line 109
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;)Lcom/nineoldandroids/animation/ObjectAnimator;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    return-object v0
.end method

.method private checkLimits()V
    .registers 5

    .prologue
    const/high16 v3, 0x42c80000

    .line 408
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    if-nez v0, :cond_7

    .line 433
    :cond_6
    :goto_6
    return-void

    .line 414
    :cond_7
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRectSideLength:F

    div-float/2addr v1, v3

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMaxShapeSize:I

    int-to-float v2, v2

    mul-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1d

    .line 415
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRectSideLength:F

    div-float/2addr v0, v3

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMaxShapeSize:I

    int-to-float v1, v1

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    .line 419
    :cond_1d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-nez v0, :cond_6

    .line 420
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_56

    .line 421
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 426
    :cond_41
    :goto_41
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_6b

    .line 427
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iput v1, v0, Landroid/graphics/PointF;->y:F

    goto :goto_6

    .line 422
    :cond_56
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_41

    .line 423
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iput v1, v0, Landroid/graphics/PointF;->x:F

    goto :goto_41

    .line 428
    :cond_6b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_6

    .line 429
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    iput v1, v0, Landroid/graphics/PointF;->y:F

    goto :goto_6
.end method

.method public static getMatrixValues(Landroid/graphics/Matrix;)[F
    .registers 3
    .param p0, "m"    # Landroid/graphics/Matrix;

    .prologue
    .line 522
    const/16 v1, 0x9

    new-array v0, v1, [F

    .line 523
    .local v0, "values":[F
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 524
    return-object v0
.end method

.method private initializeTouch(FFFF)V
    .registers 13
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F

    .prologue
    const/4 v7, 0x1

    const/high16 v6, 0x40000000

    .line 376
    iput-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInitializedTouch:Z

    .line 378
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    .line 379
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1, p3, p4}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    .line 381
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    const/high16 v3, 0x3f000000

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    invoke-static {v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->getLerp(Landroid/graphics/PointF;Landroid/graphics/PointF;FLandroid/graphics/PointF;)V

    .line 382
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMinShapeSizePixels:F

    float-to-double v2, v1

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    invoke-static {v1, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->distance(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    double-to-float v1, v2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    .line 383
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angleBetweenPoints(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    move-result-wide v2

    neg-double v2, v2

    double-to-float v1, v2

    const/high16 v2, 0x42b40000

    add-float/2addr v1, v2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentAngle:F

    .line 385
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    if-eqz v1, :cond_b1

    .line 386
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    float-to-double v2, v1

    const-wide/high16 v4, 0x3ff0000000000000L

    div-double/2addr v2, v4

    double-to-float v0, v2

    .line 388
    .local v0, "inner":F
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    if-eqz v1, :cond_b1

    .line 389
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mNeedToResetWave:Z

    if-eqz v1, :cond_5b

    .line 390
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    div-float v2, v0, v6

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->makePointCloud(FLandroid/graphics/RectF;)V

    .line 392
    :cond_5b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    iget-object v2, v1, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mTiltShiftDrawMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Radial:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    if-ne v1, v3, :cond_b2

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;->Circle:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    :goto_67
    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setType(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;)V

    .line 393
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setAlpha(F)V

    .line 394
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->setCenter(FF)V

    .line 395
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentAngle:F

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->setRotation(F)V

    .line 397
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    if-eqz v1, :cond_b1

    .line 398
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->cancel()V

    .line 399
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    div-float v4, v0, v6

    aput v4, v2, v3

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->getOuterRadius()F

    move-result v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->getBandDistance()F

    move-result v4

    mul-float/2addr v4, v6

    add-float/2addr v3, v4

    aput v3, v2, v7

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setFloatValues([F)V

    .line 400
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->start()V

    .line 404
    .end local v0    # "inner":F
    :cond_b1
    return-void

    .line 392
    .restart local v0    # "inner":F
    :cond_b2
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;->Line:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    goto :goto_67
.end method

.method private onTouchDown()V
    .registers 1

    .prologue
    .line 528
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->fadeInShape()V

    .line 529
    return-void
.end method

.method private onTouchMove(Landroid/graphics/PointF;FFZ)V
    .registers 19
    .param p1, "center"    # Landroid/graphics/PointF;
    .param p2, "distance"    # F
    .param p3, "angle"    # F
    .param p4, "firstTime"    # Z

    .prologue
    .line 533
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    if-nez v1, :cond_5

    .line 650
    :cond_4
    :goto_4
    return-void

    .line 537
    :cond_5
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 539
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterMatrix:Landroid/graphics/Matrix;

    iget v3, p1, Landroid/graphics/PointF;->x:F

    iget v4, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 541
    const/high16 v1, 0x40000000

    div-float v13, p2, v1

    .line 543
    .local v13, "radius":F
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mTiltShiftDrawMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Radial:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    if-ne v1, v3, :cond_a0

    .line 545
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingCircle:Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    iget v3, p1, Landroid/graphics/PointF;->x:F

    iget v4, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v3, v4, v13}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->set(FFF)V

    .line 546
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPath:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingCircle:Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->centerX()F

    move-result v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingCircle:Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->centerY()F

    move-result v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingCircle:Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;->getRadius()F

    move-result v5

    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 549
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRect:Landroid/graphics/RectF;

    iget v3, p1, Landroid/graphics/PointF;->x:F

    const/high16 v4, 0x40200000

    mul-float/2addr v4, v13

    sub-float/2addr v3, v4

    iget v4, p1, Landroid/graphics/PointF;->y:F

    const/high16 v5, 0x40200000

    mul-float/2addr v5, v13

    sub-float/2addr v4, v5

    iget v5, p1, Landroid/graphics/PointF;->x:F

    const/high16 v6, 0x40200000

    mul-float/2addr v6, v13

    add-float/2addr v5, v6

    iget v6, p1, Landroid/graphics/PointF;->y:F

    const/high16 v7, 0x40200000

    mul-float/2addr v7, v13

    add-float/2addr v6, v7

    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 622
    :cond_5c
    :goto_5c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;

    if-eqz v1, :cond_4

    .line 623
    const/4 v1, 0x2

    new-array v2, v1, [F

    .line 624
    .local v2, "mappedPoints":[F
    const/4 v1, 0x0

    iget v3, p1, Landroid/graphics/PointF;->x:F

    aput v3, v2, v1

    .line 625
    const/4 v1, 0x1

    iget v3, p1, Landroid/graphics/PointF;->y:F

    aput v3, v2, v1

    .line 626
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 627
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInvertedMatrix:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRectInverted:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 629
    if-eqz p4, :cond_224

    .line 630
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mTiltShiftDrawMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentScale:F

    div-float v4, v13, v4

    move/from16 v0, p3

    neg-float v5, v0

    const/high16 v6, 0x42b40000

    sub-float/2addr v5, v6

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRectInverted:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRectInverted:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRectInverted:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->right:F

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRectInverted:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    invoke-interface/range {v1 .. v9}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;->onDrawStart([FLcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;FFFFFF)V

    goto/16 :goto_4

    .line 555
    .end local v2    # "mappedPoints":[F
    :cond_a0
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mTiltShiftDrawMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Linear:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    if-ne v1, v3, :cond_5c

    .line 557
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingMatrix:Landroid/graphics/Matrix;

    iget v3, p1, Landroid/graphics/PointF;->x:F

    iget v4, p1, Landroid/graphics/PointF;->y:F

    move/from16 v0, p3

    invoke-virtual {v1, v0, v3, v4}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 559
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    iget v3, p1, Landroid/graphics/PointF;->x:F

    sub-float/2addr v3, v13

    iget v4, p1, Landroid/graphics/PointF;->y:F

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRectLength:F

    const/high16 v6, 0x40000000

    div-float/2addr v5, v6

    sub-float/2addr v4, v5

    iget v5, p1, Landroid/graphics/PointF;->x:F

    add-float/2addr v5, v13

    iget v6, p1, Landroid/graphics/PointF;->y:F

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRectLength:F

    const/high16 v8, 0x40000000

    div-float/2addr v7, v8

    add-float/2addr v6, v7

    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 564
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->sort()V

    .line 566
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    aput v4, v1, v3

    .line 567
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    aput v4, v1, v3

    .line 568
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    aput v4, v1, v3

    .line 569
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v3, 0x3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    aput v4, v1, v3

    .line 570
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v3, 0x4

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    aput v4, v1, v3

    .line 571
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v3, 0x5

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    aput v4, v1, v3

    .line 572
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v3, 0x6

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    aput v4, v1, v3

    .line 573
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v3, 0x7

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    aput v4, v1, v3

    .line 575
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingMatrix:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    invoke-virtual {v1, v3}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 577
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->firstLine:Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->reset()V

    .line 578
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->secondLine:Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->reset()V

    .line 579
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->firstLine:Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v4, 0x0

    aget v3, v3, v4

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v5, 0x1

    aget v4, v4, v5

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v6, 0x2

    aget v5, v5, v6

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v7, 0x3

    aget v6, v6, v7

    invoke-virtual {v1, v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->set(FFFF)V

    .line 580
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->secondLine:Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v4, 0x4

    aget v3, v3, v4

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v5, 0x5

    aget v4, v4, v5

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v6, 0x6

    aget v5, v5, v6

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPoints:[F

    const/4 v7, 0x7

    aget v6, v6, v7

    invoke-virtual {v1, v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->set(FFFF)V

    .line 582
    const/4 v11, 0x0

    .line 585
    .local v11, "r1":Landroid/graphics/RectF;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->firstLine:Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mThisRectF:Landroid/graphics/RectF;

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->intersect(Landroid/graphics/RectF;)[Landroid/graphics/PointF;

    move-result-object v10

    .line 586
    .local v10, "intersection":[Landroid/graphics/PointF;
    if-eqz v10, :cond_1a5

    array-length v1, v10

    const/4 v3, 0x2

    if-ne v1, v3, :cond_1a5

    .line 587
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPath:Landroid/graphics/Path;

    const/4 v3, 0x0

    aget-object v3, v10, v3

    iget v3, v3, Landroid/graphics/PointF;->x:F

    const/4 v4, 0x0

    aget-object v4, v10, v4

    iget v4, v4, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 588
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPath:Landroid/graphics/Path;

    const/4 v3, 0x1

    aget-object v3, v10, v3

    iget v3, v3, Landroid/graphics/PointF;->x:F

    const/4 v4, 0x1

    aget-object v4, v10, v4

    iget v4, v4, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 590
    new-instance v11, Landroid/graphics/RectF;

    .end local v11    # "r1":Landroid/graphics/RectF;
    const/4 v1, 0x0

    aget-object v1, v10, v1

    iget v1, v1, Landroid/graphics/PointF;->x:F

    const/4 v3, 0x0

    aget-object v3, v10, v3

    iget v3, v3, Landroid/graphics/PointF;->y:F

    const/4 v4, 0x1

    aget-object v4, v10, v4

    iget v4, v4, Landroid/graphics/PointF;->x:F

    const/4 v5, 0x1

    aget-object v5, v10, v5

    iget v5, v5, Landroid/graphics/PointF;->y:F

    invoke-direct {v11, v1, v3, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 591
    .restart local v11    # "r1":Landroid/graphics/RectF;
    invoke-virtual {v11}, Landroid/graphics/RectF;->sort()V

    .line 594
    :cond_1a5
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->secondLine:Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mThisRectF:Landroid/graphics/RectF;

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/LineF;->intersect(Landroid/graphics/RectF;)[Landroid/graphics/PointF;

    move-result-object v10

    .line 595
    if-eqz v10, :cond_203

    array-length v1, v10

    const/4 v3, 0x2

    if-ne v1, v3, :cond_203

    .line 596
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPath:Landroid/graphics/Path;

    const/4 v3, 0x0

    aget-object v3, v10, v3

    iget v3, v3, Landroid/graphics/PointF;->x:F

    const/4 v4, 0x0

    aget-object v4, v10, v4

    iget v4, v4, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 597
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPath:Landroid/graphics/Path;

    const/4 v3, 0x1

    aget-object v3, v10, v3

    iget v3, v3, Landroid/graphics/PointF;->x:F

    const/4 v4, 0x1

    aget-object v4, v10, v4

    iget v4, v4, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 599
    new-instance v12, Landroid/graphics/RectF;

    const/4 v1, 0x0

    aget-object v1, v10, v1

    iget v1, v1, Landroid/graphics/PointF;->x:F

    const/4 v3, 0x0

    aget-object v3, v10, v3

    iget v3, v3, Landroid/graphics/PointF;->y:F

    const/4 v4, 0x1

    aget-object v4, v10, v4

    iget v4, v4, Landroid/graphics/PointF;->x:F

    const/4 v5, 0x1

    aget-object v5, v10, v5

    iget v5, v5, Landroid/graphics/PointF;->y:F

    invoke-direct {v12, v1, v3, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 600
    .local v12, "r2":Landroid/graphics/RectF;
    invoke-virtual {v12}, Landroid/graphics/RectF;->sort()V

    .line 602
    if-eqz v11, :cond_219

    .line 603
    invoke-virtual {v11}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_215

    .line 604
    iget v1, v11, Landroid/graphics/RectF;->left:F

    iget v3, v11, Landroid/graphics/RectF;->top:F

    iget v4, v12, Landroid/graphics/RectF;->right:F

    iget v5, v12, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v11, v1, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 605
    invoke-virtual {v11}, Landroid/graphics/RectF;->sort()V

    .line 614
    .end local v12    # "r2":Landroid/graphics/RectF;
    :cond_203
    :goto_203
    if-eqz v11, :cond_21b

    .line 615
    const/high16 v1, 0x40200000

    mul-float/2addr v1, v13

    const/high16 v3, 0x40200000

    mul-float/2addr v3, v13

    invoke-static {v11, v1, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->grow(Landroid/graphics/RectF;FF)V

    .line 616
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v11}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    goto/16 :goto_5c

    .line 607
    .restart local v12    # "r2":Landroid/graphics/RectF;
    :cond_215
    invoke-virtual {v11, v12}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    goto :goto_203

    .line 610
    :cond_219
    move-object v11, v12

    goto :goto_203

    .line 618
    .end local v12    # "r2":Landroid/graphics/RectF;
    :cond_21b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    goto/16 :goto_5c

    .line 640
    .end local v10    # "intersection":[Landroid/graphics/PointF;
    .end local v11    # "r1":Landroid/graphics/RectF;
    .restart local v2    # "mappedPoints":[F
    :cond_224
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentScale:F

    div-float v3, v13, v3

    move/from16 v0, p3

    neg-float v4, v0

    const/high16 v5, 0x42b40000

    sub-float/2addr v4, v5

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRectInverted:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRectInverted:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRectInverted:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->right:F

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRectInverted:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->bottom:F

    invoke-interface/range {v1 .. v8}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;->onDrawing([FFFFFFF)V

    goto/16 :goto_4
.end method

.method private onTouchUp()V
    .registers 3

    .prologue
    .line 653
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeOutTimeout:I

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->fadeOutShape(J)V

    .line 655
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;

    if-eqz v0, :cond_f

    .line 656
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;->onDrawEnd()V

    .line 658
    :cond_f
    return-void
.end method

.method private resetWave()V
    .registers 2

    .prologue
    .line 436
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mNeedToResetWave:Z

    .line 437
    return-void
.end method

.method private updateBitmapRect()V
    .registers 29

    .prologue
    .line 452
    new-instance v8, Landroid/graphics/Matrix;

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-direct {v8, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 453
    .local v8, "m1":Landroid/graphics/Matrix;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInvertedMatrix:Landroid/graphics/Matrix;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/Matrix;->reset()V

    .line 455
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->getMatrixValues(Landroid/graphics/Matrix;)[F

    move-result-object v20

    .line 456
    .local v20, "v1":[F
    invoke-virtual {v8, v8}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 457
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->getMatrixValues(Landroid/graphics/Matrix;)[F

    move-result-object v21

    .line 459
    .local v21, "v2":[F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInvertedMatrix:Landroid/graphics/Matrix;

    move-object/from16 v22, v0

    const/16 v23, 0x2

    aget v23, v20, v23

    move/from16 v0, v23

    neg-float v0, v0

    move/from16 v23, v0

    const/16 v24, 0x5

    aget v24, v20, v24

    move/from16 v0, v24

    neg-float v0, v0

    move/from16 v24, v0

    invoke-virtual/range {v22 .. v24}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 460
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInvertedMatrix:Landroid/graphics/Matrix;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aget v23, v21, v23

    const/16 v24, 0x4

    aget v24, v21, v24

    invoke-virtual/range {v22 .. v24}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 461
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->getScale()F

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentScale:F

    .line 464
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v13

    .line 466
    .local v13, "rect":Landroid/graphics/RectF;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    if-nez v22, :cond_63

    if-nez v13, :cond_79

    :cond_63
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    if-eqz v22, :cond_21b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_21b

    :cond_79
    const/4 v14, 0x1

    .line 468
    .local v14, "rectChanged":Z
    :goto_7a
    if-eqz v13, :cond_221

    .line 470
    const/4 v15, 0x0

    .line 472
    .local v15, "update":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    if-eqz v22, :cond_159

    .line 473
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->hypotenuse(Landroid/graphics/RectF;)D

    move-result-wide v16

    .line 474
    .local v16, "size1":D
    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->hypotenuse(Landroid/graphics/RectF;)D

    move-result-wide v18

    .line 476
    .local v18, "size2":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v10, v0, Landroid/graphics/RectF;->left:F

    .line 477
    .local v10, "oldLeft":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v11, v0, Landroid/graphics/RectF;->top:F

    .line 479
    .local v11, "oldTop":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/RectF;->width()F

    move-result v12

    .line 480
    .local v12, "oldWidth":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/RectF;->height()F

    move-result v9

    .line 482
    .local v9, "oldHeight":F
    invoke-virtual {v13}, Landroid/graphics/RectF;->width()F

    move-result v22

    div-float v7, v22, v12

    .line 483
    .local v7, "diffW":F
    invoke-virtual {v13}, Landroid/graphics/RectF;->height()F

    move-result v22

    div-float v6, v22, v9

    .line 485
    .local v6, "diffH":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_21e

    const/4 v15, 0x1

    .line 487
    :goto_d6
    if-eqz v15, :cond_159

    .line 489
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    move/from16 v22, v0

    move/from16 v0, v22

    float-to-double v0, v0

    move-wide/from16 v22, v0

    div-double v24, v18, v16

    mul-double v22, v22, v24

    move-wide/from16 v0, v22

    double-to-float v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    .line 490
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    neg-float v0, v10

    move/from16 v23, v0

    neg-float v0, v11

    move/from16 v24, v0

    invoke-virtual/range {v22 .. v24}, Landroid/graphics/PointF;->offset(FF)V

    .line 491
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v23, v0

    mul-float v23, v23, v7

    move/from16 v0, v23

    move-object/from16 v1, v22

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 492
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v23, v0

    mul-float v23, v23, v6

    move/from16 v0, v23

    move-object/from16 v1, v22

    iput v0, v1, Landroid/graphics/PointF;->y:F

    .line 493
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v23, v0

    iget v0, v13, Landroid/graphics/RectF;->left:F

    move/from16 v24, v0

    add-float v23, v23, v24

    move/from16 v0, v23

    move-object/from16 v1, v22

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 494
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v23, v0

    iget v0, v13, Landroid/graphics/RectF;->top:F

    move/from16 v24, v0

    add-float v23, v23, v24

    move/from16 v0, v23

    move-object/from16 v1, v22

    iput v0, v1, Landroid/graphics/PointF;->y:F

    .line 498
    .end local v6    # "diffH":F
    .end local v7    # "diffW":F
    .end local v9    # "oldHeight":F
    .end local v10    # "oldLeft":F
    .end local v11    # "oldTop":F
    .end local v12    # "oldWidth":F
    .end local v16    # "size1":D
    .end local v18    # "size2":D
    :cond_159
    new-instance v22, Landroid/graphics/RectF;

    move-object/from16 v0, v22

    invoke-direct {v0, v13}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    .line 500
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/RectF;->width()F

    move-result v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/graphics/RectF;->height()F

    move-result v23

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->max(FF)F

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRectSideLength:F

    .line 502
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/RectF;->width()F

    move-result v22

    move/from16 v0, v22

    float-to-double v0, v0

    move-wide/from16 v22, v0

    const-wide/high16 v24, 0x4000000000000000L

    invoke-static/range {v22 .. v25}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/graphics/RectF;->height()F

    move-result v24

    move/from16 v0, v24

    float-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide/high16 v26, 0x4000000000000000L

    invoke-static/range {v24 .. v27}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v24

    add-double v22, v22, v24

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v22

    move-wide/from16 v0, v22

    double-to-float v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRectLength:F

    .line 503
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRectSideLength:F

    move/from16 v22, v0

    const/high16 v23, 0x447a0000

    mul-float v22, v22, v23

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRectLength:F

    .line 505
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRectSideLength:F

    move/from16 v22, v0

    const/high16 v23, 0x42c80000

    div-float v22, v22, v23

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMinShapeSize:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v23, v0

    mul-float v22, v22, v23

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMinShapeSizePixels:F

    .line 507
    if-eqz v15, :cond_215

    .line 508
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchDown()V

    .line 509
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentAngle:F

    move/from16 v24, v0

    const/16 v25, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchMove(Landroid/graphics/PointF;FFZ)V

    .line 510
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchUp()V

    .line 516
    .end local v15    # "update":Z
    :cond_215
    :goto_215
    if-eqz v14, :cond_21a

    .line 517
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->resetWave()V

    .line 519
    :cond_21a
    return-void

    .line 466
    .end local v14    # "rectChanged":Z
    :cond_21b
    const/4 v14, 0x0

    goto/16 :goto_7a

    .line 485
    .restart local v6    # "diffH":F
    .restart local v7    # "diffW":F
    .restart local v9    # "oldHeight":F
    .restart local v10    # "oldLeft":F
    .restart local v11    # "oldTop":F
    .restart local v12    # "oldWidth":F
    .restart local v14    # "rectChanged":Z
    .restart local v15    # "update":Z
    .restart local v16    # "size1":D
    .restart local v18    # "size2":D
    :cond_21e
    const/4 v15, 0x0

    goto/16 :goto_d6

    .line 513
    .end local v6    # "diffH":F
    .end local v7    # "diffW":F
    .end local v9    # "oldHeight":F
    .end local v10    # "oldLeft":F
    .end local v11    # "oldTop":F
    .end local v12    # "oldWidth":F
    .end local v15    # "update":Z
    .end local v16    # "size1":D
    .end local v18    # "size2":D
    :cond_221
    const/16 v22, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    goto :goto_215
.end method


# virtual methods
.method protected fadeInShape()V
    .registers 2

    .prologue
    .line 664
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    if-eqz v0, :cond_10

    .line 665
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/AnimatorSet;->cancel()V

    .line 666
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlphaDefault:I

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlpha:I

    .line 667
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->postInvalidate()V

    .line 669
    :cond_10
    return-void
.end method

.method protected fadeOutShape(J)V
    .registers 10
    .param p1, "timeout"    # J

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 675
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    if-eqz v1, :cond_41

    .line 676
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/AnimatorSet;->cancel()V

    .line 681
    :goto_b
    const-string v1, "paintAlpha"

    const/4 v2, 0x2

    new-array v2, v2, [I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlpha:I

    aput v3, v2, v4

    aput v4, v2, v5

    invoke-static {p0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 683
    .local v0, "anim1":Lcom/nineoldandroids/animation/ObjectAnimator;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    new-array v2, v5, [Lcom/nineoldandroids/animation/Animator;

    aput-object v0, v2, v4

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->playTogether([Lcom/nineoldandroids/animation/Animator;)V

    .line 684
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeOutDuration:J

    invoke-virtual {v1, v2, v3}, Lcom/nineoldandroids/animation/AnimatorSet;->setDuration(J)Lcom/nineoldandroids/animation/AnimatorSet;

    .line 685
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-virtual {v1, p1, p2}, Lcom/nineoldandroids/animation/AnimatorSet;->setStartDelay(J)V

    .line 686
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->OUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;-><init>(Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;)V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 687
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/AnimatorSet;->start()V

    .line 688
    return-void

    .line 678
    .end local v0    # "anim1":Lcom/nineoldandroids/animation/ObjectAnimator;
    :cond_41
    new-instance v1, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v1}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    goto :goto_b
.end method

.method public getImageRect()Landroid/graphics/RectF;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 749
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1f

    .line 750
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 752
    :goto_1e
    return-object v0

    :cond_1f
    const/4 v0, 0x0

    goto :goto_1e
.end method

.method public getPaintAlpha()I
    .registers 2

    .prologue
    .line 789
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlpha:I

    return v0
.end method

.method public getTiltShiftDrawMode()Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;
    .registers 2

    .prologue
    .line 704
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mTiltShiftDrawMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    return-object v0
.end method

.method public hasOverlappingRendering()Z
    .registers 2

    .prologue
    .line 218
    const/4 v0, 0x0

    return v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 27
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 117
    invoke-super/range {p0 .. p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 119
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v18

    .line 120
    .local v18, "theme":Landroid/content/res/Resources$Theme;
    sget-object v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView:[I

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    move/from16 v3, p3

    move/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v6

    .line 122
    .local v6, "a":Landroid/content/res/TypedArray;
    sget v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView_adobe_timeout:I

    const/16 v20, 0x3e8

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    .line 123
    .local v9, "fadeTimeout":I
    sget v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView_android_animationDuration:I

    const/16 v20, 0xc8

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v8

    .line 124
    .local v8, "fadeDuration":I
    sget v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView_adobe_strokeColor:I

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v16

    .line 125
    .local v16, "strokeColor":I
    sget v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView_adobe_strokeSize:I

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v17

    .line 126
    .local v17, "strokeWidth":I
    sget v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView_adobe_wave_pointDrawable:I

    move/from16 v0, v19

    invoke-virtual {v6, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v13

    .line 127
    .local v13, "pointDrawable":Landroid/graphics/drawable/Drawable;
    sget v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView_adobe_shape_maxSize:I

    const/16 v20, 0x64

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v11

    .line 128
    .local v11, "maxSize":I
    sget v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView_adobe_shape_minSize:I

    const/16 v20, 0xa

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v12

    .line 130
    .local v12, "minSize":I
    sget v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView_adobe_shape_defaultSize:I

    const/16 v20, 0x1

    const/16 v21, 0x1

    const/high16 v22, 0x3e800000

    move/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-virtual {v6, v0, v1, v2, v3}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v7

    .line 133
    .local v7, "defaultSize":F
    sget v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView_adobe_wave_animationDuration:I

    const/16 v20, 0x7d0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v15

    .line 134
    .local v15, "pointWaveDuration":I
    sget v19, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageTiltShiftImageView_adobe_wave_animationDelay:I

    const/16 v20, 0xc8

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v14

    .line 135
    .local v14, "pointWaveDelay":I
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    .line 137
    move-object/from16 v0, p0

    iput v12, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMinShapeSize:I

    .line 138
    move-object/from16 v0, p0

    iput v11, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMaxShapeSize:I

    .line 139
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mNeedToResetWave:Z

    .line 141
    move-object/from16 v0, p0

    iput v7, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDefaultShapeSize:F

    .line 143
    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mForeColor:I

    .line 145
    new-instance v19, Landroid/graphics/Paint;

    const/16 v20, 0x1

    invoke-direct/range {v19 .. v20}, Landroid/graphics/Paint;-><init>(I)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    .line 146
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 147
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-virtual/range {v19 .. v20}, Landroid/graphics/Paint;->setDither(Z)V

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mForeColor:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Landroid/graphics/Paint;->setColor(I)V

    .line 149
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlphaDefault:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 150
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    sget-object v20, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual/range {v19 .. v20}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 151
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 153
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setFadeoutTimeout(I)V

    .line 154
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setFadeoutDuration(I)V

    .line 156
    new-instance v19, Landroid/graphics/Path;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/Path;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPath:Landroid/graphics/Path;

    .line 158
    new-instance v19, Landroid/graphics/RectF;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/RectF;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingRect:Landroid/graphics/RectF;

    .line 159
    new-instance v19, Landroid/graphics/Matrix;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/Matrix;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingMatrix:Landroid/graphics/Matrix;

    .line 160
    new-instance v19, Landroid/graphics/Matrix;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/Matrix;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterMatrix:Landroid/graphics/Matrix;

    .line 162
    new-instance v19, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    invoke-direct/range {v19 .. v19}, Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawingCircle:Lcom/adobe/creativesdk/aviary/internal/graphics/CircleF;

    .line 164
    new-instance v19, Landroid/graphics/PointF;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/PointF;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    .line 165
    new-instance v19, Landroid/graphics/RectF;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/RectF;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRect:Landroid/graphics/RectF;

    .line 166
    new-instance v19, Landroid/graphics/RectF;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/RectF;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mThisRectF:Landroid/graphics/RectF;

    .line 167
    new-instance v19, Landroid/graphics/RectF;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/RectF;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mShapeRectInverted:Landroid/graphics/RectF;

    .line 168
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInitializedTouch:Z

    .line 170
    if-eqz v13, :cond_190

    .line 171
    new-instance v19, Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-object/from16 v0, v19

    invoke-direct {v0, v13}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;-><init>(Landroid/graphics/drawable/Drawable;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    .line 174
    :cond_190
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->getLayerType()I

    move-result v10

    .line 175
    .local v10, "layerType":I
    const/16 v19, 0x2

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setLayerType(ILandroid/graphics/Paint;)V

    .line 177
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    move-object/from16 v19, v0

    const-string v20, "radius"

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [F

    move-object/from16 v21, v0

    fill-array-data v21, :array_210

    invoke-static/range {v19 .. v21}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 178
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    move-object/from16 v19, v0

    int-to-long v0, v15

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Lcom/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 179
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    move-object/from16 v19, v0

    int-to-long v0, v14

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Lcom/nineoldandroids/animation/ObjectAnimator;->setStartDelay(J)V

    .line 180
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    move-object/from16 v19, v0

    new-instance v20, Landroid/view/animation/LinearInterpolator;

    invoke-direct/range {v20 .. v20}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual/range {v19 .. v20}, Lcom/nineoldandroids/animation/ObjectAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 181
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    move-object/from16 v19, v0

    new-instance v20, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$1;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;)V

    invoke-virtual/range {v19 .. v20}, Lcom/nineoldandroids/animation/ObjectAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 188
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    move-object/from16 v19, v0

    new-instance v20, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v10}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;-><init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;I)V

    invoke-virtual/range {v19 .. v20}, Lcom/nineoldandroids/animation/ObjectAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 214
    return-void

    .line 177
    nop

    :array_210
    .array-data 4
        0x0
        0x42c80000
    .end array-data
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 758
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDraw(Landroid/graphics/Canvas;)V

    .line 760
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    if-nez v0, :cond_8

    .line 774
    :cond_7
    :goto_7
    return-void

    .line 764
    :cond_8
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mTiltShiftDrawMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->None:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    if-eq v0, v1, :cond_7

    .line 765
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mForeColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 766
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 767
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 770
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    if-eqz v0, :cond_7

    .line 771
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->draw(Landroid/graphics/Canvas;)V

    goto :goto_7
.end method

.method protected onDrawModeChanged()V
    .registers 8

    .prologue
    const/4 v4, 0x0

    const/high16 v5, 0x40000000

    .line 717
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInitializedTouch:Z

    .line 718
    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    .line 719
    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    .line 722
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchUp()V

    .line 725
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->updateBitmapRect()V

    .line 727
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    if-eqz v3, :cond_4e

    .line 729
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    .line 730
    .local v1, "x":F
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    .line 731
    .local v2, "y":F
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDefaultShapeSize:F

    mul-float v0, v3, v4

    .line 733
    .local v0, "size":F
    div-float v3, v0, v5

    sub-float v3, v2, v3

    div-float v4, v0, v5

    add-float/2addr v4, v2

    invoke-direct {p0, v1, v3, v1, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->initializeTouch(FFFF)V

    .line 736
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchDown()V

    .line 739
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentAngle:F

    const/4 v6, 0x1

    invoke-direct {p0, v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchMove(Landroid/graphics/PointF;FFZ)V

    .line 742
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchUp()V

    .line 745
    .end local v0    # "size":F
    .end local v1    # "x":F
    .end local v2    # "y":F
    :cond_4e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->invalidate()V

    .line 746
    return-void
.end method

.method protected onImageMatrixChanged()V
    .registers 1

    .prologue
    .line 778
    invoke-super {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onImageMatrixChanged()V

    .line 779
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->updateBitmapRect()V

    .line 780
    return-void
.end method

.method protected onSetAlpha(I)Z
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 223
    const/4 v0, 0x1

    return v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 9
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/4 v3, 0x0

    .line 784
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onSizeChanged(IIII)V

    .line 785
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mThisRectF:Landroid/graphics/RectF;

    int-to-float v1, p1

    int-to-float v2, p2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 786
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 29
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 238
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    .line 239
    .local v6, "action":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v15

    .line 244
    .local v15, "pointerCount":I
    and-int/lit16 v0, v6, 0xff

    move/from16 v22, v0

    packed-switch v22, :pswitch_data_38c

    .line 369
    :cond_f
    :goto_f
    :pswitch_f
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->invalidate()V

    .line 370
    const/16 v22, 0x1

    return v22

    .line 249
    :pswitch_15
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchDown()V

    .line 251
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v18

    .line 252
    .local v18, "x":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v20

    .line 254
    .local v20, "y":F
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerIndex:I

    .line 255
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerIndex:I

    move/from16 v22, v0

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerId:I

    .line 257
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    if-nez v22, :cond_a4

    .line 258
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMinShapeSizePixels:F

    move/from16 v22, v0

    const/high16 v23, 0x40000000

    div-float v22, v22, v23

    sub-float v22, v18, v22

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMinShapeSizePixels:F

    move/from16 v23, v0

    const/high16 v24, 0x40000000

    div-float v23, v23, v24

    sub-float v23, v20, v23

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMinShapeSizePixels:F

    move/from16 v24, v0

    const/high16 v25, 0x40000000

    div-float v24, v24, v25

    add-float v24, v24, v18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMinShapeSizePixels:F

    move/from16 v25, v0

    const/high16 v26, 0x40000000

    div-float v25, v25, v26

    add-float v25, v25, v20

    move-object/from16 v0, p0

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->initializeTouch(FFFF)V

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentAngle:F

    move/from16 v24, v0

    const/16 v25, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchMove(Landroid/graphics/PointF;FFZ)V

    goto/16 :goto_f

    .line 265
    :cond_a4
    new-instance v22, Landroid/graphics/PointF;

    move-object/from16 v0, v22

    move/from16 v1, v18

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    .line 266
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentAngle:F

    move/from16 v24, v0

    const/16 v25, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchMove(Landroid/graphics/PointF;FFZ)V

    goto/16 :goto_f

    .line 272
    .end local v18    # "x":F
    .end local v20    # "y":F
    :pswitch_d8
    const/16 v22, 0x1

    move/from16 v0, v22

    if-le v15, v0, :cond_f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInitializedTouch:Z

    move/from16 v22, v0

    if-eqz v22, :cond_f

    .line 274
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerIndex:I

    move/from16 v22, v0

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v18

    .line 275
    .restart local v18    # "x":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerIndex:I

    move/from16 v22, v0

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v20

    .line 277
    .restart local v20    # "y":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerIndex:I

    move/from16 v22, v0

    if-nez v22, :cond_1aa

    const/16 v22, 0x1

    :goto_10c
    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v19

    .line 278
    .local v19, "x1":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerIndex:I

    move/from16 v22, v0

    if-nez v22, :cond_1ae

    const/16 v22, 0x1

    :goto_11e
    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v21

    .line 280
    .local v21, "y1":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move/from16 v1, v18

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 281
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move/from16 v1, v19

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 283
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->distance(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    move-result-wide v22

    move-wide/from16 v0, v22

    double-to-float v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldDistance:F

    .line 284
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angleBetweenPoints(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    move-result-wide v22

    move-wide/from16 v0, v22

    neg-double v0, v0

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    double-to-float v0, v0

    move/from16 v22, v0

    const/high16 v23, 0x43340000

    add-float v22, v22, v23

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldAngle:F

    .line 285
    new-instance v22, Landroid/graphics/PointF;

    invoke-direct/range {v22 .. v22}, Landroid/graphics/PointF;-><init>()V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldCenter:Landroid/graphics/PointF;

    .line 287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v23, v0

    const/high16 v24, 0x3f000000

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldCenter:Landroid/graphics/PointF;

    move-object/from16 v25, v0

    invoke-static/range {v22 .. v25}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->getLerp(Landroid/graphics/PointF;Landroid/graphics/PointF;FLandroid/graphics/PointF;)V

    .line 288
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->invalidate()V

    goto/16 :goto_f

    .line 277
    .end local v19    # "x1":F
    .end local v21    # "y1":F
    :cond_1aa
    const/16 v22, 0x0

    goto/16 :goto_10c

    .line 278
    .restart local v19    # "x1":F
    :cond_1ae
    const/16 v22, 0x0

    goto/16 :goto_11e

    .line 295
    .end local v18    # "x":F
    .end local v19    # "x1":F
    .end local v20    # "y":F
    :pswitch_1b2
    const v22, 0xff00

    and-int v22, v22, v6

    shr-int/lit8 v17, v22, 0x8

    .line 296
    .local v17, "pointerIndex":I
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v16

    .line 298
    .local v16, "pointerId":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerId:I

    move/from16 v22, v0

    move/from16 v0, v16

    move/from16 v1, v22

    if-ne v0, v1, :cond_f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInitializedTouch:Z

    move/from16 v22, v0

    if-eqz v22, :cond_f

    .line 301
    if-nez v17, :cond_205

    const/4 v14, 0x1

    .line 302
    .local v14, "newPointerIndex":I
    :goto_1d8
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getX(I)F

    move-result v18

    .line 303
    .restart local v18    # "x":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getY(I)F

    move-result v20

    .line 304
    .restart local v20    # "y":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerId:I

    .line 305
    move-object/from16 v0, p0

    iput v14, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerIndex:I

    .line 307
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move/from16 v1, v18

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    goto/16 :goto_f

    .line 301
    .end local v14    # "newPointerIndex":I
    .end local v18    # "x":F
    .end local v20    # "y":F
    :cond_205
    const/4 v14, 0x0

    goto :goto_1d8

    .line 312
    .end local v16    # "pointerId":I
    .end local v17    # "pointerIndex":I
    :pswitch_207
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerId:I

    move/from16 v22, v0

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v17

    .line 314
    .restart local v17    # "pointerIndex":I
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v18

    .line 315
    .restart local v18    # "x":F
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v20

    .line 317
    .restart local v20    # "y":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v22, v0

    sub-float v12, v18, v22

    .line 318
    .local v12, "dx":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v22, v0

    sub-float v13, v20, v22

    .line 319
    .local v13, "dy":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move/from16 v1, v18

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 321
    const/16 v22, 0x1

    move/from16 v0, v22

    if-le v15, v0, :cond_372

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mInitializedTouch:Z

    move/from16 v22, v0

    if-eqz v22, :cond_372

    .line 322
    if-nez v17, :cond_36f

    const/4 v14, 0x1

    .line 323
    .restart local v14    # "newPointerIndex":I
    :goto_261
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getX(I)F

    move-result v19

    .line 324
    .restart local v19    # "x1":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/MotionEvent;->getY(I)F

    move-result v21

    .line 329
    .restart local v21    # "y1":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move/from16 v1, v19

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 332
    new-instance v9, Landroid/graphics/PointF;

    invoke-direct {v9}, Landroid/graphics/PointF;-><init>()V

    .line 333
    .local v9, "center":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v23, v0

    const/high16 v24, 0x3f000000

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-static {v0, v1, v2, v9}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->getLerp(Landroid/graphics/PointF;Landroid/graphics/PointF;FLandroid/graphics/PointF;)V

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->distance(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    move-result-wide v22

    move-wide/from16 v0, v22

    double-to-float v10, v0

    .line 336
    .local v10, "dist":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFirstPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mSecondPointOriginal:Landroid/graphics/PointF;

    move-object/from16 v23, v0

    invoke-static/range {v22 .. v23}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angleBetweenPoints(Landroid/graphics/PointF;Landroid/graphics/PointF;)D

    move-result-wide v22

    move-wide/from16 v0, v22

    neg-double v0, v0

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    double-to-float v0, v0

    move/from16 v22, v0

    const/high16 v23, 0x43340000

    add-float v7, v22, v23

    .line 337
    .local v7, "angle":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldDistance:F

    move/from16 v22, v0

    sub-float v11, v10, v22

    .line 338
    .local v11, "distDiff":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldAngle:F

    move/from16 v22, v0

    sub-float v8, v7, v22

    .line 341
    .local v8, "angleDiff":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mMinShapeSizePixels:F

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    move/from16 v23, v0

    add-float v23, v23, v11

    invoke-static/range {v23 .. v23}, Ljava/lang/Math;->abs(F)F

    move-result v23

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->max(FF)F

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    .line 342
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentAngle:F

    move/from16 v22, v0

    add-float v22, v22, v8

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentAngle:F

    .line 343
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    iget v0, v9, Landroid/graphics/PointF;->x:F

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldCenter:Landroid/graphics/PointF;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v24, v0

    sub-float v23, v23, v24

    iget v0, v9, Landroid/graphics/PointF;->y:F

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldCenter:Landroid/graphics/PointF;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v25, v0

    sub-float v24, v24, v25

    invoke-virtual/range {v22 .. v24}, Landroid/graphics/PointF;->offset(FF)V

    .line 347
    move-object/from16 v0, p0

    iput v10, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldDistance:F

    .line 348
    move-object/from16 v0, p0

    iput v7, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldAngle:F

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mOldCenter:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    iget v0, v9, Landroid/graphics/PointF;->x:F

    move/from16 v23, v0

    iget v0, v9, Landroid/graphics/PointF;->y:F

    move/from16 v24, v0

    invoke-virtual/range {v22 .. v24}, Landroid/graphics/PointF;->set(FF)V

    .line 355
    .end local v7    # "angle":F
    .end local v8    # "angleDiff":F
    .end local v9    # "center":Landroid/graphics/PointF;
    .end local v10    # "dist":F
    .end local v11    # "distDiff":F
    .end local v14    # "newPointerIndex":I
    .end local v19    # "x1":F
    .end local v21    # "y1":F
    :goto_349
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->checkLimits()V

    .line 356
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentDistance:F

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCurrentAngle:F

    move/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchMove(Landroid/graphics/PointF;FFZ)V

    goto/16 :goto_f

    .line 322
    :cond_36f
    const/4 v14, 0x0

    goto/16 :goto_261

    .line 352
    :cond_372
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mCenterPoint:Landroid/graphics/PointF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v12, v13}, Landroid/graphics/PointF;->offset(FF)V

    goto :goto_349

    .line 362
    .end local v12    # "dx":F
    .end local v13    # "dy":F
    .end local v17    # "pointerIndex":I
    .end local v18    # "x":F
    .end local v20    # "y":F
    :pswitch_37e
    const/16 v22, -0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mActivePointerId:I

    .line 363
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onTouchUp()V

    goto/16 :goto_f

    .line 244
    nop

    :pswitch_data_38c
    .packed-switch 0x0
        :pswitch_15
        :pswitch_37e
        :pswitch_207
        :pswitch_37e
        :pswitch_f
        :pswitch_d8
        :pswitch_1b2
    .end packed-switch
.end method

.method public setFadeoutDuration(I)V
    .registers 4
    .param p1, "value"    # I

    .prologue
    .line 231
    int-to-long v0, p1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeOutDuration:J

    .line 232
    return-void
.end method

.method public setFadeoutTimeout(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 227
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mFadeOutTimeout:I

    .line 228
    return-void
.end method

.method public setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;

    .line 113
    return-void
.end method

.method public setPaintAlpha(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 793
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlpha:I

    .line 794
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->postInvalidate()V

    .line 795
    return-void
.end method

.method public setPaintStrokeColor(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 696
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlpha:I

    .line 697
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlpha:I

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaintAlphaDefault:I

    .line 698
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mForeColor:I

    .line 699
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 700
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->postInvalidate()V

    .line 701
    return-void
.end method

.method public setPaintStrokeWidth(I)V
    .registers 4
    .param p1, "value"    # I

    .prologue
    .line 691
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPaint:Landroid/graphics/Paint;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 692
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->postInvalidate()V

    .line 693
    return-void
.end method

.method public setTiltShiftDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;)V
    .registers 3
    .param p1, "mode"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    .prologue
    .line 708
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mTiltShiftDrawMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    .line 710
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 711
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->onDrawModeChanged()V

    .line 713
    :cond_b
    return-void
.end method
