.class public Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
.super Ljava/lang/Object;
.source "AdobeCommonCacheInstance.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$11;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final AdobeCommonCacheCriticalCount:I

.field private final AdobeCommonCacheNormalCount:I

.field private cacheAdobeId:Ljava/lang/String;

.field private cacheDir:Ljava/lang/String;

.field private cacheFrozen:Z

.field private cacheMisses:I

.field private cacheName:Ljava/lang/String;

.field private currentDiskCacheSize:J

.field private final dateComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/util/Date;",
            ">;"
        }
    .end annotation
.end field

.field private final diskCacheAccessTimes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final diskCacheCreateTimes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private diskCacheHits:I

.field private final diskCacheObjectSizes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private diskCacheSize:D

.field private final diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private evictionPolicy:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private final lruComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field private memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

.field private memCacheHits:I

.field private memCacheSize:D

.field private final numberComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field private repeatingTimer:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field private final scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

.field private useDiskCaching:Z

.field private final verboseDebugging:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .registers 4
    .param p1, "executorService"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    const/4 v1, 0x1

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    const/4 v0, 0x3

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->AdobeCommonCacheNormalCount:I

    .line 100
    const/16 v0, 0xa

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->AdobeCommonCacheCriticalCount:I

    .line 132
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->verboseDebugging:Z

    .line 140
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 145
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->useDiskCaching:Z

    .line 147
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    .line 150
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->lruComparator:Ljava/util/Comparator;

    .line 158
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->numberComparator:Ljava/util/Comparator;

    .line 166
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$3;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->dateComparator:Ljava/util/Comparator;

    .line 173
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheCreateTimes:Ljava/util/Map;

    .line 174
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheAccessTimes:Ljava/util/Map;

    .line 175
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheObjectSizes:Ljava/util/Map;

    .line 176
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 177
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 179
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;)Ljava/io/File;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheDirectoryForGuid(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)J
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .prologue
    .line 46
    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    return-wide v0
.end method

