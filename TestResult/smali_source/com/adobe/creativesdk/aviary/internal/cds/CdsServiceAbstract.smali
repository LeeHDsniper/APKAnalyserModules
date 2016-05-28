.class abstract Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;
.source "CdsServiceAbstract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private static mLastUpdateDateTime:J

.field private static mRetryCount:I


# instance fields
.field private mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

.field private mThreadPoolExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 45
    const-string v0, "CdsService"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 56
    const/4 v0, 0x1

    sput v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mRetryCount:I

    .line 60
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mLastUpdateDateTime:J

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;-><init>(Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method private addAlarm(Landroid/content/Context;JLandroid/content/Intent;)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "time"    # J
    .param p4, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x0

    .line 601
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 602
    .local v1, "cal":Ljava/util/Calendar;
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, p2, p3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 603
    const/high16 v3, 0x8000000

    invoke-static {p1, v6, p4, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 604
    .local v2, "sender":Landroid/app/PendingIntent;
    const-string v3, "alarm"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 605
    .local v0, "am":Landroid/app/AlarmManager;
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v0, v6, v4, v5, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 606
    return-void
.end method

.method private consumeManifestPacks(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Ljava/util/HashSet;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)Z
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p4, "operations"    # Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/Operations;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .local p3, "notificationList":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v2, 0x1

    .line 429
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "consumeManifestPacks"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 431
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;

    invoke-direct {v3, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mThreadPoolExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 433
    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->withThreadPool(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    .line 434
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->withWifiOnly(Z)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;

    move-result-object v3

    .line 435
    invoke-virtual {v3, p4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->withOperations(Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;

    move-result-object v3

    .line 436
    invoke-virtual {v3, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;

    move-result-object v0

    .line 438
    .local v0, "builder":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    move-result-object v1

    .line 439
    .local v1, "consumer":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->consume()V

    .line 441
    if-eqz p3, :cond_35

    .line 442
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->getAddedOrUpdatedPackTypes()Ljava/util/HashSet;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 445
    :cond_35
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->getExceptions()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v3, v2, :cond_40

    :goto_3f
    return v2

    :cond_40
    const/4 v2, 0x0

    goto :goto_3f
.end method

.method private consumeManifestPacksToBeRemoved(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Ljava/util/HashSet;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)Z
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p4, "operations"    # Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/Operations;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .local p3, "notificationList":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v1, 0x1

    .line 453
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "consumeManifestPacksToBeRemoved"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 454
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;

    invoke-direct {v2, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;-><init>(Landroid/content/Context;)V

    .line 455
    invoke-virtual {v2, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;

    move-result-object v2

    .line 456
    invoke-virtual {v2, p4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->withOperations(Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;

    move-result-object v2

    .line 457
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;

    move-result-object v0

    .line 459
    .local v0, "consumer":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->consume()V

    .line 461
    if-eqz p3, :cond_25

    .line 462
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->getRemovedPacksType()Ljava/util/HashSet;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 465
    :cond_25
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;->getExceptions()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v2, v1, :cond_30

    :goto_2f
    return v1

    :cond_30
    const/4 v1, 0x0

    goto :goto_2f
.end method

.method private consumeManifestPermissions(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/cds/util/KillException;
        }
    .end annotation

    .prologue
    .line 409
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "consumeManifestPermissions"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 410
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;

    invoke-direct {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)V

    .line 411
    .local v0, "consumer":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPermissionConsumer;->consume()V

    .line 412
    return-void
.end method

.method private consumeMessagesToBeRemoved(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Z
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    .line 491
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "consumeMessagesToBeRemoved"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 492
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;

    invoke-direct {v1, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;-><init>(Landroid/content/Context;)V

    .line 493
    invoke-virtual {v1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;->withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;

    move-result-object v1

    .line 494
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;->build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;

    move-result-object v0

    .line 496
    .local v0, "consumer":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;->consume()V

    .line 497
    const/4 v1, 0x1

    return v1
.end method

.method private consumeNewMessages(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Z
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 470
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "consumeNewMessages"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 471
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;

    invoke-direct {v2, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;-><init>(Landroid/content/Context;)V

    .line 472
    invoke-virtual {v2, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mThreadPoolExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 473
    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->withThreadPool(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    .line 474
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->withWifiOnly(Z)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;

    move-result-object v2

    .line 475
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    move-result-object v0

    .line 477
    .local v0, "consumer":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->consume()V

    .line 479
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->getExceptions()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v2, v1, :cond_33

    :goto_32
    return v1

    :cond_33
    const/4 v1, 0x0

    goto :goto_32
.end method

.method private downloadAndProcessManifest(J)V
    .registers 16
    .param p1, "now"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 347
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "downloadAndProcessManifest"

    invoke-interface {v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 348
    sget-wide v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mLastUpdateDateTime:J

    sub-long v8, p1, v8

    const-wide/16 v10, 0x1388

    cmp-long v8, v8, v10

    if-gez v8, :cond_1b

    .line 349
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "wait at least 5 secs before start downloading again"

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 400
    :goto_1a
    return-void

    .line 353
    :cond_1b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 356
    .local v0, "context":Landroid/content/Context;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 359
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->downloadManifest(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    move-result-object v3

    .line 362
    .local v3, "manifestParser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    invoke-direct {p0, v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->consumeManifestPermissions(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)V

    .line 364
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 365
    .local v5, "packTypeNotifications":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    new-instance v4, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    invoke-direct {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;-><init>()V

    .line 370
    .local v4, "operations":Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    invoke-direct {p0, v0, v3, v5, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->consumeManifestPacks(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Ljava/util/HashSet;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)Z

    move-result v8

    if-nez v8, :cond_56

    move v1, v6

    .line 373
    .local v1, "hasException":Z
    :goto_3a
    invoke-direct {p0, v0, v3, v5, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->consumeManifestPacksToBeRemoved(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Ljava/util/HashSet;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)Z

    move-result v8

    if-nez v8, :cond_58

    move v8, v6

    :goto_41
    or-int/2addr v1, v8

    .line 376
    invoke-virtual {v5}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_46
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5a

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 377
    .local v2, "key":Ljava/lang/String;
    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyPackTypeContentUpdated(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_46

    .end local v1    # "hasException":Z
    .end local v2    # "key":Ljava/lang/String;
    :cond_56
    move v1, v7

    .line 370
    goto :goto_3a

    .restart local v1    # "hasException":Z
    :cond_58
    move v8, v7

    .line 373
    goto :goto_41

    .line 381
    :cond_5a
    invoke-direct {p0, v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->consumeNewMessages(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Z

    move-result v8

    if-nez v8, :cond_7b

    move v8, v6

    :goto_61
    or-int/2addr v1, v8

    .line 384
    invoke-direct {p0, v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->consumeMessagesToBeRemoved(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Z

    move-result v8

    if-nez v8, :cond_7d

    :goto_68
    or-int/2addr v1, v6

    .line 386
    if-nez v1, :cond_7f

    .line 388
    invoke-direct {p0, v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->updateVersionKey(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Z

    .line 390
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sput-wide v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mLastUpdateDateTime:J

    .line 396
    :goto_74
    invoke-direct {p0, v0, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->restorePacksIcons(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Z

    .line 399
    invoke-static {v0, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyCdsServiceFinished(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)V

    goto :goto_1a

    :cond_7b
    move v8, v7

    .line 381
    goto :goto_61

    :cond_7d
    move v6, v7

    .line 384
    goto :goto_68

    .line 392
    :cond_7f
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "An error occurred, don\'t update the version key"

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_74
.end method

.method private downloadManifest(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 334
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "downloadManifest"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 335
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;-><init>()V

    .line 336
    .local v0, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getLatestManifestVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 337
    .local v1, "manifestVersion":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;->download(Landroid/content/Context;Ljava/lang/String;Z)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    move-result-object v2

    return-object v2
.end method

.method private handleCdsDownload(Landroid/content/Intent;)V
    .registers 12
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 200
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "handleCdsDownload"

    invoke-interface {v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 202
    const/4 v3, 0x0

    .line 203
    .local v3, "shouldRetry":Z
    const/4 v1, 0x0

    .line 207
    .local v1, "hadException":Z
    :try_start_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-direct {p0, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->downloadAndProcessManifest(J)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_12} :catch_30
    .catch Lcom/adobe/creativesdk/aviary/internal/cds/util/KillException; {:try_start_b .. :try_end_12} :catch_5b
    .catch Ljava/lang/AssertionError; {:try_start_b .. :try_end_12} :catch_64
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_12} :catch_75

    .line 234
    :goto_12
    if-eqz v1, :cond_25

    .line 235
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getPreferences(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v2

    .line 236
    .local v2, "preferences":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    const-wide/16 v6, 0x0

    invoke-virtual {v2, v6, v7}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->setCdsLastExecutionTime(J)V

    .line 239
    .end local v2    # "preferences":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    :cond_25
    if-eqz v3, :cond_2f

    .line 240
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->clearServiceQueue()V

    .line 241
    const-wide/16 v6, 0x3a98

    invoke-direct {p0, p1, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->retrySameIntent(Landroid/content/Intent;J)V

    .line 243
    :cond_2f
    return-void

    .line 208
    :catch_30
    move-exception v0

    .line 209
    .local v0, "e":Ljava/io/IOException;
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "exception handled"

    invoke-interface {v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 210
    const-string v7, "403:Forbidden"

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4f

    .line 212
    const/16 v5, 0x193

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->sendDeveloperError(I)V

    .line 213
    const/4 v3, 0x0

    .line 217
    :goto_4a
    const/4 v1, 0x1

    .line 218
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_12

    .line 215
    :cond_4f
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->isLazy:Z
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v7

    if-nez v7, :cond_59

    move v3, v5

    :goto_58
    goto :goto_4a

    :cond_59
    move v3, v6

    goto :goto_58

    .line 219
    .end local v0    # "e":Ljava/io/IOException;
    :catch_5b
    move-exception v0

    .line 220
    .local v0, "e":Lcom/adobe/creativesdk/aviary/internal/cds/util/KillException;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/KillException;->printStackTrace()V

    .line 221
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->sendKillSignal()V

    .line 222
    const/4 v1, 0x1

    .line 231
    goto :goto_12

    .line 223
    .end local v0    # "e":Lcom/adobe/creativesdk/aviary/internal/cds/util/KillException;
    :catch_64
    move-exception v0

    .line 224
    .local v0, "e":Ljava/lang/AssertionError;
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->isLazy:Z
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v7

    if-nez v7, :cond_73

    move v3, v5

    .line 225
    :goto_6e
    invoke-virtual {v0}, Ljava/lang/AssertionError;->printStackTrace()V

    .line 226
    const/4 v1, 0x1

    .line 231
    goto :goto_12

    :cond_73
    move v3, v6

    .line 224
    goto :goto_6e

    .line 227
    .end local v0    # "e":Ljava/lang/AssertionError;
    :catch_75
    move-exception v4

    .line 228
    .local v4, "throwable":Ljava/lang/Throwable;
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "exception not handled"

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 229
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 230
    const/4 v1, 0x1

    goto :goto_12
.end method

.method private handleCdsDownloadExtraAssets()V
    .registers 5

    .prologue
    .line 246
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "handleCdsDownloadExtraAssets"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 248
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->downloadExtraAssets:Z
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 249
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_28

    :cond_1d
    const/4 v0, 0x1

    .line 251
    .local v0, "isConnected":Z
    :goto_1e
    if-nez v0, :cond_2a

    .line 252
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "Skipping extra assets download b/c there\'s no wifi mConnection"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 264
    .end local v0    # "isConnected":Z
    :cond_27
    :goto_27
    return-void

    .line 249
    :cond_28
    const/4 v0, 0x0

    goto :goto_1e

    .line 256
    .restart local v0    # "isConnected":Z
    :cond_2a
    const-string v2, "aviary.intent.action.CDS_DOWNLOAD_EXTRA_ASSETS"

    const-class v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsAssetsDownloaderService;

    .line 257
    invoke-static {p0, v2, v3}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->createCommonIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v1

    .line 260
    .local v1, "newIntent":Landroid/content/Intent;
    const-string v2, "extra-execute-wifi-only"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 261
    const-string v2, "extra-max-items"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->downloadExtraAssetsCount:I
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$500(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 262
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_27
.end method

.method private handleRestoreOwnedPacks()V
    .registers 12

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 161
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "handleRestoreOwnedPacks"

    invoke-interface {v0, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 162
    const/4 v6, 0x0

    .line 164
    .local v6, "hasError":Z
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->packType:Ljava/lang/String;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 165
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v3, "PackType cannot be null"

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :cond_1e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    .line 171
    .local v1, "context":Landroid/content/Context;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 174
    :try_start_25
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->downloadManifest(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    move-result-object v2

    .line 175
    .local v2, "manifestParser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v0, 0x1

    new-array v5, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->packType:Ljava/lang/String;
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v5, v0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->restoreOwnedPacks(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;ZLjava/util/List;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_60

    move v6, v8

    .line 176
    :goto_48
    invoke-direct {p0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->restorePacksIcons(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Z
    :try_end_4b
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_4b} :catch_64

    move-result v0

    if-nez v0, :cond_62

    move v0, v8

    :goto_4f
    or-int/2addr v6, v0

    .line 182
    .end local v2    # "manifestParser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    :goto_50
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->packType:Ljava/lang/String;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Ljava/lang/String;

    move-result-object v3

    if-eqz v6, :cond_6a

    :goto_5c
    invoke-static {v0, v3, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyDownloadMissingPacksCompleted(Landroid/content/Context;Ljava/lang/String;I)V

    .line 183
    return-void

    .restart local v2    # "manifestParser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    :cond_60
    move v6, v9

    .line 175
    goto :goto_48

    :cond_62
    move v0, v9

    .line 176
    goto :goto_4f

    .line 177
    .end local v2    # "manifestParser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    :catch_64
    move-exception v7

    .line 178
    .local v7, "t":Ljava/lang/Throwable;
    invoke-virtual {v7}, Ljava/lang/Throwable;->printStackTrace()V

    .line 179
    const/4 v6, 0x1

    goto :goto_50

    .end local v7    # "t":Ljava/lang/Throwable;
    :cond_6a
    move v8, v9

    .line 182
    goto :goto_5c
.end method

.method private handleRestorePurchases()V
    .registers 5

    .prologue
    .line 186
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "handleRestorePurchases"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 187
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 189
    const/4 v1, 0x0

    .line 190
    .local v1, "packType":Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->packType:Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 191
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->packType:Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->fromString(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v1

    .line 194
    :cond_21
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v2

    invoke-direct {v0, p0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;Z)V

    .line 195
    .local v0, "helper":Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->restoreAll()V

    .line 196
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/RestoreAllHelper;->dispose()V

    .line 197
    return-void
.end method

.method private removeAlarms(Landroid/content/Context;Ljava/lang/String;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "action"    # Ljava/lang/String;

    .prologue
    const/high16 v5, 0x8000000

    const/4 v4, 0x0

    .line 609
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "alarm"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 611
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsService;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 612
    .local v1, "initIntent":Landroid/content/Intent;
    invoke-virtual {v1, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 613
    invoke-static {p1, v4, v1, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 616
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;

    invoke-direct {v2, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 618
    invoke-static {p1, v4, v2, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 616
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 619
    return-void
.end method

.method private restoreMissingPacks(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Ljava/util/Iterator;Z)Ljava/util/List;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p4, "wifiOnly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .prologue
    .line 313
    .local p3, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "restoreMissingPacks"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 315
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;

    invoke-direct {v1, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mThreadPoolExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 316
    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->withThreadPool(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;

    move-result-object v1

    .line 317
    invoke-virtual {v1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;

    move-result-object v1

    .line 318
    invoke-virtual {v1, p4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->withWifiOnly(Z)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;

    move-result-object v1

    .line 319
    invoke-virtual {v1, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->withIterator(Ljava/util/Iterator;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    move-result-object v0

    .line 321
    .local v0, "consumer":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->consume()V

    .line 322
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->getExceptions()Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method private restorePacksIcons(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Z
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 509
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "restorePacksIcons"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 510
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;

    invoke-direct {v2, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;-><init>(Landroid/content/Context;)V

    .line 511
    invoke-virtual {v2, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mThreadPoolExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 512
    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->withThreadPool(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    .line 513
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->wifiOnly(Z)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;

    move-result-object v2

    .line 514
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    move-result-object v0

    .line 516
    .local v0, "consumer":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->consume()V

    .line 517
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->getExceptions()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v2, v1, :cond_33

    :goto_32
    return v1

    :cond_33
    const/4 v1, 0x0

    goto :goto_32
.end method

.method private retrySameIntent(Landroid/content/Intent;J)V
    .registers 8
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "delay"    # J

    .prologue
    .line 568
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 569
    .local v0, "restartIntent":Landroid/content/Intent;
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "retrySameIntent"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 571
    sget v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mRetryCount:I

    add-int/lit8 v2, v1, -0x1

    sput v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mRetryCount:I

    if-lez v1, :cond_21

    .line 572
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v2, p2

    invoke-direct {p0, v1, v2, v3, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->addAlarm(Landroid/content/Context;JLandroid/content/Intent;)V

    .line 576
    :goto_20
    return-void

    .line 574
    :cond_21
    const/4 v1, 0x1

    sput v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mRetryCount:I

    goto :goto_20
.end method

.method private sendKillSignal()V
    .registers 4

    .prologue
    .line 555
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "sendKillSignal"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 556
    new-instance v0, Landroid/content/Intent;

    const-string v1, "aviary.intent.action.KILL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 557
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 558
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 559
    return-void
.end method

.method private updateVersionKey(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Z
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 528
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 531
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->hasContent()Z

    move-result v4

    if-eqz v4, :cond_70

    .line 533
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getVersionKey()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_73

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getVersionKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_73

    .line 534
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_73

    .line 535
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_73

    .line 537
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "** adding the new versionKey: %s"

    new-array v6, v2, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getVersionKey()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 539
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 540
    .local v1, "values":Landroid/content/ContentValues;
    const-string v4, "version_versionKey"

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getVersionKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 541
    const-string v4, "version_assetsBaseURL"

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 542
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    .line 543
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "manifestVersion/insert"

    invoke-static {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    .line 544
    .local v0, "result":Landroid/net/Uri;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "updated manifest version: %s"

    new-array v6, v2, [Ljava/lang/Object;

    aput-object v0, v6, v3

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 545
    if-eqz v0, :cond_71

    .line 551
    .end local v0    # "result":Landroid/net/Uri;
    .end local v1    # "values":Landroid/content/ContentValues;
    :cond_70
    :goto_70
    return v2

    .restart local v0    # "result":Landroid/net/Uri;
    .restart local v1    # "values":Landroid/content/ContentValues;
    :cond_71
    move v2, v3

    .line 545
    goto :goto_70

    .line 547
    .end local v0    # "result":Landroid/net/Uri;
    .end local v1    # "values":Landroid/content/ContentValues;
    :cond_73
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "versionKey or assetsBaseUrl is null"

    invoke-interface {v2, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    move v2, v3

    .line 548
    goto :goto_70
.end method


# virtual methods
.method getLatestManifestVersion(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 585
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getManifestVersion(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;

    move-result-object v0

    .line 586
    .local v0, "version":Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->getVersionKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 587
    :cond_10
    const/4 v1, 0x0

    .line 589
    :goto_11
    return-object v1

    :cond_12
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->getVersionKey()Ljava/lang/String;

    move-result-object v1

    goto :goto_11
.end method

.method public getThreadPool()Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mThreadPoolExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    return-object v0
.end method

.method public onCreate()V
    .registers 4

    .prologue
    .line 70
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageIntentService;->onCreate()V

    .line 71
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    const/4 v1, 0x5

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;-><init>(II)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mThreadPoolExecutor:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 72
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .registers 16
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v10, 0x1

    const/4 v8, 0x0

    .line 80
    if-nez p1, :cond_c

    .line 81
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "intent cannot be null"

    invoke-interface {v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 155
    :goto_b
    return-void

    .line 85
    :cond_c
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "action":Ljava/lang/String;
    new-instance v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    invoke-direct {v9, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;Landroid/content/Intent;)V

    iput-object v9, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    .line 89
    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v11, "action: %s"

    new-array v12, v10, [Ljava/lang/Object;

    aput-object v0, v12, v8

    invoke-interface {v9, v11, v12}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 90
    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v11, "extras: %s"

    new-array v12, v10, [Ljava/lang/Object;

    iget-object v13, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v12, v8

    invoke-interface {v9, v11, v12}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 92
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->wifiOnly:Z
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v9

    if-eqz v9, :cond_4d

    .line 94
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v9

    if-nez v9, :cond_56

    .line 95
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "Not Connected. Stopping.."

    invoke-interface {v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_b

    .line 99
    :cond_4d
    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v11, "Skipping phone mConnection check"

    new-array v12, v8, [Ljava/lang/Object;

    invoke-interface {v9, v11, v12}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 102
    :cond_56
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->pluggedOnly:Z
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v9

    if-eqz v9, :cond_70

    .line 104
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/BatteryUtils;->isCharging(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v9

    if-nez v9, :cond_79

    .line 105
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "Phone not Charging. Stopping.."

    invoke-interface {v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_b

    .line 109
    :cond_70
    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v11, "Skiping phone charging check"

    new-array v12, v8, [Ljava/lang/Object;

    invoke-interface {v9, v11, v12}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 112
    :cond_79
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->mIntentExtra:Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->isLazy:Z
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;->access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract$IntentExtra;)Z

    move-result v9

    if-eqz v9, :cond_b0

    .line 113
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v9

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v9, v11}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getPreferences(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v1

    .line 114
    .local v1, "preferences":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 115
    .local v2, "ctime":J
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getCdsLastExecutionTime()J

    move-result-wide v4

    .line 117
    .local v4, "ptime":J
    sub-long v12, v2, v4

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    .line 123
    .local v6, "timeDiff":J
    const-wide/32 v12, 0x1b77400

    cmp-long v9, v6, v12

    if-gez v9, :cond_ad

    .line 124
    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v10, "Service already started. Stopping.."

    new-array v8, v8, [Ljava/lang/Object;

    invoke-interface {v9, v10, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_b

    .line 127
    :cond_ad
    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->setCdsLastExecutionTime(J)V

    .line 131
    .end local v1    # "preferences":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .end local v2    # "ctime":J
    .end local v4    # "ptime":J
    .end local v6    # "timeDiff":J
    :cond_b0
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getBaseContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {p0, v9, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->removeAlarms(Landroid/content/Context;Ljava/lang/String;)V

    .line 133
    const/4 v9, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v11

    sparse-switch v11, :sswitch_data_f4

    :cond_bf
    move v8, v9

    :goto_c0
    packed-switch v8, :pswitch_data_102

    goto/16 :goto_b

    .line 136
    :pswitch_c5
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->handleCdsDownload(Landroid/content/Intent;)V

    .line 137
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->handleCdsDownloadExtraAssets()V

    goto/16 :goto_b

    .line 133
    :sswitch_cd
    const-string v10, "aviary.intent.action.CDS_DOWNLOAD_START"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_bf

    goto :goto_c0

    :sswitch_d6
    const-string v8, "aviary.intent.action.CDS_RESTORE_USER_ITEMS"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_bf

    move v8, v10

    goto :goto_c0

    :sswitch_e0
    const-string v8, "aviary.intent.action.CDS_RESTORE_OWNED_PACKS"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_bf

    const/4 v8, 0x2

    goto :goto_c0

    .line 142
    :pswitch_ea
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->handleRestorePurchases()V

    goto/16 :goto_b

    .line 148
    :pswitch_ef
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->handleRestoreOwnedPacks()V

    goto/16 :goto_b

    .line 133
    :sswitch_data_f4
    .sparse-switch
        0x3aea2718 -> :sswitch_cd
        0x47028f6a -> :sswitch_d6
        0x6e1999a2 -> :sswitch_e0
    .end sparse-switch

    :pswitch_data_102
    .packed-switch 0x0
        :pswitch_c5
        :pswitch_ea
        :pswitch_ef
    .end packed-switch
.end method

.method varargs restoreOwnedPacks(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;ZLjava/util/List;[Ljava/lang/String;)Ljava/util/List;
    .registers 19
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p3, "wifiOnly"    # Z
    .param p5, "packType"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;",
            "Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .prologue
    .line 273
    .local p4, "out":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v10, "restoreOwnedPacks"

    invoke-interface {v9, v10}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 275
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 277
    .local v6, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 278
    .local v5, "purchasedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$Builder;

    invoke-direct {v9, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$Builder;->build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    move-result-object v7

    .line 280
    .local v7, "storeConsumer":Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->consume()Ljava/util/HashSet;

    move-result-object v4

    .line 281
    .local v4, "hashSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    if-eqz v4, :cond_2a

    .line 282
    invoke-interface {v5, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 284
    if-eqz p4, :cond_2a

    .line 285
    move-object/from16 v0, p4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 288
    :cond_2a
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->getExceptions()Ljava/util/List;

    move-result-object v9

    invoke-interface {v6, v9}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 290
    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v10, "purchased list size: %s"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v5, v11, v12

    invoke-interface {v9, v10, v11}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 292
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    if-lez v9, :cond_68

    .line 294
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 296
    .local v3, "finalList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p5

    array-length v10, v0

    const/4 v9, 0x0

    :goto_4d
    if-ge v9, v10, :cond_5b

    aget-object v8, p5, v9

    .line 297
    .local v8, "type":Ljava/lang/String;
    invoke-static {v5, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->extractSkuByPackType(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 298
    .local v2, "filteredList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v3, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 296
    add-int/lit8 v9, v9, 0x1

    goto :goto_4d

    .line 301
    .end local v2    # "filteredList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "type":Ljava/lang/String;
    :cond_5b
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    move/from16 v0, p3

    invoke-direct {p0, p1, p2, v9, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->restoreMissingPacks(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Ljava/util/Iterator;Z)Ljava/util/List;

    move-result-object v1

    .line 302
    .local v1, "exceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    invoke-interface {v6, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 306
    .end local v1    # "exceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    .end local v3    # "finalList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_68
    return-object v6
.end method

.method protected abstract sendDeveloperError(I)V
.end method
