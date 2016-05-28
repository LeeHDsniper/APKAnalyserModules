.class public Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;
.super Landroid/view/View;
.source "CropOverlayView.java"


# static fields
.field private static final DEFAULT_CORNER_EXTENSION_DP:F

.field private static final DEFAULT_CORNER_OFFSET_DP:F

.field private static final DEFAULT_CORNER_THICKNESS_DP:F

.field private static final DEFAULT_LINE_THICKNESS_DP:F


# instance fields
.field private initializedCropWindow:Z

.field private mAspectRatioX:I

.field private mAspectRatioY:I

.field private mBackgroundPaint:Landroid/graphics/Paint;

.field private mBitmapRect:Landroid/graphics/Rect;

.field private mBorderPaint:Landroid/graphics/Paint;

.field private mCornerExtension:F

.field private mCornerLength:F

.field private mCornerOffset:F

.field private mCornerPaint:Landroid/graphics/Paint;

.field private mFixAspectRatio:Z

.field private mGuidelinePaint:Landroid/graphics/Paint;

.field private mGuidelines:I

.field private mHandleRadius:F

.field private mPressedHandle:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

.field private mSnapRadius:F

.field private mTargetAspectRatio:F

.field private mTouchOffset:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/high16 v2, 0x40000000

    .line 47
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/util/PaintUtil;->getCornerThickness()F

    move-result v0

    sput v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->DEFAULT_CORNER_THICKNESS_DP:F

    .line 48
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/util/PaintUtil;->getLineThickness()F

    move-result v0

    sput v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->DEFAULT_LINE_THICKNESS_DP:F

    .line 49
    sget v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->DEFAULT_CORNER_THICKNESS_DP:F

    div-float/2addr v0, v2

    sget v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->DEFAULT_LINE_THICKNESS_DP:F

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    sput v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->DEFAULT_CORNER_OFFSET_DP:F

    .line 50
    sget v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->DEFAULT_CORNER_THICKNESS_DP:F

    div-float/2addr v0, v2

    sget v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->DEFAULT_CORNER_OFFSET_DP:F

    add-float/2addr v0, v1

    sput v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->DEFAULT_CORNER_EXTENSION_DP:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 120
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 96
    iput-boolean v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mFixAspectRatio:Z

    .line 99
    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioX:I

    .line 100
    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioY:I

    .line 104
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioY:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTargetAspectRatio:F

    .line 110
    iput-boolean v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initializedCropWindow:Z

    .line 121
    invoke-direct {p0, p1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->init(Landroid/content/Context;)V

    .line 122
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 125
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 96
    iput-boolean v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mFixAspectRatio:Z

    .line 99
    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioX:I

    .line 100
    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioY:I

    .line 104
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioY:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTargetAspectRatio:F

    .line 110
    iput-boolean v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initializedCropWindow:Z

    .line 126
    invoke-direct {p0, p1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->init(Landroid/content/Context;)V

    .line 127
    return-void
.end method

.method private drawBackground(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 23
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "bitmapRect"    # Landroid/graphics/Rect;

    .prologue
    .line 497
    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v12

    .line 498
    .local v12, "left":F
    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v5

    .line 499
    .local v5, "top":F
    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v19

    .line 500
    .local v19, "right":F
    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v8

    .line 517
    .local v8, "bottom":F
    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v1

    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v1

    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->right:I

    int-to-float v4, v1

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 518
    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v7, v1

    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->right:I

    int-to-float v9, v1

    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v10, v1

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    move-object/from16 v6, p1

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 519
    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v10, v1

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    move-object/from16 v9, p1

    move v11, v5

    move v13, v8

    invoke-virtual/range {v9 .. v14}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 520
    move-object/from16 v0, p2

    iget v1, v0, Landroid/graphics/Rect;->right:I

    int-to-float v0, v1

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    move-object/from16 v18, v0

    move-object/from16 v13, p1

    move/from16 v14, v19

    move v15, v5

    move/from16 v17, v8

    invoke-virtual/range {v13 .. v18}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 521
    return-void
.end method

.method private drawCorners(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 525
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v7

    .line 526
    .local v7, "left":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v9

    .line 527
    .local v9, "top":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v8

    .line 528
    .local v8, "right":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v6

    .line 533
    .local v6, "bottom":F
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    sub-float v1, v7, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerExtension:F

    sub-float v2, v9, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    sub-float v3, v7, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerLength:F

    add-float v4, v9, v0

    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 538
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    sub-float v2, v9, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerLength:F

    add-float v3, v7, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    sub-float v4, v9, v0

    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, v7

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 541
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    add-float v1, v8, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerExtension:F

    sub-float v2, v9, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    add-float v3, v8, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerLength:F

    add-float v4, v9, v0

    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 546
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    sub-float v2, v9, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerLength:F

    sub-float v3, v8, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    sub-float v4, v9, v0

    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, v8

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 549
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    sub-float v1, v7, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerExtension:F

    add-float v2, v6, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    sub-float v3, v7, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerLength:F

    sub-float v4, v6, v0

    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 554
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    add-float v2, v6, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerLength:F

    add-float v3, v7, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    add-float v4, v6, v0

    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, v7

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 561
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    add-float v1, v8, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerExtension:F

    add-float v2, v6, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    add-float v3, v8, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerLength:F

    sub-float v4, v6, v0

    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 566
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    add-float v2, v6, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerLength:F

    sub-float v3, v8, v0

    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    add-float v4, v6, v0

    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v1, v8

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 572
    return-void
.end method

.method private drawRuleOfThirdsGuidelines(Landroid/graphics/Canvas;)V
    .registers 22
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 473
    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v17

    .line 474
    .local v17, "left":F
    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    .line 475
    .local v3, "top":F
    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v14

    .line 476
    .local v14, "right":F
    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v5

    .line 479
    .local v5, "bottom":F
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getWidth()F

    move-result v1

    const/high16 v4, 0x40400000

    div-float v19, v1, v4

    .line 481
    .local v19, "oneThirdCropWidth":F
    add-float v2, v17, v19

    .line 482
    .local v2, "x1":F
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v4, v2

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 483
    sub-float v7, v14, v19

    .line 484
    .local v7, "x2":F
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v6, p1

    move v8, v3

    move v9, v7

    move v10, v5

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 487
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getHeight()F

    move-result v1

    const/high16 v4, 0x40400000

    div-float v18, v1, v4

    .line 489
    .local v18, "oneThirdCropHeight":F
    add-float v10, v3, v18

    .line 490
    .local v10, "y1":F
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    move/from16 v9, v17

    move v11, v14

    move v12, v10

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 491
    sub-float v13, v5, v18

    .line 492
    .local v13, "y2":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v16, v0

    move-object/from16 v11, p1

    move/from16 v12, v17

    move v15, v13

    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 493
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 350
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 352
    .local v0, "displayMetrics":Landroid/util/DisplayMetrics;
    invoke-static {p1}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->getTargetRadius(Landroid/content/Context;)F

    move-result v1

    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mHandleRadius:F

    .line 354
    const/high16 v1, 0x40c00000

    invoke-static {v2, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mSnapRadius:F

    .line 358
    invoke-static {p1}, Lcom/behance/sdk/edmodo/cropper/util/PaintUtil;->newBorderPaint(Landroid/content/Context;)Landroid/graphics/Paint;

    move-result-object v1

    iput-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    .line 359
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/util/PaintUtil;->newGuidelinePaint()Landroid/graphics/Paint;

    move-result-object v1

    iput-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    .line 360
    invoke-static {p1}, Lcom/behance/sdk/edmodo/cropper/util/PaintUtil;->newBackgroundPaint(Landroid/content/Context;)Landroid/graphics/Paint;

    move-result-object v1

    iput-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 361
    invoke-static {p1}, Lcom/behance/sdk/edmodo/cropper/util/PaintUtil;->newCornerPaint(Landroid/content/Context;)Landroid/graphics/Paint;

    move-result-object v1

    iput-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerPaint:Landroid/graphics/Paint;

    .line 364
    sget v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->DEFAULT_CORNER_OFFSET_DP:F

    invoke-static {v2, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerOffset:F

    .line 366
    sget v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->DEFAULT_CORNER_EXTENSION_DP:F

    invoke-static {v2, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerExtension:F

    .line 368
    const/high16 v1, 0x41a00000

    invoke-static {v2, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mCornerLength:F

    .line 372
    iput v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelines:I

    .line 373
    return-void
.end method

.method private initCropWindow(Landroid/graphics/Rect;)V
    .registers 14
    .param p1, "bitmapRect"    # Landroid/graphics/Rect;

    .prologue
    const v9, 0x3dcccccd

    const/high16 v11, 0x40000000

    .line 385
    iget-boolean v8, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initializedCropWindow:Z

    if-nez v8, :cond_c

    .line 386
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initializedCropWindow:Z

    .line 388
    :cond_c
    iget-boolean v8, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mFixAspectRatio:Z

    if-eqz v8, :cond_8e

    .line 393
    invoke-static {p1}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateAspectRatio(Landroid/graphics/Rect;)F

    move-result v8

    iget v9, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTargetAspectRatio:F

    cmpl-float v8, v8, v9

    if-lez v8, :cond_54

    .line 395
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iget v9, p1, Landroid/graphics/Rect;->top:I

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    .line 396
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iget v9, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    .line 398
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->getWidth()I

    move-result v8

    int-to-float v8, v8

    div-float v0, v8, v11

    .line 401
    .local v0, "centerX":F
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v8}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v8

    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v9

    iget v10, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTargetAspectRatio:F

    invoke-static {v8, v9, v10}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateWidth(FFF)F

    move-result v3

    .line 413
    .local v3, "cropWidth":F
    div-float v5, v3, v11

    .line 414
    .local v5, "halfCropWidth":F
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    sub-float v9, v0, v5

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    .line 415
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    add-float v9, v0, v5

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    .line 454
    .end local v0    # "centerX":F
    .end local v3    # "cropWidth":F
    .end local v5    # "halfCropWidth":F
    :goto_53
    return-void

    .line 419
    :cond_54
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iget v9, p1, Landroid/graphics/Rect;->left:I

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    .line 420
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iget v9, p1, Landroid/graphics/Rect;->right:I

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    .line 422
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->getHeight()I

    move-result v8

    int-to-float v8, v8

    div-float v1, v8, v11

    .line 425
    .local v1, "centerY":F
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v8}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v8

    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v9

    iget v10, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTargetAspectRatio:F

    invoke-static {v8, v9, v10}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateHeight(FFF)F

    move-result v2

    .line 438
    .local v2, "cropHeight":F
    div-float v4, v2, v11

    .line 439
    .local v4, "halfCropHeight":F
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    sub-float v9, v1, v4

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    .line 440
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    add-float v9, v1, v4

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    goto :goto_53

    .line 446
    .end local v1    # "centerY":F
    .end local v2    # "cropHeight":F
    .end local v4    # "halfCropHeight":F
    :cond_8e
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-float v8, v8

    mul-float v6, v9, v8

    .line 447
    .local v6, "horizontalPadding":F
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v8

    int-to-float v8, v8

    mul-float v7, v9, v8

    .line 449
    .local v7, "verticalPadding":F
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iget v9, p1, Landroid/graphics/Rect;->left:I

    int-to-float v9, v9

    add-float/2addr v9, v6

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    .line 450
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iget v9, p1, Landroid/graphics/Rect;->top:I

    int-to-float v9, v9

    add-float/2addr v9, v7

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    .line 451
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iget v9, p1, Landroid/graphics/Rect;->right:I

    int-to-float v9, v9

    sub-float/2addr v9, v6

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    .line 452
    sget-object v8, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    iget v9, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v9, v9

    sub-float/2addr v9, v7

    invoke-virtual {v8, v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    goto :goto_53
.end method

.method private onActionDown(FF)V
    .registers 16
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 582
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    .line 583
    .local v2, "left":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    .line 584
    .local v3, "top":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v4

    .line 585
    .local v4, "right":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v5

    .line 587
    .local v5, "bottom":F
    iget v6, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mHandleRadius:F

    move v0, p1

    move v1, p2

    invoke-static/range {v0 .. v6}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->getPressedHandle(FFFFFFF)Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mPressedHandle:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    .line 589
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mPressedHandle:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    if-nez v0, :cond_27

    .line 598
    :goto_26
    return-void

    .line 595
    :cond_27
    iget-object v6, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mPressedHandle:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    move v7, p1

    move v8, p2

    move v9, v2

    move v10, v3

    move v11, v4

    move v12, v5

    invoke-static/range {v6 .. v12}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->getOffset(Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;FFFFFF)Landroid/util/Pair;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTouchOffset:Landroid/util/Pair;

    .line 597
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->invalidate()V

    goto :goto_26
.end method

.method private onActionMove(FF)V
    .registers 9
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 622
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mPressedHandle:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    if-nez v0, :cond_5

    .line 639
    :goto_4
    return-void

    .line 629
    :cond_5
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTouchOffset:Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    add-float/2addr p1, v0

    .line 630
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTouchOffset:Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    add-float/2addr p2, v0

    .line 633
    iget-boolean v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mFixAspectRatio:Z

    if-eqz v0, :cond_30

    .line 634
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mPressedHandle:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    iget v3, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTargetAspectRatio:F

    iget-object v4, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    iget v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mSnapRadius:F

    move v1, p1

    move v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->updateCropWindow(FFFLandroid/graphics/Rect;F)V

    .line 638
    :goto_2c
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->invalidate()V

    goto :goto_4

    .line 636
    :cond_30
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mPressedHandle:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    iget v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mSnapRadius:F

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->updateCropWindow(FFLandroid/graphics/Rect;F)V

    goto :goto_2c
.end method

.method private onActionUp()V
    .registers 2

    .prologue
    .line 606
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mPressedHandle:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    if-nez v0, :cond_5

    .line 612
    :goto_4
    return-void

    .line 609
    :cond_5
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mPressedHandle:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    .line 611
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->invalidate()V

    goto :goto_4
.end method

.method public static showGuidelines()Z
    .registers 3

    .prologue
    const/high16 v2, 0x42c80000

    .line 464
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v2

    if-ltz v0, :cond_2c

    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 465
    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v2

    if-gez v0, :cond_2e

    .line 466
    :cond_2c
    const/4 v0, 0x0

    .line 468
    :goto_2d
    return v0

    :cond_2e
    const/4 v0, 0x1

    goto :goto_2d
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 142
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 145
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    invoke-direct {p0, p1, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->drawBackground(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 147
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->showGuidelines()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 149
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelines:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_38

    .line 150
    invoke-direct {p0, p1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->drawRuleOfThirdsGuidelines(Landroid/graphics/Canvas;)V

    .line 161
    :cond_16
    :goto_16
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 162
    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 163
    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 164
    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v4

    iget-object v5, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    move-object v0, p1

    .line 161
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 167
    invoke-direct {p0, p1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->drawCorners(Landroid/graphics/Canvas;)V

    .line 168
    return-void

    .line 151
    :cond_38
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelines:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_45

    .line 153
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mPressedHandle:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    if-eqz v0, :cond_16

    .line 154
    invoke-direct {p0, p1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->drawRuleOfThirdsGuidelines(Landroid/graphics/Canvas;)V

    goto :goto_16

    .line 155
    :cond_45
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelines:I

    if-nez v0, :cond_16

    goto :goto_16
.end method

.method protected onSizeChanged(IIII)V
    .registers 6
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 136
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initCropWindow(Landroid/graphics/Rect;)V

    .line 137
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 174
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_9

    .line 196
    :goto_8
    return v0

    .line 178
    :cond_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    packed-switch v2, :pswitch_data_3e

    goto :goto_8

    .line 181
    :pswitch_11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-direct {p0, v0, v2}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->onActionDown(FF)V

    move v0, v1

    .line 182
    goto :goto_8

    .line 186
    :pswitch_1e
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-interface {v2, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 187
    invoke-direct {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->onActionUp()V

    move v0, v1

    .line 188
    goto :goto_8

    .line 191
    :pswitch_2a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-direct {p0, v0, v2}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->onActionMove(FF)V

    .line 192
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    move v0, v1

    .line 193
    goto :goto_8

    .line 178
    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_11
        :pswitch_1e
        :pswitch_2a
        :pswitch_1e
    .end packed-switch
.end method

.method public resetCropOverlayView()V
    .registers 2

    .prologue
    .line 220
    iget-boolean v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_c

    .line 221
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initCropWindow(Landroid/graphics/Rect;)V

    .line 222
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->invalidate()V

    .line 224
    :cond_c
    return-void
.end method

.method public setAspectRatioX(I)V
    .registers 4
    .param p1, "aspectRatioX"    # I

    .prologue
    .line 272
    if-gtz p1, :cond_a

    .line 273
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set aspect ratio value to a number less than or equal to 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 275
    :cond_a
    iput p1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioX:I

    .line 276
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioY:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTargetAspectRatio:F

    .line 278
    iget-boolean v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_21

    .line 279
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initCropWindow(Landroid/graphics/Rect;)V

    .line 280
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->invalidate()V

    .line 283
    :cond_21
    return-void
.end method

.method public setAspectRatioY(I)V
    .registers 4
    .param p1, "aspectRatioY"    # I

    .prologue
    .line 293
    if-gtz p1, :cond_a

    .line 294
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set aspect ratio value to a number less than or equal to 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 296
    :cond_a
    iput p1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioY:I

    .line 297
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioY:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTargetAspectRatio:F

    .line 299
    iget-boolean v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_21

    .line 300
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initCropWindow(Landroid/graphics/Rect;)V

    .line 301
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->invalidate()V

    .line 304
    :cond_21
    return-void
.end method

.method public setBitmapRect(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "bitmapRect"    # Landroid/graphics/Rect;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    .line 210
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initCropWindow(Landroid/graphics/Rect;)V

    .line 211
    return-void
.end method

.method public setFixedAspectRatio(Z)V
    .registers 3
    .param p1, "fixAspectRatio"    # Z

    .prologue
    .line 256
    iput-boolean p1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mFixAspectRatio:Z

    .line 258
    iget-boolean v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_e

    .line 259
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initCropWindow(Landroid/graphics/Rect;)V

    .line 260
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->invalidate()V

    .line 262
    :cond_e
    return-void
.end method

.method public setGuidelines(I)V
    .registers 4
    .param p1, "guidelines"    # I

    .prologue
    .line 235
    if-ltz p1, :cond_5

    const/4 v0, 0x2

    if-le p1, v0, :cond_d

    .line 236
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Guideline value must be set between 0 and 2. See documentation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 238
    :cond_d
    iput p1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelines:I

    .line 240
    iget-boolean v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_1b

    .line 241
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mBitmapRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->initCropWindow(Landroid/graphics/Rect;)V

    .line 242
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->invalidate()V

    .line 245
    :cond_1b
    return-void
.end method

.method public setInitialAttributeValues(IZII)V
    .registers 7
    .param p1, "guidelines"    # I
    .param p2, "fixAspectRatio"    # Z
    .param p3, "aspectRatioX"    # I
    .param p4, "aspectRatioY"    # I

    .prologue
    .line 323
    if-ltz p1, :cond_5

    const/4 v0, 0x2

    if-le p1, v0, :cond_d

    .line 324
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Guideline value must be set between 0 and 2. See documentation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 326
    :cond_d
    iput p1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mGuidelines:I

    .line 328
    iput-boolean p2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mFixAspectRatio:Z

    .line 330
    if-gtz p3, :cond_1b

    .line 331
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set aspect ratio value to a number less than or equal to 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 333
    :cond_1b
    iput p3, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioX:I

    .line 334
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioY:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTargetAspectRatio:F

    .line 337
    if-gtz p4, :cond_30

    .line 338
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set aspect ratio value to a number less than or equal to 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 340
    :cond_30
    iput p4, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioY:I

    .line 341
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mAspectRatioY:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->mTargetAspectRatio:F

    .line 344
    return-void
.end method
