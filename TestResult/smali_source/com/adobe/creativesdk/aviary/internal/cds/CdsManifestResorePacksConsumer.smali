.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;
.super Ljava/lang/Object;
.source "CdsManifestResorePacksConsumer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDebug:Z

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

.field private final mIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

.field private final mServerRoot:Ljava/lang/String;

.field private final mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

.field private final mWifiOnly:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const-string v0, "AviaryCdsManifestPacksConsumer"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Ljava/util/Iterator;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "wifiOnly"    # Z
    .param p3, "threadPoolExecutor"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .param p4, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z",
            "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mWifiOnly:Z

    .line 40
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mContext:Landroid/content/Context;

    .line 41
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 42
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 43
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getServerUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mServerRoot:Ljava/lang/String;

    .line 44
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->isDebug(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mDebug:Z

    .line 45
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 46
    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mIterator:Ljava/util/Iterator;

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mExceptions:Ljava/util/List;

    .line 48
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Ljava/util/Iterator;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;)V
    .registers 7
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Z
    .param p3, "x2"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .param p4, "x3"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p5, "x4"    # Ljava/util/Iterator;
    .param p6, "x5"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;

    .prologue
    .line 24
    invoke-direct/range {p0 .. p5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;-><init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Ljava/util/Iterator;)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mServerRoot:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    .prologue
    .line 24
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mDebug:Z

    return v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    .prologue
    .line 24
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mWifiOnly:Z

    return v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mExceptions:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method private consumeNewPack()Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    .registers 2

    .prologue
    .line 156
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)V

    return-object v0
.end method


# virtual methods
.method consume()V
    .registers 16

    .prologue
    const/4 v4, 0x0

    const/4 v14, 0x1

    const/4 v13, 0x0

    .line 97
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 99
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .local v7, "builder":Ljava/lang/StringBuilder;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .local v6, "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_10
    :goto_10
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_40

    .line 104
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 105
    .local v12, "pname":Ljava/lang/String;
    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    const-string v0, "\'"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 109
    const-string v0, ","

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_10

    .line 113
    .end local v12    # "pname":Ljava/lang/String;
    :cond_40
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "legacy packs size: %d"

    new-array v2, v14, [Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v13

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 115
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mContext:Landroid/content/Context;

    const-string v2, "pack/content/list"

    .line 116
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    new-array v2, v14, [Ljava/lang/String;

    const-string v3, "pack_identifier"

    aput-object v3, v2, v13

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pack_identifier IN ("

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 118
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ")"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    .line 115
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 122
    .local v8, "cursor":Landroid/database/Cursor;
    if-eqz v8, :cond_c2

    .line 123
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "cursor size: %d"

    new-array v2, v14, [Ljava/lang/Object;

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v13

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 125
    :goto_9e
    :try_start_9e
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_bf

    .line 126
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 127
    .local v10, "identifier":Ljava/lang/String;
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "remove \'%s\' from the legacy array"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v10, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 128
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_b9
    .catchall {:try_start_9e .. :try_end_b9} :catchall_ba

    goto :goto_9e

    .line 131
    .end local v10    # "identifier":Ljava/lang/String;
    :catchall_ba
    move-exception v0

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0

    :cond_bf
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 135
    :cond_c2
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_c6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_ee

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 136
    .restart local v10    # "identifier":Ljava/lang/String;
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->consumeNewPack()Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;

    move-result-object v11

    .line 137
    .local v11, "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 138
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    aput-object v10, v2, v13

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getFormatListId()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v14

    invoke-virtual {v1, v11, v4, v2}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->submit(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)Lcom/adobe/creativesdk/aviary/internal/threading/Future;

    goto :goto_c6

    .line 142
    .end local v10    # "identifier":Ljava/lang/String;
    .end local v11    # "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    :cond_ee
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v1

    .line 143
    :goto_f1
    :try_start_f1
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-lez v0, :cond_11e

    .line 144
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "wait for locks... %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_110
    .catchall {:try_start_f1 .. :try_end_110} :catchall_11b

    .line 146
    :try_start_110
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_115
    .catch Ljava/lang/InterruptedException; {:try_start_110 .. :try_end_115} :catch_116
    .catchall {:try_start_110 .. :try_end_115} :catchall_11b

    goto :goto_f1

    .line 147
    :catch_116
    move-exception v9

    .line 148
    .local v9, "e":Ljava/lang/InterruptedException;
    :try_start_117
    invoke-virtual {v9}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_f1

    .line 151
    .end local v9    # "e":Ljava/lang/InterruptedException;
    :catchall_11b
    move-exception v0

    monitor-exit v1
    :try_end_11d
    .catchall {:try_start_117 .. :try_end_11d} :catchall_11b

    throw v0

    :cond_11e
    :try_start_11e
    monitor-exit v1
    :try_end_11f
    .catchall {:try_start_11e .. :try_end_11f} :catchall_11b

    .line 152
    return-void
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
    .line 91
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mExceptions:Ljava/util/List;

    return-object v0
.end method
