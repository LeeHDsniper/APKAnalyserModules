.class public Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.source "ImageViewWithIntensity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyScaleListener;,
        Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyGestureListener;,
        Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;
    }
.end annotation


# static fields
.field private static final RAD:F

.field private static final RAD_COS:F

.field private static final RAD_SIN:F


# instance fields
.field private mCurrentPoint:Landroid/graphics/PointF;

.field private mDemoDelay:J

.field private mDemoDuration:J

.field private mDownPoint:Landroid/graphics/PointF;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mIntensity:F

.field private mIntensityInitiated:Z

.field private mIntensityListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

.field private mPath1:Landroid/graphics/Path;

.field private mPath2:Landroid/graphics/Path;

.field private mPath3:Landroid/graphics/Path;

.field private mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

.field private mPreviewBitmapDrawable:Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

.field private mScrollVerticalStarted:Z

.field private mSwipeGestureEnabled:Z

.field private mTextPaint:Landroid/graphics/Paint;

.field private mTipArcPaint:Landroid/graphics/Paint;

.field private mTipArcStrokeWeight:F

.field private mTipBackgroundColor:I

.field private mTipPaint:Landroid/graphics/Paint;

.field private mTipRadius:I

.field private final mTipRect:Landroid/graphics/RectF;

.field private mTipSize:I

.field private mTipTextColor:I

.field private mTouchSlop:F

.field private mVaryTipHue:Z

.field private mVaryTipStroke:Z

.field private final tempRect:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 30
    const-wide/high16 v0, 0x4024000000000000L

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    double-to-float v0, v0

    sput v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->RAD:F

    .line 31
    sget v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->RAD:F

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    double-to-float v0, v0

    sput v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->RAD_COS:F

    .line 32
    sget v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->RAD:F

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    sput v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->RAD_SIN:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 61
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v5, 0x0

    const/high16 v7, -0x1000000

    const/4 v6, 0x1

    .line 65
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    .line 34
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->tempRect:Landroid/graphics/Rect;

    .line 42
    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3}, Landroid/graphics/PointF;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mCurrentPoint:Landroid/graphics/PointF;

    .line 53
    iput-boolean v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mVaryTipStroke:Z

    .line 54
    iput-boolean v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mVaryTipHue:Z

    .line 67
    new-instance v3, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getGestureListener()Landroid/view/GestureDetector$OnGestureListener;

    move-result-object v4

    invoke-direct {v3, p1, v4}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mGestureDetector:Landroid/view/GestureDetector;

    .line 68
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v3

    int-to-float v3, v3

    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTouchSlop:F

    .line 70
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    .line 71
    .local v2, "theme":Landroid/content/res/Resources$Theme;
    sget-object v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageViewIntensity:[I

    invoke-virtual {v2, p2, v3, p3, v5}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 73
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageViewIntensity_adobe_tooltipSize:I

    const/16 v4, 0xc8

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipSize:I

    .line 74
    sget v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageViewIntensity_adobe_strokeSize:I

    const/high16 v4, 0x41600000

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v3

    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    .line 76
    sget v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageViewIntensity_adobe_strokeColor:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 77
    .local v1, "color":I
    const-string v3, "ImageViewTouchBase"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "color: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    sget v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageViewIntensity_adobe_strokeColor:I

    invoke-virtual {v0, v3, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipBackgroundColor:I

    .line 80
    sget v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageViewIntensity_android_textColor:I

    invoke-virtual {v0, v3, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipTextColor:I

    .line 81
    sget v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageViewIntensity_adobe_demo_duration:I

    const/16 v4, 0x3e8

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    int-to-long v4, v3

    iput-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDemoDuration:J

    .line 82
    sget v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageViewIntensity_adobe_demo_delay:I

    const/16 v4, 0x64

    invoke-virtual {v0, v3, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v3

    int-to-long v4, v3

    iput-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDemoDelay:J

    .line 83
    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipSize:I

    div-int/lit8 v3, v3, 0x2

    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    .line 85
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 87
    new-instance v3, Landroid/graphics/Path;

    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath1:Landroid/graphics/Path;

    .line 88
    new-instance v3, Landroid/graphics/Path;

    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath2:Landroid/graphics/Path;

    .line 89
    new-instance v3, Landroid/graphics/Path;

    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath3:Landroid/graphics/Path;

    .line 91
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v6}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipPaint:Landroid/graphics/Paint;

    .line 92
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipBackgroundColor:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 94
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v6}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcPaint:Landroid/graphics/Paint;

    .line 95
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 97
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3, v6}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTextPaint:Landroid/graphics/Paint;

    .line 98
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTextPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipSize:I

    div-int/lit8 v4, v4, 0x3

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 99
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTextPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipTextColor:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 100
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 101
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setLinearText(Z)V

    .line 103
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;

    return-object v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;
    .param p1, "x1"    # Landroid/graphics/PointF;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;

    return-object p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;FFFFZ)Z
    .registers 7
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;
    .param p1, "x1"    # F
    .param p2, "x2"    # F
    .param p3, "x3"    # F
    .param p4, "x4"    # F
    .param p5, "x5"    # Z

    .prologue
    .line 29
    invoke-direct/range {p0 .. p5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onScroll(FFFFZ)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;FFZ)Z
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;
    .param p1, "x1"    # F
    .param p2, "x2"    # F
    .param p3, "x3"    # Z

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onDown(FFZ)Z

    move-result v0

    return v0
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;
    .param p1, "x1"    # Z

    .prologue
    .line 29
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScrollVerticalStarted:Z

    return p1
