.class public final Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
.super Ljava/lang/Object;
.source "AdobeImageEditorController.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;
.implements Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;


# instance fields
.field private logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mChanged:Z

.field private mConfiguration:Landroid/content/res/Configuration;

.field private mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

.field private mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

.field private mCurrentEntry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

.field private mCurrentState:I

.field private final mHandler:Landroid/os/Handler;

.field private mHiresListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;",
            ">;"
        }
    .end annotation
.end field

.field private mIsTablet:Z

.field private mPanelCreatorService:Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;

.field private final mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;",
            ">;"
        }
    .end annotation
.end field

.field private mToolCompleteCount:I

.field private mToolList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .prologue
    const/4 v2, 0x0

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mHandler:Landroid/os/Handler;

    .line 136
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 137
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .line 138
    iput v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mToolCompleteCount:I

    .line 139
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mHiresListeners:Ljava/util/List;

    .line 141
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    .line 142
    new-instance v0, Landroid/content/res/Configuration;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mConfiguration:Landroid/content/res/Configuration;

    .line 144
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->initServices()V

    .line 145
    iput v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    .line 146
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mChanged:Z

    .line 147
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;I)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p1, "x1"    # I

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setCurrentState(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    return-object v0
.end method

.method private initHiResService(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V
    .registers 13
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "imageInfo"    # Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 192
    const-class v3, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 193
    .local v0, "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    const-class v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .line 195
    .local v1, "service":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    if-eqz p1, :cond_60

    .line 196
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getOriginalSize()[I

    move-result-object v3

    if-eqz v3, :cond_60

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getOriginalSize()[I

    move-result-object v3

    array-length v3, v3

    if-ne v3, v9, :cond_60

    .line 197
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "original size: %dx%d"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getOriginalSize()[I

    move-result-object v6

    aget v6, v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getOriginalSize()[I

    move-result-object v6

    aget v6, v6, v8

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 198
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "bitmap size: %dx%d"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 202
    :cond_60
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->isRunning()Z

    move-result v3

    if-nez v3, :cond_69

    .line 203
    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->setOnHiresListener(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;)V

    .line 206
    :cond_69
    const-class v3, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    .line 207
    .local v2, "sessionService":Lcom/adobe/creativesdk/aviary/internal/services/SessionService;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->isRunning()Z

    move-result v3

    if-nez v3, :cond_7a

    .line 208
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->start()V

    .line 210
    :cond_7a
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getRequestedMegaPixels()I

    move-result v3

    invoke-virtual {v2, p1, v3, p2}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->load(Landroid/graphics/Bitmap;ILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V

    .line 211
    return-void
.end method

.method private declared-synchronized initServices()V
    .registers 3

    .prologue
    .line 180
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "initServices"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->register(Ljava/lang/Class;)Ljava/lang/Class;

    .line 183
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->register(Ljava/lang/Class;)Ljava/lang/Class;

    .line 184
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/ThreadPoolService;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->register(Ljava/lang/Class;)Ljava/lang/Class;

    .line 185
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->register(Ljava/lang/Class;)Ljava/lang/Class;

    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->register(Ljava/lang/Class;)Ljava/lang/Class;

    .line 187
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    const-class v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->register(Ljava/lang/Class;)Ljava/lang/Class;

    .line 188
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->register(Ljava/lang/Class;)Ljava/lang/Class;
    :try_end_39
    .catchall {:try_start_1 .. :try_end_39} :catchall_3b

    .line 189
    monitor-exit p0

    return-void

    .line 180
    :catchall_3b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private isSamePanel(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)Z
    .registers 5
    .param p1, "panel1"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    .param p2, "panel2"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    .prologue
    .line 1159
    if-eqz p1, :cond_10

    if-eqz p2, :cond_10

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v0

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v1

    if-ne v0, v1, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private onClose(Z)V
    .registers 4
    .param p1, "isConfirmed"    # Z

    .prologue
    .line 575
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onClose"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 577
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setCurrentState(I)V

    .line 579
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getBottomBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$2;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Z)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setOnViewChangingStatusListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;)V

    .line 597
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getBottomBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->close()Z

    .line 598
    return-void
.end method

.method private onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V
    .registers 9
    .param p1, "result"    # Landroid/graphics/Bitmap;
    .param p2, "editResultVO"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .prologue
    const/4 v5, 0x1

    .line 601
    iget v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mToolCompleteCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mToolCompleteCount:I

    .line 603
    if-eqz p1, :cond_6a

    .line 604
    invoke-virtual {p0, p1, v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setNextBitmap(Landroid/graphics/Bitmap;Z)V

    .line 610
    :goto_c
    invoke-direct {p0, v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onClose(Z)V

    .line 612
    if-eqz p2, :cond_7f

    .line 615
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->valid()Z

    move-result v3

    if-nez v3, :cond_1e

    .line 616
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "editResult is not valid!"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 620
    :cond_1e
    const-class v3, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 621
    .local v0, "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    if-eqz v0, :cond_2f

    .line 622
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->getEditTool()Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->addRecipe(Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;)V

    .line 625
    :cond_2f
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->getActionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v3

    if-eqz v3, :cond_77

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->getActionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->size()I

    move-result v3

    if-lez v3, :cond_77

    .line 626
    const-class v3, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    .line 627
    .local v2, "sessionService":Lcom/adobe/creativesdk/aviary/internal/services/SessionService;
    invoke-virtual {v2, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->push(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 630
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->isUndoRedoAvailable()Z

    move-result v3

    if-eqz v3, :cond_69

    .line 631
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x5

    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->shouldShow(Landroid/content/Context;I)Z

    move-result v3

    if-eqz v3, :cond_69

    .line 632
    new-instance v1, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;-><init>(Landroid/content/Context;)V

    .line 633
    .local v1, "overlay":Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
    const-wide/16 v4, 0xc8

    invoke-virtual {v1, v4, v5}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->showDelayed(J)Z

    .line 642
    .end local v0    # "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    .end local v1    # "overlay":Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
    .end local v2    # "sessionService":Lcom/adobe/creativesdk/aviary/internal/services/SessionService;
    :cond_69
    :goto_69
    return-void

    .line 606
    :cond_6a
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "Error: returned bitmap is null!"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 607
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v3, v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setNextBitmap(Landroid/graphics/Bitmap;Z)V

    goto :goto_c

    .line 637
    .restart local v0    # "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    :cond_77
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "actionlist is missing!"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_69

    .line 640
    .end local v0    # "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    :cond_7f
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "Something was wrong, edit result is null!"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_69
.end method

.method private onPanelReady()V
    .registers 4

    .prologue
    .line 961
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v0

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->resetMatrix()V

    .line 962
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainToolBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    move-result-object v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getActiveTool()Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    move-result-object v1

    iget v1, v1, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->labelResourceId:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setTitle(IZ)V

    .line 963
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainToolBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->open()V

    .line 964
    return-void
.end method

.method private prepareToolPanel(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Landroid/os/Bundle;)V
    .registers 9
    .param p1, "effect"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, -0x1

    .line 785
    instance-of v2, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OptionPanel;

    if-eqz v2, :cond_21

    move-object v2, p1

    .line 786
    check-cast v2, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OptionPanel;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .line 787
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getOptionsPanelContainer()Landroid/view/ViewGroup;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OptionPanel;->getOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 788
    .local v1, "optionChild":Landroid/view/View;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getOptionsPanelContainer()Landroid/view/ViewGroup;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 791
    .end local v1    # "optionChild":Landroid/view/View;
    :cond_21
    instance-of v2, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ContentPanel;

    if-eqz v2, :cond_43

    move-object v2, p1

    .line 792
    check-cast v2, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ContentPanel;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ContentPanel;->getContentView(Landroid/view/LayoutInflater;)Landroid/view/View;

    move-result-object v0

    .line 793
    .local v0, "drawingChild":Landroid/view/View;
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 794
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getDrawingImageContainer()Landroid/view/ViewGroup;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 797
    .end local v0    # "drawingChild":Landroid/view/View;
    :cond_43
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v2, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 798
    return-void
.end method

.method private setCurrentState(I)V
    .registers 9
    .param p1, "newState"    # I

    .prologue
    const/4 v6, 0x0

    .line 817
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    if-eq p1, v1, :cond_2d

    .line 818
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "setcurrentState: %s >> %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 819
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    .line 820
    .local v0, "previousState":I
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    .line 822
    packed-switch p1, :pswitch_data_b4

    .line 876
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "Invalid state"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 880
    .end local v0    # "previousState":I
    :cond_2d
    :goto_2d
    return-void

    .line 825
    .restart local v0    # "previousState":I
    :pswitch_2e
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->setOnErrorListener(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;)V

    .line 826
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;

    invoke-direct {v2, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;-><init>(II)V

    invoke-virtual {v1, v2}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    goto :goto_2d

    .line 830
    :pswitch_40
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onActivate()V

    .line 831
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;

    invoke-direct {v2, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;-><init>(II)V

    invoke-virtual {v1, v2}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 833
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    instance-of v1, v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ContentPanel;

    if-nez v1, :cond_2d

    .line 834
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onPanelReady()V

    goto :goto_2d

    .line 840
    :pswitch_5b
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;

    invoke-direct {v2, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;-><init>(II)V

    invoke-virtual {v1, v2}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 841
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onDeactivate()V

    .line 844
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$3;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$3;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_2d

    .line 857
    :pswitch_77
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getOptionsPanelContainer()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 859
    if-eqz v0, :cond_95

    .line 860
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onDestroy()V

    .line 861
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->setOnErrorListener(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$OnErrorListener;)V

    .line 862
    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    .line 863
    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEntry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .line 865
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->hideProgressIfVisible()V

    .line 867
    :cond_95
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;

    invoke-direct {v2, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;-><init>(II)V

    invoke-virtual {v1, v2}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 868
    invoke-static {}, Ljava/lang/System;->gc()V

    goto :goto_2d

    .line 872
    :pswitch_a5
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;

    invoke-direct {v2, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/events/ControllerStateChangedEvent;-><init>(II)V

    invoke-virtual {v1, v2}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    goto/16 :goto_2d

    .line 822
    nop

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_a5
        :pswitch_2e
        :pswitch_40
        :pswitch_5b
        :pswitch_77
        :pswitch_77
    .end packed-switch
.end method

.method private showUndoRedoToolTip(I)V
    .registers 8
    .param p1, "textId"    # I

    .prologue
    const/4 v3, 0x0

    .line 764
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 765
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v1

    invoke-static {v1}, Lit/sephiroth/android/library/tooltip/TooltipManager;->getInstance(Landroid/app/Activity;)Lit/sephiroth/android/library/tooltip/TooltipManager;

    move-result-object v1

    invoke-virtual {v1, v3}, Lit/sephiroth/android/library/tooltip/TooltipManager;->remove(I)V

    .line 766
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v1

    invoke-static {v1}, Lit/sephiroth/android/library/tooltip/TooltipManager;->getInstance(Landroid/app/Activity;)Lit/sephiroth/android/library/tooltip/TooltipManager;

    move-result-object v1

    .line 767
    invoke-virtual {v1, v3}, Lit/sephiroth/android/library/tooltip/TooltipManager;->create(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_tooltip:I

    .line 768
    invoke-virtual {v1, v2, v3}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->withCustomView(IZ)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v1

    sget-object v2, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->None:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    const-wide/16 v4, 0x3e8

    .line 769
    invoke-virtual {v1, v2, v4, v5}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->closePolicy(Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;J)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v1

    .line 770
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2, p1}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->text(Landroid/content/res/Resources;I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$style;->AdobeImageWidget_ContentPanelsTooltip:I

    .line 771
    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->withStyleId(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .line 772
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getActionBarSize()I

    move-result v2

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->actionBarSize(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v1

    .line 773
    invoke-virtual {v1, v3}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->toggleArrow(Z)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v1

    new-instance v2, Landroid/graphics/Point;

    iget v3, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 v3, v3, 0x2

    const/16 v4, 0x5a

    invoke-direct {v2, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    sget-object v3, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->BOTTOM:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    .line 774
    invoke-virtual {v1, v2, v3}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->anchor(Landroid/graphics/Point;Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v1

    .line 775
    invoke-virtual {v1}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->show()Z

    .line 776
    return-void
.end method


# virtual methods
.method public activateTool(Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Landroid/os/Bundle;Landroid/graphics/Point;)V
    .registers 9
    .param p1, "tag"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .param p2, "options"    # Landroid/os/Bundle;
    .param p3, "origin"    # Landroid/graphics/Point;

    .prologue
    .line 220
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isClosed()Z

    move-result v1

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v1, :cond_11

    .line 270
    :cond_10
    :goto_10
    return-void

    .line 225
    :cond_11
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mToolList:Ljava/util/List;

    if-eqz v1, :cond_23

    .line 226
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mToolList:Ljava/util/List;

    iget-object v2, p1, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-ltz v1, :cond_10

    .line 232
    :cond_23
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    if-eqz v1, :cond_2f

    .line 233
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "There is already an active effect. Cannot activate new"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 235
    :cond_2f
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mPanelCreatorService:Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;

    if-nez v1, :cond_3d

    .line 236
    const-class v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mPanelCreatorService:Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;

    .line 239
    :cond_3d
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mPanelCreatorService:Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;->createNew(Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    move-result-object v0

    .line 241
    .local v0, "effect":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    if-eqz v0, :cond_10

    .line 242
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    .line 243
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEntry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .line 245
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setCurrentState(I)V

    .line 246
    invoke-direct {p0, v0, p2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->prepareToolPanel(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Landroid/os/Bundle;)V

    .line 248
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEntry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": opened"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 250
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getBottomBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setOnViewChangingStatusListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;)V

    .line 268
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getBottomBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    move-result-object v1

    invoke-virtual {v1, p3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->open(Landroid/graphics/Point;)Z

    goto :goto_10
.end method

.method public addOnHiresListener(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mHiresListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    return-void
.end method

.method public cancel()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 543
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "FilterManager::cancel"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 545
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isOpened()Z

    move-result v0

    if-nez v0, :cond_15

    .line 566
    :cond_14
    :goto_14
    return-void

    .line 548
    :cond_15
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    if-nez v0, :cond_21

    .line 549
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "there is no current effect active in the context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 552
    :cond_21
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEntry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": cancelled"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 555
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onCancelled()V

    .line 558
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->getIsChanged()Z

    move-result v0

    if-eqz v0, :cond_62

    .line 560
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0, v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setNextBitmap(Landroid/graphics/Bitmap;Z)V

    .line 565
    :goto_5d
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onClose(Z)V

    goto :goto_14

    .line 563
    :cond_62
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0, v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setNextBitmap(Landroid/graphics/Bitmap;Z)V

    goto :goto_5d
.end method

.method public closeStoreDialog()Z
    .registers 7

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1001
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "closeStoreDialog"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1002
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getStoreFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    move-result-object v0

    .line 1003
    .local v0, "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
    if-eqz v0, :cond_34

    .line 1004
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 1005
    .local v1, "manager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->popBackStack()V

    .line 1006
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainToolBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setApplyVisible(Z)V

    .line 1007
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainContent()Landroid/view/ViewGroup;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1008
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getBottomBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setVisibility(I)V

    .line 1011
    .end local v1    # "manager":Landroid/support/v4/app/FragmentManager;
    :goto_33
    return v2

    :cond_34
    move v2, v3

    goto :goto_33
.end method

.method public dispose()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 274
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->unregister(Ljava/lang/Object;)V

    .line 276
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    if-eqz v1, :cond_1b

    .line 277
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "Deactivate and destroy current panel"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 278
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onDeactivate()V

    .line 279
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onDestroy()V

    .line 280
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    .line 283
    :cond_1b
    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .line 284
    .local v0, "hiresService":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    if-eqz v0, :cond_28

    .line 285
    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->setOnHiresListener(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;)V

    .line 288
    :cond_28
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->dispose()V

    .line 289
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .line 290
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 291
    return-void
.end method

.method public getAccentColor(I)I
    .registers 4
    .param p1, "defaultColor"    # I

    .prologue
    .line 1033
    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 1034
    .local v0, "localDataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    if-eqz v0, :cond_f

    .line 1035
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getAccentColor(I)I

    move-result v1

    .line 1037
    :goto_e
    return v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getActiveTool()Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .registers 2

    .prologue
    .line 349
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEntry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    return-object v0
.end method

.method public getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
    .registers 2

    .prologue
    .line 298
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    return-object v0
.end method

.method public getBaseContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 294
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    return-object v0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 307
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getBitmapIsChanged()Z
    .registers 2

    .prologue
    .line 316
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mChanged:Z

    return v0
.end method

.method public getCurrentImageViewMatrix()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 371
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v0

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getEnabled()Z
    .registers 2

    .prologue
    .line 380
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public getService(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 393
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mServiceLoader:Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/aviary/internal/services/ServiceLoader;->getService(Ljava/lang/Class;)Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
    :try_end_5
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 396
    :goto_6
    return-object v1

    .line 394
    :catch_7
    move-exception v0

    .line 395
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    .line 396
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getStoreFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
    .registers 10

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1015
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 1016
    .local v2, "manager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    .line 1017
    .local v0, "count":I
    const-string v3, "iap-dialog-fragment"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    .line 1019
    .local v1, "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "count: %d"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1020
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "fragment: %s"

    new-array v5, v8, [Ljava/lang/Object;

    aput-object v1, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1021
    return-object v1
.end method

.method public getToolCompleteCount()I
    .registers 2

    .prologue
    .line 168
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mToolCompleteCount:I

    return v0
.end method

.method public getToolList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mToolList:Ljava/util/List;

    return-object v0
.end method

.method public getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    return-object v0
.end method

.method public hasAccentColor()Z
    .registers 3

    .prologue
    .line 1025
    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 1026
    .local v0, "localDataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    if-eqz v0, :cond_f

    .line 1027
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->hasAccentColor()Z

    move-result v1

    .line 1029
    :goto_e
    return v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public isClosed()Z
    .registers 3

    .prologue
    .line 414
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_a

    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isOpened()Z
    .registers 3

    .prologue
    .line 423
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public onActivate(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "imageInfo"    # Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .prologue
    const/4 v2, 0x0

    .line 433
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    if-eqz v1, :cond_d

    .line 434
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot activate. Already active!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 437
    :cond_d
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1c

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 438
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    .line 441
    :cond_1c
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    .line 443
    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 444
    .local v0, "dataService":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->setImageInfo(Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V

    .line 446
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mChanged:Z

    .line 447
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setCurrentState(I)V

    .line 448
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->initHiResService(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V

    .line 451
    if-eqz v0, :cond_49

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->hasAccentColor()Z

    move-result v1

    if-eqz v1, :cond_49

    .line 452
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainToolBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    move-result-object v1

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getAccentColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setTint(I)V

    .line 455
    :cond_49
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->register(Ljava/lang/Object;)V

    .line 456
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)Z
    .registers 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 462
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->register(Ljava/lang/Object;)V

    .line 463
    const/4 v0, 0x0

    return v0
.end method

.method public onApply()V
    .registers 3

    .prologue
    .line 470
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "FilterManager::onapply"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 471
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isOpened()Z

    move-result v0

    if-nez v0, :cond_14

    .line 489
    :cond_13
    :goto_13
    return-void

    .line 475
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    if-nez v0, :cond_20

    .line 476
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "there is no current effect active in the context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 479
    :cond_20
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 483
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->getIsChanged()Z

    move-result v0

    if-eqz v0, :cond_39

    .line 484
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onSave()V

    .line 485
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mChanged:Z

    goto :goto_13

    .line 487
    :cond_39
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onCancel()V

    goto :goto_13
.end method

.method public onBackPressed()Z
    .registers 6

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 499
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "onBackPressed"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 500
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isClosed()Z

    move-result v3

    if-eqz v3, :cond_10

    .line 523
    :cond_f
    :goto_f
    return v1

    .line 504
    :cond_10
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getStoreFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    move-result-object v0

    .line 505
    .local v0, "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
    if-eqz v0, :cond_26

    .line 506
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->onBackPressed()Z

    move-result v3

    if-nez v3, :cond_24

    .line 507
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->closeStoreDialog()Z

    move-result v3

    if-eqz v3, :cond_26

    move v1, v2

    .line 508
    goto :goto_f

    :cond_24
    move v1, v2

    .line 511
    goto :goto_f

    .line 515
    :cond_26
    iget v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    if-eqz v3, :cond_f

    .line 516
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isOpened()Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 517
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onBackPressed()Z

    move-result v1

    if-nez v1, :cond_3b

    .line 518
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onCancel()V

    :cond_3b
    move v1, v2

    .line 521
    goto :goto_f
.end method

.method public onCancel()V
    .registers 3

    .prologue
    .line 530
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isOpened()Z

    move-result v0

    if-nez v0, :cond_d

    .line 539
    :cond_c
    :goto_c
    return-void

    .line 533
    :cond_d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    if-nez v0, :cond_19

    .line 534
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "there is no current effect active in the context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 536
    :cond_19
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onCancel()Z

    move-result v0

    if-nez v0, :cond_c

    .line 537
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->cancel()V

    goto :goto_c
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)Z
    .registers 8
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 911
    const/4 v0, 0x0

    .line 912
    .local v0, "result":Z
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onConfigurationChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mConfiguration:Landroid/content/res/Configuration;

    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 914
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    if-eqz v1, :cond_4c

    .line 915
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->isCreated()Z

    move-result v1

    if-eqz v1, :cond_4c

    .line 916
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onConfigurationChanged, sending event to "

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 917
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v1, p1, v2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;->onConfigurationChanged(Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V

    .line 918
    const/4 v0, 0x1

    .line 922
    :cond_4c
    new-instance v1, Landroid/content/res/Configuration;

    invoke-direct {v1, p1}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mConfiguration:Landroid/content/res/Configuration;

    .line 923
    return v0
.end method

.method public onError(Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)V
    .registers 6
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "yesLabel"    # I
    .param p3, "yesListener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 689
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_generic_error_title:I

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 690
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 691
    invoke-virtual {v0, p2, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1080027

    .line 692
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 693
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 694
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;)V
    .registers 6
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;

    .prologue
    .line 1045
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "onEventMainThread(QuickLaunchEvent)"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1047
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_29

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v2

    if-eqz v2, :cond_29

    .line 1049
    const-class v2, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;

    .line 1050
    .local v1, "service":Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;
    iget-object v2, p1, Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;->tool:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;->findEntry(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    move-result-object v0

    .line 1052
    .local v0, "entry":Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    if-eqz v0, :cond_29

    .line 1053
    iget-object v2, p1, Lcom/adobe/creativesdk/aviary/internal/events/QuickLaunchEvent;->options:Landroid/os/Bundle;

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->activateTool(Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Landroid/os/Bundle;Landroid/graphics/Point;)V

    .line 1056
    .end local v0    # "entry":Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .end local v1    # "service":Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;
    :cond_29
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel$ContentReadyEvent;)V
    .registers 4
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel$ContentReadyEvent;

    .prologue
    .line 1107
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1d

    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel$ContentReadyEvent;->panel:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isSamePanel(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 1108
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setVisibility(I)V

    .line 1109
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onPanelReady()V

    .line 1111
    :cond_1d
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$CompleteEvent;)V
    .registers 7
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$CompleteEvent;

    .prologue
    .line 1074
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "CompleteEvent. currentState: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1075
    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$CompleteEvent;->bitmap:Landroid/graphics/Bitmap;

    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$CompleteEvent;->editResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 1076
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;)V
    .registers 12
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;

    .prologue
    const/high16 v9, -0x40800000

    .line 1114
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "PreviewBitmapChangedEvent"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1115
    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_24

    iget-object v4, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;->panel:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-direct {p0, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isSamePanel(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 1116
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isOpened()Z

    move-result v4

    if-nez v4, :cond_25

    .line 1134
    :cond_24
    :goto_24
    return-void

    .line 1119
    :cond_25
    const/4 v1, 0x1

    .line 1120
    .local v1, "changed":Z
    iget-boolean v3, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;->reset:Z

    .line 1121
    .local v3, "reset":Z
    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;->bitmap:Landroid/graphics/Bitmap;

    .line 1123
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v3, :cond_3a

    .line 1124
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v4

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->compareBySize(Landroid/graphics/drawable/Drawable;Landroid/graphics/Bitmap;)Z

    move-result v1

    .line 1126
    :cond_3a
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "onPreviewChange: changed: %b"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1128
    const/4 v2, 0x0

    .line 1129
    .local v2, "matrix":Landroid/graphics/Matrix;
    if-nez v1, :cond_58

    .line 1130
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v4

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    .line 1132
    :cond_58
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v4

    invoke-virtual {v4, v0, v2, v9, v9}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    goto :goto_24
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;)V
    .registers 9
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;

    .prologue
    const/high16 v6, -0x40800000

    .line 1137
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "PreviewDrawableChangedEvent"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1138
    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_24

    iget-object v4, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;->panel:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-direct {p0, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isSamePanel(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 1139
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isOpened()Z

    move-result v4

    if-nez v4, :cond_25

    .line 1156
    :cond_24
    :goto_24
    return-void

    .line 1143
    :cond_25
    const/4 v0, 0x1

    .line 1144
    .local v0, "changed":Z
    iget-boolean v3, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;->reset:Z

    .line 1145
    .local v3, "reset":Z
    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewDrawableChangedEvent;->drawable:Landroid/graphics/drawable/Drawable;

    .line 1147
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v3, :cond_3a

    .line 1148
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v4

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-static {v4, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->compareBySize(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    .line 1150
    :cond_3a
    const/4 v2, 0x0

    .line 1151
    .local v2, "matrix":Landroid/graphics/Matrix;
    if-nez v0, :cond_47

    .line 1152
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v4

    invoke-virtual {v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    .line 1154
    :cond_47
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v4

    invoke-virtual {v4, v1, v2, v6, v6}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageDrawable(Landroid/graphics/drawable/Drawable;Landroid/graphics/Matrix;FF)V

    goto :goto_24
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewUpdatedEvent;)V
    .registers 4
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewUpdatedEvent;

    .prologue
    .line 1098
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1b

    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewUpdatedEvent;->panel:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isSamePanel(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 1099
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isOpened()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 1104
    :cond_1b
    :goto_1b
    return-void

    .line 1102
    :cond_1c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v0

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postInvalidate()V

    goto :goto_1b
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressEndEvent;)V
    .registers 4
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressEndEvent;

    .prologue
    .line 1070
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-boolean v1, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressEndEvent;->isModal:Z

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->hideProgress(Z)V

    .line 1071
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;)V
    .registers 4
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;

    .prologue
    .line 1064
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_c

    .line 1065
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-boolean v1, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;->isModal:Z

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->showProgress(Z)V

    .line 1067
    :cond_c
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$RestoreToolBarTitleEvent;)V
    .registers 4
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$RestoreToolBarTitleEvent;

    .prologue
    .line 1080
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEntry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    if-eqz v0, :cond_11

    .line 1081
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainToolBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEntry:Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    iget v1, v1, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->labelResourceId:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setTitle(I)V

    .line 1083
    :cond_11
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetApplyEnabledEvent;)V
    .registers 4
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetApplyEnabledEvent;

    .prologue
    .line 1059
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "SetApplyEnabledEvent"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1060
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainToolBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    move-result-object v0

    iget-boolean v1, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetApplyEnabledEvent;->applyEnabled:Z

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setApplyVisible(Z)V

    .line 1061
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEvent;)V
    .registers 4
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEvent;

    .prologue
    .line 1086
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1a

    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEvent;->panel:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isSamePanel(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 1087
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainToolBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    move-result-object v0

    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEvent;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 1089
    :cond_1a
    return-void
.end method

.method public onEventMainThread(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEventWithResId;)V
    .registers 4
    .param p1, "event"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEventWithResId;

    .prologue
    .line 1092
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1a

    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEventWithResId;->panel:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isSamePanel(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 1093
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainToolBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    move-result-object v0

    iget v1, p1, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEventWithResId;->resId:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setTitle(I)V

    .line 1095
    :cond_1a
    return-void
.end method

.method public onHiresComplete()V
    .registers 4

    .prologue
    .line 950
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onHiresComplete"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 952
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mHiresListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    .line 953
    .local v0, "listener":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;->onHiresComplete()V

    goto :goto_d

    .line 955
    .end local v0    # "listener":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;
    :cond_1d
    return-void
.end method

.method public onHiresError(Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V
    .registers 6
    .param p1, "ex"    # Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    .prologue
    .line 932
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onHiresError: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 934
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mHiresListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    .line 935
    .local v0, "listener":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;
    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;->onHiresError(Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V

    goto :goto_1e

    .line 937
    .end local v0    # "listener":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;
    :cond_2e
    return-void
.end method

.method public onHiresProgress(II)V
    .registers 9
    .param p1, "index"    # I
    .param p2, "total"    # I

    .prologue
    .line 941
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onHiresProgress: %d of %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 943
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mHiresListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    .line 944
    .local v0, "listener":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;
    invoke-interface {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;->onHiresProgress(II)V

    goto :goto_1e

    .line 946
    .end local v0    # "listener":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;
    :cond_2e
    return-void
.end method

.method public onPause()V
    .registers 1

    .prologue
    .line 401
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->unregister(Ljava/lang/Object;)V

    .line 402
    return-void
.end method

.method public onRedo()V
    .registers 5

    .prologue
    .line 748
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "onRedo"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 749
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v2

    if-eqz v2, :cond_11

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    if-eqz v2, :cond_12

    .line 761
    :cond_11
    :goto_11
    return-void

    .line 752
    :cond_12
    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    .line 753
    .local v1, "sessionService":Lcom/adobe/creativesdk/aviary/internal/services/SessionService;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->canRedo()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 754
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->redo()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 755
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_11

    .line 756
    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setNextBitmap(Landroid/graphics/Bitmap;Z)V

    .line 757
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_redo:I

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->showUndoRedoToolTip(I)V

    .line 758
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v2

    const-string v3, "editor: redo"

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    goto :goto_11
.end method

.method public onResume()V
    .registers 1

    .prologue
    .line 405
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->register(Ljava/lang/Object;)V

    .line 406
    return-void
.end method

.method public onUndo()V
    .registers 5

    .prologue
    .line 728
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "onUndo"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 729
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getEnabled()Z

    move-result v2

    if-eqz v2, :cond_11

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mCurrentEffect:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    if-eqz v2, :cond_12

    .line 745
    :cond_11
    :goto_11
    return-void

    .line 732
    :cond_12
    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    .line 733
    .local v1, "sessionService":Lcom/adobe/creativesdk/aviary/internal/services/SessionService;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->canUndo()Z

    move-result v2

    if-eqz v2, :cond_39

    .line 734
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->undo()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 735
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_11

    .line 736
    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setNextBitmap(Landroid/graphics/Bitmap;Z)V

    .line 737
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_undo:I

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->showUndoRedoToolTip(I)V

    .line 738
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v2

    const-string v3, "editor: undo"

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    goto :goto_11

    .line 741
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_39
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->canRedo()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 742
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_cant_undo_anymore:I

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->showUndoRedoToolTip(I)V

    goto :goto_11
.end method

.method public openOrUpdateStoreDialog(Landroid/os/Bundle;)V
    .registers 10
    .param p1, "arguments"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x4

    .line 970
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "openOrUpdateStoreDialog"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 971
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 972
    .local v2, "manager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 973
    .local v1, "ft":Landroid/support/v4/app/FragmentTransaction;
    const-string v4, "iap-dialog-fragment"

    invoke-virtual {v2, v4}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    .line 974
    .local v3, "prev":Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
    if-eqz v3, :cond_23

    .line 975
    invoke-virtual {v3, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->setArguments(Landroid/os/Bundle;)V

    .line 976
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->update()V

    .line 998
    :goto_22
    return-void

    .line 979
    :cond_23
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->newInstance(Landroid/os/Bundle;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    move-result-object v0

    .line 981
    .local v0, "dialog":Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mIsTablet:Z

    if-eqz v4, :cond_31

    .line 982
    const-string v4, "iap-dialog-fragment"

    invoke-virtual {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    goto :goto_22

    .line 985
    :cond_31
    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    sget v5, Lcom/aviary/android/feather/sdk/R$id;->feather_dialogs_container:I

    const-string v6, "iap-dialog-fragment"

    .line 986
    invoke-virtual {v4, v5, v0, v6}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    const/4 v5, 0x0

    .line 987
    invoke-virtual {v4, v5}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    .line 988
    invoke-virtual {v4}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 991
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainToolBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToolBar;->setApplyVisible(Z)V

    .line 992
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainContent()Landroid/view/ViewGroup;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 993
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getBottomBar()Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;

    move-result-object v4

    invoke-virtual {v4, v7}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setVisibility(I)V

    goto :goto_22
.end method

.method public removeOnHiresListener(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;)Z
    .registers 3
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    .prologue
    .line 154
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mHiresListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setEnabled(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 888
    if-nez p1, :cond_11

    .line 889
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 890
    if-eqz p1, :cond_12

    .line 891
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->register(Ljava/lang/Object;)V

    .line 895
    :goto_d
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setCurrentState(I)V

    .line 900
    :cond_11
    :goto_11
    return-void

    .line 893
    :cond_12
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->unregister(Ljava/lang/Object;)V

    goto :goto_d

    .line 897
    :cond_16
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "Controller must be closed to change state"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_11
.end method

.method public setIsTablet(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 1163
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mIsTablet:Z

    .line 1164
    return-void
.end method

.method setNextBitmap(Landroid/graphics/Bitmap;Z)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "update"    # Z

    .prologue
    .line 661
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->setNextBitmap(Landroid/graphics/Bitmap;ZLandroid/graphics/Matrix;)V

    .line 662
    return-void
.end method

.method setNextBitmap(Landroid/graphics/Bitmap;ZLandroid/graphics/Matrix;)V
    .registers 10
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "update"    # Z
    .param p3, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    const/high16 v5, -0x40800000

    .line 672
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "setNextBitmap"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p3, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 674
    if-nez p2, :cond_27

    if-nez p3, :cond_27

    .line 675
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v0

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object p3

    .line 677
    :cond_27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mContext:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getMainImage()Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-result-object v0

    invoke-virtual {v0, p1, p3, v5, v5}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 679
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_62

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_62

    .line 680
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[recycle] original Bitmap: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 681
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 682
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    .line 684
    :cond_62
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mBitmap:Landroid/graphics/Bitmap;

    .line 685
    return-void
.end method

.method public setToolList(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 172
    .local p1, "toolList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->mToolList:Ljava/util/List;

    .line 173
    return-void
.end method
