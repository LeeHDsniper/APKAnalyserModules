.class public Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;
.super Ljava/lang/Object;
.source "PhotoViewAttacher.java"

# interfaces
.implements Landroid/view/GestureDetector$OnDoubleTapListener;
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;,
        Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;,
        Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;,
        Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;,
        Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;
    }
.end annotation


# static fields
.field static final DEBUG:Z


# instance fields
.field private mAllowParentInterceptOnEdge:Z

.field private final mBaseMatrix:Landroid/graphics/Matrix;

.field private mCurrentFlingRunnable:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;

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

.field private mMatrixChangeListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

.field private final mMatrixValues:[F

.field private mMaxScale:F

.field private mMidScale:F

.field private mMinScale:F

.field private mPhotoTapListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

.field private mScaleDragDetector:Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mScrollEdge:I

.field private final mSuppMatrix:Landroid/graphics/Matrix;

.field private mViewTapListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;

.field private mViewTreeObserver:Landroid/view/ViewTreeObserver;

.field private mZoomEnabled:Z

.field private zoomEventLoggedForAnalytics:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 42
    const-string v0, "PhotoViewAttacher"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;)V
    .registers 6
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    const/4 v3, 0x1

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const v0, 0x3e99999a

    iput v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 55
    const/high16 v0, 0x3fe00000

    iput v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 56
    const/high16 v0, 0x40400000

    iput v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 58
    iput-boolean v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->zoomEventLoggedForAnalytics:Z

    .line 119
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    .line 120
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    .line 121
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    .line 122
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    .line 123
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    .line 133
    const/4 v0, 0x2

    iput v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 136
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 139
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    .line 141
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 143
    invoke-virtual {p1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mViewTreeObserver:Landroid/view/ViewTreeObserver;

    .line 144
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mViewTreeObserver:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 147
    invoke-static {p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 149
    invoke-virtual {p1}, Landroid/widget/ImageView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_7f

    .line 151
    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;->newInstance(Landroid/content/Context;Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;)Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;

    .line 153
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$1;

    invoke-direct {v2, p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$1;-><init>(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;)V

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    .line 164
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p0}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 167
    invoke-virtual {p0, v3}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setZoomable(Z)V

    .line 169
    :cond_7f
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;)Landroid/view/View$OnLongClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;)Ljava/lang/ref/WeakReference;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$200(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method static synthetic access$300(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    return-void
.end method

.method static synthetic access$400(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;
    .param p1, "x1"    # Landroid/graphics/Matrix;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method private cancelFling()V
    .registers 2

    .prologue
    .line 524
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;

    if-eqz v0, :cond_c

    .line 525
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->cancelFling()V

    .line 526
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;

    .line 528
    :cond_c
    return-void
.end method

.method private checkAndDisplayMatrix()V
    .registers 2

    .prologue
    .line 534
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()V

    .line 535
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 536
    return-void
.end method

.method private checkImageViewScaleType()V
    .registers 4

    .prologue
    .line 539
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 545
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_1a

    instance-of v1, v0, Lcom/behance/sdk/senab/photoview/PhotoView;

    if-nez v1, :cond_1a

    .line 546
    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    sget-object v2, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    if-eq v1, v2, :cond_1a

    .line 547
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "The ImageView\'s ScaleType has been changed since attaching a PhotoViewAttacher"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 551
    :cond_1a
    return-void
.end method

.method private checkMatrixBounds()V
    .registers 13

    .prologue
    const/high16 v11, 0x40000000

    const/4 v10, 0x0

    .line 554
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    .line 555
    .local v3, "imageView":Landroid/widget/ImageView;
    if-nez v3, :cond_a

    .line 612
    :cond_9
    :goto_9
    return-void

    .line 559
    :cond_a
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v4

    .line 560
    .local v4, "rect":Landroid/graphics/RectF;
    if-eqz v4, :cond_9

    .line 564
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v2

    .local v2, "height":F
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v7

    .line 565
    .local v7, "width":F
    const/4 v0, 0x0

    .local v0, "deltaX":F
    const/4 v1, 0x0

    .line 567
    .local v1, "deltaY":F
    invoke-virtual {v3}, Landroid/widget/ImageView;->getHeight()I

    move-result v5

    .line 568
    .local v5, "viewHeight":I
    int-to-float v8, v5

    cmpg-float v8, v2, v8

    if-gtz v8, :cond_6c

    .line 569
    sget-object v8, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v9, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v9}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_b0

    .line 577
    int-to-float v8, v5

    sub-float/2addr v8, v2

    div-float/2addr v8, v11

    iget v9, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v8, v9

    .line 586
    :cond_3b
    :goto_3b
    invoke-virtual {v3}, Landroid/widget/ImageView;->getWidth()I

    move-result v6

    .line 587
    .local v6, "viewWidth":I
    int-to-float v8, v6

    cmpg-float v8, v7, v8

    if-gtz v8, :cond_8e

    .line 588
    sget-object v8, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v9, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v9}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_b8

    .line 596
    int-to-float v8, v6

    sub-float/2addr v8, v7

    div-float/2addr v8, v11

    iget v9, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v8, v9

    .line 599
    :goto_58
    const/4 v8, 0x2

    iput v8, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 611
    :goto_5b
    iget-object v8, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v8, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_9

    .line 571
    .end local v6    # "viewWidth":I
    :pswitch_61
    iget v8, v4, Landroid/graphics/RectF;->top:F

    neg-float v1, v8

    .line 572
    goto :goto_3b

    .line 574
    :pswitch_65
    int-to-float v8, v5

    sub-float/2addr v8, v2

    iget v9, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v8, v9

    .line 575
    goto :goto_3b

    .line 580
    :cond_6c
    iget v8, v4, Landroid/graphics/RectF;->top:F

    cmpl-float v8, v8, v10

    if-lez v8, :cond_76

    .line 581
    iget v8, v4, Landroid/graphics/RectF;->top:F

    neg-float v1, v8

    goto :goto_3b

    .line 582
    :cond_76
    iget v8, v4, Landroid/graphics/RectF;->bottom:F

    int-to-float v9, v5

    cmpg-float v8, v8, v9

    if-gez v8, :cond_3b

    .line 583
    int-to-float v8, v5

    iget v9, v4, Landroid/graphics/RectF;->bottom:F

    sub-float v1, v8, v9

    goto :goto_3b

    .line 590
    .restart local v6    # "viewWidth":I
    :pswitch_83
    iget v8, v4, Landroid/graphics/RectF;->left:F

    neg-float v0, v8

    .line 591
    goto :goto_58

    .line 593
    :pswitch_87
    int-to-float v8, v6

    sub-float/2addr v8, v7

    iget v9, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v8, v9

    .line 594
    goto :goto_58

    .line 600
    :cond_8e
    iget v8, v4, Landroid/graphics/RectF;->left:F

    cmpl-float v8, v8, v10

    if-lez v8, :cond_9b

    .line 601
    const/4 v8, 0x0

    iput v8, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    .line 602
    iget v8, v4, Landroid/graphics/RectF;->left:F

    neg-float v0, v8

    goto :goto_5b

    .line 603
    :cond_9b
    iget v8, v4, Landroid/graphics/RectF;->right:F

    int-to-float v9, v6

    cmpg-float v8, v8, v9

    if-gez v8, :cond_ab

    .line 604
    int-to-float v8, v6

    iget v9, v4, Landroid/graphics/RectF;->right:F

    sub-float v0, v8, v9

    .line 605
    const/4 v8, 0x1

    iput v8, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    goto :goto_5b

    .line 607
    :cond_ab
    const/4 v8, -0x1

    iput v8, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    goto :goto_5b

    .line 569
    nop

    :pswitch_data_b0
    .packed-switch 0x2
        :pswitch_61
        :pswitch_65
    .end packed-switch

    .line 588
    :pswitch_data_b8
    .packed-switch 0x2
        :pswitch_83
        :pswitch_87
    .end packed-switch
.end method

.method private static checkZoomLevels(FFF)V
    .registers 5
    .param p0, "minZoom"    # F
    .param p1, "midZoom"    # F
    .param p2, "maxZoom"    # F

    .prologue
    .line 63
    cmpl-float v0, p0, p1

    if-ltz v0, :cond_c

    .line 64
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MinZoom should be less than MidZoom"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_c
    cmpl-float v0, p1, p2

    if-ltz v0, :cond_18

    .line 66
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MidZoom should be less than MaxZoom"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_18
    return-void
.end method

.method private getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .registers 8
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    const/4 v5, 0x0

    .line 621
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 623
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_24

    .line 624
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 625
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_24

    .line 626
    iget-object v2, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 627
    iget-object v2, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 628
    iget-object v2, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    .line 631
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :goto_23
    return-object v2

    :cond_24
    const/4 v2, 0x0

    goto :goto_23
.end method

.method private getValue(Landroid/graphics/Matrix;I)F
    .registers 4
    .param p1, "matrix"    # Landroid/graphics/Matrix;
    .param p2, "whichValue"    # I

    .prologue
    .line 642
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 643
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    aget v0, v0, p2

    return v0
.end method

.method private static hasDrawable(Landroid/widget/ImageView;)Z
    .registers 2
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 74
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
    .line 81
    if-nez p0, :cond_4

    .line 82
    const/4 v0, 0x0

    .line 90
    :goto_3
    return v0

    .line 85
    :cond_4
    sget-object v0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2e

    .line 90
    const/4 v0, 0x1

    goto :goto_3

    .line 87
    :pswitch_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not supported in PhotoView"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_11
    .end packed-switch
.end method

.method private resetMatrix()V
    .registers 2

    .prologue
    .line 650
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 651
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    .line 652
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()V

    .line 653
    return-void
.end method

.method private setImageViewMatrix(Landroid/graphics/Matrix;)V
    .registers 5
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 656
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 657
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_1b

    .line 659
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkImageViewScaleType()V

    .line 660
    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 663
    iget-object v2, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    if-eqz v2, :cond_1b

    .line 664
    invoke-direct {p0, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    .line 665
    .local v0, "displayRect":Landroid/graphics/RectF;
    if-eqz v0, :cond_1b

    .line 666
    iget-object v2, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    invoke-interface {v2, v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;->onMatrixChanged(Landroid/graphics/RectF;)V

    .line 670
    .end local v0    # "displayRect":Landroid/graphics/RectF;
    :cond_1b
    return-void
.end method

.method private static setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V
    .registers 2
    .param p0, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 98
    if-eqz p0, :cond_6

    .line 99
    instance-of v0, p0, Lcom/behance/sdk/senab/photoview/PhotoView;

    if-eqz v0, :cond_7

    .line 109
    :cond_6
    :goto_6
    return-void

    .line 106
    :cond_7
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_6
.end method

.method private updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V
    .registers 16
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v12, 0x0

    const/high16 v13, 0x40000000

    .line 678
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    .line 679
    .local v3, "imageView":Landroid/widget/ImageView;
    if-eqz v3, :cond_b

    if-nez p1, :cond_c

    .line 735
    :cond_b
    :goto_b
    return-void

    .line 683
    :cond_c
    invoke-virtual {v3}, Landroid/widget/ImageView;->getWidth()I

    move-result v10

    int-to-float v8, v10

    .line 684
    .local v8, "viewWidth":F
    invoke-virtual {v3}, Landroid/widget/ImageView;->getHeight()I

    move-result v10

    int-to-float v7, v10

    .line 685
    .local v7, "viewHeight":F
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 686
    .local v1, "drawableWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 688
    .local v0, "drawableHeight":I
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10}, Landroid/graphics/Matrix;->reset()V

    .line 690
    int-to-float v10, v1

    div-float v9, v8, v10

    .line 691
    .local v9, "widthScale":F
    int-to-float v10, v0

    div-float v2, v7, v10

    .line 693
    .local v2, "heightScale":F
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_40

    .line 694
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    int-to-float v12, v0

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 734
    :goto_3c
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    goto :goto_b

    .line 696
    :cond_40
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_5f

    .line 697
    invoke-static {v9, v2}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 698
    .local v6, "scale":F
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 699
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    mul-float/2addr v11, v6

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    int-to-float v12, v0

    mul-float/2addr v12, v6

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_3c

    .line 702
    .end local v6    # "scale":F
    :cond_5f
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    if-ne v10, v11, :cond_84

    .line 703
    const/high16 v10, 0x3f800000

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 704
    .restart local v6    # "scale":F
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 705
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    int-to-float v11, v1

    mul-float/2addr v11, v6

    sub-float v11, v8, v11

    div-float/2addr v11, v13

    int-to-float v12, v0

    mul-float/2addr v12, v6

    sub-float v12, v7, v12

    div-float/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_3c

    .line 709
    .end local v6    # "scale":F
    :cond_84
    new-instance v5, Landroid/graphics/RectF;

    int-to-float v10, v1

    int-to-float v11, v0

    invoke-direct {v5, v12, v12, v10, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 710
    .local v5, "mTempSrc":Landroid/graphics/RectF;
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v12, v12, v8, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 712
    .local v4, "mTempDst":Landroid/graphics/RectF;
    sget-object v10, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v11, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_c0

    goto :goto_3c

    .line 718
    :pswitch_9e
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 714
    :pswitch_a6
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 722
    :pswitch_ae
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_3c

    .line 726
    :pswitch_b6
    iget-object v10, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object v11, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v10, v5, v4, v11}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto/16 :goto_3c

    .line 712
    nop

    :pswitch_data_c0
    .packed-switch 0x2
        :pswitch_9e
        :pswitch_ae
        :pswitch_a6
        :pswitch_b6
    .end packed-switch
.end method


# virtual methods
.method public final cleanup()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 184
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_14

    .line 185
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 187
    :cond_14
    iput-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mViewTreeObserver:Landroid/view/ViewTreeObserver;

    .line 190
    iput-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .line 191
    iput-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .line 192
    iput-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mViewTapListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .line 195
    iput-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    .line 196
    return-void
.end method

.method protected getDisplayMatrix()Landroid/graphics/Matrix;
    .registers 3

    .prologue
    .line 518
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 519
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 520
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public final getDisplayRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 200
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()V

    .line 201
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public final getImageView()Landroid/widget/ImageView;
    .registers 5

    .prologue
    .line 205
    const/4 v1, 0x0

    .line 207
    .local v1, "imageView":Landroid/widget/ImageView;
    iget-object v2, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_d

    .line 208
    iget-object v2, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "imageView":Landroid/widget/ImageView;
    check-cast v1, Landroid/widget/ImageView;

    .line 212
    .restart local v1    # "imageView":Landroid/widget/ImageView;
    :cond_d
    if-nez v1, :cond_20

    .line 213
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->cleanup()V

    .line 214
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "ImageView no longer exists. You should not use this PhotoViewAttacher any more."

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 216
    .local v0, "illegalStateException":Ljava/lang/IllegalStateException;
    const-string v2, "PhotoViewAttacher"

    const-string v3, "ImageView no longer exists. You should not use this PhotoViewAttacher any more."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 219
    .end local v0    # "illegalStateException":Ljava/lang/IllegalStateException;
    :cond_20
    return-object v1
.end method

.method public getMaxScale()F
    .registers 2

    .prologue
    .line 234
    iget v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    return v0
.end method

.method public getMidScale()F
    .registers 2

    .prologue
    .line 229
    iget v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMidScale:F

    return v0
.end method

.method public getMinScale()F
    .registers 2

    .prologue
    .line 224
    iget v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMinScale:F

    return v0
.end method

.method public final getScale()F
    .registers 3

    .prologue
    .line 239
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    return v0
.end method

.method public final getScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 2

    .prologue
    .line 244
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public final onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 249
    :try_start_0
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    .line 250
    .local v0, "scale":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 251
    .local v1, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 253
    .local v2, "y":F
    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMidScale:F

    cmpg-float v3, v0, v3

    if-gez v3, :cond_19

    .line 254
    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMidScale:F

    invoke-virtual {p0, v3, v1, v2}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->zoomTo(FFF)V

    .line 264
    .end local v0    # "scale":F
    .end local v1    # "x":F
    .end local v2    # "y":F
    :goto_17
    const/4 v3, 0x1

    return v3

    .line 255
    .restart local v0    # "scale":F
    .restart local v1    # "x":F
    .restart local v2    # "y":F
    :cond_19
    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMidScale:F

    cmpl-float v3, v0, v3

    if-ltz v3, :cond_2d

    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpg-float v3, v0, v3

    if-gez v3, :cond_2d

    .line 256
    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-virtual {p0, v3, v1, v2}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->zoomTo(FFF)V

    goto :goto_17

    .line 260
    .end local v0    # "scale":F
    .end local v1    # "x":F
    .end local v2    # "y":F
    :catch_2b
    move-exception v3

    goto :goto_17

    .line 258
    .restart local v0    # "scale":F
    .restart local v1    # "x":F
    .restart local v2    # "y":F
    :cond_2d
    const/high16 v3, 0x3f800000

    invoke-virtual {p0, v3, v1, v2}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->zoomTo(FFF)V
    :try_end_32
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_32} :catch_2b

    goto :goto_17
.end method

.method public final onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 269
    const/4 v0, 0x0

    return v0
.end method

.method public final onDrag(FF)V
    .registers 11
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 273
    sget-boolean v1, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v1, :cond_20

    .line 274
    const-string v1, "PhotoViewAttacher"

    const-string v2, "onDrag: dx: %.2f. dy: %.2f"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    :cond_20
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 279
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_5f

    invoke-static {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v1

    if-eqz v1, :cond_5f

    .line 280
    iget-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 281
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 292
    iget-boolean v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    if-eqz v1, :cond_5f

    iget-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;

    invoke-virtual {v1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;->isScaling()Z

    move-result v1

    if-nez v1, :cond_5f

    .line 293
    iget v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-eq v1, v7, :cond_58

    iget v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-nez v1, :cond_4e

    const/high16 v1, 0x3f800000

    cmpl-float v1, p1, v1

    if-gez v1, :cond_58

    :cond_4e
    iget v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScrollEdge:I

    if-ne v1, v6, :cond_5f

    const/high16 v1, -0x40800000

    cmpg-float v1, p1, v1

    if-gtz v1, :cond_5f

    .line 295
    :cond_58
    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 299
    :cond_5f
    return-void
.end method

.method public final onFling(FFFF)V
    .registers 11
    .param p1, "startX"    # F
    .param p2, "startY"    # F
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 303
    sget-boolean v1, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v1, :cond_3a

    .line 304
    const-string v1, "PhotoViewAttacher"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onFling. sX: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " sY: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Vx: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Vy: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    :cond_3a
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 308
    .local v0, "imageView":Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v1

    if-eqz v1, :cond_63

    .line 309
    new-instance v1, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;-><init>(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;

    .line 310
    iget-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/widget/ImageView;->getHeight()I

    move-result v3

    float-to-int v4, p3

    float-to-int v5, p4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;->fling(IIII)V

    .line 311
    iget-object v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    .line 313
    :cond_63
    return-void
.end method

.method public final onGlobalLayout()V
    .registers 7

    .prologue
    .line 317
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 319
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_39

    iget-boolean v5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v5, :cond_39

    .line 320
    invoke-virtual {v1}, Landroid/widget/ImageView;->getTop()I

    move-result v4

    .line 321
    .local v4, "top":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getRight()I

    move-result v3

    .line 322
    .local v3, "right":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getBottom()I

    move-result v0

    .line 323
    .local v0, "bottom":I
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLeft()I

    move-result v2

    .line 332
    .local v2, "left":I
    iget v5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mIvTop:I

    if-ne v4, v5, :cond_2a

    iget v5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    if-ne v0, v5, :cond_2a

    iget v5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    if-ne v2, v5, :cond_2a

    iget v5, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mIvRight:I

    if-eq v3, v5, :cond_39

    .line 334
    :cond_2a
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 337
    iput v4, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mIvTop:I

    .line 338
    iput v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mIvRight:I

    .line 339
    iput v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    .line 340
    iput v2, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    .line 343
    .end local v0    # "bottom":I
    .end local v2    # "left":I
    .end local v3    # "right":I
    .end local v4    # "top":I
    :cond_39
    return-void
.end method

.method public final onScale(FFF)V
    .registers 9
    .param p1, "scaleFactor"    # F
    .param p2, "focusX"    # F
    .param p3, "focusY"    # F

    .prologue
    .line 346
    sget-boolean v0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->DEBUG:Z

    if-eqz v0, :cond_27

    .line 347
    const-string v0, "PhotoViewAttacher"

    const-string v1, "onScale: scale: %.2f. fX: %.2f. fY: %.2f"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    :cond_27
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-static {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_49

    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_41

    const/high16 v0, 0x3f800000

    cmpg-float v0, p1, v0

    if-gez v0, :cond_49

    .line 351
    :cond_41
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 352
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    .line 354
    :cond_49
    return-void
.end method

.method public final onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 11
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 357
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    .line 359
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_4a

    .line 360
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    if-eqz v6, :cond_39

    .line 361
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 363
    .local v0, "displayRect":Landroid/graphics/RectF;
    if-eqz v0, :cond_39

    .line 364
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .local v2, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 367
    .local v4, "y":F
    invoke-virtual {v0, v2, v4}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v6

    if-eqz v6, :cond_39

    .line 369
    iget v6, v0, Landroid/graphics/RectF;->left:F

    sub-float v6, v2, v6

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float v3, v6, v7

    .line 370
    .local v3, "xResult":F
    iget v6, v0, Landroid/graphics/RectF;->top:F

    sub-float v6, v4, v6

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v7

    div-float v5, v6, v7

    .line 372
    .local v5, "yResult":F
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    invoke-interface {v6, v1, v3, v5}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;->onPhotoTap(Landroid/view/View;FF)V

    .line 373
    const/4 v6, 0x1

    .line 382
    .end local v0    # "displayRect":Landroid/graphics/RectF;
    .end local v2    # "x":F
    .end local v3    # "xResult":F
    .end local v4    # "y":F
    .end local v5    # "yResult":F
    :goto_38
    return v6

    .line 377
    :cond_39
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mViewTapListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    if-eqz v6, :cond_4a

    .line 378
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mViewTapListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    invoke-interface {v6, v1, v7, v8}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;->onViewTap(Landroid/view/View;FF)V

    .line 382
    :cond_4a
    const/4 v6, 0x0

    goto :goto_38
.end method

.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 11
    .param p1, "v"    # Landroid/view/View;
    .param p2, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 387
    const/4 v6, 0x0

    .line 389
    .local v6, "handled":Z
    iget-boolean v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v0, :cond_26

    .line 390
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_5c

    .line 416
    :cond_c
    :goto_c
    :pswitch_c
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 417
    const/4 v6, 0x1

    .line 421
    :cond_19
    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;

    if-eqz v0, :cond_26

    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;

    invoke-virtual {v0, p2}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 422
    const/4 v6, 0x1

    .line 426
    :cond_26
    return v6

    .line 394
    :pswitch_27
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 398
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->cancelFling()V

    goto :goto_c

    .line 405
    :pswitch_33
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_c

    .line 406
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v7

    .line 407
    .local v7, "rect":Landroid/graphics/RectF;
    if-eqz v7, :cond_c

    .line 408
    new-instance v0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v2

    iget v3, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMinScale:F

    invoke-virtual {v7}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;-><init>(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;FFFF)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 409
    const/4 v6, 0x1

    goto :goto_c

    .line 390
    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_27
        :pswitch_33
        :pswitch_c
        :pswitch_33
    .end packed-switch
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .registers 2
    .param p1, "allow"    # Z

    .prologue
    .line 431
    iput-boolean p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    .line 432
    return-void
.end method

.method public setMaxScale(F)V
    .registers 4
    .param p1, "maxScale"    # F

    .prologue
    .line 448
    iget v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMidScale:F

    invoke-static {v0, v1, p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 449
    iput p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    .line 450
    return-void
.end method

.method public setMidScale(F)V
    .registers 4
    .param p1, "midScale"    # F

    .prologue
    .line 442
    iget v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {v0, p1, v1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 443
    iput p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMidScale:F

    .line 444
    return-void
.end method

.method public setMinScale(F)V
    .registers 4
    .param p1, "minScale"    # F

    .prologue
    .line 436
    iget v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iget v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {p1, v0, v1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    .line 437
    iput p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMinScale:F

    .line 438
    return-void
.end method

.method public final setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 454
    iput-object p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 455
    return-void
.end method

.method public final setOnMatrixChangeListener(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .prologue
    .line 459
    iput-object p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mMatrixChangeListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    .line 460
    return-void
.end method

.method public final setOnPhotoTapListener(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .prologue
    .line 464
    iput-object p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    .line 465
    return-void
.end method

.method public final setOnViewTapListener(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .prologue
    .line 469
    iput-object p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mViewTapListener:Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    .line 470
    return-void
.end method

.method public final setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .registers 3
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 474
    invoke-static {p1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq p1, v0, :cond_f

    .line 475
    iput-object p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 478
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->update()V

    .line 480
    :cond_f
    return-void
.end method

.method public final setZoomable(Z)V
    .registers 2
    .param p1, "zoomable"    # Z

    .prologue
    .line 484
    iput-boolean p1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    .line 485
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->update()V

    .line 486
    return-void
.end method

.method public final update()V
    .registers 3

    .prologue
    .line 489
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    .line 491
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_14

    .line 492
    iget-boolean v1, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v1, :cond_15

    .line 494
    invoke-static {v0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    .line 497
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;)V

    .line 503
    :cond_14
    :goto_14
    return-void

    .line 500
    :cond_15
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    goto :goto_14
.end method

.method public final zoomTo(FFF)V
    .registers 11
    .param p1, "scale"    # F
    .param p2, "focalX"    # F
    .param p3, "focalY"    # F

    .prologue
    .line 507
    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v6

    .line 509
    .local v6, "imageView":Landroid/widget/ImageView;
    if-eqz v6, :cond_16

    .line 510
    new-instance v0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v2

    move-object v1, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;-><init>(Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;FFFF)V

    invoke-virtual {v6, v0}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    .line 512
    :cond_16
    iget-boolean v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->zoomEventLoggedForAnalytics:Z

    if-nez v0, :cond_1d

    .line 513
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/senab/photoview/PhotoViewAttacher;->zoomEventLoggedForAnalytics:Z

    .line 515
    :cond_1d
    return-void
.end method
