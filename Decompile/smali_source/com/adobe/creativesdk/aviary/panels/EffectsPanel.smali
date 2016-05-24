.class public Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;
.super Lcom/adobe/creativesdk/aviary/panels/BordersPanel;
.source "EffectsPanel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRenderTask;,
        Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;
    }
.end annotation


# instance fields
.field private mFactor:D

.field private mRequestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

.field protected mThumbBitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 4
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 44
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V

    .line 45
    return-void
.end method


# virtual methods
.method protected createListAdapter(Landroid/content/Context;Landroid/database/Cursor;I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "accentColor"    # I

    .prologue
    .line 72
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    invoke-direct {v0, p1, p0, p2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;Landroid/database/Cursor;)V

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mCellWidth:I

    .line 73
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setCellWidth(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_default_item_content_item:I

    .line 74
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setContentResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_supplies:I

    .line 75
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setSupplyResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_external_pack:I

    .line 76
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setExternalResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_header_pack:I

    .line 77
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setDividerResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mDefaultPackTextBackgroundColor:I

    .line 78
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setDefaultPackTextBackgroundColor(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 79
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mCache:Lit/sephiroth/android/library/picasso/LruCache;

    .line 80
    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setPicasso(Lit/sephiroth/android/library/picasso/Picasso;Lit/sephiroth/android/library/picasso/Cache;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    .line 81
    invoke-virtual {v0, p3}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setTintColor(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->build()Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    move-result-object v0

    return-object v0
.end method

.method protected createRenderTask(IF)Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;
    .registers 4
    .param p1, "position"    # I
    .param p2, "intensity"    # F

    .prologue
    .line 124
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRenderTask;

    invoke-direct {v0, p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRenderTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;IF)V

    return-object v0
.end method

.method protected getIntensityIsManaged()Z
    .registers 2

    .prologue
    .line 54
    const/4 v0, 0x0

    return v0
.end method

.method protected getIntensitySliderEnabled()Z
    .registers 2

    .prologue
    .line 49
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->EFFECT_INTENSITY_AVAILABLE:Z

    return v0
.end method

.method protected isContentTutorialNeeded()Z
    .registers 2

    .prologue
    .line 119
    const/4 v0, 0x0

    return v0
.end method

.method protected loadNativeFilter(Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;IZF)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
    .registers 9
    .param p1, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    .param p2, "position"    # I
    .param p3, "hires"    # Z
    .param p4, "intensity"    # F

    .prologue
    .line 130
    if-eqz p1, :cond_49

    const/4 v1, -0x1

    if-le p2, v1, :cond_49

    .line 131
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->EFFECTS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;

    .line 132
    .local v0, "filter":Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".json"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;->setMoaLiteEffect(Ljava/lang/String;)V

    .line 133
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;->setPreviewSize(II)V

    .line 134
    float-to-double v2, p4

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;->setIntensity(D)V

    .line 137
    .end local v0    # "filter":Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;
    :goto_48
    return-object v0

    :cond_49
    const/4 v0, 0x0

    goto :goto_48
.end method

.method protected onAddCustomRequestHandlers()V
    .registers 9

    .prologue
    .line 88
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mThumbWidth:I

    int-to-double v2, v2

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mFactor:D

    div-double/2addr v2, v4

    double-to-int v2, v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mThumbWidth:I

    int-to-double v4, v3

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mFactor:D

    div-double/2addr v4, v6

    double-to-int v3, v4

    .line 89
    invoke-static {v1, v2, v3}, Landroid/media/ThumbnailUtils;->extractThumbnail(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mThumbBitmap:Landroid/graphics/Bitmap;

    .line 90
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mThumbBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mRequestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

    .line 92
    :try_start_1f
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mRequestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/picasso/Picasso;->addRequestHandler(Lit/sephiroth/android/library/picasso/RequestHandler;)V
    :try_end_26
    .catch Ljava/lang/IllegalStateException; {:try_start_1f .. :try_end_26} :catch_27

    .line 96
    :goto_26
    return-void

    .line 93
    :catch_27
    move-exception v0

    .line 94
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_26
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 59
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 61
    const-wide v2, 0x3ff6666666666666L

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mFactor:D

    .line 63
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo;->getCpuMhz()I

    move-result v0

    .line 64
    .local v0, "cpuSpeed":I
    if-lez v0, :cond_18

    .line 65
    const/16 v1, 0x3e8

    if-ge v0, v1, :cond_18

    .line 66
    const-wide/high16 v2, 0x4000000000000000L

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mFactor:D

    .line 69
    :cond_18
    return-void
.end method

.method protected onDispose()V
    .registers 2

    .prologue
    .line 110
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onDispose()V

    .line 111
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mThumbBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mThumbBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_14

    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mThumbBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 114
    :cond_14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mThumbBitmap:Landroid/graphics/Bitmap;

    .line 115
    return-void
.end method

.method protected onProgressEnd()V
    .registers 2

    .prologue
    .line 156
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mEnableFastPreview:Z

    if-nez v0, :cond_8

    .line 157
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onProgressModalEnd()V

    .line 161
    :goto_7
    return-void

    .line 159
    :cond_8
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onProgressEnd()V

    goto :goto_7
.end method

.method protected onProgressStart()V
    .registers 2

    .prologue
    .line 147
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mEnableFastPreview:Z

    if-nez v0, :cond_8

    .line 148
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onProgressModalStart()V

    .line 152
    :goto_7
    return-void

    .line 150
    :cond_8
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onProgressStart()V

    goto :goto_7
.end method

.method protected onRemoveCustomRequestHandlers()V
    .registers 3

    .prologue
    .line 100
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onRemoveCustomRequestHandlers()V

    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mRequestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

    if-eqz v0, :cond_e

    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mRequestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/picasso/Picasso;->removeRequestHandler(Lit/sephiroth/android/library/picasso/RequestHandler;)Z

    .line 105
    :cond_e
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;->mRequestHandler:Lit/sephiroth/android/library/picasso/RequestHandler;

    .line 106
    return-void
.end method
