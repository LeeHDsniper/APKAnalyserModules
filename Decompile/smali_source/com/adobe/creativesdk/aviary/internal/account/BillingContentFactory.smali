.class public Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;,
        Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private final cdsUpdatedSubject:Lrx/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/PublishSubject",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

.field private final mApiKey:Ljava/lang/String;

.field private final mCacheMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;"
        }
    .end annotation
.end field

.field private final mCompositeSubscription:Lrx/subscriptions/CompositeSubscription;

.field private mContext:Landroid/content/Context;

.field private final mDownloadCacheMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mFixedExecutor:Ljava/util/concurrent/ExecutorService;

.field private final mGoogleManager:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

.field private final mSingleExecutor:Ljava/util/concurrent/ExecutorService;

.field public final packDownloadStatusSubject:Lrx/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/PublishSubject",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field public final packInstalledSubject:Lrx/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/PublishSubject",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field public final packPurchasedStatusSubject:Lrx/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/PublishSubject",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private final receiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

.field private final tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

.field private final userLoginSubject:Lrx/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/PublishSubject",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 89
    const-string v0, "BillingFactory"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    invoke-static {}, Lrx/subjects/PublishSubject;->create()Lrx/subjects/PublishSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->packInstalledSubject:Lrx/subjects/PublishSubject;

    .line 85
    invoke-static {}, Lrx/subjects/PublishSubject;->create()Lrx/subjects/PublishSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->packDownloadStatusSubject:Lrx/subjects/PublishSubject;

    .line 86
    invoke-static {}, Lrx/subjects/PublishSubject;->create()Lrx/subjects/PublishSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->packPurchasedStatusSubject:Lrx/subjects/PublishSubject;

    .line 87
    invoke-static {}, Lrx/subjects/PublishSubject;->create()Lrx/subjects/PublishSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->userLoginSubject:Lrx/subjects/PublishSubject;

    .line 88
    invoke-static {}, Lrx/subjects/PublishSubject;->create()Lrx/subjects/PublishSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->cdsUpdatedSubject:Lrx/subjects/PublishSubject;

    .line 99
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mContext:Landroid/content/Context;

    .line 100
    const/4 v0, 0x5

    new-instance v1, Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;-><init>(I)V

    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mFixedExecutor:Ljava/util/concurrent/ExecutorService;

    .line 101
    new-instance v0, Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;

    invoke-direct {v0, v2}, Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;-><init>(I)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    .line 102
    new-instance v0, Lrx/subscriptions/CompositeSubscription;

    invoke-direct {v0}, Lrx/subscriptions/CompositeSubscription;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCompositeSubscription:Lrx/subscriptions/CompositeSubscription;

    .line 103
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .line 104
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mGoogleManager:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    .line 106
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory;->getReceiptManager(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->receiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    .line 107
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mApiKey:Ljava/lang/String;

    .line 108
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;

    .line 109
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mDownloadCacheMap:Ljava/util/Map;

    .line 111
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->initialize()V

    .line 112
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryGooglePurchaseMap(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryAdobePurchaseMap(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mDownloadCacheMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Landroid/content/Intent;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->onBroadcastReceived(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/concurrent/ExecutorService;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    .prologue
    .line 75
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->filterPurchaseMap(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->sendReceipt(Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;J)Lrx/Observable;
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    .param p1, "x1"    # J

    .prologue
    .line 75
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->requestPackDownload(J)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;ZZLjava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->sendTracking(ZZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Ljava/lang/String;ZZLjava/lang/String;)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->sendReceipt(Ljava/lang/String;ZZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$900(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lrx/Subscriber;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    .param p1, "x1"    # Lrx/Subscriber;
    .param p2, "x2"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .prologue
    .line 75
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->doVerifyPackOptionItem(Lrx/Subscriber;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)V

    return-void
.end method

.method public static create(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 968
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private doVerifyPackOptionItem(Lrx/Subscriber;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)V
    .registers 11
    .param p2, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;>;"
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 460
    iget-object v6, p2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->DOWNLOAD_ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-ne v6, v7, :cond_25

    move v0, v4

    .line 461
    .local v0, "isError":Z
    :goto_9
    iget-object v6, p2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-ne v6, v7, :cond_27

    move v1, v4

    .line 462
    .local v1, "isFree":Z
    :goto_10
    iget-object v6, p2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE_WITH_LOGIN:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-ne v6, v7, :cond_29

    move v2, v4

    .line 463
    .local v2, "isFreeWithLogin":Z
    :goto_17
    iget-object v6, p2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->RESTORE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-ne v6, v7, :cond_2b

    move v3, v4

    .line 465
    .local v3, "isRestore":Z
    :goto_1e
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 481
    :goto_24
    return-void

    .end local v0    # "isError":Z
    .end local v1    # "isFree":Z
    .end local v2    # "isFreeWithLogin":Z
    .end local v3    # "isRestore":Z
    :cond_25
    move v0, v5

    .line 460
    goto :goto_9

    .restart local v0    # "isError":Z
    :cond_27
    move v1, v5

    .line 461
    goto :goto_10

    .restart local v1    # "isFree":Z
    :cond_29
    move v2, v5

    .line 462
    goto :goto_17

    .restart local v2    # "isFreeWithLogin":Z
    :cond_2b
    move v3, v5

    .line 463
    goto :goto_1e

    .line 469
    .restart local v3    # "isRestore":Z
    :cond_2d
    if-nez v3, :cond_33

    if-nez v1, :cond_33

    if-eqz v0, :cond_3a

    .line 470
    :cond_33
    invoke-virtual {p1, p2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 480
    :goto_36
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    goto :goto_24

    .line 471
    :cond_3a
    if-eqz v2, :cond_51

    .line 472
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->isAuthenticated()Z

    move-result v4

    if-eqz v4, :cond_46

    .line 473
    invoke-virtual {p1, p2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_36

    .line 475
    :cond_46
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "User not logged"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v4}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_36

    .line 478
    :cond_51
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Option not valid"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v4}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_36
.end method

.method private filterPurchaseMap(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
    .registers 3
    .param p1, "map"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 658
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method private handleCdsServiceFinished(Landroid/content/Intent;)V
    .registers 8
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 847
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "handleCdsServiceFinished: %s"

    new-array v3, v5, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 848
    const-string v1, "operations"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    .line 849
    .local v0, "operations":Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "operations: %s"

    new-array v3, v5, [Ljava/lang/Object;

    aput-object v0, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 851
    if-eqz v0, :cond_3b

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->totalCount()I

    move-result v1

    const/4 v2, -0x1

    if-le v1, v2, :cond_3b

    .line 852
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->cdsUpdatedSubject:Lrx/subjects/PublishSubject;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->totalCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 853
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->cdsUpdatedSubject:Lrx/subjects/PublishSubject;

    invoke-virtual {v1}, Lrx/subjects/PublishSubject;->onCompleted()V

    .line 855
    :cond_3b
    return-void
.end method

.method private handleDownloadStatusChanged(Landroid/content/Intent;)V
    .registers 12
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const-wide/16 v8, -0x1

    const/4 v7, 0x0

    .line 833
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "handleDownloadStatusChanged: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/BundleUtils;->toString(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 834
    const-string v3, "packId"

    invoke-virtual {p1, v3, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 835
    .local v0, "packId":J
    const-string v3, "status"

    invoke-virtual {p1, v3, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 838
    .local v2, "status":I
    cmp-long v3, v0, v8

    if-lez v3, :cond_3a

    .line 839
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mDownloadCacheMap:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 840
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->packDownloadStatusSubject:Lrx/subjects/PublishSubject;

    invoke-virtual {v3, p1}, Lrx/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 844
    :goto_39
    return-void

    .line 842
    :cond_3a
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "Invalid packId"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_39
.end method

.method private handlePackInstalled(Landroid/content/Intent;)V
    .registers 12
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const-wide/16 v8, -0x1

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 813
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "handlePackInstalled: %s"

    new-array v6, v0, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v7

    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/BundleUtils;->toString(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 815
    const-string v4, "packId"

    invoke-virtual {p1, v4, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 816
    .local v2, "packId":J
    const-string v4, "purchased"

    invoke-virtual {p1, v4, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v0, :cond_4a

    .line 819
    .local v0, "installed":Z
    :goto_25
    cmp-long v1, v2, v8

    if-lez v1, :cond_56

    .line 820
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mDownloadCacheMap:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 821
    if-eqz v0, :cond_4c

    .line 822
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    new-instance v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->OWNED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-direct {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)V

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    :goto_44
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->packInstalledSubject:Lrx/subjects/PublishSubject;

    invoke-virtual {v1, p1}, Lrx/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 830
    :goto_49
    return-void

    .end local v0    # "installed":Z
    :cond_4a
    move v0, v1

    .line 816
    goto :goto_25

    .line 824
    .restart local v0    # "installed":Z
    :cond_4c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_44

    .line 828
    :cond_56
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "invalid packId"

    invoke-interface {v1, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_49
.end method

.method private handlePackPurchased(Landroid/content/Intent;)V
    .registers 12
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const-wide/16 v8, -0x1

    .line 798
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "handlePackPurchased: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/BundleUtils;->toString(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 802
    const-string v2, "packId"

    invoke-virtual {p1, v2, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 804
    .local v0, "packId":J
    cmp-long v2, v0, v8

    if-lez v2, :cond_37

    .line 805
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    new-instance v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->RESTORE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-direct {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)V

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 806
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->packPurchasedStatusSubject:Lrx/subjects/PublishSubject;

    invoke-virtual {v2, p1}, Lrx/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 810
    :goto_36
    return-void

    .line 808
    :cond_37
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "Invalid packId"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_36
.end method

.method private handleUserLogin(Landroid/content/Intent;)V
    .registers 11
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 771
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "handleUserLogin: %s"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/BundleUtils;->toString(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 773
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;->SIGNIN:Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    invoke-direct {v1, v3, p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;Landroid/content/Intent;)V

    .line 775
    .local v1, "status":Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->isSuccess()Z

    move-result v3

    if-eqz v3, :cond_59

    .line 776
    const-string v3, "from"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 777
    .local v0, "from":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_48

    .line 778
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v4, "adobeid: succeeded"

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 782
    :goto_35
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v2

    .line 783
    .local v2, "userProfile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->receiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;->sendContent(Ljava/lang/String;)V

    .line 788
    .end local v0    # "from":Ljava/lang/String;
    .end local v2    # "userProfile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    :goto_42
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->userLoginSubject:Lrx/subjects/PublishSubject;

    invoke-virtual {v3, v1}, Lrx/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 789
    return-void

    .line 780
    .restart local v0    # "from":Ljava/lang/String;
    :cond_48
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v4, "adobeid: succeeded"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const-string v6, "from"

    aput-object v6, v5, v7

    aput-object v0, v5, v8

    invoke-virtual {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_35

    .line 785
    .end local v0    # "from":Ljava/lang/String;
    :cond_59
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v4, "adobeid: failed"

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    goto :goto_42
.end method

.method private handleUserLogout(Landroid/content/Intent;)V
    .registers 8
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 792
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "handleUserLogout: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/utils/BundleUtils;->toString(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 793
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;->LOGOUT:Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;

    invoke-direct {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus$Type;Landroid/content/Intent;)V

    .line 794
    .local v0, "status":Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->userLoginSubject:Lrx/subjects/PublishSubject;

    invoke-virtual {v1, v0}, Lrx/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    .line 795
    return-void
.end method

.method private initialize()V
    .registers 8

    .prologue
    .line 909
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 910
    .local v1, "packagename":Ljava/lang/String;
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 911
    .local v0, "filter":Landroid/content/IntentFilter;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".cds.serviceFinished"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 913
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".cds.downloadMissingPacksCompleted"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 914
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".cds.downloadStatusChanged"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 915
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".cds.packInstalled"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 916
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".cds.packPurchased"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 917
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".adobeId.user.signin"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 918
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".adobeId.user.logout"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 920
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$19;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$19;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 929
    .local v2, "subscriber":Lrx/functions/Action1;, "Lrx/functions/Action1<-Landroid/content/Intent;>;"
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v0}, Lrx/android/content/ContentObservable;->fromBroadcast(Landroid/content/Context;Landroid/content/IntentFilter;)Lrx/Observable;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    .line 930
    invoke-static {v6}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v6

    invoke-virtual {v5, v6}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mFixedExecutor:Ljava/util/concurrent/ExecutorService;

    .line 931
    invoke-static {v6}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v6

    invoke-virtual {v5, v6}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v5

    .line 932
    invoke-virtual {v5, v2}, Lrx/Observable;->subscribe(Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v3

    .line 934
    .local v3, "subscription1":Lrx/Subscription;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->userLoginSubject:Lrx/subjects/PublishSubject;

    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$20;

    invoke-direct {v6, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$20;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 935
    invoke-virtual {v5, v6}, Lrx/subjects/PublishSubject;->doOnNext(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v5

    .line 952
    invoke-virtual {v5}, Lrx/Observable;->subscribe()Lrx/Subscription;

    move-result-object v4

    .line 954
    .local v4, "subscription2":Lrx/Subscription;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCompositeSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v5, v3}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 955
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCompositeSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v5, v4}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 956
    return-void
.end method

.method private onBroadcastReceived(Landroid/content/Intent;)V
    .registers 9
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 745
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 746
    .local v0, "action":Ljava/lang/String;
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "onBroadcastReceived{%s}"

    new-array v4, v6, [Ljava/lang/Object;

    aput-object v0, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 748
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getContext()Landroid/content/Context;

    move-result-object v2

    if-nez v2, :cond_18

    .line 768
    :goto_17
    return-void

    .line 752
    :cond_18
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 753
    .local v1, "packagename":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".cds.packInstalled"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 754
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->handlePackInstalled(Landroid/content/Intent;)V

    goto :goto_17

    .line 755
    :cond_3d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".cds.downloadStatusChanged"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5a

    .line 756
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->handleDownloadStatusChanged(Landroid/content/Intent;)V

    goto :goto_17

    .line 757
    :cond_5a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".cds.serviceFinished"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_77

    .line 758
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->handleCdsServiceFinished(Landroid/content/Intent;)V

    goto :goto_17

    .line 759
    :cond_77
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".cds.packPurchased"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_94

    .line 760
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->handlePackPurchased(Landroid/content/Intent;)V

    goto :goto_17

    .line 761
    :cond_94
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".adobeId.user.signin"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b2

    .line 762
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->handleUserLogin(Landroid/content/Intent;)V

    goto/16 :goto_17

    .line 763
    :cond_b2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".adobeId.user.logout"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d0

    .line 764
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->handleUserLogout(Landroid/content/Intent;)V

    goto/16 :goto_17

    .line 766
    :cond_d0
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "%s not handled"

    new-array v4, v6, [Ljava/lang/Object;

    aput-object v0, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_17
.end method

.method private queryAdobePurchaseMap(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
    .registers 7
    .param p1, "map"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 609
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "queryAdobePurchaseMap: %s {%s}"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 611
    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->adobeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_37

    .line 612
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->adobeMap:Ljava/util/Map;

    .line 613
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->querySkus(Ljava/util/ArrayList;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)V

    .line 614
    invoke-virtual {v0, v1}, Lrx/Observable;->concatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    .line 653
    :goto_36
    return-object v0

    :cond_37
    invoke-static {p1}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    goto :goto_36
.end method

.method private queryGooglePurchaseMap(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
    .registers 7
    .param p1, "map"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 555
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "queryGooglePurchaseMap: %s {%s}"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 557
    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->googleMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_37

    .line 558
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mGoogleManager:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->googleMap:Ljava/util/Map;

    .line 559
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->querySkus(Ljava/util/List;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)V

    .line 560
    invoke-virtual {v0, v1}, Lrx/Observable;->concatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    .line 604
    :goto_36
    return-object v0

    :cond_37
    invoke-static {p1}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    goto :goto_36
.end method

.method private requestPackDownload(J)Lrx/Observable;
    .registers 4
    .param p1, "packid"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 427
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$14;

    invoke-direct {v0, p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$14;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;J)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method private sendReceipt(Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "purchase"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;
    .param p2, "price"    # Ljava/lang/String;
    .param p3, "userId"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 889
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "sendReceipt{item: %s, price: %s}"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v6

    aput-object p2, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 891
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mApiKey:Ljava/lang/String;

    invoke-direct {v3, v6, v4}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;-><init>(ZLjava/lang/String;)V

    .line 892
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;->getSku()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->withProductId(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v3

    .line 893
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;->getPurchaseTime()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->withPurchaseTime(J)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v3

    .line 894
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;->getOrderId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->withOrderId(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v3

    .line 895
    invoke-virtual {v3, p3}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->withUserId(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v3

    .line 896
    invoke-virtual {v3, p2}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->withPrice(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v3

    .line 897
    invoke-virtual {v3, v7}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->isNewPurchase(Z)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v3

    .line 898
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;->getToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->withToken(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v0

    .line 901
    .local v0, "builder":Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    :try_start_43
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->build()Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;

    move-result-object v2

    .line 902
    .local v2, "receipt":Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->receiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    invoke-interface {v3, v2}, Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;->sendTicket(Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;)V
    :try_end_4c
    .catch Ljava/lang/AssertionError; {:try_start_43 .. :try_end_4c} :catch_4d

    .line 906
    .end local v2    # "receipt":Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;
    :goto_4c
    return-void

    .line 903
    :catch_4d
    move-exception v1

    .line 904
    .local v1, "e":Ljava/lang/AssertionError;
    invoke-virtual {v1}, Ljava/lang/AssertionError;->printStackTrace()V

    goto :goto_4c
.end method

.method private sendReceipt(Ljava/lang/String;ZZLjava/lang/String;)V
    .registers 15
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "free"    # Z
    .param p3, "isRestore"    # Z
    .param p4, "userId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 868
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "sendReceipt{identifier: %s, isFree: %b, isRestore: %b}"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    aput-object p1, v7, v4

    .line 871
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v7, v3

    const/4 v8, 0x2

    .line 872
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    .line 868
    invoke-interface {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 874
    new-instance v5, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mApiKey:Ljava/lang/String;

    invoke-direct {v5, p2, v6}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;-><init>(ZLjava/lang/String;)V

    .line 875
    invoke-virtual {v5, p1}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->withProductId(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v5

    if-nez p3, :cond_42

    .line 876
    :goto_28
    invoke-virtual {v5, v3}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->isNewPurchase(Z)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v3

    .line 877
    invoke-virtual {v3, p4}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->withUserId(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v3

    .line 878
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->withPurchaseTime(J)Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;

    move-result-object v0

    .line 881
    .local v0, "builder":Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    :try_start_38
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;->build()Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;

    move-result-object v2

    .line 882
    .local v2, "receipt":Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->receiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    invoke-interface {v3, v2}, Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;->sendTicket(Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;)V
    :try_end_41
    .catch Ljava/lang/AssertionError; {:try_start_38 .. :try_end_41} :catch_44

    .line 886
    .end local v2    # "receipt":Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;
    :goto_41
    return-void

    .end local v0    # "builder":Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    :cond_42
    move v3, v4

    .line 875
    goto :goto_28

    .line 883
    .restart local v0    # "builder":Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt$Builder;
    :catch_44
    move-exception v1

    .line 884
    .local v1, "e":Ljava/lang/AssertionError;
    invoke-virtual {v1}, Ljava/lang/AssertionError;->printStackTrace()V

    goto :goto_41
.end method

.method private sendTracking(ZZLjava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "isFree"    # Z
    .param p2, "isRestore"    # Z
    .param p3, "identifier"    # Ljava/lang/String;
    .param p4, "whereFrom"    # Ljava/lang/String;

    .prologue
    .line 859
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "sendTracking: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p3, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 860
    if-eqz p2, :cond_15

    .line 861
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    invoke-virtual {v0, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->trackContentRestored(Ljava/lang/String;Ljava/lang/String;)V

    .line 865
    :cond_14
    :goto_14
    return-void

    .line 862
    :cond_15
    if-eqz p1, :cond_14

    .line 863
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    invoke-virtual {v0, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->trackContentInstalled(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_14
.end method

.method private subscribeTo(Ljava/lang/Object;Lrx/subjects/Subject;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 9
    .param p1, "from"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Lrx/subjects/Subject",
            "<TT;TT;>;",
            "Lrx/functions/Action1",
            "<-TT;>;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 539
    .local p2, "subject":Lrx/subjects/Subject;, "Lrx/subjects/Subject<TT;TT;>;"
    .local p3, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-TT;>;"
    instance-of v1, p1, Landroid/support/v4/app/Fragment;

    if-eqz v1, :cond_34

    move-object v1, p1

    .line 540
    check-cast v1, Landroid/support/v4/app/Fragment;

    invoke-static {v1, p2}, Lrx/android/app/AppObservable;->bindSupportFragment(Landroid/support/v4/app/Fragment;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    .line 545
    .local v0, "observable":Lrx/Observable;, "Lrx/Observable<TT;>;"
    :goto_b
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "subscribe {%s} to {%s}"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 548
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v1

    .line 549
    invoke-static {}, Lrx/schedulers/Schedulers;->newThread()Lrx/Scheduler;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v1

    .line 550
    invoke-virtual {v1, p3}, Lrx/Observable;->doOnNext(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v1

    .line 551
    invoke-virtual {v1}, Lrx/Observable;->subscribe()Lrx/Subscription;

    move-result-object v1

    return-object v1

    .end local v0    # "observable":Lrx/Observable;, "Lrx/Observable<TT;>;"
    :cond_34
    move-object v1, p1

    .line 542
    check-cast v1, Landroid/app/Activity;

    invoke-static {v1, p2}, Lrx/android/app/AppObservable;->bindActivity(Landroid/app/Activity;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    .restart local v0    # "observable":Lrx/Observable;, "Lrx/Observable<TT;>;"
    goto :goto_b
.end method

.method private verifyPack(JLjava/lang/String;)Lrx/Observable;
    .registers 7
    .param p1, "packId"    # J
    .param p3, "identifier"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            ")",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 484
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;JLjava/lang/String;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mFixedExecutor:Ljava/util/concurrent/ExecutorService;

    .line 533
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public dispose()V
    .registers 2

    .prologue
    .line 960
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCompositeSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->clear()V

    .line 961
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCompositeSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->unsubscribe()V

    .line 962
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->dispose()V

    .line 963
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mGoogleManager:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->dispose()V

    .line 964
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mContext:Landroid/content/Context;

    .line 965
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v0

    return-object v0
.end method

.method public handleActivityResult(IILandroid/content/Intent;)Z
    .registers 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 454
    const-string v0, "IabHelper"

    const-string v1, "handleActivityResult for BillingContentFactory"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 455
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mGoogleManager:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public isAuthenticated()Z
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->isAuthenticated()Z

    move-result v0

    return v0
.end method

.method public isSetupDone()Z
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mGoogleManager:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->isSetupDone()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->isSetupDone()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public queryPurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;)Lrx/Observable;
    .registers 4
    .param p1, "type"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 183
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$21;->$SwitchMap$com$adobe$creativesdk$aviary$internal$account$BillingContentFactory$StoreType:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_42

    .line 247
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 185
    :pswitch_d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mGoogleManager:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->queryPurchases()Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$3;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mFixedExecutor:Ljava/util/concurrent/ExecutorService;

    .line 213
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    goto :goto_c

    .line 216
    :pswitch_27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->queryPurchases()Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$4;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mFixedExecutor:Ljava/util/concurrent/ExecutorService;

    .line 245
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    goto :goto_c

    .line 183
    nop

    :pswitch_data_42
    .packed-switch 0x1
        :pswitch_d
        :pswitch_27
    .end packed-switch
.end method

.method public queryPurchases(Ljava/util/Map;)Lrx/Observable;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 253
    .local p1, "inputMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "queryPurchases: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 256
    invoke-static {p1}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$9;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$9;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 257
    invoke-virtual {v0, v1}, Lrx/Observable;->map(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$8;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$8;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 266
    invoke-virtual {v0, v1}, Lrx/Observable;->concatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$7;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$7;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 276
    invoke-virtual {v0, v1}, Lrx/Observable;->concatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$6;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$6;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 286
    invoke-virtual {v0, v1}, Lrx/Observable;->concatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$5;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$5;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Ljava/util/Map;)V

    .line 296
    invoke-virtual {v0, v1}, Lrx/Observable;->map(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mFixedExecutor:Ljava/util/concurrent/ExecutorService;

    .line 308
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public requestLogin(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 312
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "requestLogin: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p2}, Lcom/adobe/creativesdk/aviary/internal/utils/BundleUtils;->toString(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 313
    const-string v0, "from"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 314
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "from"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": adobeid_signin_initiated"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 318
    :goto_37
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->login(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 319
    return-void

    .line 316
    :cond_3d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v1, "adobeid_signin_initiated"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    goto :goto_37
.end method

.method public requestPurchase(Landroid/app/Activity;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/Observable;
    .registers 23
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I
    .param p3, "packid"    # J
    .param p5, "identifier"    # Ljava/lang/String;
    .param p6, "packType"    # Ljava/lang/String;
    .param p7, "trackerName"    # Ljava/lang/String;
    .param p8, "price"    # Ljava/lang/String;
    .param p9, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "IJ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)",
            "Lrx/Observable",
            "<",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 346
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mGoogleManager:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    move-object/from16 v0, p5

    invoke-virtual {v2, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->launchPurchaseFlow(Landroid/app/Activity;ILjava/lang/String;)Lrx/Observable;

    move-result-object v2

    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$12;

    move-object/from16 v0, p5

    move-object/from16 v1, p7

    invoke-direct {v3, p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$12;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    invoke-virtual {v2, v3}, Lrx/Observable;->doOnRequest(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v2

    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$11;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$11;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 354
    invoke-virtual {v2, v3}, Lrx/Observable;->doOnError(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v11

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;

    move-object v3, p0

    move-object/from16 v4, p5

    move-object/from16 v5, p7

    move/from16 v6, p9

    move-object/from16 v7, p8

    move-wide/from16 v8, p3

    move-object/from16 v10, p6

    invoke-direct/range {v2 .. v10}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$10;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;JLjava/lang/String;)V

    .line 361
    invoke-virtual {v11, v2}, Lrx/Observable;->flatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    .line 395
    invoke-static {v3}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v3

    invoke-virtual {v2, v3}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v2

    return-object v2
.end method

.method public requestRestore(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/Observable;
    .registers 13
    .param p1, "packid"    # J
    .param p3, "identifier"    # Ljava/lang/String;
    .param p4, "packType"    # Ljava/lang/String;
    .param p5, "whereFrom"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/Observable",
            "<+",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 400
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "restore {%d, %s, %s, %s}"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    aput-object p4, v2, v3

    const/4 v3, 0x3

    aput-object p5, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 402
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->verifyPack(JLjava/lang/String;)Lrx/Observable;

    move-result-object v6

    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p5

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$13;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Ljava/lang/String;Ljava/lang/String;J)V

    .line 403
    invoke-virtual {v6, v0}, Lrx/Observable;->concatMap(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    .line 423
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public requestSignUp(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 8
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 322
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "requestSignUp: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p2}, Lcom/adobe/creativesdk/aviary/internal/utils/BundleUtils;->toString(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 323
    const-string v0, "from"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 324
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "from"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": adobeid_signup_initiated"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 328
    :goto_37
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->signUp(Landroid/app/Activity;Landroid/os/Bundle;)V

    .line 329
    return-void

    .line 326
    :cond_3d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->tracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    const-string v1, "adobeid_signup_initiated"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    goto :goto_37
.end method

.method public startSetup()Lrx/Observable;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 152
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mAdobeManager:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .line 153
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->startSetup()Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mGoogleManager:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    .line 154
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->startSetup()Lrx/Observable;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 152
    invoke-static {v0, v1, v2}, Lrx/Observable;->zip(Lrx/Observable;Lrx/Observable;Lrx/functions/Func2;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mFixedExecutor:Ljava/util/concurrent/ExecutorService;

    .line 162
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public subscribeToCdsFinised(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 4
    .param p1, "from"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lrx/functions/Action1",
            "<-",
            "Ljava/lang/Integer;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 128
    .local p2, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-Ljava/lang/Integer;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->cdsUpdatedSubject:Lrx/subjects/PublishSubject;

    invoke-direct {p0, p1, v0, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->subscribeTo(Ljava/lang/Object;Lrx/subjects/Subject;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribeToPackDownloadStatusChanged(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 4
    .param p1, "from"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lrx/functions/Action1",
            "<-",
            "Landroid/content/Intent;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 132
    .local p2, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-Landroid/content/Intent;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->packDownloadStatusSubject:Lrx/subjects/PublishSubject;

    invoke-direct {p0, p1, v0, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->subscribeTo(Ljava/lang/Object;Lrx/subjects/Subject;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribeToPackInstalled(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 4
    .param p1, "from"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lrx/functions/Action1",
            "<-",
            "Landroid/content/Intent;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 136
    .local p2, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-Landroid/content/Intent;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->packInstalledSubject:Lrx/subjects/PublishSubject;

    invoke-direct {p0, p1, v0, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->subscribeTo(Ljava/lang/Object;Lrx/subjects/Subject;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribeToPackPurchased(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 4
    .param p1, "from"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lrx/functions/Action1",
            "<-",
            "Landroid/content/Intent;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 119
    .local p2, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-Landroid/content/Intent;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->packPurchasedStatusSubject:Lrx/subjects/PublishSubject;

    invoke-direct {p0, p1, v0, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->subscribeTo(Ljava/lang/Object;Lrx/subjects/Subject;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public subscribeToUserStatusChange(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lrx/functions/Action1",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 124
    .local p2, "action":Lrx/functions/Action1;, "Lrx/functions/Action1<-Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->userLoginSubject:Lrx/subjects/PublishSubject;

    invoke-direct {p0, p1, v0, p2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->subscribeTo(Ljava/lang/Object;Lrx/subjects/Subject;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method
