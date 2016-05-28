.class public Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;
.super Lcom/adobe/creativesdk/aviary/panels/BordersPanel;
.source "OverlaysPanel.java"


# instance fields
.field private mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 4
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 32
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->OVERLAY:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V

    .line 33
    return-void
.end method


# virtual methods
.method backHandled()Z
    .registers 7

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 58
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->backHandled()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 69
    :goto_8
    return v1

    .line 63
    :cond_9
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    new-array v4, v1, [Ljava/lang/Class;

    const-class v5, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;

    aput-object v5, v4, v2

    invoke-static {v3, v4}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->findOverlay(Landroid/content/Context;[Ljava/lang/Class;)Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    move-result-object v0

    .line 64
    .local v0, "overlay":Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
    if-eqz v0, :cond_21

    .line 65
    invoke-virtual {v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->onBackPressed()Z

    goto :goto_8

    :cond_21
    move v1, v2

    .line 69
    goto :goto_8
.end method

.method protected generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    .line 48
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_overlays:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected getTutorialOverlayId()I
    .registers 2

    .prologue
    .line 37
    const/4 v0, 0x7

    return v0
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 42
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 43
    return-void
.end method

.method protected onGenerateFinalBitmap()V
    .registers 4

    .prologue
    .line 142
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;

    if-eqz v1, :cond_1f

    .line 143
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->generateResultBitmap(Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 144
    .local v0, "result":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getEditToolResult()Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 145
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->onComplete(Landroid/graphics/Bitmap;)V

    .line 149
    .end local v0    # "result":Landroid/graphics/Bitmap;
    :goto_1e
    return-void

    .line 147
    :cond_1f
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->cancel()V

    goto :goto_1e
.end method

.method protected onSetupImageView()V
    .registers 4

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 54
    return-void
.end method

.method protected renderEffect(Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;IF)V
    .registers 18
    .param p1, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    .param p2, "position"    # I
    .param p3, "intensity"    # F

    .prologue
    .line 74
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "renderEffect. item: %s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v9, v10

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 76
    if-eqz p1, :cond_17c

    .line 78
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 79
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v10, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Medium:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    .line 78
    invoke-static {v8, v9, v10}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds;->getPackItemFilename(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 83
    .local v5, "path":Ljava/lang/String;
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 84
    .local v1, "maxSize":I
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "path: %s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 85
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "max_size: %d"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 88
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    new-instance v9, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    invoke-direct {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;-><init>()V

    invoke-static {v7, v8, v1, v1, v9}, Lcom/adobe/creativesdk/aviary/internal/utils/DecodeUtils;->decode(Landroid/content/Context;Landroid/net/Uri;IILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 90
    .local v3, "overlayBitmap":Landroid/graphics/Bitmap;
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v7, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->getOverlayDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    if-eqz v7, :cond_171

    .line 91
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v7, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;

    invoke-virtual {v7, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->updateImageOverlay(Landroid/graphics/Bitmap;)V

    .line 95
    :goto_8a
    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->setIsChanged(Z)V

    .line 98
    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-direct {v6}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>()V

    .line 99
    .local v6, "toolAction":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setPackIdentifier(Ljava/lang/String;)V

    .line 100
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setContentIdentifier(Ljava/lang/String;)V

    .line 102
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getEditToolResult()Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 104
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPackId()J

    move-result-wide v8

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackContentPath(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    .line 105
    .local v4, "packContentPath":Ljava/lang/String;
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "packId: %d, contentPath: %s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getId()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object v4, v9, v10

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 106
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v7

    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;

    iput-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;

    .line 107
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;

    invoke-virtual {v7, v4}, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;->setSourceDir(Ljava/lang/String;)V

    .line 108
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mCurrentFilter:Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;->setUrl(Ljava/lang/String;)V

    .line 110
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 111
    .local v0, "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "pack"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    const-string v7, "item"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v9

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": item_previewed"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 116
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v8, "pack"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v8, "item"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v7

    const/16 v8, 0x8

    invoke-static {v7, v8}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->shouldShow(Landroid/content/Context;I)Z

    move-result v7

    if-eqz v7, :cond_170

    .line 120
    new-instance v2, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;

    .line 121
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v7

    sget v8, Lcom/aviary/android/feather/sdk/R$attr;->com_adobe_image_editor_overlay_overlay_style:I

    invoke-direct {v2, v7, v8}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;-><init>(Landroid/content/Context;I)V

    .line 122
    .local v2, "overlay":Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->show()Z

    move-result v7

    if-eqz v7, :cond_170

    .line 123
    new-instance v7, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel$1;

    invoke-direct {v7, p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;)V

    invoke-virtual {v2, v7}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->setOnCloseListener(Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;)V

    .line 138
    .end local v0    # "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "maxSize":I
    .end local v2    # "overlay":Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;
    .end local v3    # "overlayBitmap":Landroid/graphics/Bitmap;
    .end local v4    # "packContentPath":Ljava/lang/String;
    .end local v5    # "path":Ljava/lang/String;
    .end local v6    # "toolAction":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<Ljava/lang/String;>;"
    :cond_170
    :goto_170
    return-void

    .line 93
    .restart local v1    # "maxSize":I
    .restart local v3    # "overlayBitmap":Landroid/graphics/Bitmap;
    .restart local v5    # "path":Ljava/lang/String;
    :cond_171
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v7, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v7, v8, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    goto/16 :goto_8a

    .line 134
    .end local v1    # "maxSize":I
    .end local v3    # "overlayBitmap":Landroid/graphics/Bitmap;
    .end local v5    # "path":Ljava/lang/String;
    :cond_17c
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v7, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/widget/ImageViewOverlay;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 135
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->getEditToolResult()Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->reset()V

    .line 136
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->setIsChanged(Z)V

    goto :goto_170
.end method
