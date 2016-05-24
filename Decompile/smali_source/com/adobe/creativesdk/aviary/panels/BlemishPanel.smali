.class public Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "BlemishPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;
.implements Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;,
        Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;
    }
.end annotation


# instance fields
.field private mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

.field protected mBrushSize:I

.field protected mBrushSizes:[I

.field private mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

.field private mDisabledStatusView:Landroid/view/View;

.field private mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

.field protected mFilterType:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field protected mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

.field protected mLensButton:Landroid/widget/ImageView;

.field private mOverlay:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

.field protected mSelectedPosition:I

.field mSizeContentDescription:Ljava/lang/String;

.field mThreadHandler:Landroid/os/Handler;

.field maxRadiusSize:F

.field minRadiusSize:F


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V
    .registers 6
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .param p3, "filterType"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 47
    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;)V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mThreadHandler:Landroid/os/Handler;

    .line 73
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->Free:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .line 81
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mSelectedPosition:I

    .line 90
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mFilterType:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 91
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;)Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;
    .param p1, "x1"    # Landroid/graphics/Bitmap;
    .param p2, "x2"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    return-void
.end method

.method private onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "actionList"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 317
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 318
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSize:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 319
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->onComplete(Landroid/graphics/Bitmap;)V

    .line 320
    return-void
.end method