.end method

.method private onDown(FFZ)Z
    .registers 7
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "fromUser"    # Z

    .prologue
    const/4 v2, 0x1

    .line 418
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mSwipeGestureEnabled:Z

    if-nez v0, :cond_6

    .line 430
    :goto_5
    return v2

    .line 421
    :cond_6
    if-eqz p3, :cond_1c

    .line 422
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 423
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->cancel()V

    .line 424
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    .line 427
    :cond_1c
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;

    .line 428
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mCurrentPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;

    invoke-virtual {v0, v1}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 429
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScrollVerticalStarted:Z

    goto :goto_5
.end method

.method private onScroll(FFFFZ)Z
    .registers 14
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F
    .param p5, "fromUser"    # Z

    .prologue
    const/4 v4, 0x0

    const/high16 v7, 0x437f0000

    const/4 v5, 0x1

    .line 374
    iget-boolean v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mSwipeGestureEnabled:Z

    if-eqz v6, :cond_c

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;

    if-nez v6, :cond_e

    :cond_c
    move v4, v5

    .line 414
    :goto_d
    return v4

    .line 377
    :cond_e
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->x:F

    sub-float v2, p1, v6

    .line 378
    .local v2, "totalDistanceX":F
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->y:F

    sub-float v3, p2, v6

    .line 379
    .local v3, "totalDistanceY":F
    iget-boolean v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScrollVerticalStarted:Z

    if-nez v6, :cond_62

    .line 381
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTouchSlop:F

    cmpl-float v6, v6, v7

    if-gtz v6, :cond_32

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTouchSlop:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_60

    .line 382
    :cond_32
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v6

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_44

    .line 383
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScrollVerticalStarted:Z

    .line 384
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;

    goto :goto_d

    .line 387
    :cond_44
    iput-boolean v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScrollVerticalStarted:Z

    .line 389
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

    if-eqz v4, :cond_55

    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityInitiated:Z

    if-nez v4, :cond_55

    .line 390
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

    invoke-interface {v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;->onIntensityInit()V

    .line 391
    iput-boolean v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityInitiated:Z

    .line 394
    :cond_55
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

    if-eqz v4, :cond_60

    .line 395
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensity:F

    invoke-interface {v4, v6}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;->onIntensitySwipeStarted(F)V

    :cond_60
    move v4, v5

    .line 399
    goto :goto_d

    .line 402
    :cond_62
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mCurrentPoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    sub-float p4, p2, v4

    .line 403
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mCurrentPoint:Landroid/graphics/PointF;

    invoke-virtual {v4, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 405
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const/high16 v6, 0x40000000

    div-float/2addr v4, v6

    div-float v4, p4, v4

    mul-float v1, v4, v7

    .line 406
    .local v1, "realDistance":F
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensity:F

    sub-float v0, v4, v1

    .line 407
    .local v0, "intensity":F
    const/4 v4, 0x0

    invoke-static {v4, v0}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-static {v7, v4}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 408
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setIntensity(F)V

    .line 410
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

    if-eqz v4, :cond_94

    .line 411
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensity:F

    invoke-interface {v4, v6}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;->onIntensitySwipeChanging(F)V

    :cond_94
    move v4, v5

    .line 414
    goto/16 :goto_d
.end method


# virtual methods
.method public finishIntensityChanging()V
    .registers 2

    .prologue
    .line 169
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onUp(Landroid/view/MotionEvent;)Z

    .line 170
    return-void
.end method

.method public generateBitmap(Landroid/graphics/Bitmap;F)V
    .registers 6
    .param p1, "outBitmap"    # Landroid/graphics/Bitmap;
    .param p2, "intensity"    # F

    .prologue
    .line 200
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 201
    .local v0, "canvas":Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPreviewBitmapDrawable:Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    if-eqz v1, :cond_14

    .line 202
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPreviewBitmapDrawable:Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    float-to-int v2, p2

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->setAlpha(I)V

    .line 203
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPreviewBitmapDrawable:Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    invoke-virtual {v1, v0}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 205
    :cond_14
    return-void
.end method

.method protected getGestureListener()Landroid/view/GestureDetector$OnGestureListener;
    .registers 3

    .prologue
    .line 107
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyGestureListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyGestureListener;-><init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;)V

    return-object v0
.end method

.method public getIntensity()F
    .registers 2

    .prologue
    .line 438
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensity:F

    return v0
.end method

.method protected getScaleListener()Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    .registers 2

    .prologue
    .line 111
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyScaleListener;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyScaleListener;-><init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;)V

    return-object v0
