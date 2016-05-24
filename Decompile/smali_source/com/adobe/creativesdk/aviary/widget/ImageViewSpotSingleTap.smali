.class public Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.source "ImageViewSpotSingleTap.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;,
        Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;,
        Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;
    }
.end annotation


# instance fields
.field mAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

.field private mBrushSize:F

.field mCanceled:Z

.field protected mCurrentScale:F

.field mDrawFadeCircle:Z

.field protected mInvertedMatrix:Landroid/graphics/Matrix;

.field private mShapePaint:Landroid/graphics/Paint;

.field protected mStartX:F

.field protected mStartY:F

.field private mTapListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;

.field mTextBounds:Landroid/graphics/Rect;

.field private mTextPaint:Landroid/graphics/Paint;

.field mTextRect:Landroid/graphics/RectF;

.field private mTextRectPaint:Landroid/graphics/Paint;

.field private mTextSize:F

.field private mToolTip:Ljava/lang/String;

.field protected mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

.field protected mX:F

.field protected mY:F

.field private radius:F

.field private textPadding:F

.field private xTextOffset:F

.field private yTextOffset:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "set"    # Landroid/util/AttributeSet;

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/high16 v2, 0x43160000

    const/4 v1, 0x0

    .line 55
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    const/high16 v0, 0x3f800000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mCurrentScale:F

    .line 29
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mInvertedMatrix:Landroid/graphics/Matrix;

    .line 30
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    .line 31
    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    .line 34
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mDrawFadeCircle:Z

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mCanceled:Z

    .line 36
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextRect:Landroid/graphics/RectF;

    .line 37
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextBounds:Landroid/graphics/Rect;

    .line 38
    const/high16 v0, 0x41200000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mBrushSize:F

    .line 39
    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->radius:F

    .line 40
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mShapePaint:Landroid/graphics/Paint;

    .line 41
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextPaint:Landroid/graphics/Paint;

    .line 42
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextRectPaint:Landroid/graphics/Paint;

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mToolTip:Ljava/lang/String;

    .line 45
    const/high16 v0, 0x42480000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextSize:F

    .line 46
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->xTextOffset:F

    .line 47
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->yTextOffset:F

    .line 48
    const/high16 v0, 0x41a00000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->textPadding:F

    .line 56
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->onCreate(Landroid/content/Context;)V

    .line 57
    return-void
.end method