.method private setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;)V
    .registers 7
    .param p1, "which"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 199
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->setDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;)V

    .line 203
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne p1, v0, :cond_22

    .line 204
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mLensButton:Landroid/widget/ImageView;

    new-array v3, v1, [I

    const v4, 0x10100a0

    aput v4, v3, v2

    invoke-virtual {v0, v3, v1}, Landroid/widget/ImageView;->setImageState([IZ)V

    .line 209
    :goto_19
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-eq p1, v0, :cond_2f

    move v0, v1

    :goto_1e
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->setPanelEnabled(Z)V

    .line 210
    return-void

    .line 206
    :cond_22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mLensButton:Landroid/widget/ImageView;

    new-array v3, v1, [I

    const v4, -0x10100a0

    aput v4, v3, v2

    invoke-virtual {v0, v3, v2}, Landroid/widget/ImageView;->setImageState([IZ)V

    goto :goto_19

    :cond_2f
    move v0, v2

    .line 209
    goto :goto_1e
.end method


# virtual methods
.method protected createFilter(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    .registers 3
    .param p1, "type"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 302
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
    .line 308
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_blemish:I

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
    .line 313
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

    .line 153
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 155
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/adobe/android/ui/widget/VibrationWidget;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    aput-object v1, v0, v5

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->disableHapticIsNecessary([Lcom/adobe/android/ui/widget/VibrationWidget;)V

    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 162
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->setOnTapListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;)V

    .line 163
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 164
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    const/high16 v3, -0x40800000

    const/high16 v4, 0x41000000

    invoke-virtual {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 166
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->start(Landroid/graphics/Bitmap;)V

    .line 168
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContentView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 169
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->contentReady()V

    .line 172
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->shouldShow(Landroid/content/Context;I)Z

    move-result v0

    if-eqz v0, :cond_76

    .line 173
    new-instance v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;

    .line 174
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;-><init>(Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mOverlay:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mOverlay:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v2, v3}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->showDelayed(J)Z

    .line 178
    :cond_76
    return-void
.end method

.method public onBackPressed()Z
    .registers 3

    .prologue
    .line 248
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onBackPressed"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 250
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mOverlay:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    if-eqz v0, :cond_15

    .line 251
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mOverlay:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-virtual {v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 252
    const/4 v0, 0x1

    .line 255
    :goto_14
    return v0

    :cond_15
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onBackPressed()Z

    move-result v0

    goto :goto_14
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 190
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 192
    .local v0, "id":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getId()I

    move-result v1

    if-ne v0, v1, :cond_1d

    .line 193
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    .line 194
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->getDrawMode()Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v1, v2, :cond_1e

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    .line 193
    :goto_1a
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;)V

    .line 196
    :cond_1d
    return-void

    .line 194
    :cond_1e
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    goto :goto_1a
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 16
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 95
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 97
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    .line 99
    .local v9, "configService":Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;
    sget v1, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_blemish_brush_size_selected:I

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v10

    .line 100
    .local v10, "mBrushSizeIndex":I
    sget v1, Lcom/aviary/android/feather/sdk/R$array;->com_adobe_image_editor_blemish_brush_sizes:I

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getSizeArray(I)[I

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSizes:[I

    .line 101
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSizes:[I

    aget v1, v1, v10

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSize:I

    .line 103
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSizes:[I

    const/4 v2, 0x0

    aget v12, v1, v2

    .line 104
    .local v12, "minBrushSize":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSizes:[I

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSizes:[I

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    aget v11, v1, v2

    .line 106
    .local v11, "maxBrushSize":I
    sget v1, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_gallery_drawable_min_size:I

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x42c80000

    div-float/2addr v1, v2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->minRadiusSize:F

    .line 107
    sget v1, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_gallery_drawable_max_size:I

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x42c80000

    div-float/2addr v1, v2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->maxRadiusSize:F

    .line 109
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContentView()Landroid/view/View;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->lens:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mLensButton:Landroid/widget/ImageView;

    .line 110
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_acc_size:I

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mSizeContentDescription:Ljava/lang/String;

    .line 111
    iput v10, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mSelectedPosition:I

    .line 114
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->gallery:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    .line 115
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v1, v10}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setDefaultPosition(I)V

    .line 116
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAutoSelectChild(Z)V

    .line 117
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setCallbackDuringFling(Z)V

    .line 119
    const/4 v0, 0x0

    .line 120
    .local v0, "accentColor":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->hasAccentColor()Z

    move-result v1

    if-eqz v1, :cond_94

    .line 121
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getAccentColor(I)I

    move-result v0

    .line 124
    :cond_94
    new-instance v8, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSizes:[I

    invoke-direct {v8, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;-><init>(Landroid/content/Context;[I)V

    .line 125
    .local v8, "adapter":Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mSelectedPosition:I

    invoke-virtual {v8, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setSelectedPosition(I)V

    .line 126
    invoke-virtual {v8, v12}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMinBrushSize(I)V

    .line 127
    invoke-virtual {v8, v11}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMaxBrushSize(I)V

    .line 128
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->minRadiusSize:F

    invoke-virtual {v8, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMinRadiusSize(F)V

    .line 129
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->maxRadiusSize:F

    invoke-virtual {v8, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setMaxRadiusSize(F)V

    .line 130
    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->setAccentColor(I)V

    .line 132
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v1, v8}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAdapter(Landroid/widget/Adapter;)V

    .line 135
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getContentView()Landroid/view/View;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 136
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 137
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSize:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->setBrushSize(F)V

    .line 139
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->disabled_status:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mDisabledStatusView:Landroid/view/View;

    .line 142
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mFilterType:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->createFilter(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    .line 145
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    const-string v2, "draw-thread"

    const/4 v3, 0x5

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mThreadHandler:Landroid/os/Handler;

    const-wide/high16 v6, 0x3ff8000000000000L

    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;-><init>(Ljava/lang/String;ILcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;Landroid/os/Handler;D)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    .line 147
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->setSingleTapAllowed(Z)V

    .line 148
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->setRegisterStrokeInitParams(Z)V

    .line 149
    return-void
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 214
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 215
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 217
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->setOnTapListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$OnTapListener;)V

    .line 219
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    if-eqz v0, :cond_30

    .line 221
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->clear()V

    .line 223
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 224
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->quit()V

    .line 225
    :cond_28
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_28

    .line 232
    :cond_30
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mOverlay:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    if-eqz v0, :cond_39

    .line 233
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mOverlay:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-virtual {v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->dismiss()V

    .line 236
    :cond_39
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->onProgressEnd()V

    .line 237
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 238
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->clear()V

    .line 243
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 244
    return-void
.end method

.method protected onDispose()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 182
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    .line 183
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mThreadHandler:Landroid/os/Handler;

    .line 184
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->dispose()V

    .line 185
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDispose()V

    .line 186
    return-void
.end method

.method protected onGenerateResult()V
    .registers 4

    .prologue
    .line 268
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_21

    .line 269
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->finish()V

    .line 270
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;)V

    .line 271
    .local v0, "task":Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 275
    .end local v0    # "task":Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GenerateResultTask;
    :goto_20
    return-void

    .line 273
    :cond_21
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mPreview:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

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
    .line 330
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    return-void
.end method

.method public onScrollFinished(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 8
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
    .line 334
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSizes:[I

    aget v0, v0, p3

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSize:I

    .line 335
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->setBrushSize(F)V

    .line 336
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;)V

    .line 337
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
    .line 324
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;)V

    .line 325
    return-void
.end method

.method public onTap([FF)V
    .registers 6
    .param p1, "points"    # [F
    .param p2, "radius"    # F

    .prologue
    .line 260
    const/high16 v0, 0x3f800000

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    .line 261
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    const/high16 v1, 0x40000000

    mul-float/2addr v1, p2

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    invoke-virtual {v0, v1, p1, v2}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->pathStart(F[FLcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;)V

    .line 262
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->pathEnd()V

    .line 263
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->setIsChanged(Z)V

    .line 264
    return-void
.end method

.method public setPanelEnabled(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 279
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mOptionView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1e

    .line 280
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mOptionView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->isEnabled()Z

    move-result v0

    if-eq p1, v0, :cond_1e

    .line 281
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mOptionView:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setEnabled(Z)V

    .line 283
    if-eqz p1, :cond_1f

    .line 284
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->restoreToolbarTitle()V

    .line 289
    :goto_16
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->mDisabledStatusView:Landroid/view/View;

    if-eqz p1, :cond_25

    const/4 v0, 0x4

    :goto_1b
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 292
    :cond_1e
    return-void

    .line 286
    :cond_1f
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_zoom_mode:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;->setToolbarTitle(I)V

    goto :goto_16

    .line 289
    :cond_25
    const/4 v0, 0x0

    goto :goto_1b
.end method
