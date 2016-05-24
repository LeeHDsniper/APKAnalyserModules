.class public Luk/co/senab/photoview/PhotoViewAttacher;
.super Ljava/lang/Object;
.source "PhotoViewAttacher.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Luk/co/senab/photoview/IPhotoView;
.implements Luk/co/senab/photoview/gestures/OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;,
        Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$android$widget$ImageView$ScaleType:[I

.field private static final DEBUG:Z

.field static final sInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field ZOOM_DURATION:I

.field private mAllowParentInterceptOnEdge:Z

.field private final mBaseMatrix:Landroid/graphics/Matrix;

.field private mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

.field private final mDisplayRect:Landroid/graphics/RectF;

.field private final mDrawMatrix:Landroid/graphics/Matrix;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mImageView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mIvBottom:I

.field private mIvLeft:I

.field private mIvRight:I

.field private mIvTop:I

.field private mLongClickListener:Landroid/view/View$OnLongClickListener;

.field private mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

.field private final mMatrixValues:[F

.field private mMaxScale:F

.field private mMidScale:F

.field private mMinScale:F

.field private mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

.field private mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mScrollEdge:I

.field private final mSuppMatrix:Landroid/graphics/Matrix;

.field private mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

.field private mZoomDelegate:Luk/co/senab/photoview/IPhotoViewZoomDelegate;

.field private mZoomEnabled:Z

.field private mZoomFocusX:F

.field private mZoomFocusY:F

.field private mZoomScale:F


# direct methods
.method static synthetic $SWITCH_TABLE$android$widget$ImageView$ScaleType()[I
    .registers 3

    .prologue
    .line 49
    sget-object v0, Luk/co/senab/photoview/PhotoViewAttacher;->$SWITCH_TABLE$android$widget$ImageView$ScaleType:[I

    if-eqz v0, :cond_5

    :goto_4
    return-object v0

    :cond_5
    invoke-static {}, Landroid/widget/ImageView$ScaleType;->values()[Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_c
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_15} :catch_66

    :goto_15
    :try_start_15
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_1e} :catch_64

    :goto_1e
    :try_start_1e
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_27
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e .. :try_end_27} :catch_62

    :goto_27
    :try_start_27
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_30
    .catch Ljava/lang/NoSuchFieldError; {:try_start_27 .. :try_end_30} :catch_60

    :goto_30
    :try_start_30
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_END:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_39
    .catch Ljava/lang/NoSuchFieldError; {:try_start_30 .. :try_end_39} :catch_5e

    :goto_39
    :try_start_39
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_42
    .catch Ljava/lang/NoSuchFieldError; {:try_start_39 .. :try_end_42} :catch_5c

    :goto_42
    :try_start_42
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_42 .. :try_end_4b} :catch_5a

    :goto_4b
    :try_start_4b
    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_55
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4b .. :try_end_55} :catch_58

    :goto_55
    sput-object v0, Luk/co/senab/photoview/PhotoViewAttacher;->$SWITCH_TABLE$android$widget$ImageView$ScaleType:[I

    goto :goto_4

    :catch_58
    move-exception v1

    goto :goto_55

    :catch_5a
    move-exception v1

    goto :goto_4b

    :catch_5c
    move-exception v1

    goto :goto_42

    :catch_5e
    move-exception v1

    goto :goto_39

    :catch_60
    move-exception v1

    goto :goto_30

    :catch_62
    move-exception v1

    goto :goto_27

    :catch_64
    move-exception v1

    goto :goto_1e

    :catch_66
    move-exception v1

    goto :goto_15
.end method

.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 59
    const-string v0, "PhotoViewAttacher"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    .line 61
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    sput-object v0, Luk/co/senab/photoview/PhotoViewAttacher;->sInterpolator:Landroid/view/animation/Interpolator;

    .line 67
    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;)V
    .registers 7
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    const/high16 v3, 0x3f800000

    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/16 v1, 0xc8

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->ZOOM_DURATION:I

    .line 69
    iput v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 70
    const/high16 v1, 0x3fe00000

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 71
    const/high16 v1, 0x40400000

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 73
    iput-boolean v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    .line 76
    iput v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomScale:F

    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomFocusX:F

    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomFocusY:F

    .line 159
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    .line 160
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 161
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    .line 162
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    .line 163
    const/16 v1, 0x9

    new-array v1, v1, [F

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    .line 173
    const/4 v1, 0x2

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 176
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 179
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    .line 181
    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setDrawingCacheEnabled(Z)V

    .line 182
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 184
    invoke-virtual {p1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 185
    .local v0, "observer":Landroid/view/ViewTreeObserver;
    if-eqz v0, :cond_5c

    .line 186
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 189
    :cond_5c
    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 191
    invoke-virtual {p1}, Landroid/widget/ImageView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_66

    .line 214
    :goto_65
    return-void

    .line 196
    :cond_66
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 195
    invoke-static {v1, p0}, Luk/co/senab/photoview/gestures/VersionedGestureDetector;->newInstance(Landroid/content/Context;Luk/co/senab/photoview/gestures/OnGestureListener;)Luk/co/senab/photoview/gestures/GestureDetector;

    move-result-object v1

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    .line 198
    new-instance v1, Landroid/view/GestureDetector;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 199
    new-instance v3, Luk/co/senab/photoview/PhotoViewAttacher$1;

    invoke-direct {v3, p0}, Luk/co/senab/photoview/PhotoViewAttacher$1;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-direct {v1, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 198
    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    .line 210
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    new-instance v2, Luk/co/senab/photoview/DefaultOnDoubleTapListener;

    invoke-direct {v2, p0}, Luk/co/senab/photoview/DefaultOnDoubleTapListener;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-virtual {v1, v2}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 213
    invoke-virtual {p0, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->setZoomable(Z)V

    goto :goto_65
.end method

.method static synthetic access$0(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method static synthetic access$1(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .registers 1

    .prologue
    .line 727
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    return-void
.end method

.method static synthetic access$2()Z
    .registers 1

    .prologue
    .line 59
    sget-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    return v0
.end method

.method static synthetic access$3(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V
    .registers 2

    .prologue
    .line 870
    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method static synthetic access$5(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/view/View$OnLongClickListener;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-object v0
.end method

.method private cancelFling()V
    .registers 2

    .prologue
    .line 718
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    if-eqz v0, :cond_c

    .line 719
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->cancelFling()V

    .line 720
    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    .line 722
    :cond_c
    return-void
.end method

.method private checkAndDisplayMatrix()V
    .registers 2

    .prologue
    .line 728
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 729
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 731
    :cond_d
    return-void
.end method

.method private checkImageViewScaleType()V
    .registers 4

    .prologue
    .line 734
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 740
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_1e

    instance-of v1, v0, Luk/co/senab/photoview/IPhotoView;

    if-nez v1, :cond_1e

    .line 741
    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    .line 742
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 743
    const-string v2, "The ImageView\'s ScaleType has been changed since attaching a PhotoViewAttacher"

    .line 742
    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 746
    :cond_1e
    return-void
.end method

.method private checkMatrixBounds()Z
    .registers 15

    .prologue
    const/4 v9, 0x1

    const/high16 v13, 0x40000000

    const/4 v12, 0x0

    const/4 v8, 0x0

    .line 749
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    .line 750
    .local v3, "imageView":Landroid/widget/ImageView;
    if-nez v3, :cond_c

    .line 807
    :cond_b
    :goto_b
    return v8

    .line 754
    :cond_c
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    invoke-direct {p0, v10}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v4

    .line 755
    .local v4, "rect":Landroid/graphics/RectF;
    if-eqz v4, :cond_b

    .line 759
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v2

    .local v2, "height":F
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v7

    .line 760
    .local v7, "width":F
    const/4 v0, 0x0

    .local v0, "deltaX":F
    const/4 v1, 0x0

    .line 762
    .local v1, "deltaY":F
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v5

    .line 763
    .local v5, "viewHeight":I
    int-to-float v10, v5

    cmpg-float v10, v2, v10

    if-gtz v10, :cond_73

    .line 764
    invoke-static {}, Luk/co/senab/photoview/PhotoViewAttacher;->$SWITCH_TABLE$android$widget$ImageView$ScaleType()[I

    move-result-object v10

    iget-object v11, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_b4

    .line 772
    int-to-float v10, v5

    sub-float/2addr v10, v2

    div-float/2addr v10, v13

    iget v11, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v10, v11

    .line 781
    :cond_3f
    :goto_3f
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v6

    .line 782
    .local v6, "viewWidth":I
    int-to-float v10, v6

    cmpg-float v10, v7, v10

    if-gtz v10, :cond_95

    .line 783
    invoke-static {}, Luk/co/senab/photoview/PhotoViewAttacher;->$SWITCH_TABLE$android$widget$ImageView$ScaleType()[I

    move-result-object v8

    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v10

    aget v8, v8, v10

    packed-switch v8, :pswitch_data_bc

    .line 791
    int-to-float v8, v6

    sub-float/2addr v8, v7

    div-float/2addr v8, v13

    iget v10, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v8, v10

    .line 794
    :goto_5e
    const/4 v8, 0x2

    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 806
    :goto_61
    iget-object v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v8, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    move v8, v9

    .line 807
    goto :goto_b

    .line 766
    .end local v6    # "viewWidth":I
    :pswitch_68
    iget v10, v4, Landroid/graphics/RectF;->top:F

    neg-float v1, v10

    .line 767
    goto :goto_3f

    .line 769
    :pswitch_6c
    int-to-float v10, v5

    sub-float/2addr v10, v2

    iget v11, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v10, v11

    .line 770
    goto :goto_3f

    .line 775
    :cond_73
    iget v10, v4, Landroid/graphics/RectF;->top:F

    cmpl-float v10, v10, v12

    if-lez v10, :cond_7d

    .line 776
    iget v10, v4, Landroid/graphics/RectF;->top:F

    neg-float v1, v10

    .line 777
    goto :goto_3f

    :cond_7d
    iget v10, v4, Landroid/graphics/RectF;->bottom:F

    int-to-float v11, v5

    cmpg-float v10, v10, v11

    if-gez v10, :cond_3f

    .line 778
    int-to-float v10, v5

    iget v11, v4, Landroid/graphics/RectF;->bottom:F

    sub-float v1, v10, v11

    goto :goto_3f

    .line 785
    .restart local v6    # "viewWidth":I
    :pswitch_8a
    iget v8, v4, Landroid/graphics/RectF;->left:F

    neg-float v0, v8

    .line 786
    goto :goto_5e

    .line 788
    :pswitch_8e
    int-to-float v8, v6

    sub-float/2addr v8, v7

    iget v10, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v8, v10

    .line 789
    goto :goto_5e

    .line 795
    :cond_95
    iget v10, v4, Landroid/graphics/RectF;->left:F

    cmpl-float v10, v10, v12

    if-lez v10, :cond_a1

    .line 796
    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 797
    iget v8, v4, Landroid/graphics/RectF;->left:F

    neg-float v0, v8

    .line 798
    goto :goto_61

    :cond_a1
    iget v8, v4, Landroid/graphics/RectF;->right:F

    int-to-float v10, v6

    cmpg-float v8, v8, v10

    if-gez v8, :cond_b0

    .line 799
    int-to-float v8, v6

    iget v10, v4, Landroid/graphics/RectF;->right:F

    sub-float v0, v8, v10

    .line 800
    iput v9, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    goto :goto_61

    .line 802
    :cond_b0
    const/4 v8, -0x1

    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    goto :goto_61

    .line 764
    :pswitch_data_b4
    .packed-switch 0x5
        :pswitch_6c
        :pswitch_68
    .end packed-switch

    .line 783
    :pswitch_data_bc
    .packed-switch 0x5
        :pswitch_8e
        :pswitch_8a
    .end packed-switch
.end method

.method private static checkZoomLevels(FFF)V
    .registers 5
    .param p0, "minZoom"    # F
    .param p1, "midZoom"    # F
    .param p2, "maxZoom"    # F

    .prologue
    .line 103
    cmpl-float v0, p0, p1

    if-ltz v0, :cond_c

    .line 104
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 105
    const-string v1, "MinZoom has to be less than MidZoom"

    .line 104
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :cond_c
    cmpl-float v0, p1, p2

    if-ltz v0, :cond_18

    .line 107
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 108
    const-string v1, "MidZoom has to be less than MaxZoom"

    .line 107
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_18
    return-void
.end method

.method private getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .registers 8
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v5, 0x0

    .line 817
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 819
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_24

    .line 820
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 821
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_24

    .line 822
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    .line 823
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    int-to-float v4, v4

    .line 822
    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 824
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 825
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    .line 828
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :goto_23
    return-object v2

    :cond_24
    const/4 v2, 0x0

    goto :goto_23
.end method

.method private getImageViewHeight(Landroid/widget/ImageView;)I
    .registers 4
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 962
    if-nez p1, :cond_4

    .line 963
    const/4 v0, 0x0

    .line 964
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p1}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_3
.end method

.method private getImageViewWidth(Landroid/widget/ImageView;)I
    .registers 4
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 956
    if-nez p1, :cond_4

    .line 957
    const/4 v0, 0x0

    .line 958
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p1}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_3
.end method

.method private getValue(Landroid/graphics/Matrix;I)F
    .registers 4
    .param p1, "matrix"    # Landroid/graphics/Matrix;
    .param p2, "whichValue"    # I

    .prologue
    .line 856
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 857
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    aget v0, v0, p2

    return v0
.end method

.method private static hasDrawable(Landroid/widget/ImageView;)Z
    .registers 2
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 116
    if-eqz p0, :cond_a

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z
    .registers 4
    .param p0, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 123
    if-nez p0, :cond_4

    .line 124
    const/4 v0, 0x0

    .line 133
    :goto_3
    return v0

    .line 127
    :cond_4
    invoke-static {}, Luk/co/senab/photoview/PhotoViewAttacher;->$SWITCH_TABLE$android$widget$ImageView$ScaleType()[I

    move-result-object v0

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_30

    .line 133
    const/4 v0, 0x1

    goto :goto_3

    .line 129
    :pswitch_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    const-string v2, " is not supported in PhotoView"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 129
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :pswitch_data_30
    .packed-switch 0x8
        :pswitch_13
    .end packed-switch
.end method

.method private resetMatrix()V
    .registers 5

    .prologue
    .line 864
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 865
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomFocusX:F

    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomFocusY:F

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    .line 866
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 867
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 868
    return-void
.end method

.method private setImageViewMatrix(Landroid/graphics/Matrix;)V
    .registers 5
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 871
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 872
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_1b

    .line 874
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkImageViewScaleType()V

    .line 875
    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 878
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    if-eqz v2, :cond_1b

    .line 879
    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    .line 880
    .local v0, "displayRect":Landroid/graphics/RectF;
    if-eqz v0, :cond_1b

    .line 881
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    invoke-interface {v2, v0}, Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;->onMatrixChanged(Landroid/graphics/RectF;)V

    .line 885
    .end local v0    # "displayRect":Landroid/graphics/RectF;
    :cond_1b
    return-void
.end method

.method private static setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V
    .registers 3
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 145
    if-eqz p0, :cond_17

    instance-of v0, p0, Luk/co/senab/photoview/IPhotoView;

    if-nez v0, :cond_17

    .line 146
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 147
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 150
    :cond_17
    return-void
.end method

.method private updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V
    .registers 16
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v12, 0x0

    const/high16 v13, 0x40000000

    .line 893
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    .line 894
    .local v3, "imageView":Landroid/widget/ImageView;
    if-eqz v3, :cond_b

    if-nez p1, :cond_c

    .line 953
    :cond_b
    :goto_b
    return-void

    .line 898
    :cond_c
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v10

    int-to-float v8, v10

    .line 899
    .local v8, "viewWidth":F
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v10

    int-to-float v7, v10

    .line 900
    .local v7, "viewHeight":F
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 901
    .local v1, "drawableWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 903
    .local v0, "drawableHeight":I
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10}, Landroid/graphics/Matrix;->reset()V

    .line 905
    int-to-float v10, v1

    div-float v9, v8, v10

    .line 906
    .local v9, "widthScale":F
    int-to-float v10, v0

    div-float v2, v7, v10

    .line 908
    .local v2, "heightScale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_40

    .line 909
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    .line 910
    int-to-float v12, v0

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    .line 909
    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 951
    :goto_3c
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    goto :goto_b

    .line 912
    :cond_40
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_5f

    .line 913
    invoke-static {v9, v2}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 914
    .local v6, "scale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 915
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    mul-float/2addr v11, v6

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    .line 916
    int-to-float v12, v0

    mul-float/2addr v12, v6

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    .line 915
    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_3c

    .line 918
    .end local v6    # "scale":F
    :cond_5f
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_84

    .line 919
    const/high16 v10, 0x3f800000

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 920
    .restart local v6    # "scale":F
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 921
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    mul-float/2addr v11, v6

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    .line 922
    int-to-float v12, v0

    mul-float/2addr v12, v6

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    .line 921
    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_3c

    .line 925
    .end local v6    # "scale":F
    :cond_84
    new-instance v5, Landroid/graphics/RectF;

    int-to-float v10, v1

    int-to-float v11, v0

    invoke-direct {v5, v12, v12, v10, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 926
    .local v5, "mTempSrc":Landroid/graphics/RectF;
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v12, v12, v8, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 928
    .local v4, "mTempDst":Landroid/graphics/RectF;
    invoke-static {}, Luk/co/senab/photoview/PhotoViewAttacher;->$SWITCH_TABLE$android$widget$ImageView$ScaleType()[I

    move-result-object v10

    iget-object v11, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_c2

    goto :goto_3c

    .line 930
    :pswitch_a0
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    .line 931
    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 935
    :pswitch_a8
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 939
    :pswitch_b0
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 943
    :pswitch_b8
    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_3c

    .line 928
    nop

    :pswitch_data_c2
    .packed-switch 0x4
        :pswitch_a0
        :pswitch_b0
        :pswitch_a8
        :pswitch_b8
    .end packed-switch
.end method


# virtual methods
.method public cleanup()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 238
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_6

    .line 272
    :goto_5
    return-void

    .line 242
    :cond_6
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 244
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_2b

    .line 246
    invoke-virtual {v0}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    .line 247
    .local v1, "observer":Landroid/view/ViewTreeObserver;
    if-eqz v1, :cond_25

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 248
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-ge v2, v3, :cond_3d

    .line 249
    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 255
    :cond_25
    :goto_25
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 258
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cancelFling()V

    .line 261
    .end local v1    # "observer":Landroid/view/ViewTreeObserver;
    :cond_2b
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v2, :cond_34

    .line 262
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v2, v4}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 266
    :cond_34
    iput-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .line 267
    iput-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .line 268
    iput-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .line 271
    iput-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    goto :goto_5

    .line 251
    .restart local v1    # "observer":Landroid/view/ViewTreeObserver;
    :cond_3d
    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_25
.end method

.method public getDisplayRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 276
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    .line 277
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getDrawMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 712
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 713
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 714
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getImageView()Landroid/widget/ImageView;
    .registers 4

    .prologue
    .line 321
    const/4 v0, 0x0

    .line 323
    .local v0, "imageView":Landroid/widget/ImageView;
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_d

    .line 324
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "imageView":Landroid/widget/ImageView;
    check-cast v0, Landroid/widget/ImageView;

    .line 328
    .restart local v0    # "imageView":Landroid/widget/ImageView;
    :cond_d
    if-nez v0, :cond_19

    .line 329
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cleanup()V

    .line 330
    const-string v1, "PhotoViewAttacher"

    .line 331
    const-string v2, "ImageView no longer exists. You should not use this PhotoViewAttacher any more."

    .line 330
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    :cond_19
    return-object v0
.end method

.method public getMaximumScale()F
    .registers 2

    .prologue
    .line 367
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    return v0
.end method

.method public getMediumScale()F
    .registers 2

    .prologue
    .line 356
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    return v0
.end method

.method public getMinimumScale()F
    .registers 2

    .prologue
    .line 345
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    return v0
.end method

.method public getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;
    .registers 2

    .prologue
    .line 605
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    return-object v0
.end method

.method public getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;
    .registers 2

    .prologue
    .line 615
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    return-object v0
.end method

.method public getScale()F
    .registers 7

    .prologue
    const-wide/high16 v4, 0x4000000000000000L

    .line 372
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float v0, v0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/4 v2, 0x3

    invoke-direct {p0, v1, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getValue(Landroid/graphics/Matrix;I)F

    move-result v1

    float-to-double v2, v1

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-float v1, v2

    add-float/2addr v0, v1

    invoke-static {v0}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v0

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 2

    .prologue
    .line 377
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getVisibleRectangleBitmap()Landroid/graphics/Bitmap;
    .registers 3

    .prologue
    .line 832
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 833
    .local v0, "imageView":Landroid/widget/ImageView;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return-object v1

    :cond_8
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_7
.end method

.method public getZoomDelegate()Luk/co/senab/photoview/IPhotoViewZoomDelegate;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomDelegate:Luk/co/senab/photoview/IPhotoViewZoomDelegate;

    return-object v0
.end method

.method public onDrag(FF)V
    .registers 13
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 382
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v2}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 421
    :cond_b
    :goto_b
    return-void

    .line 386
    :cond_c
    sget-boolean v2, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v2, :cond_2d

    .line 387
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v2

    const-string v3, "PhotoViewAttacher"

    .line 388
    const-string v4, "onDrag: dx: %.2f. dy: %.2f"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 387
    invoke-interface {v2, v3, v4}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    :cond_2d
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 392
    .local v0, "imageView":Landroid/widget/ImageView;
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 393
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 404
    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 405
    .local v1, "parent":Landroid/view/ViewParent;
    iget-boolean v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    if-eqz v2, :cond_70

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v2}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v2

    if-nez v2, :cond_70

    .line 406
    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-eq v2, v9, :cond_61

    .line 407
    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-nez v2, :cond_57

    const/high16 v2, 0x3f800000

    cmpl-float v2, p1, v2

    if-gez v2, :cond_61

    .line 408
    :cond_57
    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-ne v2, v7, :cond_b

    const/high16 v2, -0x40800000

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_b

    .line 409
    :cond_61
    if-eqz v1, :cond_b

    .line 411
    invoke-interface {v1, v8}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 412
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomDelegate:Luk/co/senab/photoview/IPhotoViewZoomDelegate;

    if-eqz v2, :cond_b

    .line 413
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomDelegate:Luk/co/senab/photoview/IPhotoViewZoomDelegate;

    invoke-interface {v2, p1, p2}, Luk/co/senab/photoview/IPhotoViewZoomDelegate;->signalDragDetected(FF)V

    goto :goto_b

    .line 417
    :cond_70
    if-eqz v1, :cond_b

    .line 418
    invoke-interface {v1, v7}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_b
.end method

.method public onFling(FFFF)V
    .registers 11
    .param p1, "startX"    # F
    .param p2, "startY"    # F
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 426
    sget-boolean v1, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v1, :cond_3a

    .line 427
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v1

    .line 428
    const-string v2, "PhotoViewAttacher"

    .line 429
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "onFling. sX: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " sY: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Vx: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 430
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Vy: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 429
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 427
    invoke-interface {v1, v2, v3}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    :cond_3a
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 433
    .local v0, "imageView":Landroid/widget/ImageView;
    new-instance v1, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/content/Context;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    .line 434
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v2

    .line 435
    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v3

    float-to-int v4, p3

    float-to-int v5, p4

    .line 434
    invoke-virtual {v1, v2, v3, v4, v5}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->fling(IIII)V

    .line 436
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    .line 437
    return-void
.end method

.method public onGlobalLayout()V
    .registers 7

    .prologue
    .line 441
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 443
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_39

    .line 444
    iget-boolean v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v5, :cond_3a

    .line 445
    invoke-virtual {v1}, Landroid/widget/ImageView;->getTop()I

    move-result v4

    .line 446
    .local v4, "top":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getRight()I

    move-result v3

    .line 447
    .local v3, "right":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getBottom()I

    move-result v0

    .line 448
    .local v0, "bottom":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLeft()I

    move-result v2

    .line 457
    .local v2, "left":I
    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvTop:I

    if-ne v4, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    if-ne v0, v5, :cond_2a

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    if-ne v2, v5, :cond_2a

    .line 458
    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvRight:I

    if-eq v3, v5, :cond_39

    .line 460
    :cond_2a
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-direct {p0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 463
    iput v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvTop:I

    .line 464
    iput v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvRight:I

    .line 465
    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    .line 466
    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    .line 472
    .end local v0    # "bottom":I
    .end local v2    # "left":I
    .end local v3    # "right":I
    .end local v4    # "top":I
    :cond_39
    :goto_39
    return-void

    .line 469
    :cond_3a
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-direct {p0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    goto :goto_39
.end method

.method public onScale(FFF)V
    .registers 11
    .param p1, "scaleFactor"    # F
    .param p2, "focusX"    # F
    .param p3, "focusY"    # F

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 477
    const-string v0, "PhotoView.Scale"

    const-string v1, "in onScale with scaleFactor %f"

    new-array v2, v6, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    sget-boolean v0, Luk/co/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v0, :cond_3e

    .line 479
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    .line 480
    const-string v1, "PhotoViewAttacher"

    .line 481
    const-string v2, "onScale: scale: %.2f. fX: %.2f. fY: %.2f"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    .line 482
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v6

    const/4 v4, 0x2

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v3, v4

    .line 481
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 479
    invoke-interface {v0, v1, v2}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 485
    :cond_3e
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_4e

    const/high16 v0, 0x3f800000

    cmpg-float v0, p1, v0

    if-gez v0, :cond_63

    .line 486
    :cond_4e
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 487
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomDelegate:Luk/co/senab/photoview/IPhotoViewZoomDelegate;

    if-eqz v0, :cond_60

    .line 488
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomDelegate:Luk/co/senab/photoview/IPhotoViewZoomDelegate;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v1

    invoke-interface {v0, v1, p2, p3}, Luk/co/senab/photoview/IPhotoViewZoomDelegate;->signalZoomHandled(FFF)V

    .line 490
    :cond_60
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 492
    :cond_63
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 12
    .param p1, "v"    # Landroid/view/View;
    .param p2, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 496
    const/4 v6, 0x0

    .line 498
    .local v6, "handled":Z
    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v0, :cond_33

    move-object v0, p1

    check-cast v0, Landroid/widget/ImageView;

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 499
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    .line 500
    .local v7, "parent":Landroid/view/ViewParent;
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_70

    .line 530
    :cond_19
    :goto_19
    :pswitch_19
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    if-eqz v0, :cond_26

    .line 531
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0, p2}, Luk/co/senab/photoview/gestures/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 532
    const/4 v6, 0x1

    .line 536
    :cond_26
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v0, :cond_33

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 537
    const/4 v6, 0x1

    .line 544
    .end local v7    # "parent":Landroid/view/ViewParent;
    :cond_33
    return v6

    .line 504
    .restart local v7    # "parent":Landroid/view/ViewParent;
    :pswitch_34
    if-eqz v7, :cond_3e

    .line 505
    const/4 v0, 0x1

    invoke-interface {v7, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 511
    :goto_3a
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cancelFling()V

    goto :goto_19

    .line 507
    :cond_3e
    const-string v0, "PhotoViewAttacher"

    const-string v1, "onTouch getParent() returned null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3a

    .line 518
    :pswitch_46
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_19

    .line 519
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v8

    .line 520
    .local v8, "rect":Landroid/graphics/RectF;
    if-eqz v8, :cond_19

    .line 521
    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v2

    iget v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 522
    invoke-virtual {v8}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    invoke-virtual {v8}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    .line 521
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 523
    const/4 v6, 0x1

    goto :goto_19

    .line 500
    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_34
        :pswitch_46
        :pswitch_19
        :pswitch_46
    .end packed-switch
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .registers 2
    .param p1, "allow"    # Z

    .prologue
    .line 549
    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    .line 550
    return-void
.end method

.method public setMaximumScale(F)V
    .registers 4
    .param p1, "maximumScale"    # F

    .prologue
    .line 584
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    invoke-static {v0, v1, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 585
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 586
    return-void
.end method

.method public setMediumScale(F)V
    .registers 4
    .param p1, "mediumScale"    # F

    .prologue
    .line 572
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {v0, p1, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 573
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 574
    return-void
.end method

.method public setMinimumScale(F)V
    .registers 4
    .param p1, "minimumScale"    # F

    .prologue
    .line 560
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {p1, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 561
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 562
    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .registers 4
    .param p1, "newOnDoubleTapListener"    # Landroid/view/GestureDetector$OnDoubleTapListener;

    .prologue
    .line 218
    if-eqz p1, :cond_8

    .line 219
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 222
    :goto_7
    return-void

    .line 221
    :cond_8
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    new-instance v1, Luk/co/senab/photoview/DefaultOnDoubleTapListener;

    invoke-direct {v1, p0}, Luk/co/senab/photoview/DefaultOnDoubleTapListener;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    goto :goto_7
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 590
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 591
    return-void
.end method

.method public setOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .prologue
    .line 595
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .line 596
    return-void
.end method

.method public setOnPhotoTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .prologue
    .line 600
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .line 601
    return-void
.end method

.method public setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .prologue
    .line 610
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .line 611
    return-void
.end method

.method public setRotationBy(F)V
    .registers 4
    .param p1, "degrees"    # F

    .prologue
    .line 316
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/high16 v1, 0x43b40000

    rem-float v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 317
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 318
    return-void
.end method

.method public setRotationTo(F)V
    .registers 4
    .param p1, "degrees"    # F

    .prologue
    .line 310
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/high16 v1, 0x43b40000

    rem-float v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 311
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 312
    return-void
.end method

.method public setScale(F)V
    .registers 3
    .param p1, "scale"    # F

    .prologue
    .line 622
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FZ)V

    .line 623
    return-void
.end method

.method public setScale(FFFZ)V
    .registers 12
    .param p1, "scale"    # F
    .param p2, "focalX"    # F
    .param p3, "focalY"    # F
    .param p4, "animate"    # Z

    .prologue
    .line 643
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v6

    .line 645
    .local v6, "imageView":Landroid/widget/ImageView;
    if-eqz v6, :cond_3f

    .line 647
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_12

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_2d

    .line 649
    :cond_12
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    .line 650
    const-string v1, "PhotoViewAttacher"

    .line 651
    const-string v2, "Scale must be within the range of minScale and maxScale"

    .line 650
    invoke-interface {v0, v1, v2}, Luk/co/senab/photoview/log/Logger;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 653
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_25

    .line 654
    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 655
    :cond_25
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_2d

    .line 656
    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 662
    :cond_2d
    if-eqz p4, :cond_40

    .line 663
    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v2

    move-object v1, p0

    move v3, p1

    move v4, p2

    move v5, p3

    .line 664
    invoke-direct/range {v0 .. v5}, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    .line 663
    invoke-virtual {v6, v0}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    .line 671
    :cond_3f
    :goto_3f
    return-void

    .line 666
    :cond_40
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 667
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomScale:F

    .line 668
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    goto :goto_3f
.end method

.method public setScale(FZ)V
    .registers 6
    .param p1, "scale"    # F
    .param p2, "animate"    # Z

    .prologue
    .line 629
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 631
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_17

    .line 633
    invoke-virtual {v0}, Landroid/widget/ImageView;->getRight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    .line 634
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBottom()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    .line 632
    invoke-virtual {p0, p1, v1, v2, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    .line 637
    :cond_17
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .registers 3
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 675
    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq p1, v0, :cond_f

    .line 676
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 679
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 681
    :cond_f
    return-void
.end method

.method public setZoomDelegate(Luk/co/senab/photoview/IPhotoViewZoomDelegate;)V
    .registers 2
    .param p1, "zoomDelegate"    # Luk/co/senab/photoview/IPhotoViewZoomDelegate;

    .prologue
    .line 79
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomDelegate:Luk/co/senab/photoview/IPhotoViewZoomDelegate;

    .line 80
    return-void
.end method

.method public setZoomFocusX(F)V
    .registers 2
    .param p1, "focusX"    # F

    .prologue
    .line 87
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomFocusX:F

    .line 88
    return-void
.end method

.method public setZoomFocusY(F)V
    .registers 2
    .param p1, "focusY"    # F

    .prologue
    .line 95
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomFocusY:F

    .line 96
    return-void
.end method

.method public setZoomTransitionDuration(I)V
    .registers 2
    .param p1, "milliseconds"    # I

    .prologue
    .line 838
    if-gez p1, :cond_4

    .line 839
    const/16 p1, 0xc8

    .line 840
    :cond_4
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->ZOOM_DURATION:I

    .line 841
    return-void
.end method

.method public setZoomable(Z)V
    .registers 2
    .param p1, "zoomable"    # Z

    .prologue
    .line 685
    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    .line 686
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->update()V

    .line 687
    return-void
.end method

.method public update()V
    .registers 3

    .prologue
    .line 690
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 692
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_14

    .line 693
    iget-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v1, :cond_15

    .line 695
    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 698
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 704
    :cond_14
    :goto_14
    return-void

    .line 701
    :cond_15
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    goto :goto_14
.end method
