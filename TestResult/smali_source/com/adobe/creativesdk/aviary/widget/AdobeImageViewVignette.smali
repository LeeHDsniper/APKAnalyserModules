.class public Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.source "AdobeImageViewVignette.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;,
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyGestureListener;,
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;,
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;
    }
.end annotation


# static fields
.field private static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private static mFadeoutTime:I

.field private static mTempBitmapScale:I


# instance fields
.field mFadeInAnimator:Lcom/nineoldandroids/animation/Animator;

.field mFadeOutAnimator:Lcom/nineoldandroids/animation/Animator;

.field private mFeather:F

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mIntensity:I

.field private mInvertedMatrix:Landroid/graphics/Matrix;

.field mOuterRadiusAddition:F

.field private final mPaint:Landroid/graphics/Paint;

.field private mPaintAlpha:I

.field private mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

.field mRippleAnimationDelay:I

.field mRippleAnimationDuration:I

.field mShouldRipple:Z

.field private mStrokeColor1:I

.field private mStrokeColor2:I

.field private mStrokeWidth1:F

.field private mStrokeWidth2:F

.field private mTargetAnimationAlpha:I

.field private mTempBitmap:Landroid/graphics/Bitmap;

.field private mTempBitmapFinalRect:Landroid/graphics/RectF;

.field private mTempBitmapRect:Landroid/graphics/Rect;

.field private mTouchState:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

.field private mVignetteListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;

.field private mVignettePaint:Landroid/graphics/Paint;

.field private mVignetteRect:Landroid/graphics/RectF;

.field private final pBitmapRect:Landroid/graphics/RectF;

.field private sControlPointTolerance:F

