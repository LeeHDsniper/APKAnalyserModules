.class Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;
.super Ljava/lang/Object;
.source "GoogleBillingContentManager.java"


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private final helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

.field private final mInventory:Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

.field private mResult:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

.field private final mSetupLock:Ljava/util/concurrent/Semaphore;

.field private final mSingleExecutor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    const-string v0, "GoogleBillingContentManager"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v2}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mSetupLock:Ljava/util/concurrent/Semaphore;

    .line 44
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    .line 48
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;

    check-cast v0, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/IAviaryClientCredentials;->getBillingKey()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    .line 49
    new-instance v0, Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;

    invoke-direct {v0, v2}, Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;-><init>(I)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    .line 50
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Ljava/util/List;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->filterList(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Lrx/Subscriber;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;
    .param p1, "x1"    # Lrx/Subscriber;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->startSetupInternal(Lrx/Subscriber;)V

    return-void
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mResult:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    return-object p1
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Ljava/util/concurrent/Semaphore;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mSetupLock:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method private filterList(Ljava/util/List;)V
    .registers 9
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
    .line 74
    .local p1, "skus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "filterList. original size: %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 75
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 76
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_19
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_39

    .line 77
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 78
    .local v0, "item":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->hasPurchase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_35

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->hasDetails(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 79
    :cond_35
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_19

    .line 82
    .end local v0    # "item":Ljava/lang/String;
    :cond_39
    return-void
.end method

.method private queryInternal(Ljava/util/List;)Lrx/Observable;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    .local p1, "skus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Ljava/util/List;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    .line 142
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method private queryPurchasesInternal()Lrx/Observable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 85
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    .line 110
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method private startSetupInternal(Lrx/Subscriber;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 156
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;>;"
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "startSetupInternal: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 157
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 160
    :try_start_14
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mSetupLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 162
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->isDisposed()Z

    move-result v1

    if-eqz v1, :cond_37

    .line 163
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v1

    if-nez v1, :cond_31

    .line 164
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "IABHelperDisposed"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 166
    :cond_31
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mSetupLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 192
    :goto_36
    return-void

    .line 167
    :cond_37
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->isSetupDone()Z

    move-result v1

    if-eqz v1, :cond_5b

    .line 168
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v1

    if-nez v1, :cond_4d

    .line 169
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mResult:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    invoke-virtual {p1, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 170
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 172
    :cond_4d
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mSetupLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V
    :try_end_52
    .catch Ljava/lang/InterruptedException; {:try_start_14 .. :try_end_52} :catch_53

    goto :goto_36

    .line 188
    :catch_53
    move-exception v0

    .line 189
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 190
    invoke-virtual {p1, v0}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_36

    .line 174
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_5b
    :try_start_5b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$4;

    invoke-direct {v2, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$4;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Lrx/Subscriber;)V

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->startSetup(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper$OnIabSetupFinishedListener;)V
    :try_end_65
    .catch Ljava/lang/InterruptedException; {:try_start_5b .. :try_end_65} :catch_53

    goto :goto_36
.end method


# virtual methods
.method public dispose()V
    .registers 3

    .prologue
    .line 250
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "dispose"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 251
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->dispose()V

    .line 252
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 253
    return-void
.end method

.method public handleActivityResult(IILandroid/content/Intent;)Z
    .registers 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isConnected()Z
    .registers 2

    .prologue
    .line 245
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->isSetupDone()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mResult:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mResult:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public isSetupDone()Z
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->isSetupDone()Z

    move-result v0

    return v0
.end method

.method public launchPurchaseFlow(Landroid/app/Activity;ILjava/lang/String;)Lrx/Observable;
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I
    .param p3, "sku"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "I",
            "Ljava/lang/String;",
            ")",
            "Lrx/Observable",
            "<",
            "Landroid/util/Pair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 197
    .line 198
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->startSetup()Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;

    invoke-direct {v1, p0, p3, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$5;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Ljava/lang/String;Landroid/app/Activity;I)V

    .line 199
    invoke-static {v1}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v1

    .line 231
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v2

    invoke-virtual {v1, v2}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v1

    .line 197
    invoke-static {v0, v1}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    const/4 v1, 0x1

    .line 232
    invoke-virtual {v0, v1}, Lrx/Observable;->elementAt(I)Lrx/Observable;

    move-result-object v0

    const-class v1, Landroid/util/Pair;

    .line 233
    invoke-virtual {v0, v1}, Lrx/Observable;->cast(Ljava/lang/Class;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public queryPurchases()Lrx/Observable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 63
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "queryPurchases"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->startSetup()Lrx/Observable;

    move-result-object v0

    .line 68
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->queryPurchasesInternal()Lrx/Observable;

    move-result-object v1

    .line 66
    invoke-static {v0, v1}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    const/4 v1, 0x1

    .line 69
    invoke-virtual {v0, v1}, Lrx/Observable;->elementAt(I)Lrx/Observable;

    move-result-object v0

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    .line 70
    invoke-virtual {v0, v1}, Lrx/Observable;->cast(Ljava/lang/Class;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public querySkus(Ljava/util/List;)Lrx/Observable;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, "skus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "querySkus"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 56
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->startSetup()Lrx/Observable;

    move-result-object v0

    .line 57
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->queryInternal(Ljava/util/List;)Lrx/Observable;

    move-result-object v1

    .line 55
    invoke-static {v0, v1}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    const/4 v1, 0x1

    .line 58
    invoke-virtual {v0, v1}, Lrx/Observable;->elementAt(I)Lrx/Observable;

    move-result-object v0

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    .line 59
    invoke-virtual {v0, v1}, Lrx/Observable;->cast(Ljava/lang/Class;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public startSetup()Lrx/Observable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 146
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$3;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$3;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
