.class public Lcom/behance/sdk/edmodo/cropper/CropImageView;
.super Landroid/widget/FrameLayout;
.source "CropImageView.java"


# static fields
.field private static final EMPTY_RECT:Landroid/graphics/Rect;


# instance fields
.field private mAspectRatioX:I

.field private mAspectRatioY:I

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

.field private mDegreesRotated:I

.field private mFixAspectRatio:Z

.field private mGuidelines:I

.field private mImageResource:I

.field private mImageView:Landroid/widget/ImageView;

.field private mLayoutHeight:I

.field private mLayoutWidth:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 45
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->EMPTY_RECT:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 78
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 63
    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 69
    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mGuidelines:I

    .line 70
    iput-boolean v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mFixAspectRatio:Z

    .line 71
    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioX:I

    .line 72
    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioY:I

    .line 73
    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mImageResource:I

    .line 79
    invoke-direct {p0, p1}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->init(Landroid/content/Context;)V

    .line 80
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 83
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 63
    iput v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 69
    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mGuidelines:I

    .line 70
    iput-boolean v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mFixAspectRatio:Z

    .line 71
    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioX:I

    .line 72
    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioY:I

    .line 73
    iput v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mImageResource:I

    .line 85
    sget-object v1, Lcom/behance/sdk/R$styleable;->CropImageView:[I

    invoke-virtual {p1, p2, v1, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 88
    .local v0, "ta":Landroid/content/res/TypedArray;
    :try_start_17
    sget v1, Lcom/behance/sdk/R$styleable;->CropImageView_guidelines:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mGuidelines:I

    .line 89
    sget v1, Lcom/behance/sdk/R$styleable;->CropImageView_fixAspectRatio:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mFixAspectRatio:Z

    .line 91
    sget v1, Lcom/behance/sdk/R$styleable;->CropImageView_aspectRatioX:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioX:I

    .line 92
    sget v1, Lcom/behance/sdk/R$styleable;->CropImageView_aspectRatioY:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioY:I

    .line 93
    sget v1, Lcom/behance/sdk/R$styleable;->CropImageView_imageResource:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mImageResource:I
    :try_end_44
    .catchall {:try_start_17 .. :try_end_44} :catchall_4b

    .line 95
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 98
    invoke-direct {p0, p1}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->init(Landroid/content/Context;)V

    .line 99
    return-void

    .line 95
    :catchall_4b
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method private static getOnMeasureSpec(III)I
    .registers 5
    .param p0, "measureSpecMode"    # I
    .param p1, "measureSpecSize"    # I
    .param p2, "desiredSize"    # I

    .prologue
    .line 505
    const/high16 v1, 0x40000000

    if-ne p0, v1, :cond_6

    .line 507
    move v0, p1

    .line 516
    .local v0, "spec":I
    :goto_5
    return v0

    .line 508
    .end local v0    # "spec":I
    :cond_6
    const/high16 v1, -0x80000000

    if-ne p0, v1, :cond_f

    .line 510
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .restart local v0    # "spec":I
    goto :goto_5

    .line 513
    .end local v0    # "spec":I
    :cond_f
    move v0, p2

    .restart local v0    # "spec":I
    goto :goto_5
.end method

.method private init(Landroid/content/Context;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 482
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 483
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v2, Lcom/behance/sdk/R$layout;->crop_image_view:I

    const/4 v3, 0x1

    invoke-virtual {v0, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 485
    .local v1, "v":Landroid/view/View;
    sget v2, Lcom/behance/sdk/R$id;->ImageView_image:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    .line 487
    iget v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mImageResource:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setImageResource(I)V

    .line 488
    sget v2, Lcom/behance/sdk/R$id;->CropOverlayView:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    iput-object v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    .line 489
    iget-object v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    iget v3, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mGuidelines:I

    iget-boolean v4, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mFixAspectRatio:Z

    iget v5, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioX:I

    iget v6, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioY:I

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->setInitialAttributeValues(IZII)V

    .line 490
    return-void
.end method


# virtual methods
.method public getActualCropRect()Landroid/graphics/RectF;
    .registers 20

    .prologue
    .line 380
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    invoke-static/range {v17 .. v18}, Lcom/behance/sdk/edmodo/cropper/util/ImageViewUtil;->getBitmapRectCenterInside(Landroid/graphics/Bitmap;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v13

    .line 384
    .local v13, "displayedImageRect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v17

    move/from16 v0, v17

    int-to-float v7, v0

    .line 385
    .local v7, "actualImageWidth":F
    invoke-virtual {v13}, Landroid/graphics/Rect;->width()I

    move-result v17

    move/from16 v0, v17

    int-to-float v14, v0

    .line 386
    .local v14, "displayedImageWidth":F
    div-float v16, v7, v14

    .line 390
    .local v16, "scaleFactorWidth":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v17

    move/from16 v0, v17

    int-to-float v6, v0

    .line 391
    .local v6, "actualImageHeight":F
    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v17

    move/from16 v0, v17

    int-to-float v12, v0

    .line 392
    .local v12, "displayedImageHeight":F
    div-float v15, v6, v12

    .line 395
    .local v15, "scaleFactorHeight":F
    sget-object v17, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual/range {v17 .. v17}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v17

    iget v0, v13, Landroid/graphics/Rect;->left:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    sub-float v9, v17, v18

    .line 396
    .local v9, "displayedCropLeft":F
    sget-object v17, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual/range {v17 .. v17}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v17

    iget v0, v13, Landroid/graphics/Rect;->top:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    sub-float v10, v17, v18

    .line 397
    .local v10, "displayedCropTop":F
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getWidth()F

    move-result v11

    .line 398
    .local v11, "displayedCropWidth":F
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getHeight()F

    move-result v8

    .line 401
    .local v8, "displayedCropHeight":F
    mul-float v2, v9, v16

    .line 402
    .local v2, "actualCropLeft":F
    mul-float v5, v10, v15

    .line 403
    .local v5, "actualCropTop":F
    mul-float v17, v11, v16

    add-float v4, v2, v17

    .line 404
    .local v4, "actualCropRight":F
    mul-float v17, v8, v15

    add-float v1, v5, v17

    .line 408
    .local v1, "actualCropBottom":F
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 409
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-static {v0, v5}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 410
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v17

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-static {v0, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 411
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v17

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 413
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v2, v5, v4, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 418
    .local v3, "actualCropRect":Landroid/graphics/RectF;
    return-object v3
.end method

.method public getCroppedImage()Landroid/graphics/Bitmap;
    .registers 23

    .prologue
    .line 336
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    invoke-static/range {v17 .. v18}, Lcom/behance/sdk/edmodo/cropper/util/ImageViewUtil;->getBitmapRectCenterInside(Landroid/graphics/Bitmap;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v13

    .line 340
    .local v13, "displayedImageRect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v17

    move/from16 v0, v17

    int-to-float v6, v0

    .line 341
    .local v6, "actualImageWidth":F
    invoke-virtual {v13}, Landroid/graphics/Rect;->width()I

    move-result v17

    move/from16 v0, v17

    int-to-float v14, v0

    .line 342
    .local v14, "displayedImageWidth":F
    div-float v16, v6, v14

    .line 346
    .local v16, "scaleFactorWidth":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v17

    move/from16 v0, v17

    int-to-float v5, v0

    .line 347
    .local v5, "actualImageHeight":F
    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v17

    move/from16 v0, v17

    int-to-float v12, v0

    .line 348
    .local v12, "displayedImageHeight":F
    div-float v15, v5, v12

    .line 351
    .local v15, "scaleFactorHeight":F
    sget-object v17, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual/range {v17 .. v17}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v17

    iget v0, v13, Landroid/graphics/Rect;->left:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    sub-float v9, v17, v18

    .line 352
    .local v9, "cropWindowX":F
    sget-object v17, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual/range {v17 .. v17}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v17

    iget v0, v13, Landroid/graphics/Rect;->top:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    sub-float v10, v17, v18

    .line 353
    .local v10, "cropWindowY":F
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getWidth()F

    move-result v8

    .line 354
    .local v8, "cropWindowWidth":F
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getHeight()F

    move-result v7

    .line 357
    .local v7, "cropWindowHeight":F
    mul-float v3, v9, v16

    .line 358
    .local v3, "actualCropX":F
    mul-float v4, v10, v15

    .line 359
    .local v4, "actualCropY":F
    mul-float v2, v8, v16

    .line 360
    .local v2, "actualCropWidth":F
    mul-float v1, v7, v15

    .line 363
    .local v1, "actualCropHeight":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    float-to-int v0, v3

    move/from16 v18, v0

    float-to-int v0, v4

    move/from16 v19, v0

    float-to-int v0, v2

    move/from16 v20, v0

    float-to-int v0, v1

    move/from16 v21, v0

    invoke-static/range {v17 .. v21}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v11

    .line 369
    .local v11, "croppedBitmap":Landroid/graphics/Bitmap;
    return-object v11
.end method

.method public getImageResource()I
    .registers 2

    .prologue
    .line 247
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mImageResource:I

    return v0
.end method

.method public getImageView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .registers 8
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 228
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 230
    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mLayoutWidth:I

    if-lez v1, :cond_1a

    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mLayoutHeight:I

    if-lez v1, :cond_1a

    .line 232
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 233
    .local v0, "origparams":Landroid/view/ViewGroup$LayoutParams;
    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mLayoutWidth:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 234
    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mLayoutHeight:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 235
    invoke-virtual {p0, v0}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 237
    .end local v0    # "origparams":Landroid/view/ViewGroup$LayoutParams;
    :cond_1a
    return-void
.end method

.method protected onMeasure(II)V
    .registers 23
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 155
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v13

    .line 156
    .local v13, "widthMode":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v14

    .line 157
    .local v14, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v6

    .line 158
    .local v6, "heightMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    .line 160
    .local v7, "heightSize":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v15, :cond_d6

    .line 162
    invoke-super/range {p0 .. p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 166
    if-nez v7, :cond_23

    .line 167
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    .line 172
    :cond_23
    const-wide/high16 v10, 0x7ff0000000000000L

    .line 173
    .local v10, "viewToBitmapWidthRatio":D
    const-wide/high16 v8, 0x7ff0000000000000L

    .line 178
    .local v8, "viewToBitmapHeightRatio":D
    int-to-double v0, v14

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v15

    int-to-double v0, v15

    move-wide/from16 v18, v0

    div-double v10, v16, v18

    .line 181
    int-to-double v0, v7

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    int-to-double v0, v15

    move-wide/from16 v18, v0

    div-double v8, v16, v18

    .line 186
    const-wide/high16 v16, 0x7ff0000000000000L

    cmpl-double v15, v10, v16

    if-nez v15, :cond_53

    const-wide/high16 v16, 0x7ff0000000000000L

    cmpl-double v15, v8, v16

    if-eqz v15, :cond_c5

    .line 187
    :cond_53
    cmpg-double v15, v10, v8

    if-gtz v15, :cond_b3

    .line 188
    move v4, v14

    .line 189
    .local v4, "desiredWidth":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    int-to-double v0, v15

    move-wide/from16 v16, v0

    mul-double v16, v16, v10

    move-wide/from16 v0, v16

    double-to-int v3, v0

    .line 204
    .local v3, "desiredHeight":I
    :goto_68
    invoke-static {v13, v14, v4}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->getOnMeasureSpec(III)I

    move-result v12

    .line 205
    .local v12, "width":I
    invoke-static {v6, v7, v3}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->getOnMeasureSpec(III)I

    move-result v5

    .line 207
    .local v5, "height":I
    move-object/from16 v0, p0

    iput v12, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mLayoutWidth:I

    .line 208
    move-object/from16 v0, p0

    iput v5, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mLayoutHeight:I

    .line 210
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v16, v0

    .line 211
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mLayoutWidth:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mLayoutHeight:I

    move/from16 v18, v0

    .line 210
    invoke-static/range {v15 .. v18}, Lcom/behance/sdk/edmodo/cropper/util/ImageViewUtil;->getBitmapRectCenterInside(IIII)Landroid/graphics/Rect;

    move-result-object v2

    .line 214
    .local v2, "bitmapRect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    invoke-virtual {v15, v2}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->setBitmapRect(Landroid/graphics/Rect;)V

    .line 217
    move-object/from16 v0, p0

    iget v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mLayoutWidth:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mLayoutHeight:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setMeasuredDimension(II)V

    .line 224
    .end local v2    # "bitmapRect":Landroid/graphics/Rect;
    .end local v3    # "desiredHeight":I
    .end local v4    # "desiredWidth":I
    .end local v5    # "height":I
    .end local v8    # "viewToBitmapHeightRatio":D
    .end local v10    # "viewToBitmapWidthRatio":D
    .end local v12    # "width":I
    :goto_b2
    return-void

    .line 191
    .restart local v8    # "viewToBitmapHeightRatio":D
    .restart local v10    # "viewToBitmapWidthRatio":D
    :cond_b3
    move v3, v7

    .line 192
    .restart local v3    # "desiredHeight":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v15

    int-to-double v0, v15

    move-wide/from16 v16, v0

    mul-double v16, v16, v8

    move-wide/from16 v0, v16

    double-to-int v4, v0

    .restart local v4    # "desiredWidth":I
    goto :goto_68

    .line 200
    .end local v3    # "desiredHeight":I
    .end local v4    # "desiredWidth":I
    :cond_c5
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    .line 201
    .restart local v4    # "desiredWidth":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    .restart local v3    # "desiredHeight":I
    goto :goto_68

    .line 221
    .end local v3    # "desiredHeight":I
    .end local v4    # "desiredWidth":I
    .end local v8    # "viewToBitmapHeightRatio":D
    .end local v10    # "viewToBitmapWidthRatio":D
    :cond_d6
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    sget-object v16, Lcom/behance/sdk/edmodo/cropper/CropImageView;->EMPTY_RECT:Landroid/graphics/Rect;

    invoke-virtual/range {v15 .. v16}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->setBitmapRect(Landroid/graphics/Rect;)V

    .line 222
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v7}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setMeasuredDimension(II)V

    goto :goto_b2
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 118
    instance-of v2, p1, Landroid/os/Bundle;

    if-eqz v2, :cond_26

    move-object v0, p1

    .line 120
    check-cast v0, Landroid/os/Bundle;

    .line 122
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_1c

    .line 124
    const-string v2, "DEGREES_ROTATED"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 125
    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 126
    .local v1, "tempDegrees":I
    iget v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->rotateImage(I)V

    .line 127
    iput v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 130
    .end local v1    # "tempDegrees":I
    :cond_1c
    const-string v2, "instanceState"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    invoke-super {p0, v2}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 135
    .end local v0    # "bundle":Landroid/os/Bundle;
    :goto_25
    return-void

    .line 133
    :cond_26
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_25
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 106
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 108
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "instanceState"

    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 109
    const-string v1, "DEGREES_ROTATED"

    iget v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 111
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 8
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 144
    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_10

    .line 145
    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-static {v1, p0}, Lcom/behance/sdk/edmodo/cropper/util/ImageViewUtil;->getBitmapRectCenterInside(Landroid/graphics/Bitmap;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    .line 146
    .local v0, "bitmapRect":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    invoke-virtual {v1, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->setBitmapRect(Landroid/graphics/Rect;)V

    .line 150
    .end local v0    # "bitmapRect":Landroid/graphics/Rect;
    :goto_f
    return-void

    .line 148
    :cond_10
    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    sget-object v2, Lcom/behance/sdk/edmodo/cropper/CropImageView;->EMPTY_RECT:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->setBitmapRect(Landroid/graphics/Rect;)V

    goto :goto_f
.end method

.method public rotateImage(I)V
    .registers 9
    .param p1, "degrees"    # I

    .prologue
    const/4 v1, 0x0

    .line 465
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 466
    .local v5, "matrix":Landroid/graphics/Matrix;
    int-to-float v0, p1

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 467
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    .line 468
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 470
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 471
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    rem-int/lit16 v0, v0, 0x168

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 472
    return-void
.end method

.method public setAspectRatio(II)V
    .registers 5
    .param p1, "aspectRatioX"    # I
    .param p2, "aspectRatioY"    # I

    .prologue
    .line 450
    iput p1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioX:I

    .line 451
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioX:I

    invoke-virtual {v0, v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->setAspectRatioX(I)V

    .line 453
    iput p2, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioY:I

    .line 454
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mAspectRatioY:I

    invoke-virtual {v0, v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->setAspectRatioY(I)V

    .line 455
    return-void
.end method

.method public setFixedAspectRatio(Z)V
    .registers 3
    .param p1, "fixAspectRatio"    # Z

    .prologue
    .line 429
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->setFixedAspectRatio(Z)V

    .line 430
    return-void
.end method

.method public setGuidelines(I)V
    .registers 3
    .param p1, "guidelines"    # I

    .prologue
    .line 440
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->setGuidelines(I)V

    .line 441
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 257
    iput-object p1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    .line 258
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 260
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    if-eqz v0, :cond_12

    .line 261
    iget-object v0, p0, Lcom/behance/sdk/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->resetCropOverlayView()V

    .line 263
    :cond_12
    return-void
.end method

.method public setImageResource(I)V
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 323
    if-eqz p1, :cond_d

    .line 324
    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 325
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0, v0}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 327
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_d
    return-void
.end method

.method public setMinSize(I)V
    .registers 2
    .param p1, "minSize"    # I

    .prologue
    .line 475
    sput p1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    .line 476
    return-void
.end method
