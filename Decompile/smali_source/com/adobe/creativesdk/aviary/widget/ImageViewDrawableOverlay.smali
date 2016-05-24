.class public Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.source "ImageViewDrawableOverlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private mDrawableListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

.field private mDropPaint:Landroid/graphics/Paint;

.field private mForceSingleSelection:Z

.field mLastMotionScrollX:F

.field mLastMotionScrollY:F

.field private mOverlayStyleId:I

.field private mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

.field private mOverlayViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;",
            ">;"
        }
    .end annotation
.end field

.field private mScaleWithContent:Z

.field mScrollStarted:Z

.field private mTempRect:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 559
    const-string v0, "ImageviewDrawableOverlay"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mForceSingleSelection:Z

    .line 41
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mTempRect:Landroid/graphics/Rect;

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScaleWithContent:Z

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mForceSingleSelection:Z

    .line 41
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mTempRect:Landroid/graphics/Rect;

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScaleWithContent:Z

    .line 51
    return-void
.end method

.method private checkSelection(Landroid/view/MotionEvent;)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .registers 8
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 310
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 311
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;>;"
    const/4 v2, 0x0

    .line 312
    .local v2, "selection":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_7
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_24

    .line 313
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 314
    .local v3, "view":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-virtual {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getHit(FF)I

    move-result v0

    .line 315
    .local v0, "edge":I
    const/4 v4, 0x1

    if-eq v0, v4, :cond_7

    .line 316
    move-object v2, v3

    goto :goto_7

    .line 319
    .end local v0    # "edge":I
    .end local v3    # "view":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_24
    return-object v2
.end method

.method private ensureVisible(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;FF)V
    .registers 16
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .param p2, "deltaX"    # F
    .param p3, "deltaY"    # F

    .prologue
    const/4 v9, 0x0

    .line 151
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getDrawRect()Landroid/graphics/RectF;

    move-result-object v6

    .line 152
    .local v6, "r":Landroid/graphics/RectF;
    const/4 v1, 0x0

    .local v1, "panDeltaX1":I
    const/4 v2, 0x0

    .line 153
    .local v2, "panDeltaX2":I
    const/4 v4, 0x0

    .local v4, "panDeltaY1":I
    const/4 v5, 0x0

    .line 155
    .local v5, "panDeltaY2":I
    cmpl-float v7, p2, v9

    if-lez v7, :cond_1a

    .line 156
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getLeft()I

    move-result v7

    int-to-float v7, v7

    iget v8, v6, Landroid/graphics/RectF;->left:F

    sub-float/2addr v7, v8

    invoke-static {v9, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    float-to-int v1, v7

    .line 158
    :cond_1a
    cmpg-float v7, p2, v9

    if-gez v7, :cond_2b

    .line 159
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getRight()I

    move-result v7

    int-to-float v7, v7

    iget v8, v6, Landroid/graphics/RectF;->right:F

    sub-float/2addr v7, v8

    invoke-static {v9, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    float-to-int v2, v7

    .line 162
    :cond_2b
    cmpl-float v7, p3, v9

    if-lez v7, :cond_3c

    .line 163
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getTop()I

    move-result v7

    int-to-float v7, v7

    iget v8, v6, Landroid/graphics/RectF;->top:F

    sub-float/2addr v7, v8

    invoke-static {v9, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    float-to-int v4, v7

    .line 166
    :cond_3c
    cmpg-float v7, p3, v9

    if-gez v7, :cond_4d

    .line 167
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getBottom()I

    move-result v7

    int-to-float v7, v7

    iget v8, v6, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v7, v8

    invoke-static {v9, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    float-to-int v5, v7

    .line 170
    :cond_4d
    if-eqz v1, :cond_5d

    move v0, v1

    .line 171
    .local v0, "panDeltaX":I
    :goto_50
    if-eqz v4, :cond_5f

    move v3, v4

    .line 173
    .local v3, "panDeltaY":I
    :goto_53
    if-nez v0, :cond_57

    if-eqz v3, :cond_5c

    .line 174
    :cond_57
    int-to-double v8, v0

    int-to-double v10, v3

    invoke-virtual {p0, v8, v9, v10, v11}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->panBy(DD)V

    .line 176
    :cond_5c
    return-void

    .end local v0    # "panDeltaX":I
    .end local v3    # "panDeltaY":I
    :cond_5d
    move v0, v2

    .line 170
    goto :goto_50

    .restart local v0    # "panDeltaX":I
    :cond_5f
    move v3, v5

    .line 171
    goto :goto_53
.end method


# virtual methods
.method public addHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z
    .registers 4
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    const/4 v0, 0x1

    .line 469
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 470
    const/4 v0, 0x0

    .line 480
    :cond_a
    :goto_a
    return v0

    .line 473
    :cond_b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 474
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->postInvalidate()V

    .line 476
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v0, :cond_a

    .line 477
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setSelectedHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    goto :goto_a
.end method

.method public animate(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 2
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 484
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->animateContent()V

    .line 485
    return-void
.end method

.method public clearOverlays()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 460
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setSelectedHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 461
    :goto_4
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_19

    .line 462
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 463
    .local v0, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->dispose()V

    goto :goto_4

    .line 465
    .end local v0    # "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_19
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 466
    return-void
.end method

.method public getHighlightCount()I
    .registers 2

    .prologue
    .line 548
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 552
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_11

    .line 553
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 555
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public getOverlayStyleId()I
    .registers 2

    .prologue
    .line 328
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayStyleId:I

    return v0
.end method

.method public getScaleWithContent()Z
    .registers 2

    .prologue
    .line 332
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScaleWithContent:Z

    return v0
.end method

.method public getSelectedHighlightView()Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .registers 2

    .prologue
    .line 502
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v3, 0x0

    .line 55
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledDoubleTapSlop()I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mTouchSlop:I

    .line 57
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v2, v3}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    .line 59
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    .line 61
    .local v1, "theme":Landroid/content/res/Resources$Theme;
    sget-object v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageViewDrawableOverlay:[I

    invoke-virtual {v1, p2, v2, p3, v3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 62
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageViewDrawableOverlay_adobe_highlightStyle:I

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayStyleId:I

    .line 64
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 65
    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 20
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 190
    const-string v2, "ImageViewTouchBase"

    const-string v3, "onDown"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScrollStarted:Z

    .line 193
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mLastMotionScrollX:F

    .line 194
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mLastMotionScrollY:F

    .line 197
    invoke-direct/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->checkSelection(Landroid/view/MotionEvent;)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v16

    .line 198
    .local v16, "newSelection":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    move-object/from16 v17, v16

    .line 200
    .local v17, "realNewSelection":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    if-nez v16, :cond_40

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_40

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mForceSingleSelection:Z

    if-eqz v2, :cond_40

    .line 203
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    .end local v16    # "newSelection":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    check-cast v16, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 206
    .restart local v16    # "newSelection":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_40
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setSelectedHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 208
    if-eqz v17, :cond_1a5

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScaleWithContent:Z

    if-eqz v2, :cond_1a5

    .line 209
    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRectF()Landroid/graphics/RectF;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getDisplayRect(Landroid/graphics/Matrix;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v9

    .line 210
    .local v9, "displayRect":Landroid/graphics/RectF;
    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v2

    invoke-interface {v2, v9}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->validateSize(Landroid/graphics/RectF;)Z

    move-result v11

    .line 212
    .local v11, "invalidSize":Z
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalidSize: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    if-nez v11, :cond_1a5

    .line 215
    const-string v2, "ImageViewTouchBase"

    const-string v3, "drawable too small!!!"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v2

    invoke-interface {v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getMinWidth()F

    move-result v15

    .line 218
    .local v15, "minW":F
    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v2

    invoke-interface {v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getMinHeight()F

    move-result v12

    .line 220
    .local v12, "minH":F
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "minW: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "minH: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    invoke-static {v15, v12}, Ljava/lang/Math;->min(FF)F

    move-result v2

    const v3, 0x3f8ccccd

    mul-float v14, v2, v3

    .line 225
    .local v14, "minSize":F
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "minSize: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v13

    .line 229
    .local v13, "minRectSize":F
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "minRectSize: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    div-float v8, v14, v13

    .line 233
    .local v8, "diff":F
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "diff: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "min.size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cur.size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "zooming to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getScale()F

    move-result v4

    mul-float/2addr v4, v8

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getScale()F

    move-result v2

    mul-float v3, v2, v8

    .line 241
    invoke-virtual {v9}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    .line 242
    invoke-virtual {v9}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    const-wide/16 v6, 0x12c

    move-object/from16 v2, p0

    .line 239
    invoke-virtual/range {v2 .. v7}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->zoomTo(FFFJ)V

    .line 244
    const/4 v2, 0x1

    .line 274
    .end local v8    # "diff":F
    .end local v9    # "displayRect":Landroid/graphics/RectF;
    .end local v11    # "invalidSize":Z
    .end local v12    # "minH":F
    .end local v13    # "minRectSize":F
    .end local v14    # "minSize":F
    .end local v15    # "minW":F
    :goto_1a4
    return v2

    .line 248
    :cond_1a5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v2, :cond_1e7

    .line 249
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getHit(FF)I

    move-result v10

    .line 251
    .local v10, "edge":I
    const/4 v2, 0x1

    invoke-static {v10, v2}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v2

    if-nez v2, :cond_1e7

    .line 253
    const/16 v2, 0x80

    invoke-static {v10, v2}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v2

    if-eqz v2, :cond_1ec

    .line 254
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    const/16 v3, 0x80

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setMode(I)V

    .line 267
    :cond_1d3
    :goto_1d3
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->postInvalidate()V

    .line 268
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDrawableListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

    if-eqz v2, :cond_1e7

    .line 269
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDrawableListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;->onDown(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 274
    .end local v10    # "edge":I
    :cond_1e7
    invoke-super/range {p0 .. p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDown(Landroid/view/MotionEvent;)Z

    move-result v2

    goto :goto_1a4

    .line 256
    .restart local v10    # "edge":I
    :cond_1ec
    const/16 v2, 0x100

    invoke-static {v10, v2}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v2

    if-eqz v2, :cond_1fe

    .line 257
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    const/16 v3, 0x100

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setMode(I)V

    goto :goto_1d3

    .line 259
    :cond_1fe
    const/16 v2, 0x200

    invoke-static {v10, v2}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v2

    if-nez v2, :cond_1d3

    .line 262
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    const/16 v2, 0x40

    if-ne v10, v2, :cond_214

    const/16 v2, 0x40

    :goto_210
    invoke-virtual {v3, v2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setMode(I)V

    goto :goto_1d3

    :cond_214
    const/16 v2, 0x20

    if-ne v10, v2, :cond_21b

    const/16 v2, 0x20

    goto :goto_210

    :cond_21b
    const/16 v2, 0x1e

    goto :goto_210
.end method

.method public onDragEntered()V
    .registers 5

    .prologue
    .line 562
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDropPaint:Landroid/graphics/Paint;

    .line 563
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDropPaint:Landroid/graphics/Paint;

    const v1, -0xcc4a1b

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 564
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDropPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 565
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDropPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/BlurMaskFilter;

    const/high16 v2, 0x40800000

    sget-object v3, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v1, v2, v3}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 566
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDropPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 567
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->postInvalidate()V

    .line 568
    return-void
.end method

.method public onDragExited()V
    .registers 2

    .prologue
    .line 571
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDropPaint:Landroid/graphics/Paint;

    .line 572
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->postInvalidate()V

    .line 573
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 426
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDraw(Landroid/graphics/Canvas;)V

    .line 428
    const/4 v3, 0x0

    .line 430
    .local v3, "shouldInvalidateAfter":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_35

    .line 431
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->save(I)I

    .line 433
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 434
    .local v1, "current":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->draw(Landroid/graphics/Canvas;)V

    .line 437
    if-nez v3, :cond_2f

    .line 438
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    .line 439
    .local v0, "content":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    instance-of v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v4, :cond_2f

    .line 440
    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .end local v0    # "content":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isEditing()Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 441
    const/4 v3, 0x1

    .line 446
    :cond_2f
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 430
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 449
    .end local v1    # "current":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_35
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDropPaint:Landroid/graphics/Paint;

    if-eqz v4, :cond_45

    .line 450
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 451
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mTempRect:Landroid/graphics/Rect;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDropPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 454
    :cond_45
    if-eqz v3, :cond_4c

    .line 455
    const-wide/16 v4, 0x190

    invoke-virtual {p0, v4, v5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->postInvalidateDelayed(J)V

    .line 457
    :cond_4c
    return-void
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 7
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 180
    const-string v0, "ImageViewTouchBase"

    const-string v1, "onFling"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMode()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_16

    .line 183
    const/4 v0, 0x0

    .line 185
    :goto_15
    return v0

    :cond_16
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v0

    goto :goto_15
.end method

.method protected onLayoutChanged(IIII)V
    .registers 9
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 69
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onLayoutChanged(IIII)V

    .line 71
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_2a

    .line 73
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 74
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;>;"
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 75
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 76
    .local v1, "view":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 77
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->invalidate()V

    goto :goto_f

    .line 80
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;>;"
    .end local v1    # "view":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_2a
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 14
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    const/4 v4, 0x1

    .line 111
    const-string v5, "ImageViewTouchBase"

    const-string v6, "onScroll"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 116
    .local v2, "x":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 118
    .local v3, "y":F
    iget-boolean v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScrollStarted:Z

    if-nez v5, :cond_61

    .line 119
    const/4 v0, 0x0

    .line 120
    .local v0, "dx":F
    const/4 v1, 0x0

    .line 121
    .local v1, "dy":F
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScrollStarted:Z

    .line 127
    :goto_18
    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mLastMotionScrollX:F

    .line 128
    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mLastMotionScrollY:F

    .line 130
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v5, :cond_6a

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMode()I

    move-result v5

    if-eq v5, v4, :cond_6a

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 131
    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMode()I

    move-result v5

    const/16 v6, 0x80

    if-eq v5, v6, :cond_6a

    .line 132
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMode()I

    move-result v6

    neg-float v7, v0

    neg-float v8, v1

    invoke-virtual {v5, v6, p2, v7, v8}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->onMouseMove(ILandroid/view/MotionEvent;FF)V

    .line 133
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->postInvalidate()V

    .line 135
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDrawableListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

    if-eqz v5, :cond_4d

    .line 136
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDrawableListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;->onMove(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 139
    :cond_4d
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMode()I

    move-result v5

    const/16 v6, 0x40

    if-ne v5, v6, :cond_60

    .line 140
    iget-boolean v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScaleWithContent:Z

    if-nez v5, :cond_60

    .line 141
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v5, p3, p4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->ensureVisible(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;FF)V

    .line 146
    :cond_60
    :goto_60
    return v4

    .line 123
    .end local v0    # "dx":F
    .end local v1    # "dy":F
    :cond_61
    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mLastMotionScrollX:F

    sub-float v0, v5, v2

    .line 124
    .restart local v0    # "dx":F
    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mLastMotionScrollY:F

    sub-float v1, v5, v3

    .restart local v1    # "dy":F
    goto :goto_18

    .line 146
    :cond_6a
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v4

    goto :goto_60
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 97
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 98
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;>;"
    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 99
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 100
    .local v1, "view":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->isSelected()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 101
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->onSingleTapConfirmed(FF)V

    .line 102
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->postInvalidate()V

    goto :goto_6

    .line 106
    .end local v1    # "view":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_27
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    move-result v2

    return v2
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    .line 288
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v2, :cond_39

    .line 290
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getHit(FF)I

    move-result v0

    .line 291
    .local v0, "edge":I
    and-int/lit8 v2, v0, 0x40

    const/16 v3, 0x40

    if-ne v2, v3, :cond_25

    .line 292
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDrawableListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

    if-eqz v2, :cond_24

    .line 293
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDrawableListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;->onClick(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 306
    .end local v0    # "edge":I
    :cond_24
    :goto_24
    return v1

    .line 298
    .restart local v0    # "edge":I
    :cond_25
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setMode(I)V

    .line 299
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->postInvalidate()V

    .line 301
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v2, v1, :cond_39

    .line 302
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setSelectedHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 306
    .end local v0    # "edge":I
    :cond_39
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_24
.end method

.method public onUp(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 279
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v0, :cond_d

    .line 280
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setMode(I)V

    .line 281
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->postInvalidate()V

    .line 283
    :cond_d
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onUp(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method protected postScale(FFF)V
    .registers 15
    .param p1, "scale"    # F
    .param p2, "centerX"    # F
    .param p3, "centerY"    # F

    .prologue
    .line 390
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_a1

    .line 391
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 393
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;>;"
    new-instance v4, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    invoke-direct {v4, v8}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 394
    .local v4, "oldMatrix":Landroid/graphics/Matrix;
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postScale(FFF)V

    .line 396
    :goto_1a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a4

    .line 397
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 399
    .local v7, "view":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    iget-boolean v8, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScaleWithContent:Z

    if-nez v8, :cond_95

    .line 400
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRectF()Landroid/graphics/RectF;

    move-result-object v0

    .line 401
    .local v0, "cropRect":Landroid/graphics/RectF;
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRectF()Landroid/graphics/RectF;

    move-result-object v8

    invoke-virtual {v7, v4, v8}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getDisplayRect(Landroid/graphics/Matrix;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v5

    .line 402
    .local v5, "rect1":Landroid/graphics/RectF;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRectF()Landroid/graphics/RectF;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getDisplayRect(Landroid/graphics/Matrix;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v6

    .line 404
    .local v6, "rect2":Landroid/graphics/RectF;
    const/16 v8, 0x9

    new-array v3, v8, [F

    .line 405
    .local v3, "mvalues":[F
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    invoke-virtual {v8, v3}, Landroid/graphics/Matrix;->getValues([F)V

    .line 406
    const/4 v8, 0x0

    aget v1, v3, v8

    .line 408
    .local v1, "currentScale":F
    iget v8, v5, Landroid/graphics/RectF;->left:F

    iget v9, v6, Landroid/graphics/RectF;->left:F

    sub-float/2addr v8, v9

    div-float/2addr v8, v1

    iget v9, v5, Landroid/graphics/RectF;->top:F

    iget v10, v6, Landroid/graphics/RectF;->top:F

    sub-float/2addr v9, v10

    div-float/2addr v9, v1

    invoke-virtual {v0, v8, v9}, Landroid/graphics/RectF;->offset(FF)V

    .line 409
    iget v8, v0, Landroid/graphics/RectF;->right:F

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v9

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v10

    sub-float/2addr v9, v10

    neg-float v9, v9

    div-float/2addr v9, v1

    add-float/2addr v8, v9

    iput v8, v0, Landroid/graphics/RectF;->right:F

    .line 410
    iget v8, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v9

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v10

    sub-float/2addr v9, v10

    neg-float v9, v9

    div-float/2addr v9, v1

    add-float/2addr v8, v9

    iput v8, v0, Landroid/graphics/RectF;->bottom:F

    .line 412
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 413
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRectF()Landroid/graphics/RectF;

    move-result-object v8

    invoke-virtual {v8, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 417
    .end local v0    # "cropRect":Landroid/graphics/RectF;
    .end local v1    # "currentScale":F
    .end local v3    # "mvalues":[F
    .end local v5    # "rect1":Landroid/graphics/RectF;
    .end local v6    # "rect2":Landroid/graphics/RectF;
    :goto_91
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->invalidate()V

    goto :goto_1a

    .line 415
    :cond_95
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    goto :goto_91

    .line 420
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;>;"
    .end local v4    # "oldMatrix":Landroid/graphics/Matrix;
    .end local v7    # "view":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_a1
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postScale(FFF)V

    .line 422
    :cond_a4
    return-void
.end method

.method protected postTranslate(FF)V
    .registers 10
    .param p1, "deltaX"    # F
    .param p2, "deltaY"    # F

    .prologue
    .line 367
    invoke-super {p0, p1, p2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postTranslate(FF)V

    .line 369
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 370
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;>;"
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4b

    .line 371
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 372
    .local v3, "view":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getScale()F

    move-result v4

    const/high16 v5, 0x3f800000

    cmpl-float v4, v4, v5

    if-eqz v4, :cond_3c

    .line 373
    const/16 v4, 0x9

    new-array v1, v4, [F

    .line 374
    .local v1, "mvalues":[F
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 375
    const/4 v4, 0x0

    aget v2, v1, v4

    .line 377
    .local v2, "scale":F
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScaleWithContent:Z

    if-nez v4, :cond_3c

    .line 378
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRectF()Landroid/graphics/RectF;

    move-result-object v4

    neg-float v5, p1

    div-float/2addr v5, v2

    neg-float v6, p2

    div-float/2addr v6, v2

    invoke-virtual {v4, v5, v6}, Landroid/graphics/RectF;->offset(FF)V

    .line 382
    .end local v1    # "mvalues":[F
    .end local v2    # "scale":F
    :cond_3c
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 383
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->invalidate()V

    goto :goto_9

    .line 385
    .end local v3    # "view":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_4b
    return-void
.end method

.method public removeHightlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z
    .registers 5
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 488
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_33

    .line 489
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 490
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayViews:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 491
    .local v0, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 492
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setSelectedHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 494
    :cond_2b
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->dispose()V

    .line 495
    const/4 v2, 0x1

    .line 498
    .end local v0    # "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :goto_2f
    return v2

    .line 488
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 498
    :cond_33
    const/4 v2, 0x0

    goto :goto_2f
.end method

.method public setForceSingleSelection(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 352
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mForceSingleSelection:Z

    .line 353
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V
    .registers 5
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "initialMatrix"    # Landroid/graphics/Matrix;
    .param p3, "minZoom"    # F
    .param p4, "maxZoom"    # F

    .prologue
    .line 362
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V

    .line 363
    return-void
.end method

.method public setOnDrawableEventListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

    .prologue
    .line 356
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDrawableListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

    .line 357
    return-void
.end method

.method public setScaleWithContent(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 342
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mScaleWithContent:Z

    .line 343
    return-void
.end method

.method public setSelectedHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 5
    .param p1, "newView"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 507
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 509
    .local v0, "oldView":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v1, :cond_14

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    .line 510
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setSelected(Z)V

    .line 513
    :cond_14
    if-eqz p1, :cond_1a

    .line 514
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setSelected(Z)V

    .line 517
    :cond_1a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->postInvalidate()V

    .line 519
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mOverlayView:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 521
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDrawableListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

    if-eqz v1, :cond_28

    .line 522
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->mDrawableListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;

    invoke-interface {v1, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;->onFocusChange(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 524
    :cond_28
    return-void
.end method
