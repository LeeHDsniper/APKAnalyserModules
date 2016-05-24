.class public Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;
.source "ImageViewTouch.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;,
        Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;,
        Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;,
        Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;
    }
.end annotation


# static fields
.field public static MIN_FLING_DELTA_TIME:J


# instance fields
.field protected mDoubleTapDirection:I

.field protected mDoubleTapEnabled:Z

.field private mDoubleTapListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;

.field protected mGestureDetector:Landroid/view/GestureDetector;

.field protected mGestureListener:Landroid/view/GestureDetector$OnGestureListener;

.field mPointerUpTime:J

.field protected mScaleDetector:Landroid/view/ScaleGestureDetector;

.field protected mScaleEnabled:Z

.field private mScaleFactor:F

.field protected mScaleListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

.field protected mScrollEnabled:Z

.field private mSingleTapListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;

.field protected mTouchSlop:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 23
    const-wide/16 v0, 0x96

    sput-wide v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->MIN_FLING_DELTA_TIME:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x1

    .line 38
    invoke-direct {p0, p1, p2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapEnabled:Z

    .line 32
    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleEnabled:Z

    .line 33
    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScrollEnabled:Z

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v0, 0x1

    .line 42
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapEnabled:Z

    .line 32
    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleEnabled:Z

    .line 33
    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScrollEnabled:Z

    .line 43
    return-void
.end method

.method static synthetic access$000(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;
    .registers 2
    .param p0, "x0"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .prologue
    .line 20
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mSingleTapListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;

    return-object v0
.end method

.method static synthetic access$100(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;
    .registers 2
    .param p0, "x0"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .prologue
    .line 20
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;

    return-object v0
.end method


# virtual methods
.method protected _setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V
    .registers 5
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "initial_matrix"    # Landroid/graphics/Matrix;
    .param p3, "min_zoom"    # F
    .param p4, "max_zoom"    # F

    .prologue
    .line 113
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->_setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V

    .line 114
    return-void
.end method

.method public canScroll()Z
    .registers 5

    .prologue
    const/4 v1, 0x1

    .line 247
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getScale()F

    move-result v2

    const/high16 v3, 0x3f800000

    cmpl-float v2, v2, v3

    if-lez v2, :cond_c

    .line 251
    :cond_b
    :goto_b
    return v1

    .line 250
    :cond_c
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 251
    .local v0, "bitmapRect":Landroid/graphics/RectF;
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mViewPort:Landroid/graphics/RectF;

    invoke-virtual {v2, v0}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v2

    if-eqz v2, :cond_b

    const/4 v1, 0x0

    goto :goto_b
.end method

.method public getDoubleTapEnabled()Z
    .registers 2

    .prologue
    .line 100
    iget-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapEnabled:Z

    return v0
.end method

.method protected getGestureListener()Landroid/view/GestureDetector$OnGestureListener;
    .registers 2

    .prologue
    .line 104
    new-instance v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;

    invoke-direct {v0, p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)V

    return-object v0
.end method

.method public getQuickScaleEnabled()Z
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 68
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_d

    .line 69
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0}, Landroid/view/ScaleGestureDetector;->isQuickScaleEnabled()Z

    move-result v0

    .line 71
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getScaleFactor()F
    .registers 2

    .prologue
    .line 76
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleFactor:F

    return v0
.end method

.method protected getScaleListener()Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    .registers 2

    .prologue
    .line 108
    new-instance v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;

    invoke-direct {v0, p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)V

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v4, 0x1

    .line 47
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mTouchSlop:I

    .line 49
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getGestureListener()Landroid/view/GestureDetector$OnGestureListener;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mGestureListener:Landroid/view/GestureDetector$OnGestureListener;

    .line 50
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getScaleListener()Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 52
    new-instance v0, Landroid/view/ScaleGestureDetector;

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-direct {v0, v1, v2}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    .line 53
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mGestureListener:Landroid/view/GestureDetector$OnGestureListener;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;Z)V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mGestureDetector:Landroid/view/GestureDetector;

    .line 54
    iput v4, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapDirection:I

    .line 55
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setQuickScaleEnabled(Z)V

    .line 56
    return-void
.end method

.method protected onDoubleTapPost(FFF)F
    .registers 5
    .param p1, "scale"    # F
    .param p2, "maxZoom"    # F
    .param p3, "minScale"    # F

    .prologue
    .line 163
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleFactor:F

    add-float/2addr v0, p1

    cmpg-float v0, v0, p2

    if-gtz v0, :cond_b

    .line 164
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleFactor:F

    add-float p3, p1, v0

    .line 166
    .end local p3    # "minScale":F
    :cond_b
    return p3
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 223
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getBitmapChanged()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 224
    const/4 v0, 0x0

    .line 226
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 19
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 185
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->canScroll()Z

    move-result v5

    if-nez v5, :cond_8

    .line 186
    const/4 v5, 0x0

    .line 219
    :goto_7
    return v5

    .line 189
    :cond_8
    sget-boolean v5, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->DEBUG:Z

    if-eqz v5, :cond_13

    .line 190
    const-string v5, "ImageViewTouchBase"

    const-string v8, "onFling"

    invoke-static {v5, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    :cond_13
    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v8, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mMinFlingVelocity:I

    mul-int/lit8 v8, v8, 0x4

    int-to-float v8, v8

    cmpl-float v5, v5, v8

    if-gtz v5, :cond_2d

    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v8, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mMinFlingVelocity:I

    mul-int/lit8 v8, v8, 0x4

    int-to-float v8, v8

    cmpl-float v5, v5, v8

    if-lez v5, :cond_126

    .line 194
    :cond_2d
    sget-boolean v5, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->DEBUG:Z

    if-eqz v5, :cond_6c

    .line 195
    const-string v5, "ImageViewTouchBase"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "velocity: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move/from16 v0, p4

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    const-string v5, "ImageViewTouchBase"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "diff: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getY()F

    move-result v9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v10

    sub-float/2addr v9, v10

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    :cond_6c
    const/high16 v5, 0x40000000

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getScale()F

    move-result v8

    const/high16 v9, 0x40000000

    div-float/2addr v8, v9

    invoke-static {v5, v8}, Ljava/lang/Math;->max(FF)F

    move-result v5

    const/high16 v8, 0x40400000

    invoke-static {v5, v8}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 201
    .local v2, "scale":F
    iget v5, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mMaxFlingVelocity:I

    int-to-float v5, v5

    div-float v5, p3, v5

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v2

    mul-float v3, v5, v8

    .line 202
    .local v3, "scaledDistanceX":F
    iget v5, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mMaxFlingVelocity:I

    int-to-float v5, v5

    div-float v5, p4, v5

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v2

    mul-float v4, v5, v8

    .line 204
    .local v4, "scaledDistanceY":F
    sget-boolean v5, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->DEBUG:Z

    if-eqz v5, :cond_f3

    .line 205
    const-string v5, "ImageViewTouchBase"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "scale: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getScale()F

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", scale_final: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    const-string v5, "ImageViewTouchBase"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "scaledDistanceX: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    const-string v5, "ImageViewTouchBase"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "scaledDistanceY: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    :cond_f3
    const/4 v5, 0x1

    iput-boolean v5, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mUserScaled:Z

    .line 212
    float-to-double v8, v3

    const-wide/high16 v10, 0x4000000000000000L

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    float-to-double v10, v4

    const-wide/high16 v12, 0x4000000000000000L

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    add-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    .line 214
    .local v6, "total":D
    const-wide v8, 0x4072c00000000000L

    const-wide/high16 v10, 0x4014000000000000L

    div-double v10, v6, v10

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v8

    const-wide/high16 v10, 0x4089000000000000L

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->min(DD)D

    move-result-wide v8

    double-to-long v8, v8

    invoke-virtual {p0, v3, v4, v8, v9}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->scrollBy(FFJ)V

    .line 216
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postInvalidate()V

    .line 217
    const/4 v5, 0x1

    goto/16 :goto_7

    .line 219
    .end local v2    # "scale":F
    .end local v3    # "scaledDistanceX":F
    .end local v4    # "scaledDistanceY":F
    .end local v6    # "total":D
    :cond_126
    const/4 v5, 0x0

    goto/16 :goto_7
.end method

.method protected onLayoutChanged(IIII)V
    .registers 10
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    const/high16 v4, 0x40000000

    .line 118
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->onLayoutChanged(IIII)V

    .line 119
    const-string v0, "ImageViewTouchBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "min: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMinScale()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", max: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMaxScale()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", result: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMaxScale()F

    move-result v2

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMinScale()F

    move-result v3

    sub-float/2addr v2, v3

    div-float/2addr v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMaxScale()F

    move-result v0

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMinScale()F

    move-result v1

    sub-float/2addr v0, v1

    div-float/2addr v0, v4

    const/high16 v1, 0x3f000000

    add-float/2addr v0, v1

    iput v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleFactor:F

    .line 121
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 8
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    const/4 v0, 0x1

    .line 175
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->canScroll()Z

    move-result v1

    if-nez v1, :cond_9

    .line 176
    const/4 v0, 0x0

    .line 181
    :goto_8
    return v0

    .line 178
    :cond_9
    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mUserScaled:Z

    .line 179
    neg-float v1, p3

    neg-float v2, p4

    invoke-virtual {p0, v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->scrollBy(FF)V

    .line 180
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate()V

    goto :goto_8
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 171
    const/4 v0, 0x1

    return v0
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 240
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getBitmapChanged()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 241
    const/4 v0, 0x0

    .line 243
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 127
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getBitmapChanged()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 128
    const/4 v1, 0x0

    .line 147
    :goto_7
    return v1

    .line 131
    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 133
    .local v0, "action":I
    const/4 v1, 0x6

    if-ne v0, v1, :cond_15

    .line 134
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mPointerUpTime:J

    .line 137
    :cond_15
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 139
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v1

    if-nez v1, :cond_27

    .line 140
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v1, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 143
    :cond_27
    packed-switch v0, :pswitch_data_32

    .line 147
    const/4 v1, 0x1

    goto :goto_7

    .line 145
    :pswitch_2c
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onUp(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_7

    .line 143
    nop

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_2c
    .end packed-switch
.end method

.method public onUp(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 230
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getBitmapChanged()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 231
    const/4 v0, 0x0

    .line 236
    :goto_7
    return v0

    .line 233
    :cond_8
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getScale()F

    move-result v0

    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMinScale()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1d

    .line 234
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMinScale()F

    move-result v0

    const-wide/16 v2, 0x32

    invoke-virtual {p0, v0, v2, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->zoomTo(FJ)V

    .line 236
    :cond_1d
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public setDoubleTapEnabled(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 88
    iput-boolean p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapEnabled:Z

    .line 89
    return-void
.end method

.method public setDoubleTapListener(Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;)V
    .registers 2
    .param p1, "listener"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;

    .prologue
    .line 80
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;

    .line 81
    return-void
.end method

.method public setQuickScaleEnabled(Z)V
    .registers 4
    .param p1, "value"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 60
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 61
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V

    .line 63
    :cond_b
    return-void
.end method

.method public setScaleEnabled(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 92
    iput-boolean p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleEnabled:Z

    .line 93
    return-void
.end method

.method public setScrollEnabled(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 96
    iput-boolean p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScrollEnabled:Z

    .line 97
    return-void
.end method

.method public setSingleTapListener(Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;)V
    .registers 2
    .param p1, "listener"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;

    .prologue
    .line 84
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mSingleTapListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;

    .line 85
    return-void
.end method