.field final tempRect:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    const-string v0, "AdobeImageViewVignette"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 45
    const/4 v0, 0x6

    sput v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapScale:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 77
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 80
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->tempRect:Landroid/graphics/RectF;

    .line 47
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    .line 48
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaint:Landroid/graphics/Paint;

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mShouldRipple:Z

    .line 55
    const/high16 v0, 0x3f800000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFeather:F

    .line 56
    const/16 v0, 0x64

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mIntensity:I

    .line 68
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mInvertedMatrix:Landroid/graphics/Matrix;

    .line 71
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapRect:Landroid/graphics/Rect;

    .line 73
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapFinalRect:Landroid/graphics/RectF;

    .line 81
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->initialize(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 82
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Landroid/view/ScaleGestureDetector;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTouchState:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Landroid/graphics/RectF;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setTouchState(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;)V

    return-void
.end method

.method private dispatchVignetteChangeListener(Landroid/graphics/RectF;)V
    .registers 8
    .param p1, "rect"    # Landroid/graphics/RectF;

    .prologue
    .line 406
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_2b

    invoke-virtual {p1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2b

    .line 407
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mInvertedMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapFinalRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 408
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapFinalRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mIntensity:I

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFeather:F

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;->onVignetteChange(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;Landroid/graphics/Bitmap;Landroid/graphics/RectF;IF)V

    .line 410
    :cond_2b
    return-void
.end method

.method private initialize(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x0

    const/high16 v6, 0x3f800000

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 85
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    .line 86
    .local v3, "theme":Landroid/content/res/Resources$Theme;
    sget-object v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette:[I

    invoke-virtual {v3, p2, v4, p3, v8}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 88
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette_adobe_vignette_strokeSize:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeWidth1:F

    .line 89
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette_adobe_vignette_controlPointSize:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    .line 90
    .local v1, "mControlPointSize":F
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeWidth1:F

    const/high16 v5, 0x3fc00000

    mul-float/2addr v4, v5

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeWidth2:F

    .line 91
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette_adobe_vignette_strokeColor1:I

    const/4 v5, -0x1

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeColor1:I

    .line 92
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette_adobe_vignette_strokeColor2:I

    invoke-virtual {v0, v4, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeColor2:I

    .line 93
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette_adobe_vignette_intensity:I

    const/16 v5, 0x64

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mIntensity:I

    .line 94
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette_adobe_vignette_feather:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFeather:F

    .line 95
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette_adobe_vignette_wave_pointDrawable:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 96
    .local v2, "pointDrawable":Landroid/graphics/drawable/Drawable;
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette_adobe_vignette_rippleAnimationDuration:I

    const/16 v5, 0x708

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mRippleAnimationDuration:I

    .line 97
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette_adobe_vignette_animationDelay:I

    const/16 v5, 0x190

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mRippleAnimationDelay:I

    .line 98
    sget v4, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageVignette_adobe_vignette_fadeout_time:I

    const/16 v5, 0x3e8

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    sput v4, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFadeoutTime:I

    .line 99
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_vignette_outer_radius_addition:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mOuterRadiusAddition:F

    .line 100
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4}, Landroid/graphics/Matrix;->reset()V

    .line 102
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeColor2:I

    if-lez v4, :cond_f3

    .line 103
    const/16 v4, 0xff

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaintAlpha:I

    .line 104
    const/16 v4, 0xff

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTargetAnimationAlpha:I

    .line 110
    :goto_89
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 112
    new-instance v4, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->getGestureListener()Landroid/view/GestureDetector$OnGestureListener;

    move-result-object v5

    invoke-direct {v4, p1, v5}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mGestureDetector:Landroid/view/GestureDetector;

    .line 114
    sget-boolean v4, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_19:Z

    if-eqz v4, :cond_a0

    .line 115
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v4, v7}, Landroid/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V

    .line 118
    :cond_a0
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4, v7}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    .line 119
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 120
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    .line 121
    sget-object v4, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->None:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTouchState:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    .line 122
    const/high16 v4, 0x40000000

    mul-float/2addr v4, v1

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->sControlPointTolerance:F

    .line 123
    invoke-virtual {p0, v7}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setHardwareAccelerated(Z)V

    .line 125
    const-string v4, "paintAlpha"

    new-array v5, v10, [F

    aput v9, v5, v8

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTargetAnimationAlpha:I

    int-to-float v6, v6

    aput v6, v5, v7

    invoke-static {p0, v4, v5}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFadeInAnimator:Lcom/nineoldandroids/animation/Animator;

    .line 126
    const-string v4, "paintAlpha"

    new-array v5, v10, [F

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTargetAnimationAlpha:I

    int-to-float v6, v6

    aput v6, v5, v8

    aput v9, v5, v7

    invoke-static {p0, v4, v5}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFadeOutAnimator:Lcom/nineoldandroids/animation/Animator;

    .line 127
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFadeOutAnimator:Lcom/nineoldandroids/animation/Animator;

    sget v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFadeoutTime:I

    int-to-long v6, v5

    invoke-virtual {v4, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setStartDelay(J)V

    .line 128
    new-instance v4, Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    invoke-direct {v4, v2}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    .line 129
    return-void

    .line 106
    :cond_f3
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeColor1:I

    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaintAlpha:I

    .line 107
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaintAlpha:I

    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTargetAnimationAlpha:I

    goto :goto_89
.end method

.method private setTouchState(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;)V
    .registers 6
    .param p1, "newState"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    .prologue
    .line 258
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTouchState:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    if-eq p1, v0, :cond_16

    .line 259
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "setTouchState: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 260
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTouchState:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    .line 261
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->invalidate()V

    .line 263
    :cond_16
    return-void
.end method

.method private updateBitmapRect()V
    .registers 14

    .prologue
    const/4 v7, 0x0

    const v12, 0x3dcccccd

    const/high16 v11, 0x40000000

    .line 266
    sget-object v8, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->None:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    iput-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTouchState:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    .line 268
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    if-nez v8, :cond_1b

    .line 269
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->setEmpty()V

    .line 270
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->setEmpty()V

    .line 318
    :cond_1a
    :goto_1a
    return-void

    .line 274
    :cond_1b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v5

    .line 275
    .local v5, "rect":Landroid/graphics/RectF;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v8, v5}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_d8

    const/4 v6, 0x1

    .line 277
    .local v6, "rectChanged":Z
    :goto_28
    if-eqz v5, :cond_ea

    .line 278
    if-eqz v6, :cond_77

    .line 279
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_db

    .line 281
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    iget v2, v8, Landroid/graphics/RectF;->left:F

    .line 282
    .local v2, "oldLeft":F
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    iget v3, v8, Landroid/graphics/RectF;->top:F

    .line 283
    .local v3, "oldTop":F
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v4

    .line 284
    .local v4, "oldWidth":F
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->height()F

    move-result v1

    .line 286
    .local v1, "oldHeight":F
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v9

    sub-float/2addr v9, v4

    neg-float v9, v9

    div-float/2addr v9, v11

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v10

    sub-float/2addr v10, v1

    neg-float v10, v10

    div-float/2addr v10, v11

    invoke-virtual {v8, v9, v10}, Landroid/graphics/RectF;->inset(FF)V

    .line 287
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    iget v9, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v9, v2

    iget v10, v5, Landroid/graphics/RectF;->top:F

    sub-float/2addr v10, v3

    invoke-virtual {v8, v9, v10}, Landroid/graphics/RectF;->offset(FF)V

    .line 288
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v9

    sub-float/2addr v9, v4

    div-float/2addr v9, v11

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v10

    sub-float/2addr v10, v1

    div-float/2addr v10, v11

    invoke-virtual {v8, v9, v10}, Landroid/graphics/RectF;->offset(FF)V

    .line 294
    .end local v1    # "oldHeight":F
    .end local v2    # "oldLeft":F
    .end local v3    # "oldTop":F
    .end local v4    # "oldWidth":F
    :cond_77
    :goto_77
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v8, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 301
    :goto_7c
    iget-boolean v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mShouldRipple:Z

    if-eqz v8, :cond_93

    .line 302
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    move-result v9

    mul-float/2addr v9, v12

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v10

    mul-float/2addr v10, v12

    invoke-virtual {v8, v9, v10}, Landroid/graphics/RectF;->inset(FF)V

    .line 305
    :cond_93
    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    invoke-direct {v0, v8}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 306
    .local v0, "matrix":Landroid/graphics/Matrix;
    sget v8, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapScale:I

    int-to-float v8, v8

    sget v9, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapScale:I

    int-to-float v9, v9

    invoke-virtual {v0, v8, v9}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 307
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->left:F

    neg-float v8, v8

    sget v9, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapScale:I

    add-int/lit8 v9, v9, -0x1

    int-to-float v9, v9

    mul-float/2addr v8, v9

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    neg-float v9, v9

    sget v10, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapScale:I

    add-int/lit8 v10, v10, -0x1

    int-to-float v10, v10

    mul-float/2addr v9, v10

    invoke-virtual {v0, v8, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 308
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v8}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 310
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-direct {p0, v8}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->dispatchVignetteChangeListener(Landroid/graphics/RectF;)V

    .line 312
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFadeOutAnimator:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v8}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 314
    iget-boolean v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mShouldRipple:Z

    if-eqz v8, :cond_1a

    .line 315
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setupRipple()V

    .line 316
    iput-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mShouldRipple:Z

    goto/16 :goto_1a

    .end local v0    # "matrix":Landroid/graphics/Matrix;
    .end local v6    # "rectChanged":Z
    :cond_d8
    move v6, v7

    .line 275
    goto/16 :goto_28

    .line 290
    .restart local v6    # "rectChanged":Z
    :cond_db
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v8, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 291
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    iget v9, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->sControlPointTolerance:F

    iget v10, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->sControlPointTolerance:F

    invoke-virtual {v8, v9, v10}, Landroid/graphics/RectF;->inset(FF)V

    goto :goto_77

    .line 297
    :cond_ea
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->setEmpty()V

    .line 298
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->setEmpty()V

    goto :goto_7c
.end method


# virtual methods
.method public generateBitmap(Landroid/graphics/Bitmap;)V
    .registers 9
    .param p1, "outBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v6, 0x0

    .line 422
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_11

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 432
    :cond_11
    :goto_11
    return-void

    .line 425
    :cond_12
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 426
    :cond_1e
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "(generateBitmap) mTempBitmap is recycled!"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_11

    .line 430
    :cond_26
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 431
    .local v0, "canvas":Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapRect:Landroid/graphics/Rect;

    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-direct {v3, v6, v6, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_11
.end method

.method protected getGestureListener()Landroid/view/GestureDetector$OnGestureListener;
    .registers 3

    .prologue
    .line 133
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyGestureListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyGestureListener;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$1;)V

    return-object v0
.end method

.method public getPaintAlpha()F
    .registers 2

    .prologue
    .line 240
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaintAlpha:I

    int-to-float v0, v0

    return v0
.end method

.method protected getScaleListener()Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    .registers 2

    .prologue
    .line 159
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)V

    return-object v0
.end method

.method public getVignetteFeather()F
    .registers 2

    .prologue
    .line 397
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFeather:F

    return v0
.end method

.method public getVignetteIntensity()I
    .registers 2

    .prologue
    .line 413
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mIntensity:I

    return v0
.end method

.method public hasOverlappingRendering()Z
    .registers 2

    .prologue
    .line 384
    const/4 v0, 0x0

    return v0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFadeOutAnimator:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    .line 228
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->getPaintAlpha()F

    move-result v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTargetAnimationAlpha:I

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_15

    .line 229
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFadeInAnimator:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 232
    :cond_15
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 233
    const/4 v0, 0x0

    .line 236
    :goto_1e
    return v0

    .line 235
    :cond_1f
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->Center:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setTouchState(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;)V

    .line 236
    const/4 v0, 0x1

    goto :goto_1e
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 436
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDraw(Landroid/graphics/Canvas;)V

    .line 438
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_13

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 470
    :cond_13
    :goto_13
    return-void

    .line 442
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_20

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_28

    .line 443
    :cond_20
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "mTempBitmap is recycled"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_13

    .line 446
    :cond_28
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapRect:Landroid/graphics/Rect;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 452
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaintAlpha:I

    if-lez v0, :cond_73

    .line 453
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeColor2:I

    if-lez v0, :cond_57

    .line 454
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeWidth2:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 455
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeColor2:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 456
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaintAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 457
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 460
    :cond_57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeWidth1:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 461
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mStrokeColor1:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 462
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaintAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 463
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 466
    :cond_73
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    if-eqz v0, :cond_13

    .line 467
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->draw(Landroid/graphics/Canvas;)V

    goto :goto_13
.end method

.method protected onLayoutChanged(IIII)V
    .registers 5
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 164
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onLayoutChanged(IIII)V

    .line 165
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->updateBitmapRect()V

    .line 166
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 8
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 194
    const/4 v0, 0x0

    .line 221
    :goto_9
    return v0

    .line 196
    :cond_a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->tempRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 198
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$3;->$SwitchMap$com$adobe$creativesdk$aviary$widget$AdobeImageViewVignette$TouchState:[I

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTouchState:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_6c

    .line 215
    :cond_1e
    :goto_1e
    :pswitch_1e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->tempRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->sControlPointTolerance:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3d

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->tempRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->sControlPointTolerance:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3d

    .line 216
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->tempRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 219
    :cond_3d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->dispatchVignetteChangeListener(Landroid/graphics/RectF;)V

    .line 220
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->invalidate()V

    .line 221
    const/4 v0, 0x1

    goto :goto_9

    .line 203
    :pswitch_47
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->tempRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    sub-float/2addr v1, p3

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->tempRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    sub-float/2addr v2, p4

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 204
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->tempRect:Landroid/graphics/RectF;

    neg-float v1, p3

    neg-float v2, p4

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->offset(FF)V

    goto :goto_1e

    .line 209
    :pswitch_65
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->tempRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p3, p4}, Landroid/graphics/RectF;->inset(FF)V

    goto :goto_1e

    .line 198
    nop

    :pswitch_data_6c
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_47
        :pswitch_65
    .end packed-switch
.end method

.method protected onSetAlpha(I)Z
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 389
    const/4 v0, 0x1

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 171
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->pBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 172
    const/4 v1, 0x0

    .line 188
    :goto_9
    return v1

    .line 175
    :cond_a
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 177
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 178
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 181
    :cond_1c
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 182
    .local v0, "action":I
    and-int/lit16 v1, v0, 0xff

    packed-switch v1, :pswitch_data_2c

    .line 188
    const/4 v1, 0x1

    goto :goto_9

    .line 184
    :pswitch_27
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->onUp(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_9

    .line 182
    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_27
    .end packed-switch
.end method

.method public onUp(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 252
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->None:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setTouchState(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;)V

    .line 253
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFadeOutAnimator:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 254
    const/4 v0, 0x1

    return v0
.end method

.method public setHardwareAccelerated(Z)V
    .registers 7
    .param p1, "accelerated"    # Z

    .prologue
    const/4 v4, 0x0

    const/16 v3, 0xb

    const/4 v2, 0x1

    .line 137
    if-eqz p1, :cond_2c

    .line 138
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v3, :cond_28

    .line 139
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->isHardwareAccelerated()Z

    move-result v1

    if-eqz v1, :cond_24

    .line 140
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 141
    .local v0, "hardwarePaint":Landroid/graphics/Paint;
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->OVERLAY:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 142
    const/4 v1, 0x2

    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setLayerType(ILandroid/graphics/Paint;)V

    .line 156
    .end local v0    # "hardwarePaint":Landroid/graphics/Paint;
    :goto_23
    return-void

    .line 144
    :cond_24
    invoke-virtual {p0, v2, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_23

    .line 147
    :cond_28
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setDrawingCacheEnabled(Z)V

    goto :goto_23

    .line 150
    :cond_2c
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v3, :cond_34

    .line 151
    invoke-virtual {p0, v2, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setLayerType(ILandroid/graphics/Paint;)V

    goto :goto_23

    .line 153
    :cond_34
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setDrawingCacheEnabled(Z)V

    goto :goto_23
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V
    .registers 10
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "vignetteBitmap"    # Landroid/graphics/Bitmap;
    .param p3, "matrix"    # Landroid/graphics/Matrix;
    .param p4, "minZoom"    # F
    .param p5, "maxZoom"    # F

    .prologue
    const/4 v3, 0x0

    .line 475
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    .line 476
    if-eqz p2, :cond_25

    .line 477
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 478
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    div-int/2addr v0, v1

    sput v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapScale:I

    .line 482
    :goto_21
    invoke-virtual {p0, p1, p3, p4, p5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 483
    return-void

    .line 480
    :cond_25
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTempBitmapRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    goto :goto_21
.end method

.method public setOnVignetteChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;

    .prologue
    .line 393
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;

    .line 394
    return-void
.end method

.method public setPaintAlpha(F)V
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 245
    float-to-int v0, p1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaintAlpha:I

    .line 246
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignettePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPaintAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 247
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->invalidate()V

    .line 248
    return-void
.end method

.method public setVignetteFeather(F)V
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 401
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mFeather:F

    .line 402
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->dispatchVignetteChangeListener(Landroid/graphics/RectF;)V

    .line 403
    return-void
.end method

.method public setVignetteIntensity(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 417
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mIntensity:I

    .line 418
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->dispatchVignetteChangeListener(Landroid/graphics/RectF;)V

    .line 419
    return-void
.end method

.method setupRipple()V
    .registers 11

    .prologue
    const/4 v6, 0x2

    const/high16 v9, 0x40000000

    .line 324
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->getLayerType()I

    move-result v1

    .line 325
    .local v1, "layerType":I
    const/4 v3, 0x0

    invoke-virtual {p0, v6, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setLayerType(ILandroid/graphics/Paint;)V

    .line 327
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setRadius(F)V

    .line 328
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    sget-object v4, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;->Ellipse:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setType(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;)V

    .line 329
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setAlpha(F)V

    .line 331
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    invoke-virtual {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->setEllipseOffset(FF)V

    .line 332
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->makeEllipseCloud(Landroid/graphics/RectF;)V

    .line 335
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    div-float v0, v3, v9

    .line 337
    .local v0, "inner":F
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    const-string v4, "radius"

    new-array v5, v6, [F

    const/4 v6, 0x0

    aput v0, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    .line 340
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->getOuterRadius()F

    move-result v7

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->getBandDistance()F

    move-result v8

    mul-float/2addr v8, v9

    add-float/2addr v7, v8

    aput v7, v5, v6

    .line 337
    invoke-static {v3, v4, v5}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v2

    .line 341
    .local v2, "mAnimator":Lcom/nineoldandroids/animation/ValueAnimator;
    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mRippleAnimationDuration:I

    int-to-long v4, v3

    invoke-virtual {v2, v4, v5}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 342
    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mRippleAnimationDelay:I

    int-to-long v4, v3

    invoke-virtual {v2, v4, v5}, Lcom/nineoldandroids/animation/ValueAnimator;->setStartDelay(J)V

    .line 343
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 344
    new-instance v3, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$1;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)V

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 351
    new-instance v3, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;

    invoke-direct {v3, p0, v2, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;Lcom/nineoldandroids/animation/ValueAnimator;I)V

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 378
    invoke-virtual {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->cancel()V

    .line 379
    invoke-virtual {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 380
    return-void
.end method
