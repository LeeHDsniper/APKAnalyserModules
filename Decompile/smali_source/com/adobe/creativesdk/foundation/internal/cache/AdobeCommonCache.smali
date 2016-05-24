.class public Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;
.super Ljava/lang/Object;
.source "AdobeCommonCache.java"


# static fields
.field private static final CACHE_VERSION:Ljava/lang/Integer;

.field private static context:Landroid/content/Context;

.field private static volatile instance:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;


# instance fields
.field private cacheDirPattern:Ljava/util/regex/Pattern;

.field cacheInstances:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;",
            ">;"
        }
    .end annotation
.end field

.field private currentCacheVerion:I

.field private executorService:Ljava/util/concurrent/ExecutorService;

.field private final rootCacheDir:Ljava/lang/String;

.field private scrubAge:I

.field private scrubPeriod:I

.field private scrubbingFuture:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field private scrubbingTimer:Ljava/util/concurrent/ScheduledExecutorService;

.field private sharedPreferences:Landroid/content/SharedPreferences;

.field private verboseLogging:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 780
    const/16 v0, 0x8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->CACHE_VERSION:Ljava/lang/Integer;

    return-void
.end method

.method private constructor <init>()V
    .registers 5

    .prologue
    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const-string v1, "^[a-zA-Z0-9]{33}$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheDirPattern:Ljava/util/regex/Pattern;

    .line 178
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    .line 179
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sput-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->context:Landroid/content/Context;

    .line 180
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->rootCacheDir:Ljava/lang/String;

    .line 182
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->context:Landroid/content/Context;

    const-string v2, "Foundation"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 183
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v2, "CCCache.version"

    const/4 v3, -0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->currentCacheVerion:I

    .line 184
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->currentCacheVerion:I

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->CACHE_VERSION:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v1, v2, :cond_5f

    .line 185
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeAllCaches()V

    .line 186
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 187
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v1, "CCCache.version"

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->CACHE_VERSION:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 188
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 193
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_5f
    const v1, 0x5265c00

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubAge:I

    .line 194
    const v1, 0x1b7740

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubPeriod:I

    .line 196
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubAge:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeDiskCachesOlderThan(I)V

    .line 197
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->startScrubbingTimer()V

    .line 201
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 203
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$3;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;)V

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 209
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    .prologue
    .line 51
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->verboseLogging:Z

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    .prologue
    .line 51
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubAge:I

    return v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;I)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;
    .param p1, "x1"    # I

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeDiskCachesOlderThan(I)V

    return-void
.end method

.method private getAvailabilityMode(Ljava/util/EnumSet;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 298
    .local p1, "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheAllowOfflineUse:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    invoke-virtual {p1, v0}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private getEvictionPolicy(Ljava/util/EnumSet;)Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;",
            ">;)",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;"
        }
    .end annotation

    .prologue
    .line 167
    .local p1, "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLSF:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    invoke-virtual {p1, v0}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 168
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLSF:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    .line 173
    :goto_a
    return-object v0

    .line 169
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLRU:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    invoke-virtual {p1, v0}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 170
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLRU:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    goto :goto_a

    .line 171
    :cond_16
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionFIFO:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    invoke-virtual {p1, v0}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 172
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionFIFO:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    goto :goto_a

    .line 173
    :cond_21
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCachePolicyUnset:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    goto :goto_a
.end method

