.class public abstract Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
.super Ljava/lang/Object;
.source "AbstractPanel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetApplyEnabledEvent;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewUpdatedEvent;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEventWithResId;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEvent;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$RestoreToolBarTitleEvent;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$CompleteEvent;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressEndEvent;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ContentPanel;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OptionPanel;,
        Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;
    }
.end annotation


# instance fields
.field private final handlerBase:Landroid/os/Handler;

.field protected logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private mActive:Z

.field protected mBitmap:Landroid/graphics/Bitmap;

.field protected mChanged:Z

.field private mCreated:Z

.field protected final mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

.field protected mEnabled:Z

.field private mEntryName:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field protected mErrorListener:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;

.field protected mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

.field private mFilterContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

.field private mOptions:Landroid/os/Bundle;

.field protected mPreview:Landroid/graphics/Bitmap;

.field protected mSaving:Z

.field protected mTrackingAttributes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 7
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    const/4 v3, 0x0

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->handlerBase:Landroid/os/Handler;

    .line 135
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mFilterContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .line 136
    iget-object v0, p2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEntryName:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 137
    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mActive:Z

    .line 138
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEnabled:Z

    .line 139
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mTrackingAttributes:Ljava/util/HashMap;

    .line 140
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 141
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEntryName:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->getToolId(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEntryName:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->getToolVersion(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .line 142
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->setIsChanged(Z)V

    .line 144
    return-void
.end method

.method private internalDispose()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 436
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->recyclePreview()V

    .line 437
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 438
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mBitmap:Landroid/graphics/Bitmap;

    .line 439
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mErrorListener:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;

    .line 440
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mFilterContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .line 441
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    .line 442
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEntryName:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 443
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mOptions:Landroid/os/Bundle;

    .line 444
    return-void
.end method


# virtual methods
.method public getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .registers 2

    .prologue
    .line 421
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mFilterContext:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    return-object v0
.end method

.method public getEditToolResult()Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;
    .registers 2

    .prologue
    .line 572
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    return-object v0
.end method

.method public getHandler()Landroid/os/Handler;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->handlerBase:Landroid/os/Handler;

    return-object v0
.end method

.method public getIsChanged()Z
    .registers 2

    .prologue
    .line 373
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mChanged:Z

    return v0
.end method

.method public getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .registers 2

    .prologue
    .line 447
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEntryName:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    return-object v0
.end method

.method public getOptions()Landroid/os/Bundle;
    .registers 2

    .prologue
    .line 290
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mOptions:Landroid/os/Bundle;

    return-object v0
.end method

.method public hasOption(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 306
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->hasOptions()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mOptions:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public hasOptions()Z
    .registers 2

    .prologue
    .line 302
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mOptions:Landroid/os/Bundle;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isActive()Z
    .registers 2

    .prologue
    .line 238
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mActive:Z

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isCreated()Z
    .registers 2

    .prologue
    .line 247
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mCreated:Z

    return v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 229
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEnabled:Z

    return v0
.end method

.method public onActivate()V
    .registers 3

    .prologue
    .line 401
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onActivate"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 402
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mActive:Z

    .line 403
    return-void
.end method

.method public onBackPressed()Z
    .registers 2

    .prologue
    .line 317
    const/4 v0, 0x0

    return v0
.end method

.method public onCancel()Z
    .registers 3

    .prologue
    .line 353
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onCancel"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 354
    const/4 v0, 0x0

    return v0
.end method

.method public onCancelled()V
    .registers 3

    .prologue
    .line 363
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onCancelled"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 364
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->setEnabled(Z)V

    .line 365
    return-void
.end method

.method protected onComplete(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 519
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 520
    return-void
.end method

.method protected onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "editResult"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .prologue
    .line 505
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onComplete(bitmap, editResult)"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 506
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 508
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    .line 509
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEntryName:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 510
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->getToolName(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": saved"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mTrackingAttributes:Ljava/util/HashMap;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 512
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$CompleteEvent;

    invoke-direct {v1, p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$CompleteEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 514
    :cond_3f
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 515
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mSaving:Z

    .line 516
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V
    .registers 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;
    .param p2, "oldConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 327
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 268
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onCreate"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 269
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mBitmap:Landroid/graphics/Bitmap;

    .line 270
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mCreated:Z

    .line 271
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mOptions:Landroid/os/Bundle;

    .line 272
    return-void
.end method

.method public onDeactivate()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 410
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onDeactivate"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 411
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->setEnabled(Z)V

    .line 412
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mActive:Z

    .line 413
    return-void
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 389
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onDestroy"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 390
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mCreated:Z

    .line 391
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onDispose()V

    .line 392
    return-void
.end method

.method protected onDispose()V
    .registers 3

    .prologue
    .line 428
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onDispose"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 429
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->internalDispose()V

    .line 430
    return-void
.end method

.method protected onGenerateResult()V
    .registers 2

    .prologue
    .line 563
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onGenerateResult(Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 564
    return-void
.end method

.method protected onGenerateResult(Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V
    .registers 4
    .param p1, "resultVO"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .prologue
    .line 567
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onGenerateResult(editResult)"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 568
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 569
    return-void
.end method

.method protected onGenericError(Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "yesLabel"    # I
    .param p3, "yesListener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 523
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mErrorListener:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 524
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mErrorListener:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;->onError(Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)V

    .line 526
    :cond_f
    return-void
.end method

.method protected onGenericError(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 537
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onGenericError(Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)V

    .line 538
    return-void
.end method

.method protected onPreviewChanged(Landroid/graphics/Bitmap;ZZ)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "reset"    # Z
    .param p3, "notify"    # Z

    .prologue
    .line 477
    if-eqz p1, :cond_2a

    const/4 v0, 0x1

    :goto_3
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->setIsChanged(Z)V

    .line 479
    if-eqz p1, :cond_10

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    .line 480
    :cond_10
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->recyclePreview()V

    .line 483
    :cond_13
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 485
    if-eqz p3, :cond_29

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 486
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;

    invoke-direct {v1, p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Landroid/graphics/Bitmap;Z)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 488
    :cond_29
    return-void

    .line 477
    :cond_2a
    const/4 v0, 0x0

    goto :goto_3
.end method

.method protected onPreviewChanged(Landroid/graphics/drawable/Drawable;ZZ)V
    .registers 6
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "reset"    # Z
    .param p3, "notify"    # Z

    .prologue
    .line 491
    if-eqz p1, :cond_1b

    const/4 v0, 0x1

    :goto_3
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->setIsChanged(Z)V

    .line 492
    if-eqz p3, :cond_1a

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 493
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;

    invoke-direct {v1, p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Landroid/graphics/drawable/Drawable;Z)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 495
    :cond_1a
    return-void

    .line 491
    :cond_1b
    const/4 v0, 0x0

    goto :goto_3
.end method

.method protected onPreviewUpdated()V
    .registers 3

    .prologue
    .line 461
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->setIsChanged(Z)V

    .line 463
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 464
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewUpdatedEvent;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewUpdatedEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 466
    :cond_16
    return-void
.end method

.method protected onProgressEnd()V
    .registers 4

    .prologue
    .line 197
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 198
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressEndEvent;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressEndEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Z)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 200
    :cond_13
    return-void
.end method

.method protected onProgressModalEnd()V
    .registers 4

    .prologue
    .line 209
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 210
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressEndEvent;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressEndEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Z)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 212
    :cond_13
    return-void
.end method

.method protected onProgressModalStart()V
    .registers 4

    .prologue
    .line 203
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 204
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Z)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 206
    :cond_13
    return-void
.end method

.method protected onProgressStart()V
    .registers 4

    .prologue
    .line 188
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 189
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Z)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 191
    :cond_13
    return-void
.end method

.method public onSave()V
    .registers 3

    .prologue
    .line 333
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onSave"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 335
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mSaving:Z

    if-nez v0, :cond_11

    .line 336
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mSaving:Z

    .line 337
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onGenerateResult()V

    .line 339
    :cond_11
    return-void
.end method

.method protected recyclePreview()V
    .registers 3

    .prologue
    .line 454
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mPreview:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_22

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_22

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mPreview:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    .line 455
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Recycle PreviewBitmap"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 456
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 458
    :cond_22
    return-void
.end method

.method protected restoreToolbarTitle()V
    .registers 3

    .prologue
    .line 172
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 173
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$RestoreToolBarTitleEvent;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$RestoreToolBarTitleEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 175
    :cond_12
    return-void
.end method

.method public setEnabled(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 220
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mEnabled:Z

    .line 221
    return-void
.end method

.method protected setIsChanged(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 382
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mChanged:Z

    .line 383
    return-void
.end method

.method public setOnErrorListener(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;

    .prologue
    .line 258
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->mErrorListener:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;

    .line 259
    return-void
.end method

.method protected setToolbarTitle(I)V
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 163
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 164
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEventWithResId;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEventWithResId;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;I)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 166
    :cond_12
    return-void
.end method

.method protected setToolbarTitle(Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 154
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isActive()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 155
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEvent;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 157
    :cond_12
    return-void
.end method