.end method

.method public getTooltipSize()I
    .registers 2

    .prologue
    .line 208
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipSize:I

    return v0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 149
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mSwipeGestureEnabled:Z

    if-eqz v0, :cond_12

    .line 150
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onDown(FFZ)Z

    move-result v0

    .line 152
    :goto_11
    return v0

    :cond_12
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDown(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_11
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 30
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 214
    invoke-super/range {p0 .. p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDraw(Landroid/graphics/Canvas;)V

    .line 216
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v21

    if-eqz v21, :cond_503

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPreviewBitmapDrawable:Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    move-object/from16 v21, v0

    if-eqz v21, :cond_43

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPreviewBitmapDrawable:Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensity:F

    move/from16 v22, v0

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->setAlpha(I)V

    .line 220
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 221
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPreviewBitmapDrawable:Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 223
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 226
    :cond_43
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScrollVerticalStarted:Z

    move/from16 v21, v0

    if-eqz v21, :cond_503

    .line 227
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v14

    .line 229
    .local v14, "saveCount":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensity:F

    move/from16 v21, v0

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0x4004666666666666L

    div-double v22, v22, v24

    move-wide/from16 v0, v22

    double-to-int v8, v0

    .line 230
    .local v8, "intensityPerc":I
    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    .line 232
    .local v9, "intensityString":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mCurrentPoint:Landroid/graphics/PointF;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipSize:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    const v23, 0x3f99999a

    mul-float v22, v22, v23

    sub-float v18, v21, v22

    .line 233
    .local v18, "x":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mCurrentPoint:Landroid/graphics/PointF;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v20, v0

    .line 235
    .local v20, "y":F
    const/4 v7, 0x0

    .line 236
    .local v7, "flip":Z
    const/16 v17, 0xa

    .line 238
    .local v17, "startAngle":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    sub-float v21, v18, v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v22, v0

    const/high16 v23, 0x40000000

    mul-float v22, v22, v23

    sub-float v21, v21, v22

    const/16 v22, 0x0

    cmpg-float v21, v21, v22

    if-gez v21, :cond_d9

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mCurrentPoint:Landroid/graphics/PointF;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipSize:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    const v23, 0x3f99999a

    mul-float v22, v22, v23

    add-float v18, v21, v22

    .line 240
    move/from16 v0, v17

    add-int/lit16 v0, v0, 0xb4

    move/from16 v17, v0

    .line 241
    const/4 v7, 0x1

    .line 244
    :cond_d9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    sub-float v22, v18, v22

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v23, v0

    sub-float v23, v20, v23

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v24, v0

    add-float v24, v24, v18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    add-float v25, v25, v20

    invoke-virtual/range {v21 .. v25}, Landroid/graphics/RectF;->set(FFFF)V

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/graphics/RectF;->width()F

    move-result v21

    const/high16 v22, 0x40000000

    div-float v21, v21, v22

    sget v22, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->RAD_COS:F

    mul-float v12, v21, v22

    .line 247
    .local v12, "radiusX":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/graphics/RectF;->height()F

    move-result v21

    const/high16 v22, 0x40000000

    div-float v21, v21, v22

    sget v22, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->RAD_SIN:F

    mul-float v13, v21, v22

    .line 249
    .local v13, "radiusY":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath1:Landroid/graphics/Path;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Path;->reset()V

    .line 250
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath1:Landroid/graphics/Path;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v23, v0

    const/high16 v24, 0x43aa0000

    invoke-virtual/range {v21 .. v24}, Landroid/graphics/Path;->addArc(Landroid/graphics/RectF;FF)V

    .line 251
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath1:Landroid/graphics/Path;

    move-object/from16 v22, v0

    if-eqz v7, :cond_504

    neg-float v0, v12

    move/from16 v21, v0

    :goto_164
    add-float v23, v18, v21

    if-eqz v7, :cond_508

    add-float v21, v20, v13

    :goto_16a
    move-object/from16 v0, v22

    move/from16 v1, v23

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 252
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath1:Landroid/graphics/Path;

    move-object/from16 v22, v0

    if-eqz v7, :cond_50c

    neg-float v0, v12

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v23, v0

    div-int/lit8 v23, v23, 0x4

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v23, v0

    sub-float v21, v21, v23

    :goto_18d
    add-float v21, v21, v18

    move-object/from16 v0, v22

    move/from16 v1, v21

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath1:Landroid/graphics/Path;

    move-object/from16 v22, v0

    if-eqz v7, :cond_1a1

    neg-float v12, v12

    .end local v12    # "radiusX":F
    :cond_1a1
    add-float v23, v18, v12

    if-eqz v7, :cond_51d

    sub-float v21, v20, v13

    :goto_1a7
    move-object/from16 v0, v22

    move/from16 v1, v23

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath1:Landroid/graphics/Path;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipPaint:Landroid/graphics/Paint;

    move-object/from16 v22, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 258
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTextPaint:Landroid/graphics/Paint;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->tempRect:Landroid/graphics/Rect;

    move-object/from16 v24, v0

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    move-object/from16 v3, v24

    invoke-virtual {v0, v9, v1, v2, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 259
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipSize:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->tempRect:Landroid/graphics/Rect;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/Rect;->width()I

    move-result v22

    sub-int v21, v21, v22

    div-int/lit8 v21, v21, 0x2

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v19, v0

    .line 260
    .local v19, "x2":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    sub-float v21, v18, v21

    add-float v21, v21, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->tempRect:Landroid/graphics/Rect;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/Rect;->height()I

    move-result v22

    div-int/lit8 v22, v22, 0x2

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    add-float v22, v22, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTextPaint:Landroid/graphics/Paint;

    move-object/from16 v23, v0

    move-object/from16 v0, p1

    move/from16 v1, v21

    move/from16 v2, v22

    move-object/from16 v3, v23

    invoke-virtual {v0, v9, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 263
    const v16, 0x3f266666

    .line 264
    .local v16, "sliderOffsetTop":F
    const v15, 0x3eb33333

    .line 266
    .local v15, "sliderOffsetBottom":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcPaint:Landroid/graphics/Paint;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipBackgroundColor:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/graphics/Paint;->setColor(I)V

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    const/high16 v22, -0x40000000

    const/high16 v23, -0x40000000

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/RectF;->inset(FF)V

    .line 269
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath2:Landroid/graphics/Path;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Path;->reset()V

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath2:Landroid/graphics/Path;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/RectF;->centerX()F

    move-result v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v23, v0

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/Path;->moveTo(FF)V

    .line 271
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath2:Landroid/graphics/Path;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    const/high16 v24, 0x42b40000

    if-eqz v7, :cond_521

    const/high16 v21, -0x3ccc0000

    :goto_28a
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 273
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mVaryTipStroke:Z

    move/from16 v21, v0

    if-eqz v21, :cond_525

    .line 274
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v22, v0

    move/from16 v0, v22

    neg-float v0, v0

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v23, v0

    move/from16 v0, v23

    neg-float v0, v0

    move/from16 v23, v0

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/RectF;->inset(FF)V

    .line 275
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v23, v0

    const v24, 0x3f266666

    mul-float v23, v23, v24

    move/from16 v0, v23

    neg-float v0, v0

    move/from16 v23, v0

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/RectF;->offset(FF)V

    .line 280
    :goto_2d7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath2:Landroid/graphics/Path;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/RectF;->centerX()F

    move-result v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v23, v0

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/Path;->lineTo(FF)V

    .line 281
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath2:Landroid/graphics/Path;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    const/high16 v24, -0x3d4c0000

    if-eqz v7, :cond_556

    const/high16 v21, 0x43340000

    :goto_308
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 282
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath2:Landroid/graphics/Path;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/RectF;->centerX()F

    move-result v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v24, v0

    const v25, 0x3eb33333

    mul-float v24, v24, v25

    sub-float v23, v23, v24

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/Path;->lineTo(FF)V

    .line 284
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath2:Landroid/graphics/Path;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcPaint:Landroid/graphics/Paint;

    move-object/from16 v22, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    sub-float v22, v18, v22

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v23, v0

    sub-float v23, v20, v23

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v24, v0

    add-float v24, v24, v18

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    add-float v25, v25, v20

    invoke-virtual/range {v21 .. v25}, Landroid/graphics/RectF;->set(FFFF)V

    .line 288
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    const/high16 v22, -0x40000000

    const/high16 v23, -0x40000000

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/RectF;->inset(FF)V

    .line 292
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mVaryTipHue:Z

    move/from16 v21, v0

    if-eqz v21, :cond_55a

    .line 293
    const/16 v21, 0xff

    const/16 v22, 0x3

    move/from16 v0, v22

    new-array v0, v0, [F

    move-object/from16 v22, v0

    const/16 v23, 0x0

    mul-int/lit8 v24, v8, 0x2

    move/from16 v0, v24

    int-to-float v0, v0

    move/from16 v24, v0

    aput v24, v22, v23

    const/16 v23, 0x1

    const/high16 v24, 0x3f800000

    aput v24, v22, v23

    const/16 v23, 0x2

    const/high16 v24, 0x3f800000

    aput v24, v22, v23

    invoke-static/range {v21 .. v22}, Landroid/graphics/Color;->HSVToColor(I[F)I

    move-result v6

    .line 297
    .local v6, "color":I
    :goto_3cb
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcPaint:Landroid/graphics/Paint;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 299
    if-lez v8, :cond_4fe

    .line 300
    int-to-float v0, v8

    move/from16 v21, v0

    const/high16 v22, 0x42c80000

    div-float v10, v21, v22

    .line 301
    .local v10, "perc":F
    const/high16 v21, 0x43340000

    mul-float v11, v10, v21

    .line 303
    .local v11, "perc180":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath3:Landroid/graphics/Path;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Path;->reset()V

    .line 305
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mVaryTipStroke:Z

    move/from16 v21, v0

    if-eqz v21, :cond_578

    .line 306
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath3:Landroid/graphics/Path;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/RectF;->centerX()F

    move-result v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v23, v0

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/Path;->moveTo(FF)V

    .line 307
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath3:Landroid/graphics/Path;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    const/high16 v24, 0x42b40000

    if-eqz v7, :cond_56d

    neg-float v0, v11

    move/from16 v21, v0

    :goto_426
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 308
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v22, v0

    move/from16 v0, v22

    neg-float v0, v0

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v23, v0

    move/from16 v0, v23

    neg-float v0, v0

    move/from16 v23, v0

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/RectF;->inset(FF)V

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v23, v0

    const v24, 0x3f266666

    mul-float v23, v23, v24

    move/from16 v0, v23

    neg-float v0, v0

    move/from16 v23, v0

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/RectF;->offset(FF)V

    .line 310
    float-to-double v0, v11

    move-wide/from16 v22, v0

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->sin(D)D

    move-result-wide v22

    move-wide/from16 v0, v22

    double-to-float v4, v0

    .line 311
    .local v4, "additional":F
    float-to-double v0, v11

    move-wide/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v21, v0

    const v24, 0x3f866666

    mul-float v21, v21, v24

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0x400921fb54442d18L

    div-double v24, v24, v26

    float-to-double v0, v4

    move-wide/from16 v26, v0

    mul-double v24, v24, v26

    sub-double v22, v22, v24

    move-wide/from16 v0, v22

    double-to-float v5, v0

    .line 312
    .local v5, "angle":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath3:Landroid/graphics/Path;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    const/high16 v24, 0x42b40000

    if-eqz v7, :cond_571

    neg-float v0, v5

    move/from16 v21, v0

    :goto_4b0
    add-float v21, v21, v24

    if-eqz v7, :cond_575

    .end local v5    # "angle":F
    :goto_4b4
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2, v5}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 313
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath3:Landroid/graphics/Path;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/RectF;->centerX()F

    move-result v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v24, v0

    const v25, 0x3eb33333

    mul-float v24, v24, v25

    sub-float v23, v23, v24

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/Path;->lineTo(FF)V

    .line 320
    .end local v4    # "additional":F
    .end local v11    # "perc180":F
    :goto_4e9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath3:Landroid/graphics/Path;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcPaint:Landroid/graphics/Paint;

    move-object/from16 v22, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 323
    .end local v10    # "perc":F
    :cond_4fe
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 326
    .end local v6    # "color":I
    .end local v7    # "flip":Z
    .end local v8    # "intensityPerc":I
    .end local v9    # "intensityString":Ljava/lang/String;
    .end local v13    # "radiusY":F
    .end local v14    # "saveCount":I
    .end local v15    # "sliderOffsetBottom":F
    .end local v16    # "sliderOffsetTop":F
    .end local v17    # "startAngle":I
    .end local v18    # "x":F
    .end local v19    # "x2":F
    .end local v20    # "y":F
    :cond_503
    return-void

    .restart local v7    # "flip":Z
    .restart local v8    # "intensityPerc":I
    .restart local v9    # "intensityString":Ljava/lang/String;
    .restart local v12    # "radiusX":F
    .restart local v13    # "radiusY":F
    .restart local v14    # "saveCount":I
    .restart local v17    # "startAngle":I
    .restart local v18    # "x":F
    .restart local v20    # "y":F
    :cond_504
    move/from16 v21, v12

    .line 251
    goto/16 :goto_164

    :cond_508
    sub-float v21, v20, v13

    goto/16 :goto_16a

    .line 252
    :cond_50c
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    move/from16 v21, v0

    div-int/lit8 v21, v21, 0x4

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    add-float v21, v21, v12

    goto/16 :goto_18d

    .line 253
    .end local v12    # "radiusX":F
    :cond_51d
    add-float v21, v20, v13

    goto/16 :goto_1a7

    .line 271
    .restart local v15    # "sliderOffsetBottom":F
    .restart local v16    # "sliderOffsetTop":F
    .restart local v19    # "x2":F
    :cond_521
    const/high16 v21, 0x43340000

    goto/16 :goto_28a

    .line 277
    :cond_525
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v22, v0

    const/high16 v23, 0x40000000

    div-float v22, v22, v23

    move/from16 v0, v22

    neg-float v0, v0

    move/from16 v22, v0

    const/high16 v23, 0x3f800000

    sub-float v22, v22, v23

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v23, v0

    const/high16 v24, 0x40000000

    div-float v23, v23, v24

    move/from16 v0, v23

    neg-float v0, v0

    move/from16 v23, v0

    const/high16 v24, 0x3f800000

    sub-float v23, v23, v24

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/RectF;->inset(FF)V

    goto/16 :goto_2d7

    .line 281
    :cond_556
    const/high16 v21, -0x3ccc0000

    goto/16 :goto_308

    .line 295
    :cond_55a
    const/16 v21, 0xff

    const/16 v22, 0x3

    move/from16 v0, v22

    new-array v0, v0, [F

    move-object/from16 v22, v0

    fill-array-data v22, :array_61c

    invoke-static/range {v21 .. v22}, Landroid/graphics/Color;->HSVToColor(I[F)I

    move-result v6

    .restart local v6    # "color":I
    goto/16 :goto_3cb

    .restart local v10    # "perc":F
    .restart local v11    # "perc180":F
    :cond_56d
    move/from16 v21, v11

    .line 307
    goto/16 :goto_426

    .restart local v4    # "additional":F
    .restart local v5    # "angle":F
    :cond_571
    move/from16 v21, v5

    .line 312
    goto/16 :goto_4b0

    :cond_575
    neg-float v5, v5

    goto/16 :goto_4b4

    .line 315
    .end local v4    # "additional":F
    .end local v5    # "angle":F
    :cond_578
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath3:Landroid/graphics/Path;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    const/high16 v24, 0x42b40000

    if-eqz v7, :cond_613

    neg-float v0, v11

    move/from16 v21, v0

    :goto_58b
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v22, v0

    const/high16 v23, 0x40000000

    div-float v22, v22, v23

    move/from16 v0, v22

    neg-float v0, v0

    move/from16 v22, v0

    const/high16 v23, 0x3f800000

    sub-float v22, v22, v23

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v23, v0

    const/high16 v24, 0x40000000

    div-float v23, v23, v24

    move/from16 v0, v23

    neg-float v0, v0

    move/from16 v23, v0

    const/high16 v24, 0x3f800000

    sub-float v23, v23, v24

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/RectF;->inset(FF)V

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath3:Landroid/graphics/Path;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    const/high16 v24, 0x42b40000

    if-eqz v7, :cond_617

    neg-float v0, v11

    move/from16 v21, v0

    :goto_5d8
    add-float v21, v21, v24

    if-eqz v7, :cond_61a

    .end local v11    # "perc180":F
    :goto_5dc
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2, v11}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPath3:Landroid/graphics/Path;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/RectF;->centerX()F

    move-result v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRect:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipArcStrokeWeight:F

    move/from16 v24, v0

    const v25, 0x3eb33333

    mul-float v24, v24, v25

    sub-float v23, v23, v24

    invoke-virtual/range {v21 .. v23}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_4e9

    .restart local v11    # "perc180":F
    :cond_613
    move/from16 v21, v11

    .line 315
    goto/16 :goto_58b

    :cond_617
    move/from16 v21, v11

    .line 317
    goto :goto_5d8

    :cond_61a
    neg-float v11, v11

    goto :goto_5dc

    .line 295
    :array_61c
    .array-data 4
        0x43480000
        0x3f800000
        0x3f800000
    .end array-data
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 11
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    const/4 v0, 0x0

    .line 138
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;

    if-eqz v1, :cond_17

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v1

    if-eqz v1, :cond_17

    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mSwipeGestureEnabled:Z

    if-eqz v1, :cond_17

    .line 139
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 144
    :cond_17
    :goto_17
    return v0

    .line 142
    :cond_18
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    const/4 v5, 0x1

    move-object v0, p0

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onScroll(FFFFZ)Z

    move-result v0

    goto :goto_17
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 116
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v1

    if-eqz v1, :cond_10

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 117
    :cond_10
    const/4 v1, 0x0

    .line 133
    :goto_11
    return v1

    .line 120
    :cond_12
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 122
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v1

    if-nez v1, :cond_24

    .line 123
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 126
    :cond_24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 127
    .local v0, "action":I
    and-int/lit16 v1, v0, 0xff

    packed-switch v1, :pswitch_data_34

    .line 133
    const/4 v1, 0x1

    goto :goto_11

    .line 129
    :pswitch_2f
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onUp(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_11

    .line 127
    :pswitch_data_34
    .packed-switch 0x1
        :pswitch_2f
    .end packed-switch
.end method

.method public onUp(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 157
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;

    .line 158
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScrollVerticalStarted:Z

    .line 160
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

    if-eqz v0, :cond_15

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mSwipeGestureEnabled:Z

    if-eqz v0, :cond_15

    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensity:F

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;->onIntensitySwipeChanged(F)V

    .line 164
    :cond_15
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->postInvalidate()V

    .line 165
    const/4 v0, 0x1

    return v0
.end method

.method public playDemo()Landroid/graphics/PointF;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 329
    new-instance v0, Landroid/graphics/PointF;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getWidth()I

    move-result v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mTipRadius:I

    div-int/lit8 v2, v2, 0x2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x4

    int-to-float v2, v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 331
    .local v0, "downPoint":Landroid/graphics/PointF;
    const/4 v1, 0x3

    new-array v1, v1, [I

    aput v4, v1, v4

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x4

    aput v3, v1, v2

    const/4 v2, 0x2

    aput v4, v1, v2

    invoke-static {v1}, Lcom/nineoldandroids/animation/ValueAnimator;->ofInt([I)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    .line 332
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDemoDuration:J

    invoke-virtual {v1, v2, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 333
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDemoDelay:J

    invoke-virtual {v1, v2, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->setStartDelay(J)V

    .line 334
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 335
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 336
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;)V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 348
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPlayDemoAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$2;

    invoke-direct {v2, p0, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$2;-><init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;Landroid/graphics/PointF;)V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 370
    return-object v0
.end method

.method public setIntensity(F)V
    .registers 2
    .param p1, "value"    # F

    .prologue
    .line 442
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensity:F

    .line 443
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->invalidate()V

    .line 444
    return-void
.end method

.method public setOnIntensityChangeListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

    .prologue
    .line 181
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensityListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;

    .line 182
    return-void
.end method

.method public setPreviewBitmap(Landroid/graphics/Bitmap;F)V
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "intensity"    # F

    .prologue
    .line 185
    if-nez p1, :cond_b

    .line 186
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPreviewBitmapDrawable:Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    .line 195
    :cond_5
    :goto_5
    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mIntensity:F

    .line 196
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->postInvalidate()V

    .line 197
    return-void

    .line 188
    :cond_b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 189
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-ne v0, v1, :cond_5

    .line 190
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-ne v0, v1, :cond_5

    .line 191
    new-instance v0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    invoke-direct {v0, p1}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mPreviewBitmapDrawable:Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    goto :goto_5
.end method

.method public setSwipeGestureEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 434
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mSwipeGestureEnabled:Z

    .line 435
    return-void
.end method

.method public setVaryTipHue(Z)V
    .registers 2
    .param p1, "vary"    # Z

    .prologue
    .line 177
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mVaryTipHue:Z

    .line 178
    return-void
.end method

.method public setVaryTipStroke(Z)V
    .registers 2
    .param p1, "vary"    # Z

    .prologue
    .line 173
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mVaryTipStroke:Z

    .line 174
    return-void
.end method
