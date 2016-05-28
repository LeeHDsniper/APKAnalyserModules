.class public Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "DelayedSpotDrawPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;
.implements Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$GenerateResultTask;
    }
.end annotation


# instance fields
.field private mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

.field protected mBrushSize:I

.field private mBrushSizeIndex:I

.field protected mBrushSizes:[I

.field private mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

.field private mDisabledStatusView:Landroid/view/View;

.field private mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

.field protected mFilterType:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field protected mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

.field protected mLensButton:Landroid/widget/ImageView;

.field protected mSelectedPosition:I

.field mSizeContentDescription:Ljava/lang/String;

.field mThreadHandler:Landroid/os/Handler;

.field private final mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private maxBrushSize:I

.field maxRadiusSize:F

.field private minBrushSize:I

.field minRadiusSize:F


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V
    .registers 6
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .param p3, "filterType"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 41
    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;)V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mThreadHandler:Landroid/os/Handler;

    .line 67
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->Free:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .line 75
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mSelectedPosition:I

    .line 88
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mFilterType:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 89
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .line 90
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;)Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;)Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    return-object v0
.end method

.method private setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;)V
    .registers 7
    .param p1, "which"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 188
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;)V

    .line 192
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-ne p1, v0, :cond_22

    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mLensButton:Landroid/widget/ImageView;

    new-array v3, v1, [I

    const v4, 0x10100a0

    aput v4, v3, v2

    invoke-virtual {v0, v3, v1}, Landroid/widget/ImageView;->setImageState([IZ)V

    .line 198
    :goto_19
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-eq p1, v0, :cond_2f

    move v0, v1

    :goto_1e
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->setPanelEnabled(Z)V

    .line 199
    return-void

    .line 195
    :cond_22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mLensButton:Landroid/widget/ImageView;

    new-array v3, v1, [I

    const v4, -0x10100a0

    aput v4, v3, v2

    invoke-virtual {v0, v3, v2}, Landroid/widget/ImageView;->setImageState([IZ)V

    goto :goto_19

    :cond_2f
    move v0, v2

    .line 198
    goto :goto_1e
.end method


# virtual methods
.method protected createFilter(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    .registers 3
    .param p1, "type"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 294
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    return-object v0
.end method

.method protected generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 300
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_spot_draw:I

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
    .line 305
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_spot:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public onActivate()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 151
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 153
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/adobe/android/ui/widget/VibrationWidget;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    aput-object v1, v0, v5

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->disableHapticIsNecessary([Lcom/adobe/android/ui/widget/VibrationWidget;)V

    .line 155
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 160
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;)V

    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 162
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    const/high16 v3, -0x40800000

    const/high16 v4, 0x41000000

    invoke-virtual {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 164
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->start(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 166
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->getContentView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 167
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->contentReady()V

    .line 168
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 180
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 182
    .local v0, "id":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getId()I

    move-result v1

    if-ne v0, v1, :cond_1d

    .line 183
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getDrawMode()Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-ne v1, v2, :cond_1e

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    :goto_1a
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;)V

    .line 185
    :cond_1d
    return-void

    .line 183
    :cond_1e
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    goto :goto_1a
.end method

.method protected onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "editResult"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .prologue
    .line 264
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {p2, v0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 265
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 266
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 267
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 13
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    const/high16 v3, 0x42c80000

    const/4 v4, 0x0

    .line 94
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 96
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    .line 98
    .local v9, "config":Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;
    sget v1, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_spot_brush_size_selected:I

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizeIndex:I

    .line 99
    sget v1, Lcom/aviary/android/feather/sdk/R$array;->com_adobe_image_editor_spot_brush_sizes:I

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getSizeArray(I)[I

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizes:[I

    .line 100
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizes:[I

    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizeIndex:I

    aget v1, v1, v2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSize:I

    .line 102
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizes:[I

    aget v1, v1, v4

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->minBrushSize:I

    .line 103
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizes:[I

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizes:[I

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    aget v1, v1, v2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->maxBrushSize:I

    .line 105
    sget v1, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_gallery_drawable_min_size:I

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v3

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->minRadiusSize:F

    .line 106
    sget v1, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_gallery_drawable_max_size:I

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v3

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->maxRadiusSize:F

    .line 108
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->getContentView()Landroid/view/View;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->lens:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mLensButton:Landroid/widget/ImageView;

    .line 109
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_acc_size:I

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mSizeContentDescription:Ljava/lang/String;

    .line 110
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizeIndex:I

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mSelectedPosition:I

    .line 113
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->gallery:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    .line 114
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizeIndex:I

    invoke-virtual {v1, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setDefaultPosition(I)V

    .line 115
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAutoSelectChild(Z)V

    .line 116
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v1, v4}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setCallbackDuringFling(Z)V

    .line 118
    const/4 v0, 0x0

    .line 119
    .local v0, "accentColor":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->hasAccentColor()Z

    move-result v1

    if-eqz v1, :cond_9c

    .line 120
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getAccentColor(I)I

    move-result v0

    .line 123
    :cond_9c
    new-instance v8, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizes:[I

    invoke-direct {v8, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;-><init>(Landroid/content/Context;[I)V

    .line 124
    .local v8, "adapter":Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mSelectedPosition:I

    invoke-virtual {v8, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setSelectedPosition(I)V

    .line 125
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->minBrushSize:I

    invoke-virtual {v8, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMinBrushSize(I)V

    .line 126
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->maxBrushSize:I

    invoke-virtual {v8, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMaxBrushSize(I)V

    .line 127
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->minRadiusSize:F

    invoke-virtual {v8, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMinRadiusSize(F)V

    .line 128
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->maxRadiusSize:F

    invoke-virtual {v8, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMaxRadiusSize(F)V

    .line 129
    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setAccentColor(I)V

    .line 130
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v1, v8}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAdapter(Landroid/widget/Adapter;)V

    .line 133
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->getContentView()Landroid/view/View;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 134
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSize:I

    int-to-float v2, v2

    const/high16 v3, 0x3fc00000

    mul-float/2addr v2, v3

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setBrushSize(F)V

    .line 135
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setDrawLimit(D)V

    .line 136
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setPaintEnabled(Z)V

    .line 137
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 139
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->disabled_status:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mDisabledStatusView:Landroid/view/View;

    .line 142
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mFilterType:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->createFilter(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    .line 145
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    const-string v2, "draw-thread"

    const/4 v3, 0x5

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mThreadHandler:Landroid/os/Handler;

    const-wide/high16 v6, 0x3ff8000000000000L

    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;-><init>(Ljava/lang/String;ILcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;Landroid/os/Handler;D)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    .line 147
    return-void
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 203
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 206
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;)V

    .line 208
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    if-eqz v0, :cond_30

    .line 210
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->clear()V

    .line 212
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 213
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->quit()V

    .line 214
    :cond_28
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_28

    .line 221
    :cond_30
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->onProgressEnd()V

    .line 222
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 223
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->clear()V

    .line 228
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 229
    return-void
.end method

.method protected onDispose()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 172
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    .line 173
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mThreadHandler:Landroid/os/Handler;

    .line 174
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->dispose()V

    .line 175
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDispose()V

    .line 176
    return-void
.end method

.method public onDrawEnd()V
    .registers 2

    .prologue
    .line 246
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->pathEnd()V

    .line 247
    return-void
.end method

.method public onDrawStart([FF)V
    .registers 6
    .param p1, "points"    # [F
    .param p2, "radius"    # F

    .prologue
    .line 233
    const/high16 v0, 0x3f800000

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    .line 234
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    const/high16 v1, 0x40000000

    div-float v1, p2, v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    invoke-virtual {v0, v1, p1, v2}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->pathStart(F[FLcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;)V

    .line 235
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setValue(Ljava/lang/Object;)V

    .line 236
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->setIsChanged(Z)V

    .line 237
    return-void
.end method

.method public onDrawing([FF)V
    .registers 4
    .param p1, "points"    # [F
    .param p2, "radius"    # F

    .prologue
    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->lineTo([F)V

    .line 242
    return-void
.end method

.method protected onGenerateResult()V
    .registers 4

    .prologue
    .line 251
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_21

    .line 252
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->finish()V

    .line 253
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$GenerateResultTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$GenerateResultTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;)V

    .line 254
    .local v0, "task":Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$GenerateResultTask;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$GenerateResultTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 260
    .end local v0    # "task":Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel$GenerateResultTask;
    :goto_20
    return-void

    .line 256
    :cond_21
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 257
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 258
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->onComplete(Landroid/graphics/Bitmap;)V

    goto :goto_20
.end method

.method public onScroll(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 6
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 373
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    return-void
.end method

.method public onScrollFinished(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 9
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 377
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSizes:[I

    aget v0, v0, p3

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSize:I

    .line 379
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mBrushSize:I

    int-to-float v1, v1

    const/high16 v2, 0x3fc00000

    mul-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setBrushSize(F)V

    .line 380
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;)V

    .line 381
    return-void
.end method

.method public onScrollStarted(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 7
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 367
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;)V

    .line 368
    return-void
.end method

.method public setPanelEnabled(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 271
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mOptionView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1e

    .line 272
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mOptionView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->isEnabled()Z

    move-result v0

    if-eq p1, v0, :cond_1e

    .line 273
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mOptionView:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setEnabled(Z)V

    .line 275
    if-eqz p1, :cond_1f

    .line 276
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->restoreToolbarTitle()V

    .line 281
    :goto_16
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->mDisabledStatusView:Landroid/view/View;

    if-eqz p1, :cond_25

    const/4 v0, 0x4

    :goto_1b
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 284
    :cond_1e
    return-void

    .line 278
    :cond_1f
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_zoom_mode:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;->setToolbarTitle(I)V

    goto :goto_16

    .line 281
    :cond_25
    const/4 v0, 0x0

    goto :goto_1b
.end method
