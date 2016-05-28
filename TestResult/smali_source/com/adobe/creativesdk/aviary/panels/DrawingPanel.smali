.class public Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "DrawingPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;
.implements Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;,
        Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
    }
.end annotation


# instance fields
.field private mAccentColor:I

.field mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

.field mActionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

.field private mBlur:I

.field private mBrushColorIndex:I

.field mBrushColors:[I

.field private mBrushSizeIndex:I

.field mBrushSizes:[I

.field private mColor:I

.field private mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

.field mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

.field protected mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

.field protected mGallerySize:Lcom/adobe/android/ui/widget/AdobeGalleryView;

.field mHeight:I

.field protected mLensButton:Landroid/widget/ImageView;

.field mOperations:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;",
            ">;"
        }
    .end annotation
.end field

.field private mPaint:Landroid/graphics/Paint;

.field private mSelectedTool:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

.field private mSize:I

.field mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mWidth:I

.field private maxBrushSize:I

.field private maxRadiusSize:F

.field private minBrushSize:I

.field private minRadiusSize:F


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 4
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 90
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 68
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mColor:I

    .line 69
    const/16 v0, 0xa

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mSize:I

    .line 70
    const/4 v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBlur:I

    .line 91
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    .prologue
    .line 58
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mSize:I

    return v0
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;
    .param p1, "x1"    # I

    .prologue
    .line 58
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mSize:I

    return p1
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)Landroid/graphics/Paint;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getSelectedTool()Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    .prologue
    .line 58
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mColor:I

    return v0
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;
    .param p1, "x1"    # I

    .prologue
    .line 58
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mColor:I

    return p1
.end method

.method private getSelectedTool()Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;
    .registers 2

    .prologue
    .line 397
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mSelectedTool:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    return-object v0
.end method

.method private initPaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;
    .registers 5
    .param p1, "original"    # Landroid/graphics/Paint;

    .prologue
    const/4 v0, 0x1

    .line 407
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setDither(Z)V

    .line 408
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 409
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 410
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 411
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mSize:I

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 412
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 413
    sget-object v0, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 414
    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 415
    new-instance v0, Landroid/graphics/BlurMaskFilter;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBlur:I

    int-to-float v1, v1

    sget-object v2, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v0, v1, v2}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 416
    return-object p1
.end method

.method private resetBitmap()V
    .registers 7

    .prologue
    .line 199
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getCurrentImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    .line 200
    .local v0, "current":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBitmap:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    const/high16 v4, -0x40800000

    const/high16 v5, 0x41000000

    invoke-virtual {v1, v2, v3, v4, v5}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 201
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->setDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;)V

    .line 202
    return-void
.end method

