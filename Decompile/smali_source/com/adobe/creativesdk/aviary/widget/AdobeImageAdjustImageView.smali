.class public Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;
.super Landroid/view/View;
.source "AdobeImageAdjustImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;,
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;,
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;
    }
.end annotation


# static fields
.field private static final SS2F_ARRAY:[Landroid/graphics/Matrix$ScaleToFit;

.field private static final STATE_SET_NONE:[I

.field private static final STATE_SET_PRESSED:[I


# instance fields
.field currentGrowth:F

.field final gridCols:I

.field final gridRows:I

.field handleHeight:I

.field handleWidth:I

.field imageCaptureRegion:Landroid/graphics/RectF;

.field initStraighten:Z

.field isReset:Z

.field mActivePointerId:I

.field mActivePointerIndex:I

.field private mAdjustViewBounds:Z

.field private mAlpha:I

.field mAnimationDuration:J

.field private mBaseline:I

.field private mBaselineAlignBottom:Z

.field private mCameraEnabled:Z

.field private mCenter:Landroid/graphics/PointF;

.field mClipPath:Landroid/graphics/Path;

.field private mColorFilter:Landroid/graphics/ColorFilter;

.field private mColorMod:Z

.field protected mCurrentScale:F

.field private mDrawMatrix:Landroid/graphics/Matrix;

.field mDrawRect:Landroid/graphics/RectF;

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mDrawableHeight:I

.field private mDrawableWidth:I

.field private mEnableFreeRotate:Z

.field mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

.field mFadeOutlinesAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

.field private mFlipMatrix:Landroid/graphics/Matrix;

.field protected mFlipType:I

.field protected mHandler:Landroid/os/Handler;

.field private mHaveFrame:Z

.field mInversePath:Landroid/graphics/Path;

.field private mIsInStraighten:Z

.field private mLastTouchX:F

.field private mLevel:I

.field mLinesAlpha:I

.field mLinesPaint:Landroid/graphics/Paint;

.field mLinesPath:Landroid/graphics/Path;

.field private mMatrix:Landroid/graphics/Matrix;

.field protected final mMatrixValues:[F

.field private mMaxHeight:I

.field private mMaxWidth:I

.field private mMergeState:Z

.field mOutlineFill:Landroid/graphics/Paint;

.field mOutlineFillAlpha:I

.field mOutlinePaint:Landroid/graphics/Paint;

.field mOutlinePaintAlpha:I

.field private mPosX:F

.field mResetAnimationDuration:J

.field private mResetListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;

.field private mResource:I

.field private mRotateMatrix:Landroid/graphics/Matrix;

.field protected mRotation:D

.field protected mRunning:Z

.field private mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

.field private mState:[I

.field mStraightenDrawable:Landroid/graphics/drawable/Drawable;

.field mStraightenMatrix:Landroid/graphics/Matrix;

.field private mTempDst:Landroid/graphics/RectF;

.field private mTempMatrix:Landroid/graphics/Matrix;

.field private mTempSrc:Landroid/graphics/RectF;

.field private mUri:Landroid/net/Uri;

.field private mViewAlphaScale:I

.field mViewDrawRect:Landroid/graphics/Rect;

.field mViewInvertRect:Landroid/graphics/RectF;

.field orientation:I

.field portrait:Z

.field prevGrowth:D

.field previousAngle:D

.field previousStraightenAngle:D

.field straightenStarted:Z

.field testStraighten:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 49
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/graphics/Matrix$ScaleToFit;

    sget-object v1, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    aput-object v1, v0, v3

    sget-object v1, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    aput-object v1, v0, v4

    const/4 v1, 0x2

    sget-object v2, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->SS2F_ARRAY:[Landroid/graphics/Matrix$ScaleToFit;

    .line 52
    new-array v0, v4, [I

    const v1, -0x10100a7

    aput v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->STATE_SET_NONE:[I

    .line 53
    new-array v0, v4, [I

    const v1, 0x10100a7

    aput v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->STATE_SET_PRESSED:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 128
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 129
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 132
    sget v0, Lcom/aviary/android/feather/sdk/R$style;->AdobeImageWidget_OrientationImageView:I

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 133
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v6, -0x1

    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 136
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrixValues:[F

    .line 55
    const/16 v0, 0x8

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->gridRows:I

    .line 56
    const/16 v0, 0x8

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->gridCols:I

    .line 57
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mHandler:Landroid/os/Handler;

    .line 58
    iput-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    .line 59
    iput v7, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCurrentScale:F

    .line 60
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    .line 61
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_NONE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    .line 62
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->isReset:Z

    .line 65
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mClipPath:Landroid/graphics/Path;

    .line 66
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mInversePath:Landroid/graphics/Path;

    .line 67
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewDrawRect:Landroid/graphics/Rect;

    .line 68
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewInvertRect:Landroid/graphics/RectF;

    .line 69
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    .line 70
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    .line 72
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    .line 73
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    .line 77
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenStarted:Z

    .line 78
    iput-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->previousStraightenAngle:D

    .line 79
    const-wide/high16 v0, 0x3ff0000000000000L

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->prevGrowth:D

    .line 80
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->testStraighten:Z

    .line 81
    iput v7, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->currentGrowth:F

    .line 82
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    .line 83
    iput-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->previousAngle:D

    .line 84
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->portrait:Z

    .line 85
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->orientation:I

    .line 86
    iput v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    .line 87
    iput v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerIndex:I

    .line 88
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    .line 93
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResource:I

    .line 96
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAdjustViewBounds:Z

    .line 97
    const v0, 0x7fffffff

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMaxWidth:I

    .line 98
    const v0, 0x7fffffff

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMaxHeight:I

    .line 100
    const/16 v0, 0xff

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAlpha:I

    .line 101
    const/16 v0, 0x100

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewAlphaScale:I

    .line 102
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mColorMod:Z

    .line 103
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 104
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mState:[I

    .line 105
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMergeState:Z

    .line 106
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLevel:I

    .line 109
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 110
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempMatrix:Landroid/graphics/Matrix;

    .line 111
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    .line 112
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;

    .line 113
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempSrc:Landroid/graphics/RectF;

    .line 114
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempDst:Landroid/graphics/RectF;

    .line 115
    iput v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mBaseline:I

    .line 116
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mBaselineAlignBottom:Z

    .line 137
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initImageView(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 138
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;D)V
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;
    .param p1, "x1"    # D

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setStraightenRotation(D)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->onReset()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;DZ)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;
    .param p1, "x1"    # D
    .param p3, "x2"    # Z

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setImageRotation(DZ)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCameraEnabled:Z

    return v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;Landroid/graphics/Matrix;)D
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;
    .param p1, "x1"    # Landroid/graphics/Matrix;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getRotationFromMatrix(Landroid/graphics/Matrix;)D

    move-result-wide v0

    return-wide v0
.end method

.method private applyColorMod()V
    .registers 4

    .prologue
    .line 1865
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_23

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mColorMod:Z

    if-eqz v0, :cond_23

    .line 1866
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 1867
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 1868
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAlpha:I

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewAlphaScale:I

    mul-int/2addr v1, v2

    shr-int/lit8 v1, v1, 0x8

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1870
    :cond_23
    return-void
.end method

.method private configureBounds()V
    .registers 20

    .prologue
    .line 480
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v14, :cond_c

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mHaveFrame:Z

    if-nez v14, :cond_d

    .line 585
    :cond_c
    :goto_c
    return-void

    .line 484
    :cond_d
    move-object/from16 v0, p0

    iget v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    .line 485
    .local v4, "dwidth":I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    .line 487
    .local v2, "dheight":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getWidth()I

    move-result v14

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingLeft()I

    move-result v15

    sub-int/2addr v14, v15

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingRight()I

    move-result v15

    sub-int v13, v14, v15

    .line 488
    .local v13, "vwidth":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getHeight()I

    move-result v14

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingTop()I

    move-result v15

    sub-int/2addr v14, v15

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingBottom()I

    move-result v15

    sub-int v12, v14, v15

    .line 490
    .local v12, "vheight":I
    if-ltz v4, :cond_37

    if-ne v13, v4, :cond_5a

    :cond_37
    if-ltz v2, :cond_3b

    if-ne v12, v2, :cond_5a

    :cond_3b
    const/4 v7, 0x1

    .line 492
    .local v7, "fits":Z
    :goto_3c
    if-lez v4, :cond_48

    if-lez v2, :cond_48

    sget-object v14, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_XY:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    if-ne v14, v15, :cond_5c

    .line 497
    :cond_48
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v14, v15, v0, v13, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 498
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    goto :goto_c

    .line 490
    .end local v7    # "fits":Z
    :cond_5a
    const/4 v7, 0x0

    goto :goto_3c

    .line 502
    .restart local v7    # "fits":Z
    :cond_5c
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v14, v15, v0, v4, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 504
    sget-object v14, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->MATRIX:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    if-ne v14, v15, :cond_89

    .line 506
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v14}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v14

    if-eqz v14, :cond_80

    .line 507
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    goto :goto_c

    .line 509
    :cond_80
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    goto :goto_c

    .line 511
    :cond_89
    if-eqz v7, :cond_92

    .line 513
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    goto/16 :goto_c

    .line 514
    :cond_92
    sget-object v14, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->CENTER:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    if-ne v14, v15, :cond_d1

    .line 516
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 517
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    sub-int v15, v13, v4

    int-to-float v15, v15

    const/high16 v16, 0x3f000000

    mul-float v15, v15, v16

    const/high16 v16, 0x3f000000

    add-float v15, v15, v16

    float-to-int v15, v15

    int-to-float v15, v15

    sub-int v16, v12, v2

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    const/high16 v17, 0x3f000000

    mul-float v16, v16, v17

    const/high16 v17, 0x3f000000

    add-float v16, v16, v17

    move/from16 v0, v16

    float-to-int v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Landroid/graphics/Matrix;->setTranslate(FF)V

    goto/16 :goto_c

    .line 518
    :cond_d1
    sget-object v14, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->CENTER_CROP:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    if-ne v14, v15, :cond_125

    .line 519
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 522
    const/4 v5, 0x0

    .local v5, "dx":F
    const/4 v6, 0x0

    .line 524
    .local v6, "dy":F
    mul-int v14, v4, v12

    mul-int v15, v13, v2

    if-le v14, v15, :cond_118

    .line 525
    int-to-float v14, v12

    int-to-float v15, v2

    div-float v9, v14, v15

    .line 526
    .local v9, "scale":F
    int-to-float v14, v13

    int-to-float v15, v4

    mul-float/2addr v15, v9

    sub-float/2addr v14, v15

    const/high16 v15, 0x3f000000

    mul-float v5, v14, v15

    .line 532
    :goto_f5
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v14, v9, v9}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 533
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    const/high16 v15, 0x3f000000

    add-float/2addr v15, v5

    float-to-int v15, v15

    int-to-float v15, v15

    const/high16 v16, 0x3f000000

    add-float v16, v16, v6

    move/from16 v0, v16

    float-to-int v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto/16 :goto_c

    .line 528
    .end local v9    # "scale":F
    :cond_118
    int-to-float v14, v13

    int-to-float v15, v4

    div-float v9, v14, v15

    .line 529
    .restart local v9    # "scale":F
    int-to-float v14, v12

    int-to-float v15, v2

    mul-float/2addr v15, v9

    sub-float/2addr v14, v15

    const/high16 v15, 0x3f000000

    mul-float v6, v14, v15

    goto :goto_f5

    .line 534
    .end local v5    # "dx":F
    .end local v6    # "dy":F
    .end local v9    # "scale":F
    :cond_125
    sget-object v14, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->CENTER_INSIDE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    if-ne v14, v15, :cond_171

    .line 535
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 540
    if-gt v4, v13, :cond_163

    if-gt v2, v12, :cond_163

    .line 541
    const/high16 v9, 0x3f800000

    .line 546
    .restart local v9    # "scale":F
    :goto_13b
    int-to-float v14, v13

    int-to-float v15, v4

    mul-float/2addr v15, v9

    sub-float/2addr v14, v15

    const/high16 v15, 0x3f000000

    mul-float/2addr v14, v15

    const/high16 v15, 0x3f000000

    add-float/2addr v14, v15

    float-to-int v14, v14

    int-to-float v5, v14

    .line 547
    .restart local v5    # "dx":F
    int-to-float v14, v12

    int-to-float v15, v2

    mul-float/2addr v15, v9

    sub-float/2addr v14, v15

    const/high16 v15, 0x3f000000

    mul-float/2addr v14, v15

    const/high16 v15, 0x3f000000

    add-float/2addr v14, v15

    float-to-int v14, v14

    int-to-float v6, v14

    .line 549
    .restart local v6    # "dy":F
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v14, v9, v9}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 550
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v14, v5, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto/16 :goto_c

    .line 543
    .end local v5    # "dx":F
    .end local v6    # "dy":F
    .end local v9    # "scale":F
    :cond_163
    int-to-float v14, v13

    int-to-float v15, v4

    div-float/2addr v14, v15

    int-to-float v15, v12

    int-to-float v0, v2

    move/from16 v16, v0

    div-float v15, v15, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->min(FF)F

    move-result v9

    .restart local v9    # "scale":F
    goto :goto_13b

    .line 553
    .end local v9    # "scale":F
    :cond_171
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempSrc:Landroid/graphics/RectF;

    const/4 v15, 0x0

    const/16 v16, 0x0

    int-to-float v0, v4

    move/from16 v17, v0

    int-to-float v0, v2

    move/from16 v18, v0

    invoke-virtual/range {v14 .. v18}, Landroid/graphics/RectF;->set(FFFF)V

    .line 554
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempDst:Landroid/graphics/RectF;

    const/4 v15, 0x0

    const/16 v16, 0x0

    int-to-float v0, v13

    move/from16 v17, v0

    int-to-float v0, v12

    move/from16 v18, v0

    invoke-virtual/range {v14 .. v18}, Landroid/graphics/RectF;->set(FFFF)V

    .line 556
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 557
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempSrc:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempDst:Landroid/graphics/RectF;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->scaleTypeToScaleToFit(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;)Landroid/graphics/Matrix$ScaleToFit;

    move-result-object v17

    invoke-virtual/range {v14 .. v17}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 559
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getMatrixScale(Landroid/graphics/Matrix;)[F

    move-result-object v14

    const/4 v15, 0x0

    aget v14, v14, v15

    move-object/from16 v0, p0

    iput v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCurrentScale:F

    .line 561
    new-instance v11, Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    invoke-direct {v11, v14}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 562
    .local v11, "tempMatrix":Landroid/graphics/Matrix;
    new-instance v10, Landroid/graphics/RectF;

    invoke-direct {v10}, Landroid/graphics/RectF;-><init>()V

    .line 563
    .local v10, "src":Landroid/graphics/RectF;
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    .line 564
    .local v3, "dst":Landroid/graphics/RectF;
    const/4 v14, 0x0

    const/4 v15, 0x0

    int-to-float v0, v2

    move/from16 v16, v0

    int-to-float v0, v4

    move/from16 v17, v0

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v10, v14, v15, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 565
    const/4 v14, 0x0

    const/4 v15, 0x0

    int-to-float v0, v13

    move/from16 v16, v0

    int-to-float v0, v12

    move/from16 v17, v0

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v3, v14, v15, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 566
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    invoke-static {v14}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->scaleTypeToScaleToFit(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;)Landroid/graphics/Matrix$ScaleToFit;

    move-result-object v14

    invoke-virtual {v11, v10, v3, v14}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 568
    new-instance v11, Landroid/graphics/Matrix;

    .end local v11    # "tempMatrix":Landroid/graphics/Matrix;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    invoke-direct {v11, v14}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 569
    .restart local v11    # "tempMatrix":Landroid/graphics/Matrix;
    invoke-virtual {v11, v11}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 571
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getMatrixScale(Landroid/graphics/Matrix;)[F

    move-result-object v14

    const/4 v15, 0x0

    aget v8, v14, v15

    .line 573
    .local v8, "invertScale":F
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    div-int/lit8 v15, v13, 0x2

    int-to-float v15, v15

    div-int/lit8 v16, v12, 0x2

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-virtual {v14, v8, v8, v15, v0}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 575
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v14}, Landroid/graphics/Matrix;->reset()V

    .line 576
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v14}, Landroid/graphics/Matrix;->reset()V

    .line 577
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v14}, Landroid/graphics/Matrix;->reset()V

    .line 578
    sget-object v14, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_NONE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v14, v14, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    move-object/from16 v0, p0

    iput v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    .line 579
    const-wide/16 v14, 0x0

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    .line 580
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCurrentScale:F

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCurrentScale:F

    move/from16 v16, v0

    div-int/lit8 v17, v13, 0x2

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    div-int/lit8 v18, v12, 0x2

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    invoke-virtual/range {v14 .. v18}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 581
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getImageRect()Landroid/graphics/RectF;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawRect:Landroid/graphics/RectF;

    .line 582
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCenter()Landroid/graphics/PointF;

    goto/16 :goto_c
.end method

.method private fireOnResetComplete()V
    .registers 2

    .prologue
    .line 1091
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResetListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;

    if-eqz v0, :cond_9

    .line 1092
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResetListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;->onResetComplete()V

    .line 1094
    :cond_9
    return-void
.end method

.method private flip(ZZ)V
    .registers 9
    .param p1, "horizontal"    # Z
    .param p2, "vertical"    # Z

    .prologue
    const/high16 v5, 0x3f800000

    const/high16 v4, -0x40800000

    .line 998
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 999
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    .line 1001
    .local v0, "center":Landroid/graphics/PointF;
    if-eqz p1, :cond_1f

    .line 1002
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_HORIZONTAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    xor-int/2addr v1, v2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    .line 1003
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    iget v2, v0, Landroid/graphics/PointF;->x:F

    iget v3, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v4, v5, v2, v3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 1006
    :cond_1f
    if-eqz p2, :cond_33

    .line 1007
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_VERTICAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    xor-int/2addr v1, v2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    .line 1008
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    iget v2, v0, Landroid/graphics/PointF;->x:F

    iget v3, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v5, v4, v2, v3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 1011
    :cond_33
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    neg-double v2, v2

    const-wide/high16 v4, 0x4000000000000000L

    mul-double/2addr v2, v4

    double-to-float v2, v2

    iget v3, v0, Landroid/graphics/PointF;->x:F

    iget v4, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v2, v3, v4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 1012
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getRotationFromMatrix(Landroid/graphics/Matrix;)D

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angle360(D)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    .line 1013
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 1014
    return-void
.end method

.method static getAngle90(D)D
    .registers 10
    .param p0, "value"    # D

    .prologue
    const-wide v6, 0x4066800000000000L

    .line 1952
    invoke-static {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angle360(D)D

    move-result-wide v2

    .line 1953
    .local v2, "rotation":D
    move-wide v0, v2

    .line 1955
    .local v0, "angle":D
    const-wide v4, 0x4070e00000000000L

    cmpl-double v4, v2, v4

    if-ltz v4, :cond_1b

    .line 1956
    const-wide v4, 0x4076800000000000L

    sub-double v0, v4, v2

    .line 1962
    :cond_1a
    :goto_1a
    return-wide v0

    .line 1957
    :cond_1b
    cmpl-double v4, v2, v6

    if-ltz v4, :cond_22

    .line 1958
    sub-double v0, v2, v6

    goto :goto_1a

    .line 1959
    :cond_22
    const-wide v4, 0x4056800000000000L

    cmpl-double v4, v2, v4

    if-lez v4, :cond_1a

    .line 1960
    sub-double v0, v6, v2

    goto :goto_1a
.end method

.method private getCenter()Landroid/graphics/PointF;
    .registers 7

    .prologue
    const/high16 v5, 0x40000000

    .line 1269
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCenter:Landroid/graphics/PointF;

    if-nez v2, :cond_2f

    .line 1270
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingRight()I

    move-result v3

    sub-int v1, v2, v3

    .line 1271
    .local v1, "vwidth":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingBottom()I

    move-result v3

    sub-int v0, v2, v3

    .line 1272
    .local v0, "vheight":I
    new-instance v2, Landroid/graphics/PointF;

    int-to-float v3, v1

    div-float/2addr v3, v5

    int-to-float v4, v0

    div-float/2addr v4, v5

    invoke-direct {v2, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCenter:Landroid/graphics/PointF;

    .line 1274
    .end local v0    # "vheight":I
    .end local v1    # "vwidth":I
    :cond_2f
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCenter:Landroid/graphics/PointF;

    return-object v2
.end method

.method private getImageRect()Landroid/graphics/RectF;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 600
    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    int-to-float v2, v2

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method private getRotationFromMatrix(Landroid/graphics/Matrix;)D
    .registers 10
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 338
    const/4 v3, 0x4

    new-array v2, v3, [F

    fill-array-data v2, :array_1c

    .line 339
    .local v2, "pts":[F
    invoke-virtual {p1, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 340
    const/4 v3, 0x0

    aget v3, v2, v3

    const/4 v4, 0x1

    aget v4, v2, v4

    const/4 v5, 0x2

    aget v5, v2, v5

    const/4 v6, 0x3

    aget v6, v2, v6

    const/4 v7, 0x0

    invoke-static {v3, v4, v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angleBetweenPoints(FFFFF)D

    move-result-wide v0

    .line 341
    .local v0, "angle":D
    neg-double v4, v0

    return-wide v4

    .line 338
    :array_1c
    .array-data 4
        0x0
        0x0
        0x0
        -0x3d380000
    .end array-data
.end method

.method private getViewRect()Landroid/graphics/RectF;
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 220
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingRight()I

    move-result v3

    sub-int v1, v2, v3

    .line 221
    .local v1, "vwidth":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingBottom()I

    move-result v3

    sub-int v0, v2, v3

    .line 222
    .local v0, "vheight":I
    new-instance v2, Landroid/graphics/RectF;

    int-to-float v3, v1

    int-to-float v4, v0

    invoke-direct {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v2
.end method

.method private initImageView(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 26
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 142
    new-instance v15, Landroid/graphics/Matrix;

    invoke-direct {v15}, Landroid/graphics/Matrix;-><init>()V

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    .line 143
    sget-object v15, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_CENTER:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .line 146
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v14

    .line 147
    .local v14, "theme":Landroid/content/res/Resources$Theme;
    sget-object v15, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageOrientationImageView:[I

    const/16 v18, 0x0

    move-object/from16 v0, p2

    move/from16 v1, p3

    move/from16 v2, v18

    invoke-virtual {v14, v0, v15, v1, v2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 149
    .local v4, "array":Landroid/content/res/TypedArray;
    sget v15, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageOrientationImageView_adobe_handle:I

    invoke-virtual {v4, v15}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    .line 150
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 152
    sget v15, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageOrientationImageView_adobe_strokeColor:I

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v10

    .line 153
    .local v10, "strokeColor1":I
    sget v15, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageOrientationImageView_adobe_strokeColorInternal:I

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v11

    .line 155
    .local v11, "strokeColor2":I
    sget v15, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageOrientationImageView_adobe_strokeSize:I

    const/16 v18, 0x2

    move/from16 v0, v18

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v12

    .line 156
    .local v12, "strokeWidth1":I
    sget v15, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageOrientationImageView_adobe_strokeSizeInternal:I

    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v13

    .line 158
    .local v13, "strokeWidth2":I
    sget v15, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageOrientationImageView_adobe_color1:I

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    .line 160
    .local v6, "fillColor":I
    sget v15, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageOrientationImageView_android_animationDuration:I

    const/16 v18, 0x190

    move/from16 v0, v18

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v15

    int-to-long v0, v15

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAnimationDuration:J

    .line 161
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAnimationDuration:J

    move-wide/from16 v18, v0

    const-wide/16 v20, 0x2

    div-long v18, v18, v20

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResetAnimationDuration:J

    .line 163
    sget v15, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageOrientationImageView_adobe_enable3d:I

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    .line 164
    .local v5, "cameraEnabled":Z
    sget v15, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageOrientationImageView_adobe_freeRotate:I

    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    .line 166
    .local v7, "freeRotate":Z
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 168
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setCameraEnabled(Z)V

    .line 169
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setEnableFreeRotate(Z)V

    .line 171
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v15}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v15

    int-to-double v0, v15

    move-wide/from16 v16, v0

    .line 172
    .local v16, "w":D
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v15}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v15

    int-to-double v8, v15

    .line 173
    .local v8, "h":D
    const-wide/high16 v18, 0x4000000000000000L

    div-double v18, v16, v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-int v15, v0

    move-object/from16 v0, p0

    iput v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleWidth:I

    .line 174
    const-wide/high16 v18, 0x4000000000000000L

    div-double v18, v8, v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-int v15, v0

    move-object/from16 v0, p0

    iput v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleHeight:I

    .line 176
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    int-to-float v0, v12

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 177
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    sget-object v18, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 178
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 179
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    invoke-virtual {v15, v10}, Landroid/graphics/Paint;->setColor(I)V

    .line 181
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    sget-object v18, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 182
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 183
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    invoke-virtual {v15, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 184
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setDither(Z)V

    .line 185
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setHinting(I)V

    .line 187
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    int-to-float v0, v13

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 188
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 189
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setDither(Z)V

    .line 190
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    sget-object v18, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 191
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    invoke-virtual {v15, v11}, Landroid/graphics/Paint;->setColor(I)V

    .line 192
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setHinting(I)V

    .line 194
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    invoke-virtual {v15}, Landroid/graphics/Paint;->getAlpha()I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFillAlpha:I

    .line 195
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    invoke-virtual {v15}, Landroid/graphics/Paint;->getAlpha()I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaintAlpha:I

    .line 196
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    invoke-virtual {v15}, Landroid/graphics/Paint;->getAlpha()I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesAlpha:I

    .line 198
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 199
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 200
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v15, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 201
    return-void
.end method

.method private onReset()V
    .registers 16

    .prologue
    const-wide v2, 0x4076800000000000L

    const/4 v14, 0x0

    .line 1048
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->isReset:Z

    if-eqz v0, :cond_61

    .line 1049
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getRotation()F

    move-result v0

    float-to-double v10, v0

    .line 1050
    .local v10, "rotation":D
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getStraightenAngle()D

    move-result-wide v12

    .line 1051
    .local v12, "straightenRotation":D
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getStraightenStarted()Z

    move-result v8

    .line 1052
    .local v8, "resetStraighten":Z
    iput-boolean v14, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenStarted:Z

    .line 1054
    rem-double/2addr v10, v2

    .line 1055
    const-wide v0, 0x4066800000000000L

    cmpl-double v0, v10, v0

    if-lez v0, :cond_24

    .line 1056
    sub-double/2addr v10, v2

    .line 1059
    :cond_24
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getHorizontalFlip()Z

    move-result v7

    .line 1060
    .local v7, "hflip":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getVerticalFlip()Z

    move-result v9

    .line 1061
    .local v9, "vflip":Z
    const/4 v6, 0x0

    .line 1062
    .local v6, "handled":Z
    iput-boolean v14, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    .line 1063
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 1065
    const-wide/16 v0, 0x0

    cmpl-double v0, v10, v0

    if-nez v0, :cond_3a

    if-eqz v8, :cond_4b

    .line 1066
    :cond_3a
    if-eqz v8, :cond_62

    .line 1067
    neg-double v1, v12

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    iget v0, v0, Landroid/graphics/PointF;->x:F

    float-to-int v3, v0

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResetAnimationDuration:J

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenBy(DIJ)V

    .line 1071
    :goto_4a
    const/4 v6, 0x1

    .line 1074
    :cond_4b
    if-eqz v7, :cond_54

    .line 1075
    const/4 v0, 0x1

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResetAnimationDuration:J

    invoke-virtual {p0, v0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->flip(ZJ)V

    .line 1076
    const/4 v6, 0x1

    .line 1079
    :cond_54
    if-eqz v9, :cond_5c

    .line 1080
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResetAnimationDuration:J

    invoke-virtual {p0, v14, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->flip(ZJ)V

    .line 1081
    const/4 v6, 0x1

    .line 1084
    :cond_5c
    if-nez v6, :cond_61

    .line 1085
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->fireOnResetComplete()V

    .line 1088
    .end local v6    # "handled":Z
    .end local v7    # "hflip":Z
    .end local v8    # "resetStraighten":Z
    .end local v9    # "vflip":Z
    .end local v10    # "rotation":D
    .end local v12    # "straightenRotation":D
    :cond_61
    return-void

    .line 1069
    .restart local v6    # "handled":Z
    .restart local v7    # "hflip":Z
    .restart local v8    # "resetStraighten":Z
    .restart local v9    # "vflip":Z
    .restart local v10    # "rotation":D
    .restart local v12    # "straightenRotation":D
    :cond_62
    neg-double v0, v10

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResetAnimationDuration:J

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->rotateBy(DJ)V

    goto :goto_4a
.end method

.method private onTouchStart()V
    .registers 3

    .prologue
    .line 1264
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->STATE_SET_PRESSED:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 1265
    const/16 v0, 0x190

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->fadeInGrid(I)V

    .line 1266
    return-void
.end method

.method private onTouchUp()V
    .registers 3

    .prologue
    .line 1258
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 1259
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->STATE_SET_NONE:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 1260
    const/16 v0, 0xc8

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->fadeOutGrid(I)V

    .line 1261
    return-void
.end method

.method private resetStraighten()V
    .registers 5

    .prologue
    const-wide/16 v2, 0x0

    .line 1248
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 1249
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenStarted:Z

    .line 1250
    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->previousStraightenAngle:D

    .line 1251
    const-wide/high16 v0, 0x3ff0000000000000L

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->prevGrowth:D

    .line 1252
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->testStraighten:Z

    .line 1253
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->currentGrowth:F

    .line 1254
    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->previousAngle:D

    .line 1255
    return-void
.end method

.method private resizeFromDrawable()V
    .registers 5

    .prologue
    .line 618
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 619
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_23

    .line 620
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    .line 621
    .local v2, "w":I
    if-gez v2, :cond_c

    .line 622
    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    .line 624
    :cond_c
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    .line 625
    .local v1, "h":I
    if-gez v1, :cond_14

    .line 626
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    .line 628
    :cond_14
    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    if-ne v2, v3, :cond_1c

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    if-eq v1, v3, :cond_23

    .line 629
    :cond_1c
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    .line 630
    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    .line 631
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->requestLayout()V

    .line 634
    .end local v1    # "h":I
    .end local v2    # "w":I
    :cond_23
    return-void
.end method

.method private resolveAdjustedSize(III)I
    .registers 8
    .param p1, "desiredSize"    # I
    .param p2, "maxSize"    # I
    .param p3, "measureSpec"    # I

    .prologue
    .line 1919
    move v0, p1

    .line 1920
    .local v0, "result":I
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 1921
    .local v1, "specMode":I
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 1922
    .local v2, "specSize":I
    sparse-switch v1, :sswitch_data_1e

    .line 1940
    :goto_c
    return v0

    .line 1925
    :sswitch_d
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1926
    goto :goto_c

    .line 1931
    :sswitch_12
    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v3, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1932
    goto :goto_c

    .line 1935
    :sswitch_1b
    move v0, v2

    .line 1936
    goto :goto_c

    .line 1922
    nop

    :sswitch_data_1e
    .sparse-switch
        -0x80000000 -> :sswitch_12
        0x0 -> :sswitch_d
        0x40000000 -> :sswitch_1b
    .end sparse-switch
.end method

.method private resolveUri()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 1873
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_6

    .line 1916
    :cond_5
    :goto_5
    return-void

    .line 1877
    :cond_6
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1878
    .local v2, "rsrc":Landroid/content/res/Resources;
    if-eqz v2, :cond_5

    .line 1882
    const/4 v0, 0x0

    .line 1884
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResource:I

    if-eqz v4, :cond_39

    .line 1886
    :try_start_11
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResource:I

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_16} :catch_1b

    move-result-object v0

    .line 1915
    :cond_17
    :goto_17
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->updateDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_5

    .line 1887
    :catch_1b
    move-exception v1

    .line 1888
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "rotate"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to find resource: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResource:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1890
    iput-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    goto :goto_17

    .line 1892
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_39
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    if-eqz v4, :cond_5

    .line 1893
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    .line 1894
    .local v3, "scheme":Ljava/lang/String;
    const-string v4, "android.resource"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6a

    .line 1906
    :goto_4b
    if-nez v0, :cond_17

    .line 1907
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "resolveUri failed on bad bitmap uri: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1909
    iput-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    goto :goto_17

    .line 1896
    :cond_6a
    const-string v4, "content"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7a

    const-string v4, "file"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_aa

    .line 1898
    :cond_7a
    :try_start_7a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    :try_end_8c
    .catch Ljava/lang/Exception; {:try_start_7a .. :try_end_8c} :catch_8e

    move-result-object v0

    goto :goto_4b

    .line 1899
    :catch_8e
    move-exception v1

    .line 1900
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v4, "rotate"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to open content: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4b

    .line 1903
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_aa
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_4b
.end method

.method private static scaleTypeToScaleToFit(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;)Landroid/graphics/Matrix$ScaleToFit;
    .registers 3
    .param p0, "st"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .prologue
    .line 589
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->SS2F_ARRAY:[Landroid/graphics/Matrix$ScaleToFit;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->nativeInt:I

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method private setImageRotation(DZ)V
    .registers 15
    .param p1, "angle"    # D
    .param p3, "invert"    # Z

    .prologue
    .line 226
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    .line 228
    .local v0, "center":Landroid/graphics/PointF;
    new-instance v5, Landroid/graphics/Matrix;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    invoke-direct {v5, v6}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 229
    .local v5, "tempMatrix":Landroid/graphics/Matrix;
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getImageRect()Landroid/graphics/RectF;

    move-result-object v4

    .line 230
    .local v4, "src":Landroid/graphics/RectF;
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getViewRect()Landroid/graphics/RectF;

    move-result-object v1

    .line 232
    .local v1, "dst":Landroid/graphics/RectF;
    double-to-float v6, p1

    iget v7, v0, Landroid/graphics/PointF;->x:F

    iget v8, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v5, v6, v7, v8}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 233
    invoke-virtual {v5, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 234
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->scaleTypeToScaleToFit(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;)Landroid/graphics/Matrix$ScaleToFit;

    move-result-object v6

    invoke-virtual {v5, v4, v1, v6}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 236
    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getMatrixScale(Landroid/graphics/Matrix;)[F

    move-result-object v3

    .line 237
    .local v3, "scale":[F
    const/4 v6, 0x0

    aget v6, v3, v6

    const/4 v7, 0x1

    aget v7, v3, v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 239
    .local v2, "fScale":F
    if-eqz p3, :cond_4b

    .line 240
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    double-to-float v7, p1

    iget v8, v0, Landroid/graphics/PointF;->x:F

    iget v9, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v6, v7, v8, v9}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 241
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget v7, v0, Landroid/graphics/PointF;->x:F

    iget v8, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v6, v2, v2, v7, v8}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 247
    :goto_4a
    return-void

    .line 243
    :cond_4b
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget v7, v0, Landroid/graphics/PointF;->x:F

    iget v8, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v6, v2, v2, v7, v8}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 244
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    double-to-float v7, p1

    iget v8, v0, Landroid/graphics/PointF;->x:F

    iget v9, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v6, v7, v8, v9}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    goto :goto_4a
.end method

.method private setStraightenRotation(D)V
    .registers 58
    .param p1, "newPosition"    # D

    .prologue
    .line 1354
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v12

    .line 1356
    .local v12, "center":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    move-object/from16 v48, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->previousStraightenAngle:D

    move-wide/from16 v50, v0

    move-wide/from16 v0, v50

    neg-double v0, v0

    move-wide/from16 v50, v0

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    iget v0, v12, Landroid/graphics/PointF;->x:F

    move/from16 v50, v0

    iget v0, v12, Landroid/graphics/PointF;->y:F

    move/from16 v51, v0

    invoke-virtual/range {v48 .. v51}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 1358
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    move-object/from16 v48, v0

    move-wide/from16 v0, p1

    double-to-float v0, v0

    move/from16 v49, v0

    iget v0, v12, Landroid/graphics/PointF;->x:F

    move/from16 v50, v0

    iget v0, v12, Landroid/graphics/PointF;->y:F

    move/from16 v51, v0

    invoke-virtual/range {v48 .. v51}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 1359
    move-wide/from16 v0, p1

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->previousStraightenAngle:D

    .line 1361
    const-wide/high16 v48, 0x3ff0000000000000L

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->prevGrowth:D

    move-wide/from16 v50, v0

    div-double v22, v48, v50

    .line 1363
    .local v22, "divideGrowth":D
    const-wide/high16 v48, 0x3ff0000000000000L

    move-object/from16 v0, p0

    move-wide/from16 v1, v22

    move-wide/from16 v3, v48

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->isNumber(DD)D

    move-result-wide v22

    .line 1365
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    move-object/from16 v48, v0

    move-wide/from16 v0, v22

    double-to-float v0, v0

    move/from16 v49, v0

    move-wide/from16 v0, v22

    double-to-float v0, v0

    move/from16 v50, v0

    iget v0, v12, Landroid/graphics/PointF;->x:F

    move/from16 v51, v0

    iget v0, v12, Landroid/graphics/PointF;->y:F

    move/from16 v52, v0

    invoke-virtual/range {v48 .. v52}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 1367
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingLeft()I

    move-result v34

    .line 1368
    .local v34, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingRight()I

    move-result v35

    .line 1369
    .local v35, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingTop()I

    move-result v36

    .line 1370
    .local v36, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingBottom()I

    move-result v13

    .line 1372
    .local v13, "paddingBottom":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->portrait:Z

    move/from16 v48, v0

    if-eqz v48, :cond_3c7

    .line 1376
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v48

    invoke-static/range {v48 .. v49}, Ljava/lang/Math;->sin(D)D

    move-result-wide v38

    .line 1377
    .local v38, "sinRad":D
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v48

    invoke-static/range {v48 .. v49}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    .line 1379
    .local v14, "cosRad":D
    const/16 v48, 0x8

    move/from16 v0, v48

    new-array v0, v0, [F

    move-object/from16 v37, v0

    const/16 v48, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    add-double v50, v50, v52

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v36

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    sub-double v50, v50, v52

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    add-double v50, v50, v52

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v36

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    sub-double v50, v50, v52

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    add-double v50, v50, v52

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    int-to-double v0, v13

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    sub-double v50, v50, v52

    int-to-double v0, v13

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    add-double v50, v50, v52

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    int-to-double v0, v13

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    sub-double v50, v50, v52

    int-to-double v0, v13

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    .line 1390
    .local v37, "testPoint":[F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 1392
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v48, v0

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v48, v0

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, v38

    add-double v48, v48, v50

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, v14

    add-double v48, v48, v50

    move-wide/from16 v0, v48

    double-to-float v0, v0

    move/from16 v40, v0

    .line 1393
    .local v40, "x1":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v48, v0

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v48, v0

    move/from16 v0, v36

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, v38

    sub-double v48, v48, v50

    move/from16 v0, v36

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, v14

    add-double v48, v48, v50

    move-wide/from16 v0, v48

    double-to-float v0, v0

    move/from16 v44, v0

    .line 1394
    .local v44, "y1":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v48, v0

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v48, v0

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, v38

    add-double v48, v48, v50

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, v14

    add-double v48, v48, v50

    move-wide/from16 v0, v48

    double-to-float v0, v0

    move/from16 v41, v0

    .line 1395
    .local v41, "x2":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v48, v0

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v48, v0

    int-to-double v0, v13

    move-wide/from16 v50, v0

    mul-double v50, v50, v38

    sub-double v48, v48, v50

    int-to-double v0, v13

    move-wide/from16 v50, v0

    mul-double v50, v50, v14

    add-double v48, v48, v50

    move-wide/from16 v0, v48

    double-to-float v0, v0

    move/from16 v45, v0

    .line 1396
    .local v45, "y2":F
    const/16 v48, 0x2

    aget v42, v37, v48

    .line 1397
    .local v42, "x3":F
    const/16 v48, 0x3

    aget v46, v37, v48

    .line 1398
    .local v46, "y3":F
    const/16 v48, 0x6

    aget v43, v37, v48

    .line 1399
    .local v43, "x4":F
    const/16 v48, 0x7

    aget v47, v37, v48

    .line 1401
    .local v47, "y4":F
    mul-float v48, v40, v45

    mul-float v49, v44, v41

    sub-float v48, v48, v49

    sub-float v49, v46, v47

    mul-float v48, v48, v49

    sub-float v49, v44, v45

    mul-float v50, v42, v47

    mul-float v51, v46, v43

    sub-float v50, v50, v51

    mul-float v49, v49, v50

    sub-float v48, v48, v49

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v32, v0

    .line 1402
    .local v32, "numerator2":D
    sub-float v48, v40, v41

    sub-float v49, v46, v47

    mul-float v48, v48, v49

    sub-float v49, v44, v45

    sub-float v50, v42, v43

    mul-float v49, v49, v50

    sub-float v48, v48, v49

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v18, v0

    .line 1404
    .local v18, "denominator2":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v48, v0

    move/from16 v0, v35

    int-to-float v0, v0

    move/from16 v49, v0

    add-float v48, v48, v49

    move/from16 v0, v48

    float-to-double v6, v0

    .line 1405
    .local v6, "aPx":D
    div-double v48, v32, v18

    int-to-double v0, v13

    move-wide/from16 v50, v0

    add-double v8, v48, v50

    .line 1407
    .local v8, "aPy":D
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v48

    move-object/from16 v0, v48

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    move/from16 v48, v0

    move/from16 v0, v48

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->orientation:I

    .line 1408
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->orientation:I

    move/from16 v48, v0

    const/16 v49, 0x2

    move/from16 v0, v48

    move/from16 v1, v49

    if-ne v0, v1, :cond_32f

    const-wide/16 v48, 0x0

    cmpl-double v48, p1, v48

    if-lez v48, :cond_32f

    .line 1409
    div-double v48, v32, v18

    int-to-double v0, v13

    move-wide/from16 v50, v0

    mul-double v50, v50, v38

    add-double v8, v48, v50

    .line 1412
    :cond_32f
    move/from16 v0, v41

    float-to-double v0, v0

    move-wide/from16 v48, v0

    sub-double v24, v6, v48

    .line 1413
    .local v24, "dx":D
    move/from16 v0, v45

    float-to-double v0, v0

    move-wide/from16 v48, v0

    sub-double v26, v8, v48

    .line 1415
    .local v26, "dy":D
    const-wide/16 v48, 0x0

    cmpg-double v48, p1, v48

    if-gez v48, :cond_351

    .line 1416
    move/from16 v0, v40

    float-to-double v0, v0

    move-wide/from16 v48, v0

    sub-double v24, v6, v48

    .line 1417
    move/from16 v0, v44

    float-to-double v0, v0

    move-wide/from16 v48, v0

    sub-double v26, v8, v48

    .line 1420
    :cond_351
    mul-double v48, v24, v24

    mul-double v50, v26, v26

    add-double v48, v48, v50

    invoke-static/range {v48 .. v49}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v20

    .line 1421
    .local v20, "distance":D
    const-wide/high16 v48, 0x4000000000000000L

    mul-double v48, v48, v20

    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v50

    invoke-static/range {v50 .. v51}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v50

    invoke-static/range {v50 .. v51}, Ljava/lang/Math;->sin(D)D

    move-result-wide v50

    mul-double v10, v48, v50

    .line 1422
    .local v10, "amountNeededToGrow":D
    const/16 v48, 0x0

    aget v48, v37, v48

    const/16 v49, 0x2

    aget v49, v37, v49

    sub-float v48, v48, v49

    const/16 v49, 0x0

    aget v49, v37, v49

    const/16 v50, 0x2

    aget v50, v37, v50

    sub-float v49, v49, v50

    mul-float v48, v48, v49

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v48, v0

    invoke-static/range {v48 .. v49}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v20

    .line 1424
    const-wide/16 v48, 0x0

    cmpl-double v48, p1, v48

    if-eqz v48, :cond_3c4

    .line 1425
    add-double v48, v20, v10

    div-double v28, v48, v20

    .line 1426
    .local v28, "growthFactor":D
    const-wide/high16 v48, 0x3ff0000000000000L

    move-object/from16 v0, p0

    move-wide/from16 v1, v28

    move-wide/from16 v3, v48

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->isNumber(DD)D

    move-result-wide v28

    .line 1427
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    move-object/from16 v48, v0

    move-wide/from16 v0, v28

    double-to-float v0, v0

    move/from16 v49, v0

    move-wide/from16 v0, v28

    double-to-float v0, v0

    move/from16 v50, v0

    iget v0, v12, Landroid/graphics/PointF;->x:F

    move/from16 v51, v0

    iget v0, v12, Landroid/graphics/PointF;->y:F

    move/from16 v52, v0

    invoke-virtual/range {v48 .. v52}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 1486
    .end local v18    # "denominator2":D
    .end local v32    # "numerator2":D
    :goto_3bd
    move-wide/from16 v0, v28

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->prevGrowth:D

    .line 1487
    return-void

    .line 1430
    .end local v28    # "growthFactor":D
    .restart local v18    # "denominator2":D
    .restart local v32    # "numerator2":D
    :cond_3c4
    const-wide/high16 v28, 0x3ff0000000000000L

    .restart local v28    # "growthFactor":D
    goto :goto_3bd

    .line 1434
    .end local v6    # "aPx":D
    .end local v8    # "aPy":D
    .end local v10    # "amountNeededToGrow":D
    .end local v14    # "cosRad":D
    .end local v18    # "denominator2":D
    .end local v20    # "distance":D
    .end local v24    # "dx":D
    .end local v26    # "dy":D
    .end local v28    # "growthFactor":D
    .end local v32    # "numerator2":D
    .end local v37    # "testPoint":[F
    .end local v38    # "sinRad":D
    .end local v40    # "x1":F
    .end local v41    # "x2":F
    .end local v42    # "x3":F
    .end local v43    # "x4":F
    .end local v44    # "y1":F
    .end local v45    # "y2":F
    .end local v46    # "y3":F
    .end local v47    # "y4":F
    :cond_3c7
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v48

    invoke-static/range {v48 .. v49}, Ljava/lang/Math;->sin(D)D

    move-result-wide v38

    .line 1435
    .restart local v38    # "sinRad":D
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v48

    invoke-static/range {v48 .. v49}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    .line 1437
    .restart local v14    # "cosRad":D
    const/16 v48, 0x8

    move/from16 v0, v48

    new-array v0, v0, [F

    move-object/from16 v37, v0

    const/16 v48, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    add-double v50, v50, v52

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v36

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    sub-double v50, v50, v52

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    add-double v50, v50, v52

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->top:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v36

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    sub-double v50, v50, v52

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    add-double v50, v50, v52

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    int-to-double v0, v13

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    sub-double v50, v50, v52

    int-to-double v0, v13

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    add-double v50, v50, v52

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    const/16 v48, 0x7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v49, v0

    move/from16 v0, v49

    float-to-double v0, v0

    move-wide/from16 v50, v0

    int-to-double v0, v13

    move-wide/from16 v52, v0

    mul-double v52, v52, v38

    sub-double v50, v50, v52

    int-to-double v0, v13

    move-wide/from16 v52, v0

    mul-double v52, v52, v14

    add-double v50, v50, v52

    move-wide/from16 v0, v50

    double-to-float v0, v0

    move/from16 v49, v0

    aput v49, v37, v48

    .line 1448
    .restart local v37    # "testPoint":[F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 1450
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v48, v0

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v48, v0

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, v38

    add-double v48, v48, v50

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, v14

    add-double v48, v48, v50

    move-wide/from16 v0, v48

    double-to-float v0, v0

    move/from16 v40, v0

    .line 1451
    .restart local v40    # "x1":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v48, v0

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v48, v0

    int-to-double v0, v13

    move-wide/from16 v50, v0

    mul-double v50, v50, v38

    sub-double v48, v48, v50

    int-to-double v0, v13

    move-wide/from16 v50, v0

    mul-double v50, v50, v14

    add-double v48, v48, v50

    move-wide/from16 v0, v48

    double-to-float v0, v0

    move/from16 v44, v0

    .line 1452
    .restart local v44    # "y1":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v48, v0

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v48, v0

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, v38

    add-double v48, v48, v50

    move/from16 v0, v35

    int-to-double v0, v0

    move-wide/from16 v50, v0

    mul-double v50, v50, v14

    add-double v48, v48, v50

    move-wide/from16 v0, v48

    double-to-float v0, v0

    move/from16 v41, v0

    .line 1453
    .restart local v41    # "x2":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v48, v0

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v48, v0

    int-to-double v0, v13

    move-wide/from16 v50, v0

    mul-double v50, v50, v38

    sub-double v48, v48, v50

    int-to-double v0, v13

    move-wide/from16 v50, v0

    mul-double v50, v50, v14

    add-double v48, v48, v50

    move-wide/from16 v0, v48

    double-to-float v0, v0

    move/from16 v45, v0

    .line 1454
    .restart local v45    # "y2":F
    const/16 v48, 0x4

    aget v42, v37, v48

    .line 1455
    .restart local v42    # "x3":F
    const/16 v48, 0x5

    aget v46, v37, v48

    .line 1456
    .restart local v46    # "y3":F
    const/16 v48, 0x6

    aget v43, v37, v48

    .line 1457
    .restart local v43    # "x4":F
    const/16 v48, 0x7

    aget v47, v37, v48

    .line 1459
    .restart local v47    # "y4":F
    mul-float v48, v40, v45

    mul-float v49, v44, v41

    sub-float v48, v48, v49

    sub-float v49, v42, v43

    mul-float v48, v48, v49

    sub-float v49, v40, v41

    mul-float v50, v42, v47

    mul-float v51, v46, v43

    sub-float v50, v50, v51

    mul-float v49, v49, v50

    sub-float v48, v48, v49

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v30, v0

    .line 1460
    .local v30, "numerator1":D
    sub-float v48, v40, v41

    sub-float v49, v46, v47

    mul-float v48, v48, v49

    sub-float v49, v44, v45

    sub-float v50, v42, v43

    mul-float v49, v49, v50

    sub-float v48, v48, v49

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v16, v0

    .line 1462
    .local v16, "denominator1":D
    div-double v48, v30, v16

    move/from16 v0, v34

    int-to-double v0, v0

    move-wide/from16 v50, v0

    add-double v6, v48, v50

    .line 1463
    .restart local v6    # "aPx":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v48, v0

    move-object/from16 v0, v48

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v48, v0

    int-to-float v0, v13

    move/from16 v49, v0

    add-float v48, v48, v49

    move/from16 v0, v48

    float-to-double v8, v0

    .line 1464
    .restart local v8    # "aPy":D
    move/from16 v0, v40

    float-to-double v0, v0

    move-wide/from16 v48, v0

    sub-double v24, v6, v48

    .line 1465
    .restart local v24    # "dx":D
    move/from16 v0, v44

    float-to-double v0, v0

    move-wide/from16 v48, v0

    sub-double v26, v8, v48

    .line 1467
    .restart local v26    # "dy":D
    const-wide/16 v48, 0x0

    cmpg-double v48, p1, v48

    if-gez v48, :cond_659

    .line 1468
    move/from16 v0, v41

    float-to-double v0, v0

    move-wide/from16 v48, v0

    sub-double v24, v6, v48

    .line 1469
    move/from16 v0, v45

    float-to-double v0, v0

    move-wide/from16 v48, v0

    sub-double v26, v8, v48

    .line 1472
    :cond_659
    mul-double v48, v24, v24

    mul-double v50, v26, v26

    add-double v48, v48, v50

    invoke-static/range {v48 .. v49}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v20

    .line 1473
    .restart local v20    # "distance":D
    const-wide/high16 v48, 0x4000000000000000L

    mul-double v48, v48, v20

    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v50

    invoke-static/range {v50 .. v51}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v50

    invoke-static/range {v50 .. v51}, Ljava/lang/Math;->sin(D)D

    move-result-wide v50

    mul-double v10, v48, v50

    .line 1474
    .restart local v10    # "amountNeededToGrow":D
    const/16 v48, 0x5

    aget v48, v37, v48

    const/16 v49, 0x1

    aget v49, v37, v49

    sub-float v48, v48, v49

    const/16 v49, 0x5

    aget v49, v37, v49

    const/16 v50, 0x1

    aget v50, v37, v50

    sub-float v49, v49, v50

    mul-float v48, v48, v49

    move/from16 v0, v48

    float-to-double v0, v0

    move-wide/from16 v48, v0

    invoke-static/range {v48 .. v49}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v20

    .line 1476
    const-wide/16 v48, 0x0

    cmpl-double v48, p1, v48

    if-eqz v48, :cond_6c7

    .line 1477
    add-double v48, v20, v10

    div-double v28, v48, v20

    .line 1478
    .restart local v28    # "growthFactor":D
    const-wide/high16 v48, 0x3ff0000000000000L

    move-object/from16 v0, p0

    move-wide/from16 v1, v28

    move-wide/from16 v3, v48

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->isNumber(DD)D

    move-result-wide v28

    .line 1480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    move-object/from16 v48, v0

    move-wide/from16 v0, v28

    double-to-float v0, v0

    move/from16 v49, v0

    move-wide/from16 v0, v28

    double-to-float v0, v0

    move/from16 v50, v0

    iget v0, v12, Landroid/graphics/PointF;->x:F

    move/from16 v51, v0

    iget v0, v12, Landroid/graphics/PointF;->y:F

    move/from16 v52, v0

    invoke-virtual/range {v48 .. v52}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    goto/16 :goto_3bd

    .line 1482
    .end local v28    # "growthFactor":D
    :cond_6c7
    const-wide/high16 v28, 0x3ff0000000000000L

    .restart local v28    # "growthFactor":D
    goto/16 :goto_3bd
.end method

.method private updateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v2, -0x1

    .line 457
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_10

    .line 458
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 459
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 461
    :cond_10
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 462
    if-eqz p1, :cond_3c

    .line 463
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 464
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 465
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 467
    :cond_24
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLevel:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 468
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    .line 469
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    .line 470
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->applyColorMod()V

    .line 471
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->configureBounds()V

    .line 476
    :goto_3b
    return-void

    .line 473
    :cond_3c
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    .line 474
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    goto :goto_3b
.end method


# virtual methods
.method crop(FFDFFLandroid/graphics/PointF;Landroid/graphics/Canvas;)Landroid/graphics/RectF;
    .registers 32
    .param p1, "originalWidth"    # F
    .param p2, "originalHeight"    # F
    .param p3, "angle"    # D
    .param p5, "targetWidth"    # F
    .param p6, "targetHeight"    # F
    .param p7, "center"    # Landroid/graphics/PointF;
    .param p8, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1968
    invoke-static/range {p3 .. p4}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->radians(D)D

    move-result-wide v12

    .line 1970
    .local v12, "radians":D
    const/16 v17, 0x4

    move/from16 v0, v17

    new-array v10, v0, [Landroid/graphics/PointF;

    const/16 v17, 0x0

    new-instance v18, Landroid/graphics/PointF;

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v18 .. v20}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v18, v10, v17

    const/16 v17, 0x1

    new-instance v18, Landroid/graphics/PointF;

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move/from16 v1, p1

    move/from16 v2, v19

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v18, v10, v17

    const/16 v17, 0x2

    new-instance v18, Landroid/graphics/PointF;

    move-object/from16 v0, v18

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v18, v10, v17

    const/16 v17, 0x3

    new-instance v18, Landroid/graphics/PointF;

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, p2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v18, v10, v17

    .line 1974
    .local v10, "original":[Landroid/graphics/PointF;
    move/from16 v0, p1

    neg-float v0, v0

    move/from16 v17, v0

    const/high16 v18, 0x40000000

    div-float v17, v17, v18

    move/from16 v0, p2

    neg-float v0, v0

    move/from16 v18, v0

    const/high16 v19, 0x40000000

    div-float v18, v18, v19

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v10, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->translate([Landroid/graphics/PointF;FF)V

    .line 1976
    array-length v0, v10

    move/from16 v17, v0

    move/from16 v0, v17

    new-array v0, v0, [Landroid/graphics/PointF;

    move-object/from16 v16, v0

    .line 1977
    .local v16, "rotated":[Landroid/graphics/PointF;
    const/16 v17, 0x0

    const/16 v18, 0x0

    array-length v0, v10

    move/from16 v19, v0

    move/from16 v0, v17

    move-object/from16 v1, v16

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-static {v10, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1978
    move-object/from16 v0, v16

    invoke-static {v0, v12, v13}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->rotate([Landroid/graphics/PointF;D)V

    .line 1980
    const-wide/16 v18, 0x0

    cmpl-double v17, p3, v18

    if-ltz v17, :cond_21a

    .line 1981
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v14, v0, [Landroid/graphics/PointF;

    const/16 v17, 0x0

    new-instance v18, Landroid/graphics/PointF;

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v18 .. v20}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v18, v14, v17

    const/16 v17, 0x1

    new-instance v18, Landroid/graphics/PointF;

    move/from16 v0, p5

    neg-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x40000000

    div-float v19, v19, v20

    move/from16 v0, p6

    neg-float v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x40000000

    div-float v20, v20, v21

    invoke-direct/range {v18 .. v20}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v18, v14, v17

    .line 1982
    .local v14, "ray":[Landroid/graphics/PointF;
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v4, v0, [Landroid/graphics/PointF;

    const/16 v17, 0x0

    const/16 v18, 0x0

    aget-object v18, v16, v18

    aput-object v18, v4, v17

    const/16 v17, 0x1

    const/16 v18, 0x3

    aget-object v18, v16, v18

    aput-object v18, v4, v17

    .line 1985
    .local v4, "bound":[Landroid/graphics/PointF;
    invoke-static {v14, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->intersection([Landroid/graphics/PointF;[Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v7

    .line 1987
    .local v7, "intersectTL":Landroid/graphics/PointF;
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v15, v0, [Landroid/graphics/PointF;

    const/16 v17, 0x0

    new-instance v18, Landroid/graphics/PointF;

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v18 .. v20}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v18, v15, v17

    const/16 v17, 0x1

    new-instance v18, Landroid/graphics/PointF;

    const/high16 v19, 0x40000000

    div-float v19, p5, v19

    move/from16 v0, p6

    neg-float v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x40000000

    div-float v20, v20, v21

    invoke-direct/range {v18 .. v20}, Landroid/graphics/PointF;-><init>(FF)V

    aput-object v18, v15, v17

    .line 1988
    .local v15, "ray2":[Landroid/graphics/PointF;
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v5, v0, [Landroid/graphics/PointF;

    const/16 v17, 0x0

    const/16 v18, 0x0

    aget-object v18, v16, v18

    aput-object v18, v5, v17

    const/16 v17, 0x1

    const/16 v18, 0x1

    aget-object v18, v16, v18

    aput-object v18, v5, v17

    .line 1991
    .local v5, "bound2":[Landroid/graphics/PointF;
    invoke-static {v15, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->intersection([Landroid/graphics/PointF;[Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v8

    .line 1994
    .local v8, "intersectTR":Landroid/graphics/PointF;
    new-instance v6, Landroid/graphics/PointF;

    iget v0, v7, Landroid/graphics/PointF;->x:F

    move/from16 v17, v0

    iget v0, v8, Landroid/graphics/PointF;->x:F

    move/from16 v18, v0

    move/from16 v0, v18

    neg-float v0, v0

    move/from16 v18, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(FF)F

    move-result v17

    iget v0, v7, Landroid/graphics/PointF;->y:F

    move/from16 v18, v0

    iget v0, v8, Landroid/graphics/PointF;->y:F

    move/from16 v19, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->max(FF)F

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v6, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 1996
    .local v6, "intersect":Landroid/graphics/PointF;
    new-instance v9, Landroid/graphics/RectF;

    iget v0, v6, Landroid/graphics/PointF;->x:F

    move/from16 v17, v0

    iget v0, v6, Landroid/graphics/PointF;->y:F

    move/from16 v18, v0

    iget v0, v6, Landroid/graphics/PointF;->x:F

    move/from16 v19, v0

    move/from16 v0, v19

    neg-float v0, v0

    move/from16 v19, v0

    iget v0, v6, Landroid/graphics/PointF;->y:F

    move/from16 v20, v0

    move/from16 v0, v20

    neg-float v0, v0

    move/from16 v20, v0

    move/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-direct {v9, v0, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 1997
    .local v9, "newRect":Landroid/graphics/RectF;
    move-object/from16 v0, p7

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v17, v0

    move-object/from16 v0, p7

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v9, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    .line 1999
    if-eqz p8, :cond_219

    .line 2001
    move-object/from16 v0, p7

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v17, v0

    move-object/from16 v0, p7

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v18, v0

    invoke-static/range {v16 .. v18}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->translate([Landroid/graphics/PointF;FF)V

    .line 2002
    move-object/from16 v0, p7

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v17, v0

    move-object/from16 v0, p7

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->translate([Landroid/graphics/PointF;FF)V

    .line 2003
    move-object/from16 v0, p7

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v17, v0

    move-object/from16 v0, p7

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v15, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->translate([Landroid/graphics/PointF;FF)V

    .line 2005
    new-instance v11, Landroid/graphics/Paint;

    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-direct {v11, v0}, Landroid/graphics/Paint;-><init>(I)V

    .line 2006
    .local v11, "paint":Landroid/graphics/Paint;
    const v17, 0x66ffff00

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 2007
    sget-object v17, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 2008
    const/high16 v17, 0x40000000

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 2010
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p8

    invoke-virtual {v0, v1, v2, v11}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->drawRect([Landroid/graphics/PointF;Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 2012
    const v17, -0xff0100

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 2013
    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-virtual {v0, v14, v1, v11}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->drawLine([Landroid/graphics/PointF;Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 2015
    const v17, -0xffff01

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 2016
    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-virtual {v0, v15, v1, v11}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->drawLine([Landroid/graphics/PointF;Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 2018
    const v17, -0xff0001

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 2019
    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-virtual {v0, v4, v1, v11}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->drawLine([Landroid/graphics/PointF;Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 2021
    const/16 v17, -0x1

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 2022
    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-virtual {v0, v5, v1, v11}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->drawLine([Landroid/graphics/PointF;Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 2024
    const v17, -0x777778

    move/from16 v0, v17

    invoke-virtual {v11, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 2025
    move-object/from16 v0, p8

    invoke-virtual {v0, v9, v11}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 2027
    .end local v11    # "paint":Landroid/graphics/Paint;
    :cond_219
    return-object v9

    .line 2030
    .end local v4    # "bound":[Landroid/graphics/PointF;
    .end local v5    # "bound2":[Landroid/graphics/PointF;
    .end local v6    # "intersect":Landroid/graphics/PointF;
    .end local v7    # "intersectTL":Landroid/graphics/PointF;
    .end local v8    # "intersectTR":Landroid/graphics/PointF;
    .end local v9    # "newRect":Landroid/graphics/RectF;
    .end local v14    # "ray":[Landroid/graphics/PointF;
    .end local v15    # "ray2":[Landroid/graphics/PointF;
    :cond_21a
    new-instance v17, Ljava/lang/IllegalArgumentException;

    const-string v18, "angle cannot be < 0"

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17
.end method

.method drawLine([Landroid/graphics/PointF;Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 10
    .param p1, "line"    # [Landroid/graphics/PointF;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/4 v4, 0x1

    const/4 v2, 0x0

    .line 2046
    aget-object v0, p1, v2

    iget v1, v0, Landroid/graphics/PointF;->x:F

    aget-object v0, p1, v2

    iget v2, v0, Landroid/graphics/PointF;->y:F

    aget-object v0, p1, v4

    iget v3, v0, Landroid/graphics/PointF;->x:F

    aget-object v0, p1, v4

    iget v4, v0, Landroid/graphics/PointF;->y:F

    move-object v0, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 2047
    return-void
.end method

.method drawRect([Landroid/graphics/PointF;Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 11
    .param p1, "rect"    # [Landroid/graphics/PointF;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2036
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 2037
    .local v0, "path":Landroid/graphics/Path;
    aget-object v1, p1, v3

    iget v1, v1, Landroid/graphics/PointF;->x:F

    aget-object v2, p1, v3

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 2038
    aget-object v1, p1, v4

    iget v1, v1, Landroid/graphics/PointF;->x:F

    aget-object v2, p1, v4

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2039
    aget-object v1, p1, v5

    iget v1, v1, Landroid/graphics/PointF;->x:F

    aget-object v2, p1, v5

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2040
    aget-object v1, p1, v6

    iget v1, v1, Landroid/graphics/PointF;->x:F

    aget-object v2, p1, v6

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2041
    aget-object v1, p1, v3

    iget v1, v1, Landroid/graphics/PointF;->x:F

    aget-object v2, p1, v3

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 2042
    invoke-virtual {p2, v0, p3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 2043
    return-void
.end method

.method protected drawableStateChanged()V
    .registers 3

    .prologue
    .line 1694
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 1695
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 1696
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 1697
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 1699
    :cond_14
    return-void
.end method

.method protected fadeInGrid(I)V
    .registers 6
    .param p1, "durationMs"    # I

    .prologue
    .line 1310
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

    if-eqz v0, :cond_9

    .line 1311
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    .line 1313
    :cond_9
    const-string v0, "gridAlpha"

    const/4 v1, 0x2

    new-array v1, v1, [I

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getAlpha()I

    move-result v3

    aput v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesAlpha:I

    aput v3, v1, v2

    invoke-static {p0, v0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

    .line 1314
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 1315
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 1316
    return-void
.end method

.method protected fadeInOutlines(II)V
    .registers 12
    .param p1, "durationMs"    # I
    .param p2, "delay"    # I

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v1, 0x0

    .line 1325
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeOutlinesAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    if-eqz v0, :cond_c

    .line 1326
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeOutlinesAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/AnimatorSet;->cancel()V

    .line 1329
    :cond_c
    new-instance v0, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeOutlinesAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    .line 1330
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeOutlinesAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    int-to-long v2, p2

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/AnimatorSet;->setStartDelay(J)V

    .line 1331
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeOutlinesAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    const/4 v0, 0x3

    new-array v3, v0, [Lcom/nineoldandroids/animation/Animator;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    const-string v5, "alpha"

    new-array v6, v8, [I

    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_19:Z

    if-eqz v0, :cond_75

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    .line 1332
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result v0

    :goto_2e
    aput v0, v6, v1

    const/16 v0, 0xff

    aput v0, v6, v7

    invoke-static {v4, v5, v6}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    aput-object v0, v3, v1

    const-string v0, "outlineFillAlpha"

    new-array v4, v8, [I

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    .line 1333
    invoke-virtual {v5}, Landroid/graphics/Paint;->getAlpha()I

    move-result v5

    aput v5, v4, v1

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFillAlpha:I

    aput v5, v4, v7

    invoke-static {p0, v0, v4}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    aput-object v0, v3, v7

    const-string v0, "outlinePaintAlpha"

    new-array v4, v8, [I

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    .line 1334
    invoke-virtual {v5}, Landroid/graphics/Paint;->getAlpha()I

    move-result v5

    aput v5, v4, v1

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaintAlpha:I

    aput v1, v4, v7

    invoke-static {p0, v0, v4}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    aput-object v0, v3, v8

    .line 1331
    invoke-virtual {v2, v3}, Lcom/nineoldandroids/animation/AnimatorSet;->playTogether([Lcom/nineoldandroids/animation/Animator;)V

    .line 1336
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeOutlinesAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/AnimatorSet;->setDuration(J)Lcom/nineoldandroids/animation/AnimatorSet;

    .line 1337
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeOutlinesAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/AnimatorSet;->start()V

    .line 1338
    return-void

    :cond_75
    move v0, v1

    .line 1332
    goto :goto_2e
.end method

.method protected fadeOutGrid(I)V
    .registers 6
    .param p1, "durationMs"    # I

    .prologue
    const/4 v3, 0x0

    .line 1296
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

    if-eqz v0, :cond_a

    .line 1297
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    .line 1299
    :cond_a
    const-string v0, "gridAlpha"

    const/4 v1, 0x2

    new-array v1, v1, [I

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getAlpha()I

    move-result v2

    aput v2, v1, v3

    const/4 v2, 0x1

    aput v3, v1, v2

    invoke-static {p0, v0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

    .line 1300
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 1301
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFadeAnimator:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 1302
    return-void
.end method

.method public flip(Z)V
    .registers 4
    .param p1, "horizontal"    # Z

    .prologue
    .line 889
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAnimationDuration:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->flip(ZJ)V

    .line 890
    return-void
.end method

.method protected flip(ZJ)V
    .registers 4
    .param p1, "horizontal"    # Z
    .param p2, "durationMs"    # J

    .prologue
    .line 893
    invoke-virtual {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->flipTo(ZJ)V

    .line 894
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->hideOutlines()V

    .line 895
    return-void
.end method

.method protected flipTo(ZJ)V
    .registers 14
    .param p1, "horizontal"    # Z
    .param p2, "durationMs"    # J

    .prologue
    const/4 v9, 0x1

    .line 898
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    if-eqz v0, :cond_d

    .line 899
    const-string v0, "rotate"

    const-string v1, "still running!.."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 994
    :cond_c
    :goto_c
    return-void

    .line 903
    :cond_d
    iput-boolean v9, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    .line 905
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingRight()I

    move-result v1

    sub-int v8, v0, v1

    .line 906
    .local v8, "vwidth":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingBottom()I

    move-result v1

    sub-int v7, v0, v1

    .line 907
    .local v7, "vheight":I
    div-int/lit8 v0, v8, 0x2

    int-to-float v4, v0

    .line 908
    .local v4, "centerx":F
    div-int/lit8 v0, v7, 0x2

    int-to-float v5, v0

    .line 910
    .local v5, "centery":F
    new-instance v2, Landroid/graphics/Camera;

    invoke-direct {v2}, Landroid/graphics/Camera;-><init>()V

    .line 912
    .local v2, "camera":Landroid/graphics/Camera;
    const/4 v0, 0x2

    new-array v1, v0, [F

    const/4 v3, 0x0

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCameraEnabled:Z

    if-eqz v0, :cond_82

    const/4 v0, 0x0

    :goto_41
    aput v0, v1, v3

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCameraEnabled:Z

    if-eqz v0, :cond_85

    const/high16 v0, 0x43340000

    :goto_49
    aput v0, v1, v9

    invoke-static {v1}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v6

    .line 913
    .local v6, "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;

    move-object v1, p0

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;Landroid/graphics/Camera;ZFF)V

    invoke-virtual {v6, v0}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 941
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;

    invoke-direct {v0, p0, p1, v4, v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;ZFF)V

    invoke-virtual {v6, v0}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 985
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->INOUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;-><init>(Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;)V

    invoke-virtual {v6, v0}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 986
    invoke-virtual {v6, p2, p3}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 987
    invoke-virtual {v6}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 989
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenStarted:Z

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->isReset:Z

    if-nez v0, :cond_c

    .line 990
    iput-boolean v9, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    .line 991
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resetStraighten()V

    .line 992
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    goto :goto_c

    .line 912
    .end local v6    # "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    :cond_82
    const/high16 v0, 0x3f800000

    goto :goto_41

    :cond_85
    const/high16 v0, -0x40800000

    goto :goto_49
.end method

.method public getBaseline()I
    .registers 2

    .prologue
    .line 1720
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mBaselineAlignBottom:Z

    if-eqz v0, :cond_9

    .line 1721
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getMeasuredHeight()I

    move-result v0

    .line 1723
    :goto_8
    return v0

    :cond_9
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mBaseline:I

    goto :goto_8
.end method

.method public getBaselineAlignBottom()Z
    .registers 2

    .prologue
    .line 746
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mBaselineAlignBottom:Z

    return v0
.end method

.method public getCurrentRotation()D
    .registers 3

    .prologue
    .line 1017
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    return-wide v0
.end method

.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 373
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getFlipType()I
    .registers 2

    .prologue
    .line 1035
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    return v0
.end method

.method public getGridAlpha()I
    .registers 2

    .prologue
    .line 696
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getGrowthFactor()D
    .registers 3

    .prologue
    .line 250
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->prevGrowth:D

    return-wide v0
.end method

.method public getHorizontalFlip()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 1021
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_NONE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    if-eq v1, v2, :cond_17

    .line 1022
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_HORIZONTAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    and-int/2addr v1, v2

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_HORIZONTAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    if-ne v1, v2, :cond_17

    const/4 v0, 0x1

    .line 1024
    :cond_17
    return v0
.end method

.method public getImageMatrix()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 673
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method protected getMatrixScale(Landroid/graphics/Matrix;)[F
    .registers 5
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v2, 0x0

    .line 593
    const/4 v1, 0x2

    new-array v0, v1, [F

    .line 594
    .local v0, "result":[F
    invoke-virtual {p0, p1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getValue(Landroid/graphics/Matrix;I)F

    move-result v1

    aput v1, v0, v2

    .line 595
    const/4 v1, 0x1

    const/4 v2, 0x4

    invoke-virtual {p0, p1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getValue(Landroid/graphics/Matrix;I)F

    move-result v2

    aput v2, v0, v1

    .line 596
    return-object v0
.end method

.method public getOutlineFillAlpha()I
    .registers 2

    .prologue
    .line 705
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getOutlinePaintAlpha()I
    .registers 2

    .prologue
    .line 714
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getRotation()F
    .registers 3

    .prologue
    .line 1498
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    double-to-float v0, v0

    return v0
.end method

.method public getScaleType()Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;
    .registers 2

    .prologue
    .line 645
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    return-object v0
.end method

.method public getStraightenAngle()D
    .registers 3

    .prologue
    .line 254
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->previousStraightenAngle:D

    return-wide v0
.end method

.method public getStraightenStarted()Z
    .registers 2

    .prologue
    .line 804
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenStarted:Z

    return v0
.end method

.method protected getValue(Landroid/graphics/Matrix;I)F
    .registers 4
    .param p1, "matrix"    # Landroid/graphics/Matrix;
    .param p2, "whichValue"    # I

    .prologue
    .line 604
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 605
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrixValues:[F

    aget v0, v0, p2

    return v0
.end method

.method public getVerticalFlip()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 1028
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_NONE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    if-eq v1, v2, :cond_17

    .line 1029
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_VERTICAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    and-int/2addr v1, v2

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_VERTICAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    if-ne v1, v2, :cond_17

    const/4 v0, 0x1

    .line 1031
    :cond_17
    return v0
.end method

.method protected hideOutlines()V
    .registers 1

    .prologue
    .line 743
    return-void
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "dr"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 1680
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_8

    .line 1681
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 1685
    :goto_7
    return-void

    .line 1683
    :cond_8
    invoke-super {p0, p1}, Landroid/view/View;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_7
.end method

.method protected isNumber(DD)D
    .registers 8
    .param p1, "number"    # D
    .param p3, "defaultValue"    # D

    .prologue
    .line 1490
    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 1491
    :cond_c
    const-string v0, "rotate"

    const-string v1, "number is NaN or Infinite"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-wide p1, p3

    .line 1494
    .end local p1    # "number":D
    :cond_14
    return-wide p1
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    const/4 v1, 0x1

    .line 1099
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->orientation:I

    .line 1100
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    .line 1101
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCenter:Landroid/graphics/PointF;

    .line 1102
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 1103
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenStarted:Z

    if-eqz v0, :cond_21

    .line 1104
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    .line 1105
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resetStraighten()V

    .line 1106
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 1108
    :cond_21
    return-void
.end method

.method public onCreateDrawableState(I)[I
    .registers 4
    .param p1, "extraSpace"    # I

    .prologue
    .line 1703
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mState:[I

    if-nez v0, :cond_9

    .line 1704
    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object v0

    .line 1708
    :goto_8
    return-object v0

    .line 1705
    :cond_9
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMergeState:Z

    if-nez v0, :cond_10

    .line 1706
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mState:[I

    goto :goto_8

    .line 1708
    :cond_10
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mState:[I

    array-length v0, v0

    add-int/2addr v0, p1

    invoke-super {p0, v0}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mState:[I

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mergeDrawableStates([I[I)[I

    move-result-object v0

    goto :goto_8
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 26
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1504
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 1506
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_11

    .line 1507
    const-string v3, "rotate"

    const-string v4, "Drawable is null"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1649
    :cond_10
    :goto_10
    return-void

    .line 1511
    :cond_11
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    if-eqz v3, :cond_1d

    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    if-nez v3, :cond_25

    .line 1512
    :cond_1d
    const-string v3, "rotate"

    const-string v4, "drawable width or height is 0"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_10

    .line 1516
    :cond_25
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingTop()I

    move-result v15

    .line 1517
    .local v15, "mPaddingTop":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingLeft()I

    move-result v14

    .line 1521
    .local v14, "mPaddingLeft":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    if-nez v3, :cond_44

    .line 1522
    const-string v3, "rotate"

    const-string v4, "mDrawMatrix is null"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1523
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_10

    .line 1527
    :cond_44
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v19

    .line 1529
    .local v19, "saveCount":I
    int-to-float v3, v14

    int-to-float v4, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1531
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;

    if-eqz v3, :cond_5e

    .line 1532
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1534
    :cond_5e
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    if-eqz v3, :cond_6d

    .line 1535
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1537
    :cond_6d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    if-eqz v3, :cond_7c

    .line 1538
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1540
    :cond_7c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    if-eqz v3, :cond_8b

    .line 1541
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1544
    :cond_8b
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1547
    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 1549
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mEnableFreeRotate:Z

    if-eqz v3, :cond_10

    .line 1551
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getImageRect()Landroid/graphics/RectF;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawRect:Landroid/graphics/RectF;

    .line 1553
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewDrawRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 1555
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mClipPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 1556
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mInversePath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 1557
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 1559
    const/16 v3, 0x8

    new-array v0, v3, [F

    move-object/from16 v16, v0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    aput v4, v16, v3

    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    aput v4, v16, v3

    const/4 v3, 0x2

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    aput v4, v16, v3

    const/4 v3, 0x3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    aput v4, v16, v3

    const/4 v3, 0x4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    aput v4, v16, v3

    const/4 v3, 0x5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    aput v4, v16, v3

    const/4 v3, 0x6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    aput v4, v16, v3

    const/4 v3, 0x7

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    aput v4, v16, v3

    .line 1564
    .local v16, "points":[F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 1565
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 1566
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 1567
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mTempMatrix:Landroid/graphics/Matrix;

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 1569
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewInvertRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 1570
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewInvertRect:Landroid/graphics/RectF;

    iget v4, v3, Landroid/graphics/RectF;->top:F

    int-to-float v5, v14

    sub-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/RectF;->top:F

    .line 1571
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewInvertRect:Landroid/graphics/RectF;

    iget v4, v3, Landroid/graphics/RectF;->left:F

    int-to-float v5, v15

    sub-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/RectF;->left:F

    .line 1573
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mInversePath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewInvertRect:Landroid/graphics/RectF;

    sget-object v5, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 1575
    const/4 v3, 0x2

    aget v3, v16, v3

    const/4 v4, 0x3

    aget v4, v16, v4

    const/4 v5, 0x0

    aget v5, v16, v5

    const/4 v8, 0x1

    aget v8, v16, v8

    invoke-static {v3, v4, v5, v8}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->distance(FFFF)D

    move-result-wide v20

    .line 1576
    .local v20, "sx":D
    const/4 v3, 0x6

    aget v3, v16, v3

    const/4 v4, 0x7

    aget v4, v16, v4

    const/4 v5, 0x0

    aget v5, v16, v5

    const/4 v8, 0x1

    aget v8, v16, v8

    invoke-static {v3, v4, v5, v8}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->distance(FFFF)D

    move-result-wide v22

    .line 1577
    .local v22, "sy":D
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    invoke-static {v4, v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getAngle90(D)D

    move-result-wide v6

    .line 1580
    .local v6, "angle":D
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    if-eqz v3, :cond_2f5

    .line 1582
    const-wide v4, 0x4046800000000000L

    cmpg-double v3, v6, v4

    if-gez v3, :cond_201

    .line 1583
    move-wide/from16 v0, v20

    double-to-float v4, v0

    move-wide/from16 v0, v22

    double-to-float v5, v0

    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    int-to-float v8, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    int-to-float v9, v3

    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v10

    const/4 v11, 0x0

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v11}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->crop(FFDFFLandroid/graphics/PointF;Landroid/graphics/Canvas;)Landroid/graphics/RectF;

    move-result-object v17

    .line 1588
    .local v17, "rect":Landroid/graphics/RectF;
    :goto_1bd
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->height()F

    move-result v3

    const/high16 v4, 0x41000000

    div-float v12, v3, v4

    .line 1589
    .local v12, "colStep":F
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->width()F

    move-result v3

    const/high16 v4, 0x41000000

    div-float v18, v3, v4

    .line 1591
    .local v18, "rowStep":F
    const/4 v13, 0x1

    .local v13, "i":I
    :goto_1ce
    const/16 v3, 0x8

    if-ge v13, v3, :cond_21d

    .line 1592
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    move-object/from16 v0, v17

    iget v4, v0, Landroid/graphics/RectF;->left:F

    float-to-int v4, v4

    int-to-float v4, v4

    move-object/from16 v0, v17

    iget v5, v0, Landroid/graphics/RectF;->top:F

    int-to-float v8, v13

    mul-float/2addr v8, v12

    add-float/2addr v5, v8

    float-to-int v5, v5

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1593
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    move-object/from16 v0, v17

    iget v4, v0, Landroid/graphics/RectF;->right:F

    float-to-int v4, v4

    int-to-float v4, v4

    move-object/from16 v0, v17

    iget v5, v0, Landroid/graphics/RectF;->top:F

    int-to-float v8, v13

    mul-float/2addr v8, v12

    add-float/2addr v5, v8

    float-to-int v5, v5

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1591
    add-int/lit8 v13, v13, 0x1

    goto :goto_1ce

    .line 1585
    .end local v12    # "colStep":F
    .end local v13    # "i":I
    .end local v17    # "rect":Landroid/graphics/RectF;
    .end local v18    # "rowStep":F
    :cond_201
    move-wide/from16 v0, v20

    double-to-float v4, v0

    move-wide/from16 v0, v22

    double-to-float v5, v0

    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    int-to-float v8, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    int-to-float v9, v3

    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v10

    const/4 v11, 0x0

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v11}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->crop(FFDFFLandroid/graphics/PointF;Landroid/graphics/Canvas;)Landroid/graphics/RectF;

    move-result-object v17

    .restart local v17    # "rect":Landroid/graphics/RectF;
    goto :goto_1bd

    .line 1596
    .restart local v12    # "colStep":F
    .restart local v13    # "i":I
    .restart local v18    # "rowStep":F
    :cond_21d
    const/4 v13, 0x1

    :goto_21e
    const/16 v3, 0x8

    if-ge v13, v3, :cond_253

    .line 1597
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    move-object/from16 v0, v17

    iget v4, v0, Landroid/graphics/RectF;->left:F

    int-to-float v5, v13

    mul-float v5, v5, v18

    add-float/2addr v4, v5

    float-to-int v4, v4

    int-to-float v4, v4

    move-object/from16 v0, v17

    iget v5, v0, Landroid/graphics/RectF;->top:F

    float-to-int v5, v5

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1598
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    move-object/from16 v0, v17

    iget v4, v0, Landroid/graphics/RectF;->left:F

    int-to-float v5, v13

    mul-float v5, v5, v18

    add-float/2addr v4, v5

    float-to-int v4, v4

    int-to-float v4, v4

    move-object/from16 v0, v17

    iget v5, v0, Landroid/graphics/RectF;->bottom:F

    float-to-int v5, v5

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1596
    add-int/lit8 v13, v13, 0x1

    goto :goto_21e

    .line 1600
    :cond_253
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    .line 1602
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v2

    .line 1603
    .local v2, "center":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    iget v4, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget v5, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleWidth:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    float-to-int v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    move-object/from16 v0, p0

    iget v8, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleHeight:I

    int-to-float v8, v8

    sub-float/2addr v5, v8

    float-to-int v5, v5

    iget v8, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget v9, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleWidth:I

    int-to-float v9, v9

    add-float/2addr v8, v9

    float-to-int v8, v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    move-object/from16 v0, p0

    iget v10, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleHeight:I

    int-to-float v10, v10

    add-float/2addr v9, v10

    float-to-int v9, v9

    invoke-virtual {v3, v4, v5, v8, v9}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1608
    iget v3, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iput v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    .line 1609
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    .line 1627
    .end local v2    # "center":Landroid/graphics/PointF;
    :cond_29b
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mClipPath:Landroid/graphics/Path;

    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move-object/from16 v0, v17

    invoke-virtual {v3, v0, v4}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 1629
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mInversePath:Landroid/graphics/Path;

    sget-object v4, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    move-object/from16 v0, v17

    invoke-virtual {v3, v0, v4}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 1632
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v19

    .line 1634
    int-to-float v3, v14

    int-to-float v4, v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1636
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mInversePath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1637
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1638
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mClipPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1641
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1645
    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto/16 :goto_10

    .line 1611
    .end local v12    # "colStep":F
    .end local v13    # "i":I
    .end local v17    # "rect":Landroid/graphics/RectF;
    .end local v18    # "rowStep":F
    :cond_2f5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v17, v0

    .line 1612
    .restart local v17    # "rect":Landroid/graphics/RectF;
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->height()F

    move-result v3

    const/high16 v4, 0x41000000

    div-float v12, v3, v4

    .line 1613
    .restart local v12    # "colStep":F
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->width()F

    move-result v3

    const/high16 v4, 0x41000000

    div-float v18, v3, v4

    .line 1615
    .restart local v18    # "rowStep":F
    const/4 v13, 0x1

    .restart local v13    # "i":I
    :goto_30c
    const/16 v3, 0x8

    if-ge v13, v3, :cond_33f

    .line 1616
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    move-object/from16 v0, v17

    iget v4, v0, Landroid/graphics/RectF;->left:F

    float-to-int v4, v4

    int-to-float v4, v4

    move-object/from16 v0, v17

    iget v5, v0, Landroid/graphics/RectF;->top:F

    int-to-float v8, v13

    mul-float/2addr v8, v12

    add-float/2addr v5, v8

    float-to-int v5, v5

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1617
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    move-object/from16 v0, v17

    iget v4, v0, Landroid/graphics/RectF;->right:F

    float-to-int v4, v4

    int-to-float v4, v4

    move-object/from16 v0, v17

    iget v5, v0, Landroid/graphics/RectF;->top:F

    int-to-float v8, v13

    mul-float/2addr v8, v12

    add-float/2addr v5, v8

    float-to-int v5, v5

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1615
    add-int/lit8 v13, v13, 0x1

    goto :goto_30c

    .line 1620
    :cond_33f
    const/4 v13, 0x1

    :goto_340
    const/16 v3, 0x8

    if-ge v13, v3, :cond_29b

    .line 1621
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    move-object/from16 v0, v17

    iget v4, v0, Landroid/graphics/RectF;->left:F

    int-to-float v5, v13

    mul-float v5, v5, v18

    add-float/2addr v4, v5

    float-to-int v4, v4

    int-to-float v4, v4

    move-object/from16 v0, v17

    iget v5, v0, Landroid/graphics/RectF;->top:F

    float-to-int v5, v5

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1622
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPath:Landroid/graphics/Path;

    move-object/from16 v0, v17

    iget v4, v0, Landroid/graphics/RectF;->left:F

    int-to-float v5, v13

    mul-float v5, v5, v18

    add-float/2addr v4, v5

    float-to-int v4, v4

    int-to-float v4, v4

    move-object/from16 v0, v17

    iget v5, v0, Landroid/graphics/RectF;->bottom:F

    float-to-int v5, v5

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1620
    add-int/lit8 v13, v13, 0x1

    goto :goto_340
.end method

.method protected onLayout(ZIIII)V
    .registers 12
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 1653
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 1655
    if-eqz p1, :cond_32

    .line 1656
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mHaveFrame:Z

    .line 1658
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    .line 1659
    .local v2, "oldRotation":D
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getHorizontalFlip()Z

    move-result v0

    .line 1660
    .local v0, "flipH":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getVerticalFlip()Z

    move-result v1

    .line 1662
    .local v1, "flipV":Z
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->configureBounds()V

    .line 1664
    if-nez v0, :cond_19

    if-eqz v1, :cond_1c

    .line 1665
    :cond_19
    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->flip(ZZ)V

    .line 1668
    :cond_1c
    const-wide/16 v4, 0x0

    cmpl-double v4, v2, v4

    if-eqz v4, :cond_28

    .line 1669
    const/4 v4, 0x0

    invoke-direct {p0, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setImageRotation(DZ)V

    .line 1670
    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    .line 1673
    :cond_28
    const/16 v4, 0x190

    const/16 v5, 0x12c

    invoke-virtual {p0, v4, v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->fadeInOutlines(II)V

    .line 1674
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 1676
    .end local v0    # "flipH":Z
    .end local v1    # "flipV":Z
    .end local v2    # "oldRotation":D
    :cond_32
    return-void
.end method

.method protected onMeasure(II)V
    .registers 29
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1730
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resolveUri()V

    .line 1735
    const/4 v5, 0x0

    .line 1738
    .local v5, "desiredAspect":F
    const/16 v17, 0x0

    .line 1741
    .local v17, "resizeWidth":Z
    const/16 v16, 0x0

    .line 1743
    .local v16, "resizeHeight":Z
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v20

    .line 1744
    .local v20, "widthSpecMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v9

    .line 1746
    .local v9, "heightSpecMode":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v21, v0

    if-nez v21, :cond_da

    .line 1748
    const/16 v21, -0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    .line 1749
    const/16 v21, -0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    .line 1750
    const/16 v18, 0x0

    .line 1751
    .local v18, "w":I
    const/4 v7, 0x0

    .line 1779
    .local v7, "h":I
    :cond_2b
    :goto_2b
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingLeft()I

    move-result v13

    .line 1780
    .local v13, "pleft":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingRight()I

    move-result v14

    .line 1781
    .local v14, "pright":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingTop()I

    move-result v15

    .line 1782
    .local v15, "ptop":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingBottom()I

    move-result v12

    .line 1787
    .local v12, "pbottom":I
    if-nez v17, :cond_3f

    if-eqz v16, :cond_145

    .line 1794
    :cond_3f
    add-int v21, v18, v13

    add-int v21, v21, v14

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMaxWidth:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resolveAdjustedSize(III)I

    move-result v19

    .line 1797
    .local v19, "widthSize":I
    add-int v21, v7, v15

    add-int v21, v21, v12

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMaxHeight:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, p2

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resolveAdjustedSize(III)I

    move-result v8

    .line 1799
    .local v8, "heightSize":I
    const/16 v21, 0x0

    cmpl-float v21, v5, v21

    if-eqz v21, :cond_d2

    .line 1801
    sub-int v21, v19, v13

    sub-int v21, v21, v14

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    sub-int v22, v8, v15

    sub-int v22, v22, v12

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    div-float v4, v21, v22

    .line 1804
    .local v4, "actualAspect":F
    sub-float v21, v4, v5

    invoke-static/range {v21 .. v21}, Ljava/lang/Math;->abs(F)F

    move-result v21

    move/from16 v0, v21

    float-to-double v0, v0

    move-wide/from16 v22, v0

    const-wide v24, 0x3e7ad7f29abcaf48L

    cmpl-double v21, v22, v24

    if-lez v21, :cond_d2

    .line 1807
    const/4 v6, 0x0

    .line 1810
    .local v6, "done":Z
    if-eqz v17, :cond_b7

    .line 1811
    sub-int v21, v8, v15

    sub-int v21, v21, v12

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    mul-float v21, v21, v5

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    add-int v21, v21, v13

    add-int v11, v21, v14

    .line 1812
    .local v11, "newWidth":I
    move/from16 v0, v19

    if-gt v11, v0, :cond_b7

    .line 1813
    move/from16 v19, v11

    .line 1814
    const/4 v6, 0x1

    .line 1819
    .end local v11    # "newWidth":I
    :cond_b7
    if-nez v6, :cond_d2

    if-eqz v16, :cond_d2

    .line 1820
    sub-int v21, v19, v13

    sub-int v21, v21, v14

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v21, v21, v5

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    add-int v21, v21, v15

    add-int v10, v21, v12

    .line 1821
    .local v10, "newHeight":I
    if-gt v10, v8, :cond_d2

    .line 1822
    move v8, v10

    .line 1842
    .end local v4    # "actualAspect":F
    .end local v6    # "done":Z
    .end local v10    # "newHeight":I
    :cond_d2
    :goto_d2
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setMeasuredDimension(II)V

    .line 1845
    return-void

    .line 1753
    .end local v7    # "h":I
    .end local v8    # "heightSize":I
    .end local v12    # "pbottom":I
    .end local v13    # "pleft":I
    .end local v14    # "pright":I
    .end local v15    # "ptop":I
    .end local v18    # "w":I
    .end local v19    # "widthSize":I
    :cond_da
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    move/from16 v18, v0

    .line 1754
    .restart local v18    # "w":I
    move-object/from16 v0, p0

    iget v7, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    .line 1756
    .restart local v7    # "h":I
    if-gtz v18, :cond_e8

    .line 1757
    const/16 v18, 0x1

    .line 1759
    :cond_e8
    if-gtz v7, :cond_eb

    .line 1760
    const/4 v7, 0x1

    .line 1763
    :cond_eb
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    move/from16 v22, v0

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_105

    .line 1764
    const/16 v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->portrait:Z

    .line 1767
    :cond_105
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v21

    move-object/from16 v0, v21

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    move/from16 v21, v0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->orientation:I

    .line 1771
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAdjustViewBounds:Z

    move/from16 v21, v0

    if-eqz v21, :cond_2b

    .line 1772
    const/high16 v21, 0x40000000

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_13f

    const/16 v17, 0x1

    .line 1773
    :goto_12b
    const/high16 v21, 0x40000000

    move/from16 v0, v21

    if-eq v9, v0, :cond_142

    const/16 v16, 0x1

    .line 1775
    :goto_133
    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v21, v0

    int-to-float v0, v7

    move/from16 v22, v0

    div-float v5, v21, v22

    goto/16 :goto_2b

    .line 1772
    :cond_13f
    const/16 v17, 0x0

    goto :goto_12b

    .line 1773
    :cond_142
    const/16 v16, 0x0

    goto :goto_133

    .line 1832
    .restart local v12    # "pbottom":I
    .restart local v13    # "pleft":I
    .restart local v14    # "pright":I
    .restart local v15    # "ptop":I
    :cond_145
    add-int v21, v13, v14

    add-int v18, v18, v21

    .line 1833
    add-int v21, v15, v12

    add-int v7, v7, v21

    .line 1835
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getSuggestedMinimumWidth()I

    move-result v21

    move/from16 v0, v18

    move/from16 v1, v21

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v18

    .line 1836
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getSuggestedMinimumHeight()I

    move-result v21

    move/from16 v0, v21

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 1838
    move/from16 v0, v18

    move/from16 v1, p1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resolveSize(II)I

    move-result v19

    .line 1839
    .restart local v19    # "widthSize":I
    move/from16 v0, p2

    invoke-static {v7, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resolveSize(II)I

    move-result v8

    .restart local v8    # "heightSize":I
    goto/16 :goto_d2
.end method

.method protected onSetAlpha(I)Z
    .registers 5
    .param p1, "alpha"    # I

    .prologue
    const/4 v1, 0x1

    .line 1849
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-nez v2, :cond_17

    .line 1850
    shr-int/lit8 v2, p1, 0x7

    add-int v0, p1, v2

    .line 1851
    .local v0, "scale":I
    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewAlphaScale:I

    if-eq v2, v0, :cond_16

    .line 1852
    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mViewAlphaScale:I

    .line 1853
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mColorMod:Z

    .line 1854
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->applyColorMod()V

    .line 1858
    .end local v0    # "scale":I
    :cond_16
    :goto_16
    return v1

    :cond_17
    const/4 v1, 0x0

    goto :goto_16
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 27
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 1114
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mEnableFreeRotate:Z

    move/from16 v20, v0

    if-nez v20, :cond_b

    .line 1115
    const/16 v20, 0x1

    .line 1244
    :goto_a
    return v20

    .line 1118
    :cond_b
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    .line 1120
    .local v4, "action":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    move/from16 v20, v0

    if-eqz v20, :cond_1a

    .line 1121
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resetStraighten()V

    .line 1126
    :cond_1a
    and-int/lit16 v0, v4, 0xff

    move/from16 v20, v0

    packed-switch v20, :pswitch_data_2c8

    .line 1244
    :cond_21
    :goto_21
    :pswitch_21
    const/16 v20, 0x1

    goto :goto_a

    .line 1129
    :pswitch_24
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    move/from16 v20, v0

    move-object/from16 v0, p1

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v10

    .line 1130
    .local v10, "index":I
    if-gez v10, :cond_4e

    .line 1132
    const-string v20, "rotate"

    const-string v21, "released original pointer"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1133
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->onTouchUp()V

    .line 1134
    const/16 v20, -0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    .line 1135
    const/16 v20, -0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerIndex:I

    .line 1138
    :cond_4e
    const-string v20, "rotate"

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "pointerId: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ", activePointerId: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_21

    .line 1144
    .end local v10    # "index":I
    :pswitch_7d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_96

    .line 1145
    const-string v20, "rotate"

    const-string v21, "We already have a valid pointer"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1146
    const/16 v20, 0x1

    goto/16 :goto_a

    .line 1149
    :cond_96
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_97
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v20

    move/from16 v0, v20

    if-ge v9, v0, :cond_21

    .line 1151
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/view/MotionEvent;->getX(I)F

    move-result v18

    .line 1152
    .local v18, "x":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/view/MotionEvent;->getY(I)F

    move-result v19

    .line 1154
    .local v19, "y":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    if-eqz v20, :cond_127

    .line 1155
    new-instance v5, Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v20, v0

    const/high16 v21, 0x42700000

    sub-float v20, v20, v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v21, v0

    const/high16 v22, 0x42700000

    sub-float v21, v21, v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v22, v0

    const/high16 v23, 0x42700000

    add-float v22, v22, v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v23, v0

    const/high16 v24, 0x42700000

    add-float v23, v23, v24

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v5, v0, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 1160
    .local v5, "copy":Landroid/graphics/RectF;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingLeft()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getPaddingTop()I

    move-result v21

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v5, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    .line 1161
    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mIsInStraighten:Z

    .line 1164
    .end local v5    # "copy":Landroid/graphics/RectF;
    :cond_127
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mIsInStraighten:Z

    move/from16 v20, v0

    if-eqz v20, :cond_16d

    .line 1165
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLastTouchX:F

    .line 1166
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->centerX()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    .line 1168
    move-object/from16 v0, p0

    iput v9, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerIndex:I

    .line 1169
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerIndex:I

    move/from16 v20, v0

    move-object/from16 v0, p1

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    .line 1170
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->onTouchStart()V

    .line 1171
    const/16 v20, 0x1

    goto/16 :goto_a

    .line 1149
    :cond_16d
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_97

    .line 1179
    .end local v9    # "i":I
    .end local v18    # "x":F
    .end local v19    # "y":F
    :pswitch_171
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    move/from16 v20, v0

    move-object/from16 v0, p1

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v11

    .line 1180
    .local v11, "pointerIndex":I
    if-gez v11, :cond_18c

    .line 1181
    const-string v20, "rotate"

    const-string v21, "could not find the original pointerId"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1182
    const/16 v20, 0x0

    goto/16 :goto_a

    .line 1185
    :cond_18c
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getX(I)F

    move-result v18

    .line 1186
    .restart local v18    # "x":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Landroid/view/MotionEvent;->getY(I)F

    move-result v19

    .line 1189
    .restart local v19    # "y":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLastTouchX:F

    move/from16 v20, v0

    sub-float v8, v18, v20

    .line 1192
    .local v8, "dx":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    move/from16 v20, v0

    add-float v20, v20, v8

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    .line 1195
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLastTouchX:F

    .line 1197
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mIsInStraighten:Z

    move/from16 v20, v0

    if-eqz v20, :cond_26e

    .line 1199
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v21, v0

    cmpl-float v20, v20, v21

    if-lez v20, :cond_1e4

    .line 1200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    .line 1202
    :cond_1e4
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v21, v0

    cmpg-float v20, v20, v21

    if-gez v20, :cond_20c

    .line 1203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/RectF;->left:F

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    .line 1207
    :cond_20c
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v20

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v20, v0

    move/from16 v0, v20

    float-to-double v14, v0

    .line 1208
    .local v14, "midPoint":D
    const/high16 v20, 0x42340000

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v21, v0

    mul-float v20, v20, v21

    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v20, v0

    div-double v20, v20, v14

    const-wide v22, 0x4046800000000000L

    sub-double v12, v20, v22

    .line 1209
    .local v12, "maxAngle":D
    const/high16 v20, 0x42340000

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    move/from16 v21, v0

    mul-float v20, v20, v21

    move/from16 v0, v20

    float-to-double v0, v0

    move-wide/from16 v20, v0

    div-double v20, v20, v14

    const-wide v22, 0x4046800000000000L

    sub-double v16, v20, v22

    .line 1210
    .local v16, "tempAngle":D
    const-wide v20, 0x4046800000000000L

    mul-double v20, v20, v16

    div-double v6, v20, v12

    .line 1212
    .local v6, "angle":D
    neg-double v0, v6

    move-wide/from16 v20, v0

    const-wide/high16 v22, 0x4000000000000000L

    div-double v20, v20, v22

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    move/from16 v22, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    move/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straighten(DF)V

    .line 1216
    .end local v6    # "angle":D
    .end local v12    # "maxAngle":D
    .end local v14    # "midPoint":D
    .end local v16    # "tempAngle":D
    :cond_26e
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    goto/16 :goto_21

    .line 1220
    .end local v8    # "dx":F
    .end local v11    # "pointerIndex":I
    .end local v18    # "x":F
    .end local v19    # "y":F
    :pswitch_273
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_284

    .line 1221
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->onTouchUp()V

    .line 1224
    :cond_284
    const/16 v20, -0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    .line 1225
    const/16 v20, -0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerIndex:I

    .line 1227
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mIsInStraighten:Z

    .line 1228
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLastTouchX:F

    goto/16 :goto_21

    .line 1232
    :pswitch_2a6
    const/16 v20, -0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerId:I

    .line 1233
    const/16 v20, -0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mActivePointerIndex:I

    .line 1235
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mIsInStraighten:Z

    .line 1236
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLastTouchX:F

    goto/16 :goto_21

    .line 1126
    :pswitch_data_2c8
    .packed-switch 0x0
        :pswitch_7d
        :pswitch_273
        :pswitch_171
        :pswitch_2a6
        :pswitch_21
        :pswitch_7d
        :pswitch_24
    .end packed-switch
.end method

.method public printDetails()V
    .registers 7

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 879
    const-string v0, "rotate"

    const-string v3, "details:"

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 880
    const-string v3, "rotate"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " flip horizontal: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    sget-object v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_HORIZONTAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v5, v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    and-int/2addr v0, v5

    sget-object v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_HORIZONTAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v5, v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    if-ne v0, v5, :cond_76

    move v0, v1

    :goto_24
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 883
    const-string v0, "rotate"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " flip vertical: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    sget-object v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_VERTICAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v5, v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    and-int/2addr v4, v5

    sget-object v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_VERTICAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v5, v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    if-ne v4, v5, :cond_78

    :goto_49
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 884
    const-string v0, "rotate"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " rotation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 885
    const-string v0, "rotate"

    const-string v1, "--------"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 886
    return-void

    :cond_76
    move v0, v2

    .line 880
    goto :goto_24

    :cond_78
    move v1, v2

    .line 883
    goto :goto_49
.end method

.method public rotate90(Z)V
    .registers 4
    .param p1, "cw"    # Z

    .prologue
    .line 788
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAnimationDuration:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->rotate90(ZJ)V

    .line 789
    return-void
.end method

.method public rotate90(ZJ)V
    .registers 8
    .param p1, "cw"    # Z
    .param p2, "durationMs"    # J

    .prologue
    .line 792
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    if-eqz v2, :cond_c

    .line 793
    const-string v2, "rotate"

    const-string v3, "still animating.."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 801
    :goto_b
    return-void

    .line 797
    :cond_c
    if-eqz p1, :cond_1f

    const/16 v2, 0x5a

    :goto_10
    int-to-double v0, v2

    .line 798
    .local v0, "destRotation":D
    invoke-virtual {p0, v0, v1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->rotateBy(DJ)V

    .line 799
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->hideOutlines()V

    .line 800
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->portrait:Z

    if-nez v2, :cond_22

    const/4 v2, 0x1

    :goto_1c
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->portrait:Z

    goto :goto_b

    .line 797
    .end local v0    # "destRotation":D
    :cond_1f
    const/16 v2, -0x5a

    goto :goto_10

    .line 800
    .restart local v0    # "destRotation":D
    :cond_22
    const/4 v2, 0x0

    goto :goto_1c
.end method

.method protected rotateBy(DJ)V
    .registers 16
    .param p1, "deltaRotation"    # D
    .param p3, "durationMs"    # J

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 808
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    if-eqz v1, :cond_e

    .line 809
    const-string v1, "rotate"

    const-string v6, "still running!.."

    invoke-static {v1, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 876
    :cond_d
    :goto_d
    return-void

    .line 813
    :cond_e
    iput-boolean v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    .line 815
    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    add-double v2, v6, p1

    .line 816
    .local v2, "destRotation":D
    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    .line 818
    .local v4, "srcRotation":D
    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    invoke-direct {p0, v6, v7, v9}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setImageRotation(DZ)V

    .line 819
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 821
    const/4 v1, 0x2

    new-array v1, v1, [F

    double-to-float v6, v4

    aput v6, v1, v9

    double-to-float v6, v2

    aput v6, v1, v8

    invoke-static {v1}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    .line 822
    .local v0, "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    new-instance v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$3;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 833
    new-instance v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;

    invoke-direct {v1, p0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;D)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 867
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;

    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->INOUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    invoke-direct {v1, v6}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;-><init>(Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 868
    invoke-virtual {v0, p3, p4}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 869
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 871
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenStarted:Z

    if-eqz v1, :cond_d

    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->isReset:Z

    if-nez v1, :cond_d

    .line 872
    iput-boolean v8, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    .line 873
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resetStraighten()V

    .line 874
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    goto :goto_d
.end method

.method public setAdjustViewBounds(Z)V
    .registers 3
    .param p1, "adjustViewBounds"    # Z

    .prologue
    .line 353
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAdjustViewBounds:Z

    .line 354
    if-eqz p1, :cond_9

    .line 355
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_CENTER:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setScaleType(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;)V

    .line 357
    :cond_9
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 778
    and-int/lit16 p1, p1, 0xff

    .line 779
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAlpha:I

    if-eq v0, p1, :cond_11

    .line 780
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mAlpha:I

    .line 781
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mColorMod:Z

    .line 782
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->applyColorMod()V

    .line 783
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 785
    :cond_11
    return-void
.end method

.method public setBaseline(I)V
    .registers 3
    .param p1, "baseline"    # I

    .prologue
    .line 1944
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mBaseline:I

    if-eq v0, p1, :cond_9

    .line 1945
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mBaseline:I

    .line 1946
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->requestLayout()V

    .line 1948
    :cond_9
    return-void
.end method

.method public setBaselineAlignBottom(Z)V
    .registers 3
    .param p1, "aligned"    # Z

    .prologue
    .line 750
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mBaselineAlignBottom:Z

    if-eq v0, p1, :cond_9

    .line 751
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mBaselineAlignBottom:Z

    .line 752
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->requestLayout()V

    .line 754
    :cond_9
    return-void
.end method

.method public setCameraEnabled(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 204
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_c

    if-eqz p1, :cond_c

    const/4 v0, 0x1

    :goto_9
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCameraEnabled:Z

    .line 205
    return-void

    .line 204
    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public final setColorFilter(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 757
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 758
    return-void
.end method

.method public final setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V
    .registers 4
    .param p1, "color"    # I
    .param p2, "mode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 761
    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    invoke-direct {v0, p1, p2}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 762
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 765
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    if-eq v0, p1, :cond_f

    .line 766
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 767
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mColorMod:Z

    .line 768
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->applyColorMod()V

    .line 769
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 771
    :cond_f
    return-void
.end method

.method public setEnableFreeRotate(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 208
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mEnableFreeRotate:Z

    .line 209
    return-void
.end method

.method public setGridAlpha(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 700
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLinesPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 701
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->postInvalidate()V

    .line 702
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    .line 431
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 432
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 440
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eq v2, p1, :cond_1f

    .line 441
    const/4 v2, 0x0

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResource:I

    .line 442
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    .line 444
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    .line 445
    .local v1, "oldWidth":I
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    .line 447
    .local v0, "oldHeight":I
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->updateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 449
    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableWidth:I

    if-ne v1, v2, :cond_19

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawableHeight:I

    if-eq v0, v2, :cond_1c

    .line 450
    :cond_19
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->requestLayout()V

    .line 452
    :cond_1c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 454
    .end local v0    # "oldHeight":I
    .end local v1    # "oldWidth":I
    :cond_1f
    return-void
.end method

.method public setImageLevel(I)V
    .registers 3
    .param p1, "level"    # I

    .prologue
    .line 637
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mLevel:I

    .line 638
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_e

    .line 639
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 640
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resizeFromDrawable()V

    .line 642
    :cond_e
    return-void
.end method

.method public setImageMatrix(Landroid/graphics/Matrix;)V
    .registers 3
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 683
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 684
    const/4 p1, 0x0

    .line 688
    :cond_9
    if-nez p1, :cond_13

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-eqz v0, :cond_1d

    :cond_13
    if-eqz p1, :cond_28

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    .line 689
    :cond_1d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 690
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->configureBounds()V

    .line 691
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 693
    :cond_28
    return-void
.end method

.method public setImageResource(I)V
    .registers 4
    .param p1, "resId"    # I

    .prologue
    const/4 v1, 0x0

    .line 390
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    if-nez v0, :cond_9

    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResource:I

    if-eq v0, p1, :cond_19

    .line 391
    :cond_9
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->updateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 392
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResource:I

    .line 393
    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    .line 394
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resolveUri()V

    .line 395
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->requestLayout()V

    .line 396
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 398
    :cond_19
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 413
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResource:I

    if-nez v0, :cond_16

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    if-eq v0, p1, :cond_28

    if-eqz p1, :cond_16

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    .line 414
    :cond_16
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->updateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 415
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResource:I

    .line 416
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mUri:Landroid/net/Uri;

    .line 417
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resolveUri()V

    .line 418
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->requestLayout()V

    .line 419
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 421
    :cond_28
    return-void
.end method

.method public setMaxHeight(I)V
    .registers 2
    .param p1, "maxHeight"    # I

    .prologue
    .line 364
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMaxHeight:I

    .line 365
    return-void
.end method

.method public setMaxWidth(I)V
    .registers 2
    .param p1, "maxWidth"    # I

    .prologue
    .line 360
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mMaxWidth:I

    .line 361
    return-void
.end method

.method public setOnResetListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;

    .prologue
    .line 216
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mResetListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;

    .line 217
    return-void
.end method

.method public setOutlineFillAlpha(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 709
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlineFill:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 710
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->postInvalidate()V

    .line 711
    return-void
.end method

.method public setOutlinePaintAlpha(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 718
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mOutlinePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 719
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->postInvalidate()V

    .line 720
    return-void
.end method

.method public setScaleType(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;)V
    .registers 4
    .param p1, "scaleType"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .prologue
    .line 649
    if-nez p1, :cond_8

    .line 650
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 653
    :cond_8
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    if-eq v0, p1, :cond_1e

    .line 654
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .line 656
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mScaleType:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->CENTER:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    if-ne v0, v1, :cond_1f

    const/4 v0, 0x1

    :goto_15
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setWillNotCacheDrawing(Z)V

    .line 658
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->requestLayout()V

    .line 659
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 661
    :cond_1e
    return-void

    .line 656
    :cond_1f
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public setSelected(Z)V
    .registers 2
    .param p1, "selected"    # Z

    .prologue
    .line 1714
    invoke-super {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 1715
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->resizeFromDrawable()V

    .line 1716
    return-void
.end method

.method public straighten(DF)V
    .registers 11
    .param p1, "newPosition"    # D
    .param p3, "posx"    # F

    .prologue
    .line 1279
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    if-eqz v0, :cond_5

    .line 1293
    :goto_4
    return-void

    .line 1283
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenStarted:Z

    .line 1285
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleWidth:I

    int-to-float v1, v1

    sub-float v1, p3, v1

    float-to-int v1, v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleHeight:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleWidth:I

    int-to-float v3, v3

    add-float/2addr v3, p3

    float-to-int v3, v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleHeight:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    float-to-int v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1290
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setStraightenRotation(D)V

    .line 1291
    iput p3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mPosX:F

    .line 1292
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    goto :goto_4
.end method

.method public straightenBy(DIJ)V
    .registers 23
    .param p1, "newPosition"    # D
    .param p3, "newx"    # I
    .param p4, "durationMs"    # J

    .prologue
    .line 264
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    if-eqz v2, :cond_e

    .line 265
    const-string v2, "rotate"

    const-string v3, "still running!.."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    :goto_d
    return-void

    .line 269
    :cond_e
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    .line 270
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenStarted:Z

    .line 272
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 274
    .local v14, "startTime":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    .line 275
    .local v4, "srcx":I
    sub-int v2, p3, v4

    int-to-float v5, v2

    .line 277
    .local v5, "deltax":F
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getStraightenAngle()D

    move-result-wide v2

    add-double v12, v2, p1

    .line 278
    .local v12, "destRotation":D
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getStraightenAngle()D

    move-result-wide v6

    .line 279
    .local v6, "srcRotation":D
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 281
    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_6e

    invoke-static {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v10

    .line 282
    .local v10, "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    move-wide/from16 v0, p4

    invoke-virtual {v10, v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 283
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->INOUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;-><init>(Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;)V

    invoke-virtual {v10, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 284
    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;

    move-object/from16 v3, p0

    move-wide/from16 v8, p1

    invoke-direct/range {v2 .. v9}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;IFDD)V

    invoke-virtual {v10, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 300
    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;

    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-direct {v2, v0, v1, v12, v13}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;ID)V

    invoke-virtual {v10, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 334
    invoke-virtual {v10}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    goto :goto_d

    .line 281
    nop

    :array_6e
    .array-data 4
        0x0
        0x3f800000
    .end array-data
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3
    .param p1, "dr"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 1689
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_a

    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