.method private getFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z
    .registers 13
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p4, "cacheName"    # Ljava/lang/String;
    .param p6, "handler"    # Landroid/os/Handler;
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
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler",
            "<TT;>;",
            "Landroid/os/Handler;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 656
    .local p3, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    .local p5, "cacheCallback":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<TT;>;"
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 657
    .local v0, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    if-eqz v0, :cond_14

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p5

    move-object v5, p6

    .line 658
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getObjectFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V

    .line 659
    const/4 v1, 0x1

    .line 661
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public static getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
        }
    .end annotation

    .prologue
    .line 72
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->instance:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    if-nez v0, :cond_13

    .line 73
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    monitor-enter v1

    .line 74
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->instance:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    if-nez v0, :cond_12

    .line 75
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->instance:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    .line 77
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 79
    :cond_13
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->instance:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    return-object v0

    .line 77
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method private removeDiskCachesOlderThan(I)V
    .registers 16
    .param p1, "timeInMillis"    # I

    .prologue
    const/4 v8, 0x0

    .line 120
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->rootCacheDir:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 121
    .local v4, "rootDir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_39

    .line 122
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$2;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;)V

    invoke-virtual {v4, v5}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v2

    .line 129
    .local v2, "diskCaches":[Ljava/io/File;
    if-nez v2, :cond_3a

    .line 130
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Failed to access disk cache root directory at "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->rootCacheDir:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v5, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .end local v2    # "diskCaches":[Ljava/io/File;
    :cond_39
    :goto_39
    return-void

    .line 134
    .restart local v2    # "diskCaches":[Ljava/io/File;
    :cond_3a
    array-length v5, v2

    if-nez v5, :cond_4e

    .line 135
    iget-boolean v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->verboseLogging:Z

    if-eqz v5, :cond_4e

    .line 136
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v9, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Cache is Empty. Nothing to scrub"

    invoke-static {v5, v9, v10}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    :cond_4e
    const/4 v5, 0x1

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->freezeAllCaches(Z)V

    .line 139
    array-length v9, v2

    move v5, v8

    :goto_54
    if-ge v5, v9, :cond_da

    aget-object v1, v2, v5

    .line 140
    .local v1, "diskCache":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 143
    .local v0, "dirName":Ljava/lang/String;
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheDirPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v10, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/regex/Matcher;->matches()Z

    move-result v10

    if-eqz v10, :cond_b3

    const/16 v10, 0x20

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x37

    if-ne v10, v11, :cond_b3

    .line 145
    new-instance v10, Ljava/util/Date;

    invoke-direct {v10}, Ljava/util/Date;-><init>()V

    invoke-virtual {v10}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    sub-long v6, v10, v12

    .line 147
    .local v6, "timeSinceLastModification":J
    int-to-long v10, p1

    cmp-long v10, v6, v10

    if-lez v10, :cond_b3

    .line 149
    :try_start_8a
    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V

    .line 150
    iget-boolean v10, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->verboseLogging:Z

    if-eqz v10, :cond_b3

    .line 151
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v11, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Deleting disk cache at "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_8a .. :try_end_b3} :catch_b6

    .line 139
    .end local v6    # "timeSinceLastModification":J
    :cond_b3
    :goto_b3
    add-int/lit8 v5, v5, 0x1

    goto :goto_54

    .line 152
    .restart local v6    # "timeSinceLastModification":J
    :catch_b6
    move-exception v3

    .line 153
    .local v3, "e":Ljava/io/IOException;
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v11, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Error delecting disk cache during scrubbing : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_b3

    .line 159
    .end local v0    # "dirName":Ljava/lang/String;
    .end local v1    # "diskCache":Ljava/io/File;
    .end local v3    # "e":Ljava/io/IOException;
    .end local v6    # "timeSinceLastModification":J
    :cond_da
    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->freezeAllCaches(Z)V

    goto/16 :goto_39
.end method

.method private startScrubbingTimer()V
    .registers 8

    .prologue
    .line 91
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->stopScrubbingTimer()V

    .line 93
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubbingTimer:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v0, :cond_d

    .line 94
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubbingTimer:Ljava/util/concurrent/ScheduledExecutorService;

    .line 95
    :cond_d
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;)V

    .line 103
    .local v1, "r":Ljava/lang/Runnable;
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubbingTimer:Ljava/util/concurrent/ScheduledExecutorService;

    const-wide/16 v2, 0x0

    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubPeriod:I

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubbingFuture:Ljava/util/concurrent/ScheduledFuture;

    .line 104
    return-void
.end method

.method private stopScrubbingTimer()V
    .registers 2

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->stopScrubbingTimer(Z)V

    .line 109
    return-void
.end method

.method private stopScrubbingTimer(Z)V
    .registers 3
    .param p1, "forceShutdown"    # Z

    .prologue
    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubbingFuture:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_9

    .line 113
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubbingFuture:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 116
    :cond_9
    return-void
.end method