.method static synthetic access$1100(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getNormalEvictionThreshold()I

    move-result v0

    return v0
.end method

.method static synthetic access$1200(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheEviction()V

    return-void
.end method

.method static synthetic access$1300(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->stopRepeatingTimer()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;
    .param p2, "x2"    # Landroid/os/Handler;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->callMissHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;Ljava/lang/String;J)V
    .registers 6
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # J

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->logDiskCacheHit(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/io/File;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    .param p1, "x1"    # Ljava/io/File;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->addEntryToCacheMetadata(Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;
    .param p2, "x2"    # Landroid/os/Handler;
    .param p3, "x3"    # Ljava/lang/Object;
    .param p4, "x4"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->callHitHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V

    return-void
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)D
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .prologue
    .line 46
    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCacheSize:D

    return-wide v0
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    return-object v0
.end method

.method static synthetic access$900(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    return-void
.end method

.method private addEntryToCacheMetadata(Ljava/io/File;Ljava/lang/String;)V
    .registers 13
    .param p1, "file"    # Ljava/io/File;
    .param p2, "keyPath"    # Ljava/lang/String;

    .prologue
    .line 996
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 997
    .local v2, "fileCreateTime":J
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    .line 998
    .local v0, "fileAccessTime":J
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 1000
    .local v4, "fileSize":J
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheObjectSizes:Ljava/util/Map;

    invoke-interface {v6, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_19

    .line 1001
    iget-wide v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    add-long/2addr v6, v4

    iput-wide v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    .line 1004
    :cond_19
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheAccessTimes:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, p2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1005
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheCreateTimes:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, p2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1006
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheObjectSizes:Ljava/util/Map;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, p2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1012
    iget-boolean v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheFrozen:Z

    if-nez v6, :cond_70

    iget-wide v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getNormalEvictionThreshold()I

    move-result v8

    int-to-long v8, v8

    cmp-long v6, v6, v8

    if-lez v6, :cond_70

    .line 1013
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Sync eviction event at "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/text/SimpleDateFormat;->getInstance()Ljava/text/DateFormat;

    move-result-object v7

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8}, Ljava/util/Date;-><init>()V

    invoke-virtual {v7, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 1014
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheEviction()V

    .line 1016
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->repeatingTimer:Ljava/util/concurrent/ScheduledFuture;

    if-nez v6, :cond_70

    .line 1017
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->startRepeatingTimer()V

    .line 1020
    :cond_70
    return-void
.end method

.method private cacheEviction()V
    .registers 12

    .prologue
    const/4 v6, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 865
    iget-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCriticalEvictionThreshold()I

    move-result v4

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_6f

    .line 866
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->AdobeCommonCacheCriticalEviction:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    .line 867
    .local v0, "evictionType":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCriticalEvictionThreshold()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 873
    .local v1, "threshold":Ljava/lang/Integer;
    :goto_19
    const-string v2, "%s eviction: %d > %d"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v8

    iget-wide v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v9

    aput-object v1, v3, v10

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 875
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$11;->$SwitchMap$com$adobe$creativesdk$foundation$internal$cache$AdobeCommonCachePolicies:[I

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->evictionPolicy:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_82

    .line 886
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->lruEviction(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;)V

    .line 890
    :goto_44
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCurrentDiskCacheSize()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    .line 892
    const-string v3, "After eviction: %d - %d are %s"

    new-array v4, v6, [Ljava/lang/Object;

    iget-wide v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v4, v8

    aput-object v1, v4, v9

    iget-wide v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    .line 893
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v8, v2

    cmp-long v2, v6, v8

    if-lez v2, :cond_7e

    const-string v2, "UNORDERED"

    :goto_65
    aput-object v2, v4, v10

    .line 892
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 895
    return-void

    .line 869
    .end local v0    # "evictionType":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;
    .end local v1    # "threshold":Ljava/lang/Integer;
    :cond_6f
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->AdobeCommonCacheNormalEviction:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    .line 870
    .restart local v0    # "evictionType":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getNormalEvictionThreshold()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .restart local v1    # "threshold":Ljava/lang/Integer;
    goto :goto_19

    .line 882
    :pswitch_7a
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->largeObjectFirstEviction(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;)V

    goto :goto_44

    .line 893
    :cond_7e
    const-string v2, "in order"

    goto :goto_65

    .line 875
    nop

    :pswitch_data_82
    .packed-switch 0x1
        :pswitch_7a
    .end packed-switch
.end method

.method private cacheLog(Ljava/lang/String;)V
    .registers 4
    .param p1, "logStr"    # Ljava/lang/String;

    .prologue
    .line 362
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    return-void
.end method

.method private callHitHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .registers 7
    .param p2, "handler"    # Landroid/os/Handler;
    .param p4, "location"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler",
            "<TT;>;",
            "Landroid/os/Handler;",
            "TT;",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1349
    .local p1, "callback":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<TT;>;"
    .local p3, "object":Ljava/lang/Object;, "TT;"
    if-eqz p2, :cond_b

    .line 1350
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$9;

    invoke-direct {v0, p0, p1, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$9;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1365
    :goto_a
    return-void

    .line 1357
    :cond_b
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$10;

    invoke-direct {v1, p0, p1, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$10;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1362
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_a
.end method

.method private callMissHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
    .registers 5
    .param p1, "callback"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 1326
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheMisses:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheMisses:I

    .line 1327
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$8;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$8;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;)V

    .line 1335
    .local v0, "callBack":Ljava/lang/Runnable;
    if-eqz p2, :cond_11

    .line 1336
    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1340
    :goto_10
    return-void

    .line 1338
    :cond_11
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_10
.end method

.method private clearMemCache()V
    .registers 2

    .prologue
    .line 190
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;->evictAll()V

    .line 191
    return-void
.end method

.method private getCacheDirectoryForGuid(Ljava/lang/String;)Ljava/io/File;
    .registers 8
    .param p1, "guid"    # Ljava/lang/String;

    .prologue
    .line 1289
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    invoke-direct {v0, v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1290
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_35

    .line 1291
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    .line 1292
    .local v1, "success":Z
    if-nez v1, :cond_35

    .line 1293
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Folder creation not successful for path "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 1295
    .end local v1    # "success":Z
    :cond_35
    return-object v0
.end method

.method private getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 1308
    if-nez p2, :cond_4

    .line 1309
    move-object v0, p1

    .line 1314
    .local v0, "result":Ljava/lang/String;
    :goto_3
    return-object v0

    .line 1311
    .end local v0    # "result":Ljava/lang/String;
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "result":Ljava/lang/String;
    goto :goto_3
.end method

.method private getCriticalEvictionThreshold()I
    .registers 5

    .prologue
    .line 1389
    const-wide v0, 0x3fee666666666666L

    iget-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheSize:D

    mul-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method private getCurrentDiskCacheSize()J
    .registers 9

    .prologue
    .line 1113
    const-wide/16 v2, 0x0

    .line 1115
    .local v2, "total":J
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheObjectSizes:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1116
    .local v0, "stringLongEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long/2addr v2, v6

    goto :goto_c

    .line 1118
    .end local v0    # "stringLongEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    :cond_24
    return-wide v2
.end method

.method private getEntrySetsSortedByValue(Ljava/util/Map;Ljava/util/Comparator;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/Comparator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;>;)",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 941
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    .local p2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 942
    .local v1, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 943
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    invoke-static {v0, p2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 944
    return-object v0
.end method

.method private getNormalEvictionThreshold()I
    .registers 5

    .prologue
    .line 1381
    const-wide v0, 0x3feb333333333333L

    iget-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheSize:D

    mul-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method private getObjectFromDiskWithGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;)Ljava/lang/Object;
    .registers 23
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 615
    .local p3, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    new-instance v13, Ljava/util/Date;

    invoke-direct {v13}, Ljava/util/Date;-><init>()V

    .line 616
    .local v13, "startTime":Ljava/util/Date;
    const/4 v6, 0x0

    .line 617
    .local v6, "finalResult":Ljava/lang/Object;, "TT;"
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->useDiskCaching:Z

    if-eqz v14, :cond_a6

    .line 619
    :try_start_c
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 620
    sget-object v14, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v15, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Got Read lock in getObjectFromDiskWithGUID.Current lock count "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 621
    new-instance v9, Ljava/io/File;

    invoke-direct/range {p0 .. p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheDirectoryForGuid(Ljava/lang/String;)Ljava/io/File;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-direct {v9, v14, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 623
    .local v9, "inputFile":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_a7

    .line 624
    sget-object v14, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v15, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Disk Miss for key "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_72
    .catchall {:try_start_c .. :try_end_72} :catchall_160

    .line 625
    const/4 v6, 0x0

    .line 662
    .end local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 663
    sget-object v14, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v15, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Read lock released in getObjectFromDiskWithGUID.Holding "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 667
    .end local v9    # "inputFile":Ljava/io/File;
    :cond_a6
    :goto_a6
    return-object v6

    .line 627
    .restart local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .restart local v9    # "inputFile":Ljava/io/File;
    :cond_a7
    const/4 v7, 0x0

    .line 628
    .local v7, "fis":Ljava/io/FileInputStream;
    const/4 v11, 0x0

    .line 630
    .local v11, "ois":Ljava/io/ObjectInputStream;
    :try_start_a9
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_ae
    .catch Ljava/io/IOException; {:try_start_a9 .. :try_end_ae} :catch_140
    .catch Ljava/lang/ClassNotFoundException; {:try_start_a9 .. :try_end_ae} :catch_195
    .catchall {:try_start_a9 .. :try_end_ae} :catchall_1b7

    .line 631
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .local v8, "fis":Ljava/io/FileInputStream;
    :try_start_ae
    new-instance v12, Ljava/io/ObjectInputStream;

    invoke-direct {v12, v8}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_ae .. :try_end_b3} :catch_1d6
    .catch Ljava/lang/ClassNotFoundException; {:try_start_ae .. :try_end_b3} :catch_1cf
    .catchall {:try_start_ae .. :try_end_b3} :catchall_1c8

    .line 632
    .end local v11    # "ois":Ljava/io/ObjectInputStream;
    .local v12, "ois":Ljava/io/ObjectInputStream;
    :try_start_b3
    invoke-virtual {v12}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v10

    .line 634
    .local v10, "object":Ljava/lang/Object;, "TT;"
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    .line 635
    .local v5, "endTime":Ljava/util/Date;
    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v14

    invoke-virtual {v13}, Ljava/util/Date;->getTime()J

    move-result-wide v16

    sub-long v14, v14, v16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v14, v15}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->logDiskCacheHit(Ljava/lang/String;Ljava/lang/String;J)V

    .line 636
    invoke-direct/range {p0 .. p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v14}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->addEntryToCacheMetadata(Ljava/io/File;Ljava/lang/String;)V

    .line 639
    move-object v6, v10

    .line 641
    sget-object v14, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    move-object/from16 v0, p3

    invoke-virtual {v0, v14}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_f8

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCacheSize:D

    const-wide/16 v16, 0x0

    cmpl-double v14, v14, v16

    if-lez v14, :cond_f8

    .line 642
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    invoke-direct/range {p0 .. p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15, v10}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_f8
    .catch Ljava/io/IOException; {:try_start_b3 .. :try_end_f8} :catch_1da
    .catch Ljava/lang/ClassNotFoundException; {:try_start_b3 .. :try_end_f8} :catch_1d2
    .catchall {:try_start_b3 .. :try_end_f8} :catchall_1cb

    .line 653
    :cond_f8
    if-eqz v8, :cond_fd

    .line 654
    :try_start_fa
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V

    .line 655
    :cond_fd
    if-eqz v12, :cond_102

    .line 656
    invoke-virtual {v12}, Ljava/io/ObjectInputStream;->close()V
    :try_end_102
    .catch Ljava/io/IOException; {:try_start_fa .. :try_end_102} :catch_139
    .catchall {:try_start_fa .. :try_end_102} :catchall_160

    :cond_102
    move-object v11, v12

    .end local v12    # "ois":Ljava/io/ObjectInputStream;
    .restart local v11    # "ois":Ljava/io/ObjectInputStream;
    move-object v7, v8

    .line 662
    .end local v5    # "endTime":Ljava/util/Date;
    .end local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .end local v8    # "fis":Ljava/io/FileInputStream;
    .end local v10    # "object":Ljava/lang/Object;, "TT;"
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    :cond_104
    :goto_104
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 663
    sget-object v14, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v15, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Read lock released in getObjectFromDiskWithGUID.Holding "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_a6

    .line 657
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .end local v11    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "endTime":Ljava/util/Date;
    .restart local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "object":Ljava/lang/Object;, "TT;"
    .restart local v12    # "ois":Ljava/io/ObjectInputStream;
    :catch_139
    move-exception v4

    .line 658
    .local v4, "e":Ljava/io/IOException;
    :try_start_13a
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_13d
    .catchall {:try_start_13a .. :try_end_13d} :catchall_160

    move-object v11, v12

    .end local v12    # "ois":Ljava/io/ObjectInputStream;
    .restart local v11    # "ois":Ljava/io/ObjectInputStream;
    move-object v7, v8

    .line 660
    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto :goto_104

    .line 645
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "endTime":Ljava/util/Date;
    .end local v10    # "object":Ljava/lang/Object;, "TT;"
    :catch_140
    move-exception v4

    .line 646
    .end local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .restart local v4    # "e":Ljava/io/IOException;
    :goto_141
    :try_start_141
    sget-object v14, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v15, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "Unable to read map from cache"

    move-object/from16 v0, v16

    invoke-static {v14, v15, v0, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_150
    .catchall {:try_start_141 .. :try_end_150} :catchall_1b7

    .line 653
    if-eqz v7, :cond_155

    .line 654
    :try_start_152
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V

    .line 655
    :cond_155
    if-eqz v11, :cond_104

    .line 656
    invoke-virtual {v11}, Ljava/io/ObjectInputStream;->close()V
    :try_end_15a
    .catch Ljava/io/IOException; {:try_start_152 .. :try_end_15a} :catch_15b
    .catchall {:try_start_152 .. :try_end_15a} :catchall_160

    goto :goto_104

    .line 657
    :catch_15b
    move-exception v4

    .line 658
    :try_start_15c
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_15f
    .catchall {:try_start_15c .. :try_end_15f} :catchall_160

    goto :goto_104

    .line 662
    .end local v4    # "e":Ljava/io/IOException;
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .end local v9    # "inputFile":Ljava/io/File;
    .end local v11    # "ois":Ljava/io/ObjectInputStream;
    :catchall_160
    move-exception v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v15}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 663
    sget-object v15, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v16, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Read lock released in getObjectFromDiskWithGUID.Holding "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v15 .. v17}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    throw v14

    .line 648
    .restart local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    .restart local v9    # "inputFile":Ljava/io/File;
    .restart local v11    # "ois":Ljava/io/ObjectInputStream;
    :catch_195
    move-exception v4

    .line 649
    .end local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .local v4, "e":Ljava/lang/ClassNotFoundException;
    :goto_196
    :try_start_196
    sget-object v14, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v15, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "Unable to read map from cache"

    move-object/from16 v0, v16

    invoke-static {v14, v15, v0, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1a5
    .catchall {:try_start_196 .. :try_end_1a5} :catchall_1b7

    .line 653
    if-eqz v7, :cond_1aa

    .line 654
    :try_start_1a7
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V

    .line 655
    :cond_1aa
    if-eqz v11, :cond_104

    .line 656
    invoke-virtual {v11}, Ljava/io/ObjectInputStream;->close()V
    :try_end_1af
    .catch Ljava/io/IOException; {:try_start_1a7 .. :try_end_1af} :catch_1b1
    .catchall {:try_start_1a7 .. :try_end_1af} :catchall_160

    goto/16 :goto_104

    .line 657
    :catch_1b1
    move-exception v4

    .line 658
    .local v4, "e":Ljava/io/IOException;
    :try_start_1b2
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1b5
    .catchall {:try_start_1b2 .. :try_end_1b5} :catchall_160

    goto/16 :goto_104

    .line 652
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_1b7
    move-exception v14

    .line 653
    :goto_1b8
    if-eqz v7, :cond_1bd

    .line 654
    :try_start_1ba
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V

    .line 655
    :cond_1bd
    if-eqz v11, :cond_1c2

    .line 656
    invoke-virtual {v11}, Ljava/io/ObjectInputStream;->close()V
    :try_end_1c2
    .catch Ljava/io/IOException; {:try_start_1ba .. :try_end_1c2} :catch_1c3
    .catchall {:try_start_1ba .. :try_end_1c2} :catchall_160

    .line 659
    :cond_1c2
    :goto_1c2
    :try_start_1c2
    throw v14

    .line 657
    :catch_1c3
    move-exception v4

    .line 658
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1c7
    .catchall {:try_start_1c2 .. :try_end_1c7} :catchall_160

    goto :goto_1c2

    .line 652
    .end local v4    # "e":Ljava/io/IOException;
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .restart local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    :catchall_1c8
    move-exception v14

    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto :goto_1b8

    .end local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .end local v11    # "ois":Ljava/io/ObjectInputStream;
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v12    # "ois":Ljava/io/ObjectInputStream;
    :catchall_1cb
    move-exception v14

    move-object v11, v12

    .end local v12    # "ois":Ljava/io/ObjectInputStream;
    .restart local v11    # "ois":Ljava/io/ObjectInputStream;
    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto :goto_1b8

    .line 648
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .restart local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    :catch_1cf
    move-exception v4

    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto :goto_196

    .end local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .end local v11    # "ois":Ljava/io/ObjectInputStream;
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v12    # "ois":Ljava/io/ObjectInputStream;
    :catch_1d2
    move-exception v4

    move-object v11, v12

    .end local v12    # "ois":Ljava/io/ObjectInputStream;
    .restart local v11    # "ois":Ljava/io/ObjectInputStream;
    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto :goto_196

    .line 645
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .restart local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    :catch_1d6
    move-exception v4

    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_141

    .end local v6    # "finalResult":Ljava/lang/Object;, "TT;"
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .end local v11    # "ois":Ljava/io/ObjectInputStream;
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v12    # "ois":Ljava/io/ObjectInputStream;
    :catch_1da
    move-exception v4

    move-object v11, v12

    .end local v12    # "ois":Ljava/io/ObjectInputStream;
    .restart local v11    # "ois":Ljava/io/ObjectInputStream;
    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_141
.end method

.method private getObjectFromDiskWithGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
    .registers 14
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p5, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler",
            "<TT;>;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 679
    .local p3, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    .local p4, "callback":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<TT;>;"
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    .line 681
    .local v6, "startTime":Ljava/util/Date;
    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->useDiskCaching:Z

    if-eqz v1, :cond_1a

    .line 682
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p4

    move-object v5, p5

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;Ljava/util/Date;Ljava/util/EnumSet;)V

    .line 735
    .local v0, "r":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 739
    .end local v0    # "r":Ljava/lang/Runnable;
    :goto_19
    return-void

    .line 737
    :cond_1a
    invoke-direct {p0, p4, p5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->callMissHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V

    goto :goto_19
.end method

.method private initDiskCacheMetadata()V
    .registers 13

    .prologue
    const/4 v11, 0x0

    .line 954
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    if-eqz v7, :cond_d

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_12

    .line 955
    :cond_d
    const-string v7, "Cannot create the disk cache metadata.  Non-existent disk cache."

    invoke-direct {p0, v7}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 958
    :cond_12
    :try_start_12
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 959
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheFrozen:Z

    .line 960
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Got Read lock in initDiskCacheMetadata.Current lock count "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v10}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 961
    new-instance v0, Ljava/io/File;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    invoke-direct {v0, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 962
    .local v0, "diskCache":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_62

    .line 963
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v6

    .line 964
    .local v6, "success":Z
    if-nez v6, :cond_62

    .line 965
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Error creating disk cache. Folder creation not successful"

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_62
    .catchall {:try_start_12 .. :try_end_62} :catchall_e5

    .line 968
    .end local v6    # "success":Z
    :cond_62
    :try_start_62
    sget-object v7, Lorg/apache/commons/io/filefilter/TrueFileFilter;->INSTANCE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    sget-object v8, Lorg/apache/commons/io/filefilter/TrueFileFilter;->INSTANCE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    invoke-static {v0, v7, v8}, Lorg/apache/commons/io/FileUtils;->listFiles(Ljava/io/File;Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Ljava/util/Collection;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 970
    .local v3, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_70
    :goto_70
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_b5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 972
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-nez v8, :cond_70

    invoke-virtual {v2}, Ljava/io/File;->isHidden()Z

    move-result v8

    if-nez v8, :cond_70

    .line 973
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 974
    .local v4, "index":I
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheName:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/2addr v9, v4

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 975
    .local v5, "keyPath":Ljava/lang/String;
    invoke-direct {p0, v2, v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->addEntryToCacheMetadata(Ljava/io/File;Ljava/lang/String;)V
    :try_end_a6
    .catch Ljava/lang/RuntimeException; {:try_start_62 .. :try_end_a6} :catch_a7
    .catchall {:try_start_62 .. :try_end_a6} :catchall_e5

    goto :goto_70

    .line 978
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v4    # "index":I
    .end local v5    # "keyPath":Ljava/lang/String;
    :catch_a7
    move-exception v1

    .line 979
    .local v1, "e":Ljava/lang/RuntimeException;
    :try_start_a8
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Error initializing disk cache"

    invoke-static {v7, v8, v9, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b5
    .catchall {:try_start_a8 .. :try_end_b5} :catchall_e5

    .line 982
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :cond_b5
    iput-boolean v11, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheFrozen:Z

    .line 983
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 984
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Read lock released in initDiskCacheMetadata.Holding "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v10}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 986
    return-void

    .line 982
    .end local v0    # "diskCache":Ljava/io/File;
    :catchall_e5
    move-exception v7

    iput-boolean v11, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheFrozen:Z

    .line 983
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 984
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v9, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Read lock released in initDiskCacheMetadata.Holding "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v11}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    throw v7
.end method

.method private largeObjectFirstEviction(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;)V
    .registers 13
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    .prologue
    .line 829
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->AdobeCommonCacheCriticalEviction:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    if-ne p1, v8, :cond_6a

    const/16 v8, 0xa

    :goto_6
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 832
    .local v3, "evictionCount":Ljava/lang/Integer;
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheObjectSizes:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->size()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 834
    .local v0, "count":Ljava/lang/Integer;
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheObjectSizes:Ljava/util/Map;

    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->numberComparator:Ljava/util/Comparator;

    invoke-direct {p0, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getEntrySetsSortedByValue(Ljava/util/Map;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v6

    .line 837
    .local v6, "sortedKeySet":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    :try_start_1c
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 838
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_26
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ge v5, v8, :cond_86

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ge v5, v8, :cond_86

    .line 839
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 840
    .local v7, "theKey":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_50
    .catchall {:try_start_1c .. :try_end_50} :catchall_7b

    move-result-object v2

    .line 842
    .local v2, "entry":Ljava/lang/String;
    :try_start_51
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 843
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_64

    .line 844
    invoke-static {v4}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V

    .line 845
    const-string v8, "LSF"

    invoke-direct {p0, v7, v8}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->notifyDiskCacheEviction(Ljava/lang/String;Ljava/lang/String;)V

    .line 847
    :cond_64
    invoke-direct {p0, v7}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->removeEntryFromCacheMetadata(Ljava/lang/String;)V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_67} :catch_6c
    .catchall {:try_start_51 .. :try_end_67} :catchall_7b

    .line 838
    .end local v4    # "file":Ljava/io/File;
    :goto_67
    add-int/lit8 v5, v5, 0x1

    goto :goto_26

    .line 829
    .end local v0    # "count":Ljava/lang/Integer;
    .end local v2    # "entry":Ljava/lang/String;
    .end local v3    # "evictionCount":Ljava/lang/Integer;
    .end local v5    # "i":I
    .end local v6    # "sortedKeySet":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    .end local v7    # "theKey":Ljava/lang/String;
    :cond_6a
    const/4 v8, 0x3

    goto :goto_6

    .line 848
    .restart local v0    # "count":Ljava/lang/Integer;
    .restart local v2    # "entry":Ljava/lang/String;
    .restart local v3    # "evictionCount":Ljava/lang/Integer;
    .restart local v5    # "i":I
    .restart local v6    # "sortedKeySet":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    .restart local v7    # "theKey":Ljava/lang/String;
    :catch_6c
    move-exception v1

    .line 849
    .local v1, "e":Ljava/io/IOException;
    :try_start_6d
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v9, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Could not remove cached file"

    invoke-static {v8, v9, v10, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7a
    .catchall {:try_start_6d .. :try_end_7a} :catchall_7b

    goto :goto_67

    .line 853
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "entry":Ljava/lang/String;
    .end local v5    # "i":I
    .end local v7    # "theKey":Ljava/lang/String;
    :catchall_7b
    move-exception v8

    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v8

    .restart local v5    # "i":I
    :cond_86
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 855
    return-void
.end method

.method private logDiskCacheHit(Ljava/lang/String;Ljava/lang/String;J)V
    .registers 10
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "msLatency"    # J

    .prologue
    .line 1169
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheHits:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheHits:I

    .line 1170
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Disk cache hit for key:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " with guid "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " and latency "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 1171
    return-void
.end method

.method private logMemCacheHit(Ljava/lang/String;Ljava/lang/String;J)V
    .registers 10
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "msLatency"    # J

    .prologue
    .line 1372
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCacheHits:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCacheHits:I

    .line 1373
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Mem cache hit for key:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " with guid "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " and latency "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 1374
    return-void
.end method

.method private lruEviction(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;)V
    .registers 13
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    .prologue
    .line 747
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->AdobeCommonCacheCriticalEviction:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    if-ne p1, v7, :cond_a0

    const/16 v7, 0xa

    :goto_6
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 750
    .local v1, "evictionCount":Ljava/lang/Integer;
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheAccessTimes:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 752
    .local v0, "count":Ljava/lang/Integer;
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheAccessTimes:Ljava/util/Map;

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->lruComparator:Ljava/util/Comparator;

    invoke-direct {p0, v7, v8}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getEntrySetsSortedByValue(Ljava/util/Map;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v4

    .line 756
    .local v4, "sortedEntrySet":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    :try_start_1c
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 758
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_26
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ge v3, v7, :cond_d1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ge v3, v7, :cond_d1

    .line 759
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 761
    .local v6, "theKey":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    invoke-direct {v2, v7, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 763
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_a3

    .line 765
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v5

    .line 766
    .local v5, "status":Z
    const-string v7, "LRU"

    invoke-direct {p0, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->notifyDiskCacheEviction(Ljava/lang/String;Ljava/lang/String;)V

    .line 767
    if-nez v5, :cond_78

    .line 768
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Could not remove cached file in disk"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 771
    .end local v5    # "status":Z
    :cond_78
    :goto_78
    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->removeEntryFromCacheMetadata(Ljava/lang/String;)V

    .line 773
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Removing file in cache : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 758
    add-int/lit8 v3, v3, 0x1

    goto :goto_26

    .line 747
    .end local v0    # "count":Ljava/lang/Integer;
    .end local v1    # "evictionCount":Ljava/lang/Integer;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "i":I
    .end local v4    # "sortedEntrySet":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    .end local v6    # "theKey":Ljava/lang/String;
    :cond_a0
    const/4 v7, 0x3

    goto/16 :goto_6

    .line 770
    .restart local v0    # "count":Ljava/lang/Integer;
    .restart local v1    # "evictionCount":Ljava/lang/Integer;
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "i":I
    .restart local v4    # "sortedEntrySet":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    .restart local v6    # "theKey":Ljava/lang/String;
    :cond_a3
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "File doesn\'t exist in disk: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c5
    .catchall {:try_start_1c .. :try_end_c5} :catchall_c6

    goto :goto_78

    .line 777
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "i":I
    .end local v6    # "theKey":Ljava/lang/String;
    :catchall_c6
    move-exception v7

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v7

    .restart local v3    # "i":I
    :cond_d1
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 779
    return-void
.end method

.method private notifyDiskCacheEviction(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "theKey"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 930
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Disk cache eviction for key:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".Type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 931
    return-void
.end method

.method private printDiskCacheMetadata()V
    .registers 11

    .prologue
    .line 1058
    :try_start_0
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 1059
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Got Read lock in printDiskCacheMetadata.Current lock count "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 1060
    const-string v2, "============================================"

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 1061
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Disk Cache Size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 1062
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Disk Cache Location: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 1064
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->evictionPolicy:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLSF:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    if-ne v2, v3, :cond_e9

    .line 1065
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheObjectSizes:Ljava/util/Map;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->numberComparator:Ljava/util/Comparator;

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getEntrySetsSortedByValue(Ljava/util/Map;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v1

    .line 1067
    .local v1, "entrySets":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    const-string v2, "============================================"

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 1068
    const-string v2, "Eviction Policy: Large Size First"

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 1069
    const-string v2, "Sorted Object Size Dictionary"

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 1071
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_83
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1072
    .local v0, "entrySet":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " : "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "bytes"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V
    :try_end_b9
    .catchall {:try_start_0 .. :try_end_b9} :catchall_ba

    goto :goto_83

    .line 1104
    .end local v0    # "entrySet":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    .end local v1    # "entrySets":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    :catchall_ba
    move-exception v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 1105
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Read lock released in printDiskCacheMetadata.Holding "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    throw v2

    .line 1076
    :cond_e9
    :try_start_e9
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->evictionPolicy:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLRU:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    if-ne v2, v3, :cond_14e

    .line 1078
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheAccessTimes:Ljava/util/Map;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->numberComparator:Ljava/util/Comparator;

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getEntrySetsSortedByValue(Ljava/util/Map;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v1

    .line 1080
    .restart local v1    # "entrySets":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    const-string v2, "============================================"

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 1081
    const-string v2, "Eviction Policy: Least Recently Used"

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 1082
    const-string v2, "Sorted Access Times Dictionary"

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 1084
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_10a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1085
    .restart local v0    # "entrySet":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " : "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/text/DateFormat;->getInstance()Ljava/text/DateFormat;

    move-result-object v5

    new-instance v6, Ljava/util/Date;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-direct {v6, v8, v9}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v5, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    goto :goto_10a

    .line 1102
    .end local v0    # "entrySet":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    .end local v1    # "entrySets":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;>;"
    :cond_14e
    const-string v2, ""

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V
    :try_end_153
    .catchall {:try_start_e9 .. :try_end_153} :catchall_ba

    .line 1104
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 1105
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Read lock released in printDiskCacheMetadata.Holding "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 1108
    return-void
.end method

.method private removeEntryFromCacheMetadata(Ljava/lang/String;)V
    .registers 15
    .param p1, "keyPath"    # Ljava/lang/String;

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 905
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheObjectSizes:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 906
    .local v4, "fileSize":J
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheCreateTimes:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 907
    .local v2, "fileCreateTime":J
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheAccessTimes:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 909
    .local v0, "fileAccessTime":J
    const-string v6, "( %d ): Deleted metadata from %s: (AT: %s) (CT: %s) (Sz: %d)"

    const/4 v7, 0x5

    new-array v7, v7, [Ljava/lang/Object;

    iget-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v10

    aput-object p1, v7, v11

    .line 910
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v12

    const/4 v8, 0x3

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    .line 909
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 912
    iget-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheObjectSizes:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    sub-long v6, v8, v6

    iput-wide v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    .line 914
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheAccessTimes:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 915
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheCreateTimes:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 916
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheObjectSizes:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 918
    iget-wide v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getNormalEvictionThreshold()I

    move-result v8

    int-to-long v8, v8

    cmp-long v6, v6, v8

    if-gez v6, :cond_c4

    .line 920
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->repeatingTimer:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v6, :cond_c4

    .line 921
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "===== Sync stop timer at "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/text/SimpleDateFormat;->getInstance()Ljava/text/DateFormat;

    move-result-object v7

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8}, Ljava/util/Date;-><init>()V

    invoke-virtual {v7, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 922
    const-string v6, "Stopping eviction timer: %d < %d"

    new-array v7, v12, [Ljava/lang/Object;

    iget-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getNormalEvictionThreshold()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 923
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->stopRepeatingTimer()V

    .line 926
    :cond_c4
    return-void
.end method

.method private setObjectToDisk(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 14
    .param p2, "guid"    # Ljava/lang/String;
    .param p3, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1133
    .local p1, "object":Ljava/lang/Object;, "TT;"
    iget-boolean v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheFrozen:Z

    if-nez v6, :cond_8

    instance-of v6, p1, Ljava/io/Serializable;

    if-nez v6, :cond_9

    .line 1166
    :cond_8
    :goto_8
    return-void

    .line 1136
    :cond_9
    iget-boolean v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->useDiskCaching:Z

    if-eqz v6, :cond_8

    .line 1137
    const/4 v1, 0x0

    .line 1138
    .local v1, "fos":Ljava/io/FileOutputStream;
    const/4 v3, 0x0

    .line 1140
    .local v3, "oos":Ljava/io/ObjectOutputStream;
    :try_start_f
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 1141
    new-instance v5, Ljava/io/File;

    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheDirectoryForGuid(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    invoke-direct {v5, v6, p3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1142
    .local v5, "outputFile":Ljava/io/File;
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_26} :catch_90
    .catchall {:try_start_f .. :try_end_26} :catchall_d7

    .line 1143
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .local v2, "fos":Ljava/io/FileOutputStream;
    :try_start_26
    new-instance v4, Ljava/io/ObjectOutputStream;

    invoke-direct {v4, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_2b} :catch_116
    .catchall {:try_start_26 .. :try_end_2b} :catchall_10f

    .line 1144
    .end local v3    # "oos":Ljava/io/ObjectOutputStream;
    .local v4, "oos":Ljava/io/ObjectOutputStream;
    :try_start_2b
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v7, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Adding "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " to disk cache"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 1145
    invoke-virtual {v4, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 1146
    invoke-direct {p0, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->addEntryToCacheMetadata(Ljava/io/File;Ljava/lang/String;)V
    :try_end_59
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_59} :catch_11a
    .catchall {:try_start_2b .. :try_end_59} :catchall_112

    .line 1152
    if-eqz v4, :cond_5e

    .line 1153
    :try_start_5b
    invoke-virtual {v4}, Ljava/io/ObjectOutputStream;->close()V

    .line 1154
    :cond_5e
    if-eqz v2, :cond_63

    .line 1155
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_63
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_63} :catch_6d
    .catchall {:try_start_5b .. :try_end_63} :catchall_85

    .line 1161
    :cond_63
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    goto :goto_8

    .line 1158
    :catch_6d
    move-exception v0

    .line 1159
    .local v0, "e":Ljava/io/IOException;
    :try_start_6e
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v7, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Error closing stream"

    invoke-static {v6, v7, v8, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7b
    .catchall {:try_start_6e .. :try_end_7b} :catchall_85

    .line 1161
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    goto :goto_8

    .end local v0    # "e":Ljava/io/IOException;
    :catchall_85
    move-exception v6

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v6

    .line 1148
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .end local v4    # "oos":Ljava/io/ObjectOutputStream;
    .end local v5    # "outputFile":Ljava/io/File;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "oos":Ljava/io/ObjectOutputStream;
    :catch_90
    move-exception v0

    .line 1149
    .restart local v0    # "e":Ljava/io/IOException;
    :goto_91
    :try_start_91
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v7, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Error serializing map"

    invoke-static {v6, v7, v8, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9e
    .catchall {:try_start_91 .. :try_end_9e} :catchall_d7

    .line 1152
    if-eqz v3, :cond_a3

    .line 1153
    :try_start_a0
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V

    .line 1154
    :cond_a3
    if-eqz v1, :cond_a8

    .line 1155
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_a8
    .catch Ljava/io/IOException; {:try_start_a0 .. :try_end_a8} :catch_b3
    .catchall {:try_start_a0 .. :try_end_a8} :catchall_cc

    .line 1161
    :cond_a8
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    goto/16 :goto_8

    .line 1158
    :catch_b3
    move-exception v0

    .line 1159
    :try_start_b4
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v7, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Error closing stream"

    invoke-static {v6, v7, v8, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_c1
    .catchall {:try_start_b4 .. :try_end_c1} :catchall_cc

    .line 1161
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    goto/16 :goto_8

    :catchall_cc
    move-exception v6

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v6

    .line 1151
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_d7
    move-exception v6

    .line 1152
    :goto_d8
    if-eqz v3, :cond_dd

    .line 1153
    :try_start_da
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V

    .line 1154
    :cond_dd
    if-eqz v1, :cond_e2

    .line 1155
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_e2
    .catch Ljava/io/IOException; {:try_start_da .. :try_end_e2} :catch_ec
    .catchall {:try_start_da .. :try_end_e2} :catchall_104

    .line 1161
    :cond_e2
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    :goto_eb
    throw v6

    .line 1158
    :catch_ec
    move-exception v0

    .line 1159
    .restart local v0    # "e":Ljava/io/IOException;
    :try_start_ed
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Error closing stream"

    invoke-static {v7, v8, v9, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_fa
    .catchall {:try_start_ed .. :try_end_fa} :catchall_104

    .line 1161
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    goto :goto_eb

    .end local v0    # "e":Ljava/io/IOException;
    :catchall_104
    move-exception v6

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v6

    .line 1151
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "outputFile":Ljava/io/File;
    :catchall_10f
    move-exception v6

    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_d8

    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .end local v3    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "oos":Ljava/io/ObjectOutputStream;
    :catchall_112
    move-exception v6

    move-object v3, v4

    .end local v4    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v3    # "oos":Ljava/io/ObjectOutputStream;
    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_d8

    .line 1148
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_116
    move-exception v0

    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto/16 :goto_91

    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .end local v3    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "oos":Ljava/io/ObjectOutputStream;
    :catch_11a
    move-exception v0

    move-object v3, v4

    .end local v4    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v3    # "oos":Ljava/io/ObjectOutputStream;
    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto/16 :goto_91
.end method

.method private startRepeatingTimer()V
    .registers 8

    .prologue
    .line 1027
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->repeatingTimer:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_a

    .line 1028
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->repeatingTimer:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 1029
    :cond_a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->scheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)V

    const-wide/16 v2, 0x0

    const-wide/32 v4, 0xea60

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->repeatingTimer:Ljava/util/concurrent/ScheduledFuture;

    .line 1042
    return-void
.end method

.method private stopRepeatingTimer()V
    .registers 3

    .prologue
    .line 1048
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->repeatingTimer:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_a

    .line 1049
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->repeatingTimer:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 1050
    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->repeatingTimer:Ljava/util/concurrent/ScheduledFuture;

    .line 1051
    return-void
.end method


# virtual methods
.method public addObject(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;)V
    .registers 9
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "guid"    # Ljava/lang/String;
    .param p3, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    const-wide/16 v2, 0x0

    .line 412
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheFrozen:Z

    if-eqz v0, :cond_7

    .line 423
    :cond_6
    :goto_6
    return-void

    .line 415
    :cond_7
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-virtual {p4, v0}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCacheSize:D

    cmpl-double v0, v0, v2

    if-lez v0, :cond_1e

    .line 416
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    invoke-direct {p0, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    :cond_1e
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepOnDiskCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-virtual {p4, v0}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheSize:D

    cmpl-double v0, v0, v2

    if-lez v0, :cond_6

    .line 420
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->setObjectToDisk(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6
.end method

.method public clear()V
    .registers 6

    .prologue
    .line 198
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->clearMemCache()V

    .line 200
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->repeatingTimer:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v2, :cond_a

    .line 201
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->stopRepeatingTimer()V

    .line 205
    :cond_a
    :try_start_a
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 207
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 208
    .local v1, "file":Ljava/io/File;
    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V

    .line 209
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cache with cache name "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " deleted from location "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_41} :catch_4b
    .catchall {:try_start_a .. :try_end_41} :catchall_87

    .line 214
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 217
    .end local v1    # "file":Ljava/io/File;
    :goto_4a
    return-void

    .line 210
    :catch_4b
    move-exception v0

    .line 211
    .local v0, "e":Ljava/io/IOException;
    :try_start_4c
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Error deleting cache directory"

    invoke-static {v2, v3, v4, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 212
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to delete cache "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " from location "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V
    :try_end_7d
    .catchall {:try_start_4c .. :try_end_7d} :catchall_87

    .line 214
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    goto :goto_4a

    .end local v0    # "e":Ljava/io/IOException;
    :catchall_87
    move-exception v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v2
.end method

.method public configureCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IDLcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;Z)V
    .registers 22
    .param p1, "cacheName"    # Ljava/lang/String;
    .param p2, "adobeId"    # Ljava/lang/String;
    .param p3, "rootCacheDir"    # Ljava/lang/String;
    .param p4, "memCacheSize"    # I
    .param p5, "diskCacheSize"    # D
    .param p7, "cacheEviction"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;
    .param p8, "allowOfflineUse"    # Z

    .prologue
    .line 239
    if-nez p2, :cond_8

    .line 240
    const-string v7, "Cannot configure a cache without an adobeID"

    invoke-direct {p0, v7}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 295
    .end local p5    # "diskCacheSize":D
    :goto_7
    return-void

    .line 244
    .restart local p5    # "diskCacheSize":D
    :cond_8
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheName:Ljava/lang/String;

    .line 245
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheAdobeId:Ljava/lang/String;

    .line 246
    move-object/from16 v0, p7

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->evictionPolicy:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    .line 248
    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    move/from16 v0, p4

    invoke-direct {v7, v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;-><init>(I)V

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    .line 253
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 256
    .local v3, "charString":Ljava/lang/String;
    :try_start_2a
    const-string v7, "SHA-1"

    .line 257
    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_2f
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2a .. :try_end_2f} :catch_af

    move-result-object v4

    .line 259
    .local v4, "digest":Ljava/security/MessageDigest;
    :try_start_30
    const-string v7, "UTF-8"

    invoke-virtual {v3, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/security/MessageDigest;->update([B)V
    :try_end_39
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_30 .. :try_end_39} :catch_a6
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_30 .. :try_end_39} :catch_af

    .line 265
    :goto_39
    :try_start_39
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v6

    .line 266
    .local v6, "messageDigest":[B
    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/utils/Util;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v2

    .line 268
    .local v2, "adobeIdPath":Ljava/lang/String;
    if-eqz p8, :cond_be

    .line 269
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x37

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 273
    :goto_56
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    .line 275
    const/16 v7, 0xc8

    move/from16 v0, p4

    if-gt v0, v7, :cond_d2

    move/from16 v0, p4

    int-to-double v8, v0

    :goto_86
    iput-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCacheSize:D

    .line 277
    const-wide/high16 v8, 0x41b0000000000000L

    cmpg-double v7, p5, v8

    if-gtz v7, :cond_d5

    .end local p5    # "diskCacheSize":D
    :goto_8e
    move-wide/from16 v0, p5

    iput-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheSize:D

    .line 279
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->clearMemCache()V
    :try_end_95
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_39 .. :try_end_95} :catch_af

    .line 286
    .end local v2    # "adobeIdPath":Ljava/lang/String;
    .end local v4    # "digest":Ljava/security/MessageDigest;
    .end local v6    # "messageDigest":[B
    :goto_95
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->initDiskCacheMetadata()V

    .line 287
    sget-boolean v7, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->$assertionsDisabled:Z

    if-nez v7, :cond_d8

    iget-boolean v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheFrozen:Z

    if-eqz v7, :cond_d8

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 260
    .restart local v4    # "digest":Ljava/security/MessageDigest;
    .restart local p5    # "diskCacheSize":D
    :catch_a6
    move-exception v5

    .line 261
    .local v5, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_a7
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/security/MessageDigest;->update([B)V
    :try_end_ae
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_a7 .. :try_end_ae} :catch_af

    goto :goto_39

    .line 281
    .end local v4    # "digest":Ljava/security/MessageDigest;
    .end local v5    # "e":Ljava/io/UnsupportedEncodingException;
    .end local p5    # "diskCacheSize":D
    :catch_af
    move-exception v5

    .line 282
    .local v5, "e":Ljava/security/NoSuchAlgorithmException;
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "MD5 Hash not available. Using unencrypted string"

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_95

    .line 271
    .end local v5    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v2    # "adobeIdPath":Ljava/lang/String;
    .restart local v4    # "digest":Ljava/security/MessageDigest;
    .restart local v6    # "messageDigest":[B
    .restart local p5    # "diskCacheSize":D
    :cond_be
    :try_start_be
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x38

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_d0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_be .. :try_end_d0} :catch_af

    move-result-object v2

    goto :goto_56

    .line 275
    :cond_d2
    const-wide/high16 v8, 0x4069000000000000L

    goto :goto_86

    .line 277
    :cond_d5
    const-wide/high16 p5, 0x41b0000000000000L

    goto :goto_8e

    .line 288
    .end local v2    # "adobeIdPath":Ljava/lang/String;
    .end local v4    # "digest":Ljava/security/MessageDigest;
    .end local v6    # "messageDigest":[B
    .end local p5    # "diskCacheSize":D
    :cond_d8
    iget-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getNormalEvictionThreshold()I

    move-result v7

    int-to-long v10, v7

    cmp-long v7, v8, v10

    if-lez v7, :cond_e6

    .line 289
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheEviction()V

    .line 292
    :cond_e6
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->printDiskCacheMetadata()V

    goto/16 :goto_7
.end method

.method public containsItemWithGUID(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 12
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 436
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 438
    .local v2, "item":Ljava/lang/Object;
    if-eqz v2, :cond_e

    .line 439
    const/4 v3, 0x1

    .line 453
    .local v3, "result":Z
    :goto_d
    return v3

    .line 441
    .end local v3    # "result":Z
    :cond_e
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheDir:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 443
    .local v1, "inputPath":Ljava/lang/String;
    :try_start_2b
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 444
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Got Read lock in containsItemWithGUID.Current lock count "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 445
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 446
    .local v0, "inputFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z
    :try_end_60
    .catchall {:try_start_2b .. :try_end_60} :catchall_90

    move-result v3

    .line 448
    .restart local v3    # "result":Z
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 449
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Released read lock in containsItemWithGUID.Current lock count "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_d

    .line 448
    .end local v0    # "inputFile":Ljava/io/File;
    .end local v3    # "result":Z
    :catchall_90
    move-exception v4

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 449
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Released read lock in containsItemWithGUID.Current lock count "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    throw v4
.end method

.method protected finalize()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 182
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 183
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->clearMemCache()V

    .line 184
    return-void
.end method

.method public freezeCache(Z)V
    .registers 3
    .param p1, "freeze"    # Z

    .prologue
    .line 1397
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheFrozen:Z

    .line 1398
    if-nez p1, :cond_8

    const/4 v0, 0x1

    :goto_5
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->useDiskCaching:Z

    .line 1399
    return-void

    .line 1398
    :cond_8
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public getCacheAdobeId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheAdobeId:Ljava/lang/String;

    return-object v0
.end method

.method public getObjectFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;)Ljava/lang/Object;
    .registers 7
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 596
    .local p3, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    if-eqz p1, :cond_4

    if-nez p2, :cond_6

    .line 597
    :cond_4
    const/4 v0, 0x0

    .line 603
    :cond_5
    :goto_5
    return-object v0

    .line 599
    :cond_6
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 600
    .local v0, "result":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_5

    .line 601
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getObjectFromDiskWithGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_5
.end method

.method public getObjectFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
    .registers 14
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p5, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler",
            "<TT;>;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 564
    .local p3, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    .local p4, "callback":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<TT;>;"
    if-eqz p1, :cond_4

    if-nez p2, :cond_b

    .line 565
    :cond_4
    const/4 v4, 0x0

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;->AdobeCommonCacheHitLocationMemory:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    invoke-direct {p0, p4, p5, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->callHitHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V

    .line 579
    :goto_a
    return-void

    .line 569
    :cond_b
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    .line 570
    .local v3, "startTime":Ljava/util/Date;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 572
    .local v2, "result":Ljava/lang/Object;, "TT;"
    if-eqz v2, :cond_34

    .line 573
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    sub-long v0, v4, v6

    .line 574
    .local v0, "msLatency":J
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->logMemCacheHit(Ljava/lang/String;Ljava/lang/String;J)V

    .line 575
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;->AdobeCommonCacheHitLocationMemory:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    invoke-direct {p0, p4, p5, v2, v4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->callHitHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V

    goto :goto_a

    .line 577
    .end local v0    # "msLatency":J
    :cond_34
    invoke-direct/range {p0 .. p5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getObjectFromDiskWithGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V

    goto :goto_a
.end method

.method public getTimestampForGUID(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Date;
    .registers 7
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 1402
    const/4 v1, 0x0

    .line 1404
    .local v1, "result":Ljava/util/Date;
    new-instance v0, Ljava/io/File;

    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheDirectoryForGuid(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-direct {v0, v2, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1406
    .local v0, "cacheFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 1408
    new-instance v1, Ljava/util/Date;

    .end local v1    # "result":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 1411
    .restart local v1    # "result":Ljava/util/Date;
    :cond_19
    return-object v1
.end method

.method protected printStatistics()V
    .registers 21

    .prologue
    .line 302
    const-string v12, "====================================================="

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 303
    const-string v12, "Cache Stats:"

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 304
    const-string v12, ""

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 306
    move-object/from16 v0, p0

    iget v12, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCacheHits:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheHits:I

    add-int/2addr v12, v13

    move-object/from16 v0, p0

    iget v13, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheMisses:I

    add-int v9, v12, v13

    .line 308
    .local v9, "totalAccesses":I
    const-wide/16 v6, 0x0

    .line 309
    .local v6, "memCacheHitRate":D
    const-wide/16 v4, 0x0

    .line 310
    .local v4, "diskCacheHitRate":D
    const-wide/16 v2, 0x0

    .line 313
    .local v2, "cacheMissRate":D
    if-eqz v9, :cond_4d

    .line 314
    const-wide/high16 v12, 0x4059000000000000L

    move-object/from16 v0, p0

    iget v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCacheHits:I

    int-to-double v14, v14

    mul-double/2addr v12, v14

    int-to-double v14, v9

    div-double v6, v12, v14

    .line 315
    const-wide/high16 v12, 0x4059000000000000L

    move-object/from16 v0, p0

    iget v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheHits:I

    int-to-double v14, v14

    mul-double/2addr v12, v14

    int-to-double v14, v9

    div-double v4, v12, v14

    .line 316
    const-wide/high16 v12, 0x4059000000000000L

    move-object/from16 v0, p0

    iget v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheMisses:I

    int-to-double v14, v14

    mul-double/2addr v12, v14

    int-to-double v14, v9

    div-double v2, v12, v14

    .line 318
    :cond_4d
    add-double v12, v6, v4

    add-double v10, v12, v2

    .line 320
    .local v10, "totalRate":D
    const-string v8, "%s %6.2f%% %6d"

    .line 321
    .local v8, "rateFormat":Ljava/lang/String;
    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Memory cache hit rate:"

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x2

    move-object/from16 v0, p0

    iget v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCacheHits:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v8, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 322
    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Disk cache hit rate:"

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x2

    move-object/from16 v0, p0

    iget v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheHits:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v8, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 323
    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Cache miss rate:"

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x2

    move-object/from16 v0, p0

    iget v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheMisses:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v8, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 324
    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Total:"

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v8, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 344
    const-string v12, ""

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 346
    const-string v12, ""

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 347
    const-string v12, "Disk Cache Usage: %6.2f%% %d bytes"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-wide/high16 v16, 0x4059000000000000L

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    long-to-double v0, v0

    move-wide/from16 v18, v0

    mul-double v16, v16, v18

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskCacheSize:D

    move-wide/from16 v18, v0

    div-double v16, v16, v18

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J

    move-wide/from16 v16, v0

    .line 348
    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    aput-object v15, v13, v14

    .line 347
    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 350
    const-string v12, ""

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 351
    const-string v12, "====================================================="

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 352
    const-string v12, ""

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V

    .line 354
    return-void
.end method

.method public removeItemWithGUID(Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 464
    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheFrozen:Z

    if-eqz v2, :cond_5

    .line 491
    :goto_4
    return-void

    .line 467
    :cond_5
    const/4 v0, 0x0

    .line 469
    .local v0, "inputFile":Ljava/io/File;
    if-eqz p2, :cond_89

    .line 471
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    new-instance v0, Ljava/io/File;

    .end local v0    # "inputFile":Ljava/io/File;
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheDirectoryForGuid(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-direct {v0, v2, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 478
    .restart local v0    # "inputFile":Ljava/io/File;
    :goto_1a
    :try_start_1a
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 480
    if-eqz v0, :cond_7e

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_7e

    .line 481
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Removing "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " from disk cache"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v1

    .line 483
    .local v1, "success":Z
    if-nez v1, :cond_77

    .line 484
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cannot delete file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    :cond_77
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->removeEntryFromCacheMetadata(Ljava/lang/String;)V
    :try_end_7e
    .catchall {:try_start_1a .. :try_end_7e} :catchall_8d

    .line 488
    .end local v1    # "success":Z
    :cond_7e
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    goto/16 :goto_4

    .line 475
    :cond_89
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->clearMemCache()V

    goto :goto_1a

    .line 488
    :catchall_8d
    move-exception v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v2
.end method

.method public removeSetWithGUID(Ljava/lang/String;)V
    .registers 10
    .param p1, "guid"    # Ljava/lang/String;

    .prologue
    .line 499
    iget-boolean v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheFrozen:Z

    if-eqz v5, :cond_5

    .line 525
    :goto_4
    return-void

    .line 502
    :cond_5
    :try_start_5
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 503
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheDirectoryForGuid(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 506
    .local v4, "setDirectory":Ljava/io/File;
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->clearMemCache()V

    .line 508
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_63

    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_63

    .line 509
    sget-object v5, Lorg/apache/commons/io/filefilter/TrueFileFilter;->INSTANCE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    sget-object v6, Lorg/apache/commons/io/filefilter/TrueFileFilter;->INSTANCE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    invoke-static {v4, v5, v6}, Lorg/apache/commons/io/FileUtils;->listFiles(Ljava/io/File;Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Ljava/util/Collection;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 510
    .local v2, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2f
    :goto_2f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_60

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 511
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 512
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_2f

    const-string v6, "modified-data"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2f

    .line 513
    invoke-direct {p0, p1, v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->removeEntryFromCacheMetadata(Ljava/lang/String;)V
    :try_end_54
    .catchall {:try_start_5 .. :try_end_54} :catchall_55

    goto :goto_2f

    .line 523
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "setDirectory":Ljava/io/File;
    :catchall_55
    move-exception v5

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v5

    .line 517
    .restart local v2    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .restart local v4    # "setDirectory":Ljava/io/File;
    :cond_60
    :try_start_60
    invoke-static {v4}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V
    :try_end_63
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_63} :catch_6d
    .catchall {:try_start_60 .. :try_end_63} :catchall_55

    .line 523
    .end local v2    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    :cond_63
    :goto_63
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    goto :goto_4

    .line 518
    .restart local v2    # "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    :catch_6d
    move-exception v0

    .line 519
    .local v0, "e":Ljava/io/IOException;
    :try_start_6e
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Error deleting directory from cache"

    invoke-static {v5, v6, v7, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7b
    .catchall {:try_start_6e .. :try_end_7b} :catchall_55

    goto :goto_63
.end method
