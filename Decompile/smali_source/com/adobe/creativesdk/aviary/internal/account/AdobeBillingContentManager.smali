.class Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
.super Ljava/lang/Object;
.source "AdobeBillingContentManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private mCheckedArray:[Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDisposed:Z

.field private final mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

.field private final mLock:Ljava/lang/Object;

.field private mLoginClient:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

.field private mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

.field private mSetupDone:Z

.field private final mSingleExecutor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLock:Ljava/lang/Object;

    .line 55
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mCheckedArray:[Ljava/lang/String;

    .line 184
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mContext:Landroid/content/Context;

    .line 185
    new-instance v0, Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/utils/CustomPriorityThreadFactory;-><init>(I)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    .line 186
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    .line 187
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mSetupDone:Z

    return v0
.end method

.method static synthetic access$1002(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mSetupDone:Z

    return p1
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    return-object p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    return-object v0
.end method

.method static synthetic access$302(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
    .param p1, "x1"    # [Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mCheckedArray:[Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/List;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->filterList(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->getUserId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/Collection;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
    .param p1, "x1"    # Ljava/util/Collection;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mergeArray(Ljava/util/Collection;)V

    return-void
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/Collection;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
    .param p1, "x1"    # Ljava/util/Collection;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mergeArrays(Ljava/util/Collection;)V

    return-void
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfDisposed()V

    return-void
.end method

.method static synthetic access$900(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLock:Ljava/lang/Object;

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
    .line 286
    .local p1, "skus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

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

    .line 288
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 290
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    monitor-enter v3

    .line 291
    :cond_1c
    :goto_1c
    :try_start_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_44

    .line 292
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 293
    .local v0, "item":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->hasPurchase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_37

    .line 294
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1c

    .line 299
    .end local v0    # "item":Ljava/lang/String;
    :catchall_34
    move-exception v2

    monitor-exit v3
    :try_end_36
    .catchall {:try_start_1c .. :try_end_36} :catchall_34

    throw v2

    .line 295
    .restart local v0    # "item":Ljava/lang/String;
    :cond_37
    :try_start_37
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mCheckedArray:[Ljava/lang/String;

    invoke-static {v2, v0}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    const/4 v4, -0x1

    if-le v2, v4, :cond_1c

    .line 296
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1c

    .line 299
    .end local v0    # "item":Ljava/lang/String;
    :cond_44
    monitor-exit v3
    :try_end_45
    .catchall {:try_start_37 .. :try_end_45} :catchall_34

    .line 300
    return-void
.end method

.method private getUserId()Ljava/lang/String;
    .registers 3

    .prologue
    .line 303
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfDisposed()V

    .line 304
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfSetupNotDone()V

    .line 306
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v0

    .line 307
    .local v0, "profile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    if-eqz v0, :cond_13

    .line 308
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v1

    .line 310
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method private mergeArray(Ljava/util/Collection;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 276
    .local p1, "skus":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/HashSet;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mCheckedArray:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 277
    .local v0, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 279
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 280
    .local v1, "sortedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 281
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mCheckedArray:[Ljava/lang/String;

    .line 282
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "cache map size %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mCheckedArray:[Ljava/lang/String;

    array-length v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 283
    return-void
.end method

.method private mergeArrays(Ljava/util/Collection;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<[",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 268
    .local p1, "arrays":Ljava/util/Collection;, "Ljava/util/Collection<[Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 269
    .local v0, "array":[Ljava/lang/String;
    if-eqz v0, :cond_4

    array-length v2, v0

    if-lez v2, :cond_4

    .line 270
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mergeArray(Ljava/util/Collection;)V

    goto :goto_4

    .line 273
    .end local v0    # "array":[Ljava/lang/String;
    :cond_1d
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
            "Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 207
    .local p1, "skus":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/List;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    .line 264
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method private throwIfDisposed()V
    .registers 3

    .prologue
    .line 432
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mDisposed:Z

    if-eqz v0, :cond_c

    .line 433
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "AdobeAccountManager already disposed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 435
    :cond_c
    return-void
.end method

.method private throwIfSetupNotDone()V
    .registers 4

    .prologue
    .line 438
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 439
    :try_start_3
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mSetupDone:Z

    if-nez v0, :cond_12

    .line 440
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Setup already done"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 442
    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v0

    :cond_12
    :try_start_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_f

    .line 443
    return-void
.end method


# virtual methods
.method public clearInventory()Lrx/Observable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 190
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    .line 203
    invoke-static {v1}, Lrx/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public dispose()V
    .registers 2

    .prologue
    .line 426
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mDisposed:Z

    .line 427
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mContext:Landroid/content/Context;

    .line 428
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mSingleExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 429
    return-void
.end method

.method public getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    .registers 2

    .prologue
    .line 384
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfDisposed()V

    .line 385
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfSetupNotDone()V

    .line 386
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v0

    return-object v0
.end method

.method public isAuthenticated()Z
    .registers 2

    .prologue
    .line 378
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfDisposed()V

    .line 379
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfSetupNotDone()V

    .line 380
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isAuthenticated()Z

    move-result v0

    return v0
.end method

.method public isSetupDone()Z
    .registers 3

    .prologue
    .line 419
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 420
    :try_start_3
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mSetupDone:Z

    monitor-exit v1

    return v0

    .line 421
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public login(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 314
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "login"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 315
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfDisposed()V

    .line 316
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfSetupNotDone()V

    .line 318
    new-instance v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;-><init>()V

    .line 320
    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->withActivity(Landroid/app/Activity;)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;

    move-result-object v1

    .line 321
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->build()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    move-result-object v0

    .line 323
    .local v0, "session":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLoginClient:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

    if-eqz v1, :cond_25

    .line 325
    :try_start_1e
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLoginClient:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->unregisterLoginClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V
    :try_end_25
    .catch Ljava/lang/NullPointerException; {:try_start_1e .. :try_end_25} :catch_39

    .line 331
    :cond_25
    :goto_25
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

    invoke-direct {v1, p0, p2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Landroid/os/Bundle;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLoginClient:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

    .line 332
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLoginClient:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->registerLoginClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V

    .line 333
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->login(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;)V

    .line 334
    return-void

    .line 326
    :catch_39
    move-exception v1

    goto :goto_25
.end method

.method public queryPurchases()Lrx/Observable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    .line 70
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->startSetup()Lrx/Observable;

    move-result-object v0

    const/4 v1, 0x0

    .line 71
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->queryInternal(Ljava/util/List;)Lrx/Observable;

    move-result-object v1

    .line 69
    invoke-static {v0, v1}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    const/4 v1, 0x1

    .line 72
    invoke-virtual {v0, v1}, Lrx/Observable;->elementAt(I)Lrx/Observable;

    move-result-object v0

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    .line 73
    invoke-virtual {v0, v1}, Lrx/Observable;->cast(Ljava/lang/Class;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public querySkus(Ljava/util/ArrayList;)Lrx/Observable;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    .line 61
    .local p1, "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->startSetup()Lrx/Observable;

    move-result-object v0

    .line 62
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->queryInternal(Ljava/util/List;)Lrx/Observable;

    move-result-object v1

    .line 60
    invoke-static {v0, v1}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    const/4 v1, 0x1

    .line 63
    invoke-virtual {v0, v1}, Lrx/Observable;->elementAt(I)Lrx/Observable;

    move-result-object v0

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    .line 64
    invoke-virtual {v0, v1}, Lrx/Observable;->cast(Ljava/lang/Class;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public signUp(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 337
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "signUp"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 338
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfDisposed()V

    .line 339
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->throwIfSetupNotDone()V

    .line 341
    new-instance v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;-><init>()V

    .line 343
    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->withActivity(Landroid/app/Activity;)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;

    move-result-object v1

    .line 344
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->build()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    move-result-object v0

    .line 346
    .local v0, "session":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLoginClient:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

    if-eqz v1, :cond_25

    .line 348
    :try_start_1e
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLoginClient:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->unregisterLoginClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V
    :try_end_25
    .catch Ljava/lang/NullPointerException; {:try_start_1e .. :try_end_25} :catch_39

    .line 354
    :cond_25
    :goto_25
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

    invoke-direct {v1, p0, p2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Landroid/os/Bundle;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLoginClient:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

    .line 355
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mLoginClient:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$LoginClient;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->registerLoginClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V

    .line 356
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->promptForSignUp(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;)V

    .line 357
    return-void

    .line 349
    :catch_39
    move-exception v1

    goto :goto_25
.end method

.method public startSetup()Lrx/Observable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 391
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$3;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$3;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
