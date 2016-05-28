.class public final Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
.super Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
.source "HiResBackgroundService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;,
        Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;,
        Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;
    }
.end annotation


# instance fields
.field private final logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private final mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

.field private mListener:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

.field private mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

.field private volatile mServiceLooper:Landroid/os/Looper;

.field private moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

.field private running:Z

.field private final thread:Landroid/os/HandlerThread;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 5
    .param p1, "controller"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 427
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    .line 85
    const-string v0, "HiResBackgroundService"

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    .line 86
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 429
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    .line 430
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "hires-looper"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->thread:Landroid/os/HandlerThread;

    .line 431
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->thread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 432
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;II)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchProgress(II)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchError(Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V

    return-void
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    return-object v0
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    return-object p1
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->quit()V

    return-void
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchSaveComplete()V

    return-void
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->getActivityContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method private dispatchError(Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V
    .registers 7
    .param p1, "e"    # Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    .prologue
    .line 467
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "dispatchError: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->getCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 468
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->printStackTrace()V

    .line 469
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mListener:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    if-eqz v0, :cond_22

    .line 470
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mListener:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;->onHiresError(Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V

    .line 474
    :goto_21
    return-void

    .line 472
    :cond_22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "no listeners attached"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_21
.end method

.method private dispatchProgress(II)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "total"    # I

    .prologue
    .line 477
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dispatchProgress: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 478
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mListener:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    if-eqz v0, :cond_2b

    .line 479
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mListener:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    invoke-interface {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;->onHiresProgress(II)V

    .line 481
    :cond_2b
    return-void
.end method

.method private dispatchSaveComplete()V
    .registers 2

    .prologue
    .line 461
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mListener:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    if-eqz v0, :cond_9

    .line 462
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mListener:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;->onHiresComplete()V

    .line 464
    :cond_9
    return-void
.end method

.method private getActivityContext()Landroid/content/Context;
    .registers 3

    .prologue
    .line 439
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    .line 440
    .local v0, "controller":Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    if-nez v0, :cond_8

    .line 441
    const/4 v1, 0x0

    .line 443
    :goto_7
    return-object v1

    :cond_8
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    goto :goto_7
.end method

.method private internalLoad(Landroid/net/Uri;ILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "maxSize"    # I
    .param p3, "imageInfo"    # Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .prologue
    .line 516
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "internalLoad, size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 517
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    if-eqz v2, :cond_64

    .line 518
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->removeAllMessages()V

    .line 520
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->reset()V

    .line 521
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->index:I

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    iget v4, v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    invoke-direct {p0, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchProgress(II)V

    .line 524
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp30:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v2

    invoke-static {p2, v2}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 526
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 527
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->toBundle(Landroid/os/Bundle;)V

    .line 529
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    const/16 v3, 0x3e8

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 530
    .local v1, "message":Landroid/os/Message;
    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 531
    iput p2, v1, Landroid/os/Message;->arg1:I

    .line 532
    invoke-virtual {p3}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getOrientation()I

    move-result v2

    iput v2, v1, Landroid/os/Message;->arg2:I

    .line 533
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 535
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->sendMessage(Landroid/os/Message;)Z

    .line 537
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "message":Landroid/os/Message;
    :cond_64
    return-void
.end method

.method private quit()V
    .registers 3

    .prologue
    .line 639
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "quit"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 641
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->running:Z

    .line 642
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    if-eqz v0, :cond_20

    .line 643
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 645
    :try_start_16
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->unload()V
    :try_end_1b
    .catch Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException; {:try_start_16 .. :try_end_1b} :catch_29

    .line 650
    :cond_1b
    :goto_1b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->dispose()V

    .line 652
    :cond_20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    .line 653
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceLooper:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 654
    return-void

    .line 646
    :catch_29
    move-exception v0

    goto :goto_1b
.end method


# virtual methods
.method public apply(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 7
    .param p1, "actions"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 581
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "apply"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 582
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    if-eqz v2, :cond_36

    .line 584
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->index:I

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    iget v4, v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    invoke-direct {p0, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchProgress(II)V

    .line 586
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 587
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->toBundle(Landroid/os/Bundle;)V

    .line 589
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    const/16 v3, 0x3e9

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 590
    .local v1, "message":Landroid/os/Message;
    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 591
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 593
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->sendMessage(Landroid/os/Message;)Z

    .line 595
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "message":Landroid/os/Message;
    :cond_36
    return-void
.end method

.method public apply(Ljava/lang/String;)V
    .registers 7
    .param p1, "actions"    # Ljava/lang/String;

    .prologue
    .line 598
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "apply(s)"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 599
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    if-eqz v2, :cond_36

    .line 601
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->index:I

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    iget v4, v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    invoke-direct {p0, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchProgress(II)V

    .line 603
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 604
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->toBundle(Landroid/os/Bundle;)V

    .line 606
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    const/16 v3, 0x3e9

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 607
    .local v1, "message":Landroid/os/Message;
    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 608
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 610
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->sendMessage(Landroid/os/Message;)Z

    .line 612
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "message":Landroid/os/Message;
    :cond_36
    return-void
.end method

.method public dispose()V
    .registers 3

    .prologue
    .line 448
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "dispose"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 449
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->stop()V

    .line 450
    return-void
.end method

.method public getHiresEnabled()Z
    .registers 2

    .prologue
    .line 663
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    if-eqz v0, :cond_b

    .line 664
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->getHiresEnabled()Z

    move-result v0

    .line 666
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 493
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->running:Z

    return v0
.end method

.method public load(Landroid/net/Uri;ILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "maxSize"    # I
    .param p3, "imageInfo"    # Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .prologue
    .line 547
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "load: %s, maxSize: %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 548
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->internalLoad(Landroid/net/Uri;ILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V

    .line 549
    return-void
.end method

.method protected removeAllMessages()V
    .registers 3

    .prologue
    .line 508
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    if-eqz v0, :cond_19

    .line 509
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->removeMessages(I)V

    .line 510
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    const/16 v1, 0x3eb

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->removeMessages(I)V

    .line 511
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    const/16 v1, 0x3e9

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->removeMessages(I)V

    .line 513
    :cond_19
    return-void
.end method

.method public revert(Landroid/net/Uri;II)V
    .registers 11
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "maxSize"    # I
    .param p3, "orientation"    # I

    .prologue
    .line 552
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "revert: %s, maxSize: %d, orientation: %d"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 553
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    if-eqz v2, :cond_60

    .line 554
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->removeAllMessages()V

    .line 556
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->reset()V

    .line 557
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->index:I

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    iget v4, v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    invoke-direct {p0, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchProgress(II)V

    .line 560
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp30:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v2

    invoke-static {p2, v2}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 562
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 563
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->toBundle(Landroid/os/Bundle;)V

    .line 565
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    const/16 v3, 0x3eb

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 566
    .local v1, "message":Landroid/os/Message;
    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 567
    iput p2, v1, Landroid/os/Message;->arg1:I

    .line 568
    iput p3, v1, Landroid/os/Message;->arg2:I

    .line 569
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 571
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->sendMessage(Landroid/os/Message;)Z

    .line 573
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "message":Landroid/os/Message;
    :cond_60
    return-void
.end method

.method public save(Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)V
    .registers 9
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "format"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p3, "quality"    # I

    .prologue
    .line 620
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "save"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 621
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    if-eqz v2, :cond_3e

    .line 623
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->index:I

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    iget v4, v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    invoke-direct {p0, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchProgress(II)V

    .line 625
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 626
    .local v0, "bundle":Landroid/os/Bundle;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->toBundle(Landroid/os/Bundle;)V

    .line 628
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    const/16 v3, 0x3ea

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 629
    .local v1, "message":Landroid/os/Message;
    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 630
    invoke-virtual {p2}, Landroid/graphics/Bitmap$CompressFormat;->ordinal()I

    move-result v2

    iput v2, v1, Landroid/os/Message;->arg1:I

    .line 631
    iput p3, v1, Landroid/os/Message;->arg2:I

    .line 632
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 634
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->sendMessage(Landroid/os/Message;)Z

    .line 636
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v1    # "message":Landroid/os/Message;
    :cond_3e
    return-void
.end method

.method public setOnHiresListener(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    .prologue
    .line 457
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mListener:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;

    .line 458
    return-void
.end method

.method public start()V
    .registers 3

    .prologue
    .line 484
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "start"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 485
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->running:Z

    if-nez v0, :cond_1f

    .line 486
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->thread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceLooper:Landroid/os/Looper;

    .line 487
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceLooper:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;-><init>(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    .line 488
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->running:Z

    .line 490
    :cond_1f
    return-void
.end method

.method public stop()V
    .registers 3

    .prologue
    .line 497
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "stop"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 498
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->removeAllMessages()V

    .line 499
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    if-eqz v0, :cond_15

    .line 500
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mServiceHandler:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;

    const/16 v1, 0x7cf

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->sendEmptyMessage(I)Z

    .line 502
    :cond_15
    return-void
.end method