.method public static getMatrixValues(Landroid/graphics/Matrix;)[F
    .registers 3
    .param p0, "m"    # Landroid/graphics/Matrix;

    .prologue
    .line 281
    const/16 v1, 0x9

    new-array v0, v1, [F

    .line 282
    .local v0, "values":[F
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 283
    return-object v0
.end method

.method private onCreate(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, -0x1

    const/4 v4, 0x0

    .line 60
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_blemish_tool_tip:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mToolTip:Ljava/lang/String;

    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$dimen;->abc_text_size_small_material:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextSize:F

    .line 62
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextSize:F

    const/high16 v1, 0x40000000

    div-float/2addr v0, v1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->textPadding:F

    .line 63
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextSize:F

    const/high16 v1, 0x40400000

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->yTextOffset:F

    .line 64
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->yTextOffset:F

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->xTextOffset:F

    .line 66
    new-instance v0, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    .line 67
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-virtual {v0, p0}, Lcom/nineoldandroids/animation/AnimatorSet;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mShapePaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mShapePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 71
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mShapePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 72
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mShapePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40c00000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 74
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 76
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mToolTip:Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mToolTip:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 78
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextRectPaint:Landroid/graphics/Paint;

    const/16 v1, 0x96

    invoke-virtual {v0, v1, v4, v4, v4}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 80
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->setLongClickable(Z)V

    .line 81
    return-void
.end method

.method private startAnimation()V
    .registers 13

    .prologue
    const/high16 v11, 0x3f800000

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 178
    const/4 v1, 0x0

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->radius:F

    .line 179
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mShapePaint:Landroid/graphics/Paint;

    const/16 v2, 0xff

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 184
    new-instance v0, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    .line 185
    .local v0, "set2":Lcom/nineoldandroids/animation/AnimatorSet;
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1, v11}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/AnimatorSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 186
    const-wide/16 v2, 0x50

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/AnimatorSet;->setDuration(J)Lcom/nineoldandroids/animation/AnimatorSet;

    .line 187
    new-array v1, v10, [Lcom/nineoldandroids/animation/Animator;

    const-string v2, "radius"

    new-array v3, v10, [F

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mBrushSize:F

    aput v4, v3, v8

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mBrushSize:F

    float-to-double v4, v4

    const-wide v6, 0x3ff3333333333333L

    mul-double/2addr v4, v6

    double-to-int v4, v4

    int-to-float v4, v4

    aput v4, v3, v9

    .line 188
    invoke-static {p0, v2, v3}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v8

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mShapePaint:Landroid/graphics/Paint;

    const-string v3, "alpha"

    new-array v4, v10, [I

    fill-array-data v4, :array_6a

    .line 189
    invoke-static {v2, v3, v4}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v9

    .line 187
    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/AnimatorSet;->playTogether([Lcom/nineoldandroids/animation/Animator;)V

    .line 192
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    new-array v2, v9, [Lcom/nineoldandroids/animation/Animator;

    aput-object v0, v2, v8

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->playSequentially([Lcom/nineoldandroids/animation/Animator;)V

    .line 194
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    new-instance v2, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v2, v11}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 195
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mAnimator:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/AnimatorSet;->start()V

    .line 196
    return-void

    .line 188
    nop

    :array_6a
    .array-data 4
        0xff
        0x0
    .end array-data
.end method


# virtual methods
.method public getDrawMode()Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;
    .registers 2

    .prologue
    .line 251
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    return-object v0
.end method

.method public getImageRect()Landroid/graphics/RectF;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 296
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1f

    .line 297
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 299
    :goto_1e
    return-object v0

    :cond_1f
    const/4 v0, 0x0

    goto :goto_1e
.end method

.method public getRadius()F
    .registers 2

    .prologue
    .line 84
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->radius:F

    return v0
.end method

.method protected getScaleListener()Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    .registers 2

    .prologue
    .line 147
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;-><init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;)V

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 142
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 143
    return-void
.end method

.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 105
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 99
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->invalidate()V

    .line 100
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 109
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->invalidate()V

    .line 110
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 94
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->invalidate()V

    .line 95
    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v0, v1, :cond_1d

    .line 223
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    .line 224
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mStartX:F

    .line 225
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    .line 226
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mStartY:F

    .line 227
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mDrawFadeCircle:Z

    .line 230
    :cond_1d
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDown(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v7, 0x41200000

    .line 115
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDraw(Landroid/graphics/Canvas;)V

    .line 117
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mDrawFadeCircle:Z

    if-eqz v0, :cond_1b

    .line 118
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->radius:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1b

    .line 119
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->radius:F

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mShapePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 123
    :cond_1b
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mCanceled:Z

    if-eqz v0, :cond_7a

    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->textPadding:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->xTextOffset:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextBounds:Landroid/graphics/Rect;

    .line 126
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3fa00000

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->textPadding:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->yTextOffset:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextBounds:Landroid/graphics/Rect;

    .line 127
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v3, v4

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->textPadding:F

    add-float/2addr v3, v4

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->xTextOffset:F

    sub-float/2addr v3, v4

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextBounds:Landroid/graphics/Rect;

    .line 128
    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    const/high16 v6, 0x3f000000

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->textPadding:F

    add-float/2addr v4, v5

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->yTextOffset:F

    sub-float/2addr v4, v5

    .line 124
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 130
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextRectPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v7, v7, v1}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 131
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mToolTip:Ljava/lang/String;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->xTextOffset:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->yTextOffset:F

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 134
    :cond_7a
    return-void
.end method

.method protected onDrawModeChanged()V
    .registers 9

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 262
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    sget-object v6, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v3, v6, :cond_43

    .line 263
    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 264
    .local v0, "m1":Landroid/graphics/Matrix;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 266
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->getMatrixValues(Landroid/graphics/Matrix;)[F

    move-result-object v1

    .line 267
    .local v1, "v1":[F
    invoke-virtual {v0, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 268
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->getMatrixValues(Landroid/graphics/Matrix;)[F

    move-result-object v2

    .line 270
    .local v2, "v2":[F
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mInvertedMatrix:Landroid/graphics/Matrix;

    const/4 v6, 0x2

    aget v6, v1, v6

    neg-float v6, v6

    const/4 v7, 0x5

    aget v7, v1, v7

    neg-float v7, v7

    invoke-virtual {v3, v6, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 271
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mInvertedMatrix:Landroid/graphics/Matrix;

    aget v6, v2, v5

    const/4 v7, 0x4

    aget v7, v2, v7

    invoke-virtual {v3, v6, v7}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 273
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->getScale()F

    move-result v3

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->getBaseScale()F

    move-result v6

    mul-float/2addr v3, v6

    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mCurrentScale:F

    .line 276
    .end local v0    # "m1":Landroid/graphics/Matrix;
    .end local v1    # "v1":[F
    .end local v2    # "v2":[F
    :cond_43
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    sget-object v6, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v3, v6, :cond_57

    move v3, v4

    :goto_4a
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->setDoubleTapEnabled(Z)V

    .line 277
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    sget-object v6, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v3, v6, :cond_59

    :goto_53
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->setScaleEnabled(Z)V

    .line 278
    return-void

    :cond_57
    move v3, v5

    .line 276
    goto :goto_4a

    :cond_59
    move v4, v5

    .line 277
    goto :goto_53
.end method

.method protected onDrawableChanged(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 288
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDrawableChanged(Landroid/graphics/drawable/Drawable;)V

    .line 290
    if-eqz p1, :cond_c

    instance-of v0, p1, Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;

    if-eqz v0, :cond_c

    .line 291
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->onDrawModeChanged()V

    .line 293
    :cond_c
    return-void
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 7
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 213
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v0, v1, :cond_8

    .line 214
    const/4 v0, 0x0

    .line 217
    :goto_7
    return v0

    :cond_8
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v0

    goto :goto_7
.end method

.method protected onLayoutChanged(IIII)V
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 152
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onLayoutChanged(IIII)V

    .line 154
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 155
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->onDrawModeChanged()V

    .line 157
    :cond_c
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 7
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v0, v1, :cond_1a

    .line 201
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    .line 202
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    .line 203
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mCanceled:Z

    .line 204
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->postInvalidate()V

    .line 205
    const/4 v0, 0x0

    .line 208
    :goto_19
    return v0

    :cond_1a
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v0

    goto :goto_19
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    .line 161
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v2, v3, :cond_30

    .line 162
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mDrawFadeCircle:Z

    .line 163
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->startAnimation()V

    .line 164
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTapListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;

    if-eqz v2, :cond_2f

    .line 165
    const/4 v2, 0x2

    new-array v0, v2, [F

    .line 166
    .local v0, "mappedPoints":[F
    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    aput v3, v0, v2

    .line 167
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    aput v2, v0, v1

    .line 168
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 169
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTapListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mBrushSize:F

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mCurrentScale:F

    div-float/2addr v3, v4

    invoke-interface {v2, v0, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;->onTap([FF)V

    .line 173
    .end local v0    # "mappedPoints":[F
    :cond_2f
    :goto_2f
    return v1

    :cond_30
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_2f
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 243
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v0, v1, :cond_8

    .line 244
    const/4 v0, 0x0

    .line 247
    :goto_7
    return v0

    :cond_8
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_7
.end method

.method public onUp(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 235
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mCanceled:Z

    .line 236
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->postInvalidate()V

    .line 238
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onUp(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public setBrushSize(F)V
    .registers 2
    .param p1, "value"    # F

    .prologue
    .line 304
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mBrushSize:F

    .line 305
    return-void
.end method

.method public setDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;)V
    .registers 3
    .param p1, "mode"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-eq p1, v0, :cond_9

    .line 256
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    .line 257
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->onDrawModeChanged()V

    .line 259
    :cond_9
    return-void
.end method

.method public setOnTapListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTapListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;

    .line 138
    return-void
.end method

.method public setRadius(F)V
    .registers 2
    .param p1, "value"    # F

    .prologue
    .line 88
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->radius:F

    .line 89
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->invalidate()V

    .line 90
    return-void
.end method
