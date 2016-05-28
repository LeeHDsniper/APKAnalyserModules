.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;
.super Ljava/lang/Object;
.source "CdsStorePurchasesConsumer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$Builder;
    }
.end annotation


# static fields
.field private static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mExceptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private final mPurchases:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const-string v0, "CdsStorePurchasesConsumer"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mLock:Ljava/lang/Object;

    .line 29
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mPurchases:Ljava/util/LinkedHashSet;

    .line 32
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mContext:Landroid/content/Context;

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mExceptions:Ljava/util/List;

    .line 34
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$1;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;)Ljava/util/LinkedHashSet;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mPurchases:Ljava/util/LinkedHashSet;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mExceptions:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->queryAdobePurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    return-void
.end method

.method private queryAdobePurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    .registers 5
    .param p1, "billingContentFactory"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 41
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "queryAdobePurchases"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 43
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;->Adobe:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    .line 44
    invoke-virtual {p1, v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryPurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;)Lrx/Observable;

    move-result-object v0

    .line 45
    invoke-static {}, Lrx/schedulers/Schedulers;->newThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 46
    invoke-static {}, Lrx/schedulers/Schedulers;->newThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$1;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$2;

    invoke-direct {v2, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 47
    invoke-virtual {v0, v1, v2}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;

    .line 76
    return-void
.end method

.method private queryGooglePurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    .registers 6
    .param p1, "billingContentFactory"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 79
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "queryGooglePurchases"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 81
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;->Google:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;

    .line 82
    invoke-virtual {p1, v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryPurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$StoreType;)Lrx/Observable;

    move-result-object v0

    .line 83
    invoke-static {}, Lrx/schedulers/Schedulers;->newThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 84
    invoke-static {}, Lrx/schedulers/Schedulers;->newThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$3;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;)V

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$4;

    invoke-direct {v2, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$4;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$5;

    invoke-direct {v3, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer$5;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 85
    invoke-virtual {v0, v1, v2, v3}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;Lrx/functions/Action0;)Lrx/Subscription;

    .line 112
    return-void
.end method


# virtual methods
.method public consume()Ljava/util/HashSet;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "consume"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 121
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 123
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 124
    :try_start_d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->queryPurchases()V
    :try_end_10
    .catchall {:try_start_d .. :try_end_10} :catchall_29

    .line 126
    :try_start_10
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_15
    .catch Ljava/lang/InterruptedException; {:try_start_10 .. :try_end_15} :catch_24
    .catchall {:try_start_10 .. :try_end_15} :catchall_29

    .line 130
    :goto_15
    :try_start_15
    monitor-exit v2
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_29

    .line 135
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "computation completed!"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 138
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mPurchases:Ljava/util/LinkedHashSet;

    if-eqz v1, :cond_2c

    .line 139
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mPurchases:Ljava/util/LinkedHashSet;

    .line 141
    :goto_23
    return-object v1

    .line 127
    :catch_24
    move-exception v0

    .line 128
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_25
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_15

    .line 130
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_29
    move-exception v1

    monitor-exit v2
    :try_end_2b
    .catchall {:try_start_25 .. :try_end_2b} :catchall_29

    throw v1

    .line 141
    :cond_2c
    const/4 v1, 0x0

    goto :goto_23
.end method

.method public getExceptions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mExceptions:Ljava/util/List;

    return-object v0
.end method

.method public queryPurchases()V
    .registers 3

    .prologue
    .line 115
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->create(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    move-result-object v0

    .line 116
    .local v0, "billingContentFactory":Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsStorePurchasesConsumer;->queryGooglePurchases(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V

    .line 117
    return-void
.end method