.method private setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V
    .registers 8
    .param p1, "which"    # Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 347
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$3;->$SwitchMap$com$adobe$creativesdk$aviary$panels$DrawingPanel$DrawinTool:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->ordinal()I

    move-result v3

    aget v0, v0, v3

    packed-switch v0, :pswitch_data_9e

    .line 372
    :goto_d
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Zoom:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    if-ne p1, v0, :cond_8e

    .line 373
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mLensButton:Landroid/widget/ImageView;

    new-array v3, v1, [I

    const v4, 0x10100a0

    aput v4, v3, v2

    invoke-virtual {v0, v3, v1}, Landroid/widget/ImageView;->setImageState([IZ)V

    .line 379
    :goto_1d
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Zoom:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    if-eq p1, v0, :cond_9b

    move v0, v1

    :goto_22
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setPanelEnabled(Z)V

    .line 380
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mSelectedTool:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    .line 381
    return-void

    .line 349
    :pswitch_28
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->setDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;)V

    .line 350
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mPaint:Landroid/graphics/Paint;

    const/16 v3, 0xff

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 351
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mPaint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    goto :goto_d

    .line 355
    :pswitch_3f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->setDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;)V

    .line 356
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mPaint:Landroid/graphics/Paint;

    new-instance v3, Landroid/graphics/PorterDuffXfermode;

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v3, v4}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 357
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 359
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->DRAW:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 360
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": eraser_selected"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    goto :goto_d

    .line 365
    :pswitch_84
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->setDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;)V

    goto :goto_d

    .line 375
    :cond_8e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mLensButton:Landroid/widget/ImageView;

    new-array v3, v1, [I

    const v4, -0x10100a0

    aput v4, v3, v2

    invoke-virtual {v0, v3, v2}, Landroid/widget/ImageView;->setImageState([IZ)V

    goto :goto_1d

    :cond_9b
    move v0, v2

    .line 379
    goto :goto_22

    .line 347
    nop

    :pswitch_data_9e
    .packed-switch 0x1
        :pswitch_28
        :pswitch_3f
        :pswitch_84
    .end packed-switch
.end method

.method private setupFill()V
    .registers 5

    .prologue
    const/4 v2, 0x1

    .line 192
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColorIndex:I

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setDefaultPosition(I)V

    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setCallbackDuringFling(Z)V

    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAutoSelectChild(Z)V

    .line 195
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColors:[I

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;-><init>(Landroid/content/Context;[I)V

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAdapter(Landroid/widget/Adapter;)V

    .line 196
    return-void
.end method

.method private setupSize()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 177
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGallerySize:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizeIndex:I

    invoke-virtual {v1, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setDefaultPosition(I)V

    .line 178
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGallerySize:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v1, v3}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setCallbackDuringFling(Z)V

    .line 179
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGallerySize:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v1, v3}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAutoSelectChild(Z)V

    .line 181
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizes:[I

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;-><init>(Landroid/content/Context;[I)V

    .line 182
    .local v0, "adapter":Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizeIndex:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setSelectedPosition(I)V

    .line 183
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->minBrushSize:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMinBrushSize(I)V

    .line 184
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->maxBrushSize:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMaxBrushSize(I)V

    .line 185
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->minRadiusSize:F

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMinRadiusSize(F)V

    .line 186
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->maxRadiusSize:F

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMaxRadiusSize(F)V

    .line 187
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mAccentColor:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setAccentColor(I)V

    .line 188
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGallerySize:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v1, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAdapter(Landroid/widget/Adapter;)V

    .line 189
    return-void
.end method


# virtual methods
.method protected generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 422
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_draw:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 427
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_draw:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public onActivate()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 206
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 208
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/android/ui/widget/VibrationWidget;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    aput-object v1, v0, v3

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGallerySize:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->disableHapticIsNecessary([Lcom/adobe/android/ui/widget/VibrationWidget;)V

    .line 210
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGallerySize:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)V

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 250
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$2;-><init>(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;)V

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 299
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 301
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    .line 303
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;)V

    .line 304
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->setOnDrawPathListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;)V

    .line 306
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContentView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 307
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->contentReady()V

    .line 308
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 324
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 326
    .local v0, "id":I
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getId()I

    move-result v2

    if-ne v0, v2, :cond_5b

    .line 327
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result v1

    .line 328
    .local v1, "selected":Z
    if-nez v1, :cond_5c

    const/4 v2, 0x1

    :goto_13
    invoke-virtual {p1, v2}, Landroid/view/View;->setSelected(Z)V

    .line 330
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isSelected: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 331
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "selectedToolPos: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v4}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedItemPosition()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 333
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 334
    sget-object v2, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Zoom:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    .line 343
    .end local v1    # "selected":Z
    :cond_5b
    :goto_5b
    return-void

    .line 328
    .restart local v1    # "selected":Z
    :cond_5c
    const/4 v2, 0x0

    goto :goto_13

    .line 336
    :cond_5e
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedItemPosition()I

    move-result v2

    if-nez v2, :cond_6c

    .line 337
    sget-object v2, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Erase:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    goto :goto_5b

    .line 339
    :cond_6c
    sget-object v2, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Draw:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;)V

    goto :goto_5b
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 14
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    const/high16 v7, 0x42c80000

    const/4 v10, 0x0

    .line 95
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 97
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v5

    const-class v6, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    .line 99
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v6, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_gallery_drawable_min_size:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v7

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->minRadiusSize:F

    .line 100
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v6, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_gallery_drawable_max_size:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v7

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->maxRadiusSize:F

    .line 102
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v6, Lcom/aviary/android/feather/sdk/R$array;->com_adobe_image_editor_draw_brush_sizes:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getIntArray(I)[I

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizes:[I

    .line 103
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v6, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_draw_brush_size_selected:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v5

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizeIndex:I

    .line 105
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v6, Lcom/aviary/android/feather/sdk/R$array;->com_adobe_image_editor_draw_fill_colors:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getIntArray(I)[I

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColors:[I

    .line 106
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v6, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_draw_fill_color_selected:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v5

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColorIndex:I

    .line 108
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizes:[I

    aget v5, v5, v10

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->minBrushSize:I

    .line 109
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizes:[I

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizes:[I

    array-length v6, v6

    add-int/lit8 v6, v6, -0x1

    aget v5, v5, v6

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->maxBrushSize:I

    .line 111
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v6, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_draw_brush_softValue:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v5

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBlur:I

    .line 113
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColors:[I

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColorIndex:I

    aget v5, v5, v6

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mColor:I

    .line 114
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizes:[I

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushSizeIndex:I

    aget v5, v5, v6

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mSize:I

    .line 116
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContentView()Landroid/view/View;

    move-result-object v5

    sget v6, Lcom/aviary/android/feather/sdk/R$id;->lens:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mLensButton:Landroid/widget/ImageView;

    .line 118
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v5

    sget v6, Lcom/aviary/android/feather/sdk/R$id;->gallery:I

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGallerySize:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    .line 119
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v5

    sget v6, Lcom/aviary/android/feather/sdk/R$id;->gallery2:I

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    .line 121
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContentView()Landroid/view/View;

    move-result-object v5

    sget v6, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 122
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v6, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v5, v6}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 124
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mWidth:I

    .line 125
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mHeight:I

    .line 127
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->resetBitmap()V

    .line 129
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mOperations:Ljava/util/Collection;

    .line 130
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    .line 132
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "draw"

    aput-object v6, v5, v10

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->actionList([Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mActionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .line 133
    new-instance v5, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .line 135
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mActionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v5, v10}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    .line 136
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v6, "previewSize"

    new-instance v7, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    iget v8, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mWidth:I

    int-to-float v8, v8

    iget v9, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mHeight:I

    int-to-float v9, v9

    invoke-direct {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 137
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v6, "commands"

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mOperations:Ljava/util/Collection;

    invoke-virtual {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/util/Collection;)V

    .line 139
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v6, Lcom/aviary/android/feather/sdk/R$bool;->com_adobe_image_editor_draw_panels_use_palette:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getBoolean(I)Z

    move-result v5

    if-eqz v5, :cond_16c

    .line 140
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v5

    const-class v6, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 141
    .local v3, "service":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    if-eqz v3, :cond_16c

    .line 142
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getImageInfo()Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    move-result-object v2

    .line 143
    .local v2, "imageInfo":Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    if-eqz v2, :cond_16c

    .line 144
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getPalette()Landroid/support/v7/graphics/Palette;

    move-result-object v5

    if-eqz v5, :cond_16c

    .line 145
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getPalette()Landroid/support/v7/graphics/Palette;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v7/graphics/Palette;->getSwatches()Ljava/util/List;

    move-result-object v4

    .line 146
    .local v4, "swatches":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/graphics/Palette$Swatch;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v0, v5, [I

    .line 147
    .local v0, "colors":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_149
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v1, v5, :cond_15e

    .line 148
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v5}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result v5

    aput v5, v0, v1

    .line 147
    add-int/lit8 v1, v1, 0x1

    goto :goto_149

    .line 150
    :cond_15e
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColors:[I

    invoke-static {v0, v5}, Lorg/apache/commons/lang3/ArrayUtils;->addAll([I[I)[I

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColors:[I

    .line 151
    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColorIndex:I

    array-length v6, v0

    add-int/2addr v5, v6

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColorIndex:I

    .line 157
    .end local v0    # "colors":[I
    .end local v1    # "i":I
    .end local v2    # "imageInfo":Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    .end local v3    # "service":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    .end local v4    # "swatches":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/graphics/Palette$Swatch;>;"
    :cond_16c
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mConfig:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v6, Lcom/aviary/android/feather/sdk/R$bool;->com_adobe_image_editor_draw_has_eraser:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getBoolean(I)Z

    move-result v5

    if-eqz v5, :cond_18c

    .line 158
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColors:[I

    invoke-static {v5, v10}, Lorg/apache/commons/lang3/ArrayUtils;->add([II)[I

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColors:[I

    .line 159
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColors:[I

    invoke-static {v5, v10, v10}, Lorg/apache/commons/lang3/ArrayUtils;->add([III)[I

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColors:[I

    .line 160
    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColorIndex:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBrushColorIndex:I

    .line 163
    :cond_18c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->hasAccentColor()Z

    move-result v5

    if-eqz v5, :cond_1be

    .line 164
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v5

    invoke-virtual {v5, v10}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getAccentColor(I)I

    move-result v5

    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mAccentColor:I

    .line 169
    :goto_1a0
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setupFill()V

    .line 170
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setupSize()V

    .line 172
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v5, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->getPaint()Landroid/graphics/Paint;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->initPaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mPaint:Landroid/graphics/Paint;

    .line 173
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v5, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->setPaint(Landroid/graphics/Paint;)V

    .line 174
    return-void

    .line 166
    :cond_1be
    iput v10, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mAccentColor:I

    goto :goto_1a0
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 312
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;)V

    .line 313
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->setOnDrawPathListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;)V

    .line 314
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 316
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGalleryColor:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 317
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mGallerySize:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 319
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 320
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 402
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 403
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->clear()V

    .line 404
    return-void
.end method

.method public onDrawStart()V
    .registers 2

    .prologue
    .line 452
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setIsChanged(Z)V

    .line 453
    return-void
.end method

.method public onEnd()V
    .registers 3

    .prologue
    .line 486
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onEnd"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 487
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    if-eqz v0, :cond_15

    .line 488
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mOperations:Ljava/util/Collection;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 489
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    .line 491
    :cond_15
    return-void
.end method

.method protected onGenerateResult()V
    .registers 6

    .prologue
    const/high16 v4, -0x40800000

    .line 432
    const/4 v0, 0x0

    .line 434
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v2

    if-nez v2, :cond_40

    .line 435
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 440
    :goto_17
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 441
    .local v1, "canvas":Landroid/graphics/Canvas;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->commit(Landroid/graphics/Canvas;)V

    .line 442
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v2, v0, v3, v4, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 444
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 445
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mActionList:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 447
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->onComplete(Landroid/graphics/Bitmap;)V

    .line 448
    return-void

    .line 437
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    :cond_40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBitmap:Landroid/graphics/Bitmap;

    goto :goto_17
.end method

.method public onLineTo(FF)V
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 472
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    if-eqz v0, :cond_f

    .line 473
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    const/4 v2, 0x1

    invoke-direct {v1, v2, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;-><init>(IFF)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->addCommand(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;)V

    .line 475
    :cond_f
    return-void
.end method

.method public onMoveTo(FF)V
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 465
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    if-eqz v0, :cond_f

    .line 466
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    const/4 v2, 0x0

    invoke-direct {v1, v2, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;-><init>(IFF)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->addCommand(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;)V

    .line 468
    :cond_f
    return-void
.end method

.method public onQuadTo(FFFF)V
    .registers 12
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "x1"    # F
    .param p4, "y1"    # F

    .prologue
    .line 479
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    if-eqz v0, :cond_13

    .line 480
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    const/4 v1, 0x2

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;-><init>(IFFFF)V

    invoke-virtual {v6, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->addCommand(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;)V

    .line 482
    :cond_13
    return-void
.end method

.method public onStart()V
    .registers 8

    .prologue
    .line 457
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onStart"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 458
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->getDrawingScale()F

    move-result v0

    .line 459
    .local v0, "scale":F
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mBlur:I

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mSize:I

    mul-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    mul-float v4, v1, v0

    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mColor:I

    .line 460
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->getSelectedTool()Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    move-result-object v1

    sget-object v6, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;->Erase:Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$DrawinTool;

    if-ne v1, v6, :cond_2b

    const/4 v1, 0x1

    :goto_25
    invoke-direct {v2, v3, v4, v5, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;-><init>(IFII)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mCurrentOperation:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    .line 461
    return-void

    .line 460
    :cond_2b
    const/4 v1, 0x0

    goto :goto_25
.end method

.method public setPanelEnabled(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 384
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->isActive()Z

    move-result v0

    if-nez v0, :cond_7

    .line 394
    :goto_6
    return-void

    .line 388
    :cond_7
    if-eqz p1, :cond_1b

    .line 389
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->restoreToolbarTitle()V

    .line 393
    :goto_c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->mOptionView:Landroid/view/ViewGroup;

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->disabled_status:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz p1, :cond_21

    const/4 v0, 0x4

    :goto_17
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_6

    .line 391
    :cond_1b
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_zoom_mode:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;->setToolbarTitle(I)V

    goto :goto_c

    .line 393
    :cond_21
    const/4 v0, 0x0

    goto :goto_17
.end method
