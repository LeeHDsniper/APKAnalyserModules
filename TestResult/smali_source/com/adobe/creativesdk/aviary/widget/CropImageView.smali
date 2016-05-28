.class public Lcom/adobe/creativesdk/aviary/widget/CropImageView;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.source "CropImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;,
        Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;
    }
.end annotation


# instance fields
.field protected mAspectRatio:D

.field private mAspectRatioFixed:Z

.field private mCropMinSize:I

.field protected mHandler:Landroid/os/Handler;

.field private mHighlighStyle:I

.field private mHighlightSingleTapUpListener:Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;

.field private mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

.field private mMotionEdge:I

.field private mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

.field private mRect1:Landroid/graphics/Rect;

.field private mRect2:Landroid/graphics/Rect;

.field onLayoutRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 66
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHandler:Landroid/os/Handler;

    .line 33
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatio:D

    .line 34
    const/4 v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionEdge:I

    .line 36
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->onLayoutRunnable:Ljava/lang/Runnable;

    .line 55
    const/16 v0, 0xa

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mCropMinSize:I

    .line 57
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect1:Landroid/graphics/Rect;

    .line 58
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect2:Landroid/graphics/Rect;

    .line 67
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    return-object v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/aviary/widget/CropImageView;Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    return-object p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .prologue
    .line 29
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionEdge:I

    return v0
.end method