# virtual methods
.method public addData([BLjava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Z
    .registers 7
    .param p1, "data"    # [B
    .param p2, "guid"    # Ljava/lang/String;
    .param p3, "key"    # Ljava/lang/String;
    .param p5, "cacheName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 483
    .local p4, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    invoke-virtual/range {p0 .. p5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->addObject(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public addDictionary(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Z
    .registers 7
    .param p1, "map"    # Ljava/util/Map;
    .param p2, "guid"    # Ljava/lang/String;
    .param p3, "key"    # Ljava/lang/String;
    .param p5, "cacheName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 448
    .local p4, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    invoke-virtual/range {p0 .. p5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->addObject(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public addObject(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Z
    .registers 12
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "guid"    # Ljava/lang/String;
    .param p3, "key"    # Ljava/lang/String;
    .param p5, "cacheName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p4, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    const/4 v1, 0x0

    .line 503
    instance-of v2, p1, Ljava/io/Serializable;

    if-nez v2, :cond_2a

    .line 504
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Object is not serializable. Not adding "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to cache."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    :cond_29
    :goto_29
    return v1

    .line 508
    :cond_2a
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v2, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 509
    .local v0, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    if-eqz v0, :cond_29

    .line 510
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->addObject(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;)V

    .line 511
    const/4 v1, 0x1

    goto :goto_29
.end method

.method public clearAllCaches()V
    .registers 4

    .prologue
    .line 333
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 334
    .local v0, "stringAdobeCommonCacheInstanceEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->clear()V

    goto :goto_a

    .line 336
    .end local v0    # "stringAdobeCommonCacheInstanceEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;>;"
    :cond_20
    return-void
.end method

.method public configureCache(Ljava/lang/String;IDLjava/util/EnumSet;)V
    .registers 19
    .param p1, "cacheName"    # Ljava/lang/String;
    .param p2, "memCacheSize"    # I
    .param p3, "diskCacheSize"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ID",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
        }
    .end annotation

    .prologue
    .line 236
    .local p5, "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_10

    .line 237
    :cond_8
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;

    const-string v6, "Invalid cache name."

    invoke-direct {v4, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 240
    :cond_10
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCachePolicyUnset:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_29

    invoke-virtual/range {p5 .. p5}, Ljava/util/EnumSet;->size()I

    move-result v4

    const/4 v6, 0x1

    if-ne v4, v6, :cond_29

    .line 241
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;

    const-string v6, "Invalid cache policy."

    invoke-direct {v4, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 245
    :cond_29
    move-object/from16 v0, p5

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getEvictionPolicy(Ljava/util/EnumSet;)Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    move-result-object v10

    .line 246
    .local v10, "cacheEviction":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;
    move-object/from16 v0, p5

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getAvailabilityMode(Ljava/util/EnumSet;)Z

    move-result v11

    .line 250
    .local v11, "allowOfflineUse":Z
    if-nez v11, :cond_4f

    .line 251
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAdobeID()Ljava/lang/String;

    move-result-object v5

    .line 253
    .local v5, "adobeId":Ljava/lang/String;
    if-eqz v5, :cond_47

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_51

    .line 254
    :cond_47
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;

    const-string v6, "Cannot configure cache before logging in"

    invoke-direct {v4, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 259
    .end local v5    # "adobeId":Ljava/lang/String;
    :cond_4f
    const-string v5, "000000000000000000000000@AdobeID"

    .line 262
    .restart local v5    # "adobeId":Ljava/lang/String;
    :cond_51
    if-gez p2, :cond_6c

    .line 263
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Illegal memCacheSize value "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 266
    :cond_6c
    const/16 v4, 0xc8

    if-le p2, v4, :cond_a5

    .line 267
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "memCacheSize: %"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/high16 v8, 0x100000

    div-int v8, p2, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " MB exceeds maximum value.  Setting to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " MB."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    const/16 p2, 0xc8

    .line 271
    :cond_a5
    const-wide/16 v6, 0x0

    cmpg-double v4, p3, v6

    if-gez v4, :cond_c7

    .line 272
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Illegal diskCacheSize value: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, p3

    double-to-long v8, v0

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 275
    :cond_c7
    const-wide/high16 v6, 0x41b0000000000000L

    cmpl-double v4, p3, v6

    if-lez v4, :cond_103

    .line 276
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "diskCacheSize: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-wide/high16 v8, 0x4130000000000000L

    div-double v8, p3, v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "MB exceeds maximum value.  Setting to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-wide/high16 v8, 0x4070000000000000L

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "MB."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    const-wide/high16 p3, 0x41b0000000000000L

    .line 280
    :cond_103
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 282
    .local v3, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    if-nez v3, :cond_124

    .line 283
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-direct {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 284
    .local v2, "newInstance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v4, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    move-object v3, v2

    .line 293
    .end local v2    # "newInstance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    :cond_11a
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->rootCacheDir:Ljava/lang/String;

    move-object v4, p1

    move v7, p2

    move-wide/from16 v8, p3

    invoke-virtual/range {v3 .. v11}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->configureCache(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IDLcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;Z)V

    .line 295
    return-void

    .line 288
    :cond_124
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheAdobeId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_11a

    .line 289
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Attempt to reconfigure cache "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " with different AdobeID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " vs "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheAdobeId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public containsItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "cacheName"    # Ljava/lang/String;

    .prologue
    .line 528
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 530
    .local v0, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    if-eqz v0, :cond_f

    .line 531
    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->containsItemWithGUID(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 533
    :goto_e
    return v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public doesCacheExist(Ljava/lang/String;)Z
    .registers 3
    .param p1, "cacheName"    # Ljava/lang/String;

    .prologue
    .line 309
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public freezeAllCaches(Z)V
    .registers 5
    .param p1, "freeze"    # Z

    .prologue
    .line 382
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 384
    .local v0, "cacheIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;>;>;"
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 385
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 386
    .local v1, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->freezeCache(Z)V

    goto :goto_a

    .line 388
    .end local v1    # "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    :cond_20
    return-void
.end method

.method public getDataFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p4, "cacheName"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 678
    .local p3, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 679
    .local v0, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    if-eqz v0, :cond_f

    .line 680
    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getObjectFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;)Ljava/lang/Object;

    move-result-object v1

    .line 682
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getDataFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z
    .registers 8
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p4, "cacheName"    # Ljava/lang/String;
    .param p6, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler",
            "<[B>;",
            "Landroid/os/Handler;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 720
    .local p3, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    .local p5, "cacheCallback":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<[B>;"
    invoke-direct/range {p0 .. p6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z

    move-result v0

    return v0
.end method

.method public getDictionaryFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z
    .registers 8
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p4, "cacheName"    # Ljava/lang/String;
    .param p6, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Landroid/os/Handler;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 617
    .local p3, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    .local p5, "cacheCallback":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-direct/range {p0 .. p6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z

    move-result v0

    return v0
.end method

.method public getObjectFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z
    .registers 8
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p4, "cacheName"    # Ljava/lang/String;
    .param p6, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/os/Handler;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 637
    .local p3, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    .local p5, "cacheCallback":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<Ljava/lang/Object;>;"
    invoke-direct/range {p0 .. p6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z

    move-result v0

    return v0
.end method

.method public getTimestampForGUID(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Date;
    .registers 8
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "cacheName"    # Ljava/lang/String;

    .prologue
    .line 761
    const/4 v1, 0x0

    .line 763
    .local v1, "result":Ljava/util/Date;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    if-eqz v2, :cond_17

    .line 764
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    monitor-enter v3

    .line 765
    :try_start_8
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 767
    .local v0, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    if-eqz v0, :cond_16

    .line 768
    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getTimestampForGUID(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 770
    :cond_16
    monitor-exit v3

    .line 772
    .end local v0    # "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    :cond_17
    return-object v1

    .line 770
    :catchall_18
    move-exception v2

    monitor-exit v3
    :try_end_1a
    .catchall {:try_start_8 .. :try_end_1a} :catchall_18

    throw v2
.end method

.method public printStatistics(Ljava/lang/String;)V
    .registers 4
    .param p1, "cacheName"    # Ljava/lang/String;

    .prologue
    .line 726
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 727
    .local v0, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    if-eqz v0, :cond_d

    .line 728
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->printStatistics()V

    .line 730
    :cond_d
    return-void
.end method

.method public removeAllCaches()V
    .registers 9

    .prologue
    .line 739
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->rootCacheDir:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 740
    .local v4, "root":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_46

    .line 742
    :try_start_d
    invoke-static {v4}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_10} :catch_32

    .line 749
    :goto_10
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 750
    .local v0, "allCaches":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_41

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 751
    .local v1, "cacheName":Ljava/lang/String;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v6, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 752
    .local v3, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->clear()V

    goto :goto_1a

    .line 743
    .end local v0    # "allCaches":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v1    # "cacheName":Ljava/lang/String;
    .end local v3    # "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    :catch_32
    move-exception v2

    .line 744
    .local v2, "e":Ljava/io/IOException;
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Error removing cache"

    invoke-static {v5, v6, v7, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_10

    .line 754
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "allCaches":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_41
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    .line 757
    .end local v0    # "allCaches":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_46
    return-void
.end method

.method public removeCache(Ljava/lang/String;)Z
    .registers 4
    .param p1, "cacheName"    # Ljava/lang/String;

    .prologue
    .line 345
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 347
    .local v0, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    if-eqz v0, :cond_14

    .line 348
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->clear()V

    .line 349
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    const/4 v1, 0x1

    .line 352
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public removeItemWithGUID(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "cacheName"    # Ljava/lang/String;

    .prologue
    .line 547
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 549
    .local v0, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    if-eqz v0, :cond_f

    .line 550
    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->removeItemWithGUID(Ljava/lang/String;Ljava/lang/String;)V

    .line 551
    const/4 v1, 0x1

    .line 553
    :goto_e
    return v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public removeSetWithGUID(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "guid"    # Ljava/lang/String;
    .param p2, "cacheName"    # Ljava/lang/String;

    .prologue
    .line 565
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->cacheInstances:Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .line 568
    .local v0, "instance":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
    if-eqz v0, :cond_f

    .line 569
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->removeSetWithGUID(Ljava/lang/String;)V

    .line 570
    const/4 v1, 0x1

    .line 572
    :goto_e
    return v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method