.method static synthetic access$202(Lcom/adobe/creativesdk/aviary/widget/CropImageView;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionEdge:I

    return p1
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightSingleTapUpListener:Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Landroid/view/ScaleGestureDetector;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/widget/CropImageView;Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Z
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->ensureVisible(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Landroid/view/ScaleGestureDetector;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mDoubleTapEnabled:Z

    return v0
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/aviary/widget/CropImageView;FFF)F
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;
    .param p1, "x1"    # F
    .param p2, "x2"    # F
    .param p3, "x3"    # F

    .prologue
    .line 29
    invoke-virtual {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->onDoubleTapPost(FFF)F

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/adobe/creativesdk/aviary/widget/CropImageView;FFFJ)V
    .registers 6
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;
    .param p1, "x1"    # F
    .param p2, "x2"    # F
    .param p3, "x3"    # F
    .param p4, "x4"    # J

    .prologue
    .line 29
    invoke-virtual/range {p0 .. p5}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->zoomTo(FFFJ)V

    return-void
.end method

.method private computeFinalCropRect(D)Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .registers 28
    .param p1, "aspectRatio"    # D

    .prologue
    .line 315
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getScale()F

    move-result v19

    .line 317
    .local v19, "scale":F
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v8

    int-to-float v0, v8

    move/from16 v22, v0

    .line 318
    .local v22, "width":F
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    int-to-float v0, v8

    move/from16 v16, v0

    .line 320
    .local v16, "height":F
    new-instance v21, Landroid/graphics/RectF;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getWidth()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getHeight()I

    move-result v11

    int-to-float v11, v11

    move-object/from16 v0, v21

    invoke-direct {v0, v8, v9, v10, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 321
    .local v21, "viewRect":Landroid/graphics/RectF;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v2

    .line 323
    .local v2, "bitmapRect":Landroid/graphics/RectF;
    new-instance v18, Landroid/graphics/RectF;

    move-object/from16 v0, v21

    iget v8, v0, Landroid/graphics/RectF;->left:F

    iget v9, v2, Landroid/graphics/RectF;->left:F

    .line 324
    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    move-object/from16 v0, v21

    iget v9, v0, Landroid/graphics/RectF;->top:F

    iget v10, v2, Landroid/graphics/RectF;->top:F

    .line 325
    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v9

    move-object/from16 v0, v21

    iget v10, v0, Landroid/graphics/RectF;->right:F

    iget v11, v2, Landroid/graphics/RectF;->right:F

    .line 326
    invoke-static {v10, v11}, Ljava/lang/Math;->min(FF)F

    move-result v10

    move-object/from16 v0, v21

    iget v11, v0, Landroid/graphics/RectF;->bottom:F

    iget v0, v2, Landroid/graphics/RectF;->bottom:F

    move/from16 v23, v0

    .line 327
    move/from16 v0, v23

    invoke-static {v11, v0}, Ljava/lang/Math;->min(FF)F

    move-result v11

    move-object/from16 v0, v18

    invoke-direct {v0, v8, v9, v10, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 329
    .local v18, "rect":Landroid/graphics/RectF;
    div-float v8, v22, v19

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/RectF;->width()F

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    move-result v8

    div-float v9, v16, v19

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/RectF;->height()F

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->min(FF)F

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    move-result v8

    const v9, 0x3f4ccccd

    mul-float/2addr v8, v9

    float-to-double v14, v8

    .line 330
    .local v14, "cropWidth":D
    move-wide v12, v14

    .line 332
    .local v12, "cropHeight":D
    const-wide/16 v8, 0x0

    cmpl-double v8, p1, v8

    if-eqz v8, :cond_90

    .line 333
    const-wide/high16 v8, 0x3ff0000000000000L

    cmpl-double v8, p1, v8

    if-lez v8, :cond_cd

    .line 334
    div-double v12, v12, p1

    .line 340
    :cond_90
    :goto_90
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v17

    .line 341
    .local v17, "mImageMatrix":Landroid/graphics/Matrix;
    new-instance v20, Landroid/graphics/Matrix;

    invoke-direct/range {v20 .. v20}, Landroid/graphics/Matrix;-><init>()V

    .line 343
    .local v20, "tmpMatrix":Landroid/graphics/Matrix;
    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    move-result v8

    if-nez v8, :cond_aa

    .line 344
    const-string v8, "ImageViewTouchBase"

    const-string v9, "cannot invert matrix"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    :cond_aa
    invoke-virtual/range {v20 .. v21}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 349
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/RectF;->centerX()F

    move-result v8

    float-to-double v8, v8

    const-wide/high16 v10, 0x4000000000000000L

    div-double v10, v14, v10

    sub-double v4, v8, v10

    .line 350
    .local v4, "x":D
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/RectF;->centerY()F

    move-result v8

    float-to-double v8, v8

    const-wide/high16 v10, 0x4000000000000000L

    div-double v10, v12, v10

    sub-double v6, v8, v10

    .line 351
    .local v6, "y":D
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    add-double v8, v4, v14

    add-double v10, v6, v12

    invoke-direct/range {v3 .. v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;-><init>(DDDD)V

    .line 353
    .local v3, "cropRect":Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    return-object v3

    .line 336
    .end local v3    # "cropRect":Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .end local v4    # "x":D
    .end local v6    # "y":D
    .end local v17    # "mImageMatrix":Landroid/graphics/Matrix;
    .end local v20    # "tmpMatrix":Landroid/graphics/Matrix;
    :cond_cd
    mul-double v14, v14, p1

    goto :goto_90
.end method

.method private ensureVisible(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Z
    .registers 14
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    const/4 v7, 0x0

    .line 132
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getDrawRect()Landroid/graphics/Rect;

    move-result-object v6

    .line 133
    .local v6, "r":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getLeft()I

    move-result v8

    iget v9, v6, Landroid/graphics/Rect;->left:I

    sub-int/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 134
    .local v1, "panDeltaX1":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getRight()I

    move-result v8

    iget v9, v6, Landroid/graphics/Rect;->right:I

    sub-int/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 135
    .local v2, "panDeltaX2":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getTop()I

    move-result v8

    iget v9, v6, Landroid/graphics/Rect;->top:I

    sub-int/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 136
    .local v4, "panDeltaY1":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getBottom()I

    move-result v8

    iget v9, v6, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 137
    .local v5, "panDeltaY2":I
    if-eqz v1, :cond_42

    move v0, v1

    .line 138
    .local v0, "panDeltaX":I
    :goto_34
    if-eqz v4, :cond_44

    move v3, v4

    .line 140
    .local v3, "panDeltaY":I
    :goto_37
    if-nez v0, :cond_3b

    if-eqz v3, :cond_41

    .line 141
    :cond_3b
    int-to-double v8, v0

    int-to-double v10, v3

    invoke-virtual {p0, v8, v9, v10, v11}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->panBy(DD)V

    .line 142
    const/4 v7, 0x1

    .line 144
    :cond_41
    return v7

    .end local v0    # "panDeltaX":I
    .end local v3    # "panDeltaY":I
    :cond_42
    move v0, v2

    .line 137
    goto :goto_34

    .restart local v0    # "panDeltaX":I
    :cond_44
    move v3, v5

    .line 138
    goto :goto_37
.end method

.method private updateAspectRatio(DLcom/adobe/creativesdk/aviary/widget/HighlightView;Z)V
    .registers 16
    .param p1, "aspectRatio"    # D
    .param p3, "hv"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    .param p4, "animate"    # Z

    .prologue
    const-wide/16 v2, 0x0

    .line 298
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    int-to-float v10, v5

    .line 299
    .local v10, "width":F
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    int-to-float v0, v5

    .line 300
    .local v0, "height":F
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    float-to-int v5, v10

    int-to-double v6, v5

    float-to-int v5, v0

    int-to-double v8, v5

    move-wide v4, v2

    invoke-direct/range {v1 .. v9}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;-><init>(DDDD)V

    .line 301
    .local v1, "imageRect":Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    .line 302
    .local v4, "mImageMatrix":Landroid/graphics/Matrix;
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->computeFinalCropRect(D)Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-result-object v6

    .line 304
    .local v6, "cropRect":Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    if-eqz p4, :cond_31

    .line 305
    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatioFixed:Z

    move-object v2, p3

    move-object v3, p0

    move-object v5, v1

    invoke-virtual/range {v2 .. v7}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->animateTo(Landroid/view/View;Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Z)V

    .line 310
    :goto_30
    return-void

    .line 307
    :cond_31
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatioFixed:Z

    invoke-virtual {p3, v4, v1, v6, v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->setup(Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Z)V

    .line 308
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->postInvalidate()V

    goto :goto_30
.end method


# virtual methods
.method public getAspectRatio()D
    .registers 3

    .prologue
    .line 370
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatio:D

    return-wide v0
.end method

.method public getAspectRatioIsFixed()Z
    .registers 2

    .prologue
    .line 366
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatioFixed:Z

    return v0
.end method

.method public getHighlightView()Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    .registers 2

    .prologue
    .line 281
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 83
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 84
    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mGestureDetector:Landroid/view/GestureDetector;

    .line 85
    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mGestureListener:Landroid/view/GestureDetector$OnGestureListener;

    .line 86
    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mScaleListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 87
    new-instance v2, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;-><init>(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)V

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v6, v5}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;Z)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mGestureDetector:Landroid/view/GestureDetector;

    .line 88
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v2, v7}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    .line 90
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    .line 92
    .local v1, "theme":Landroid/content/res/Resources$Theme;
    sget-object v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropImageView:[I

    invoke-virtual {v1, p2, v2, p3, v7}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 93
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropImageView_adobe_minCropSize:I

    const/16 v3, 0x32

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mCropMinSize:I

    .line 94
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropImageView_adobe_highlightStyle:I

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlighStyle:I

    .line 96
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 98
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 6
    .param p1, "config"    # Landroid/content/res/Configuration;

    .prologue
    .line 171
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_14

    .line 172
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/widget/CropImageView$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView$2;-><init>(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 180
    :cond_14
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->postInvalidate()V

    .line 181
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 149
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDraw(Landroid/graphics/Canvas;)V

    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    if-eqz v0, :cond_c

    .line 151
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->draw(Landroid/graphics/Canvas;)V

    .line 153
    :cond_c
    return-void
.end method

.method protected onDrawableChanged(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 191
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDrawableChanged(Landroid/graphics/drawable/Drawable;)V

    .line 193
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 194
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/widget/CropImageView$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView$3;-><init>(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 202
    :cond_15
    return-void
.end method

.method protected onLayoutChanged(IIII)V
    .registers 7
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 102
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onLayoutChanged(IIII)V

    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->onLayoutRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 104
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 11
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 157
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onSizeChanged(IIII)V

    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    if-eqz v0, :cond_11

    .line 160
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->onSizeChanged(Lcom/adobe/creativesdk/aviary/widget/CropImageView;IIII)V

    .line 162
    :cond_11
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    .line 108
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 109
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 111
    .local v0, "action":I
    packed-switch v0, :pswitch_data_22

    .line 128
    :goto_d
    return v3

    .line 114
    :pswitch_e
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    if-eqz v1, :cond_1c

    .line 115
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;->None:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->setMode(Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;I)V

    .line 116
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->postInvalidate()V

    .line 119
    :cond_1c
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .line 120
    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionEdge:I

    goto :goto_d

    .line 111
    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_e
    .end packed-switch
.end method

.method protected postScale(FFF)V
    .registers 12
    .param p1, "scale"    # F
    .param p2, "centerX"    # F
    .param p3, "centerY"    # F

    .prologue
    .line 228
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    if-eqz v3, :cond_aa

    .line 230
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 255
    :goto_c
    return-void

    .line 234
    :cond_d
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getCropRectD()Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-result-object v0

    .line 235
    .local v0, "cropRect":Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getCropRectD()Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect1:Landroid/graphics/Rect;

    invoke-virtual {v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getDisplayRect(Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Landroid/graphics/Rect;)V

    .line 237
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postScale(FFF)V

    .line 239
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getCropRectD()Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect2:Landroid/graphics/Rect;

    invoke-virtual {v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getDisplayRect(Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Landroid/graphics/Rect;)V

    .line 241
    const/16 v3, 0x9

    new-array v2, v3, [F

    .line 242
    .local v2, "mvalues":[F
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/graphics/Matrix;->getValues([F)V

    .line 243
    const/4 v3, 0x0

    aget v1, v2, v3

    .line 245
    .local v1, "currentScale":F
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect1:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect2:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    div-float/2addr v3, v1

    float-to-double v4, v3

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect1:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect2:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v6

    int-to-float v3, v3

    div-float/2addr v3, v1

    float-to-double v6, v3

    invoke-virtual {v0, v4, v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    .line 246
    iget-wide v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect2:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect1:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    sub-int/2addr v3, v6

    neg-int v3, v3

    int-to-float v3, v3

    div-float/2addr v3, v1

    float-to-double v6, v3

    add-double/2addr v4, v6

    iput-wide v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 247
    iget-wide v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect2:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mRect1:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    sub-int/2addr v3, v6

    neg-int v3, v3

    int-to-float v3, v3

    div-float/2addr v3, v1

    float-to-double v6, v3

    add-double/2addr v4, v6

    iput-wide v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 249
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 250
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getCropRectD()Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->set(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V

    .line 251
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->invalidate()V

    goto/16 :goto_c

    .line 253
    .end local v0    # "cropRect":Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .end local v1    # "currentScale":F
    .end local v2    # "mvalues":[F
    :cond_aa
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postScale(FFF)V

    goto/16 :goto_c
.end method

.method protected postTranslate(FF)V
    .registers 11
    .param p1, "deltaX"    # F
    .param p2, "deltaY"    # F

    .prologue
    .line 206
    invoke-super {p0, p1, p2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postTranslate(FF)V

    .line 208
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    if-eqz v2, :cond_f

    .line 210
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 224
    :cond_f
    :goto_f
    return-void

    .line 214
    :cond_10
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getScale()F

    move-result v2

    const/high16 v3, 0x3f800000

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_37

    .line 215
    const/16 v2, 0x9

    new-array v0, v2, [F

    .line 216
    .local v0, "mvalues":[F
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 217
    const/4 v2, 0x0

    aget v1, v0, v2

    .line 218
    .local v1, "scale":F
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getCropRectD()Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-result-object v2

    neg-float v3, p1

    div-float/2addr v3, v1

    float-to-double v4, v3

    neg-float v3, p2

    div-float/2addr v3, v1

    float-to-double v6, v3

    invoke-virtual {v2, v4, v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    .line 221
    .end local v0    # "mvalues":[F
    .end local v1    # "scale":F
    :cond_37
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 222
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->invalidate()V

    goto :goto_f
.end method

.method public setAspectRatio(DZ)V
    .registers 5
    .param p1, "value"    # D
    .param p3, "isFixed"    # Z

    .prologue
    .line 358
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 359
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatio:D

    .line 360
    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatioFixed:Z

    .line 361
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->updateCropView(Z)V

    .line 363
    :cond_e
    return-void
.end method

.method public setHighlightView(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)V
    .registers 3
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 285
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    if-eqz v0, :cond_9

    .line 286
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dispose()V

    .line 289
    :cond_9
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .line 290
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .line 291
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    if-eqz v0, :cond_17

    .line 292
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->fadeIn(Landroid/view/View;)V

    .line 294
    :cond_17
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->invalidate()V

    .line 295
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;DZ)V
    .registers 9
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "aspectRatio"    # D
    .param p4, "isFixed"    # Z

    .prologue
    .line 165
    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatio:D

    .line 166
    iput-boolean p4, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatioFixed:Z

    .line 167
    const/4 v0, 0x0

    const/high16 v1, -0x40800000

    const/high16 v2, 0x41000000

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 168
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V
    .registers 6
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "initialMatrix"    # Landroid/graphics/Matrix;
    .param p3, "minZoom"    # F
    .param p4, "maxZoom"    # F

    .prologue
    .line 185
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .line 186
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V

    .line 187
    return-void
.end method

.method public setMinCropSize(I)V
    .registers 3
    .param p1, "value"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 75
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mCropMinSize:I

    .line 76
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    if-eqz v0, :cond_b

    .line 77
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->setMinSize(I)V

    .line 79
    :cond_b
    return-void
.end method

.method public setOnHighlightSingleTapUpConfirmedListener(Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightSingleTapUpListener:Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;

    .line 71
    return-void
.end method

.method public updateCropView(Z)V
    .registers 7
    .param p1, "bitmapChanged"    # Z

    .prologue
    const/4 v2, 0x0

    .line 259
    if-eqz p1, :cond_6

    .line 260
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setHighlightView(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)V

    .line 263
    :cond_6
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-nez v1, :cond_13

    .line 264
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setHighlightView(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)V

    .line 265
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->invalidate()V

    .line 278
    :goto_12
    return-void

    .line 269
    :cond_13
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getHighlightView()Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v1

    if-eqz v1, :cond_27

    .line 270
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatio:D

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getHighlightView()Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v1

    const/4 v4, 0x1

    invoke-direct {p0, v2, v3, v1, v4}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->updateAspectRatio(DLcom/adobe/creativesdk/aviary/widget/HighlightView;Z)V

    .line 277
    :goto_23
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->invalidate()V

    goto :goto_12

    .line 272
    :cond_27
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlighStyle:I

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;-><init>(Landroid/view/View;I)V

    .line 273
    .local v0, "hv":Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mCropMinSize:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->setMinSize(I)V

    .line 274
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mAspectRatio:D

    const/4 v1, 0x0

    invoke-direct {p0, v2, v3, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->updateAspectRatio(DLcom/adobe/creativesdk/aviary/widget/HighlightView;Z)V

    .line 275
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setHighlightView(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)V

    goto :goto_23
.end method
