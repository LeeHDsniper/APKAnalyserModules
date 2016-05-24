.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
.super Ljava/lang/Object;
.source "CdsManifestPacksConsumer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;
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
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

.field private final mServerRoot:Ljava/lang/String;

.field private final mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

.field private final mWifiOnly:Z

.field private final notificationList:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 41
    const-string v0, "CdsManifestPacksConsumer"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "wifiOnly"    # Z
    .param p3, "threadPoolExecutor"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .param p4, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p5, "operations"    # Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mWifiOnly:Z

    .line 57
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    .line 58
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 59
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 60
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getServerUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mServerRoot:Ljava/lang/String;

    .line 61
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->isDebug(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mDebug:Z

    .line 62
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mExceptions:Ljava/util/List;

    .line 64
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->notificationList:Ljava/util/HashSet;

    .line 65
    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    .line 66
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;)V
    .registers 7
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Z
    .param p3, "x2"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .param p4, "x3"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p5, "x4"    # Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    .param p6, "x5"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;

    .prologue
    .line 40
    invoke-direct/range {p0 .. p5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;-><init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mServerRoot:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mExceptions:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mDebug:Z

    return v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mWifiOnly:Z

    return v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;I)Z
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    .param p2, "x2"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Ljava/lang/AssertionError;,
            Landroid/os/RemoteException;,
            Landroid/content/OperationApplicationException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->updateContentFromJson(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;JI)Z
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
    .param p1, "x1"    # J
    .param p3, "x2"    # I

    .prologue
    .line 40
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->updateDisplayOrder(JI)Z

    move-result v0

    return v0
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;JI)Z
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
    .param p1, "x1"    # J
    .param p3, "x2"    # I

    .prologue
    .line 40
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->updateVisibility(JI)Z

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/HashSet;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->notificationList:Ljava/util/HashSet;

    return-object v0
.end method

.method private consumeNewPack(ILcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    .registers 4
    .param p1, "order"    # I
    .param p2, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 255
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;ILcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;)V

    return-object v0
.end method

.method private consumeOldPack(ILcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    .registers 11
    .param p1, "displayOrder"    # I
    .param p2, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    .param p3, "currentPack"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 191
    invoke-virtual {p3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getVersionKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getVersionKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-virtual {p3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getDisplayOrder()I

    move-result v3

    if-ne v3, p1, :cond_1c

    .line 192
    invoke-virtual {p3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getVisible()I

    move-result v3

    if-eq v3, v0, :cond_43

    .line 194
    :cond_1c
    invoke-virtual {p3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getVersionKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getVersionKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 195
    .local v2, "versionKeyMatch":Z
    invoke-virtual {p3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getDisplayOrder()I

    move-result v3

    if-ne v3, p1, :cond_3f

    move v5, v0

    .line 196
    .local v5, "displayOrderMatch":Z
    :goto_2f
    invoke-virtual {p3}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getVisible()I

    move-result v3

    if-eq v3, v0, :cond_41

    move v6, v0

    .line 198
    .local v6, "isHidden":Z
    :goto_36
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;

    move-object v1, p0

    move-object v3, p3

    move v4, p1

    invoke-direct/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;ZLcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;IZZ)V

    .line 249
    .end local v2    # "versionKeyMatch":Z
    .end local v5    # "displayOrderMatch":Z
    .end local v6    # "isHidden":Z
    :goto_3e
    return-object v0

    .restart local v2    # "versionKeyMatch":Z
    :cond_3f
    move v5, v1

    .line 195
    goto :goto_2f

    .restart local v5    # "displayOrderMatch":Z
    :cond_41
    move v6, v1

    .line 196
    goto :goto_36

    .line 249
    .end local v2    # "versionKeyMatch":Z
    .end local v5    # "displayOrderMatch":Z
    :cond_43
    const/4 v0, 0x0

    goto :goto_3e
.end method

.method private consumePack(ILcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;)V
    .registers 12
    .param p1, "displayOrder"    # I
    .param p2, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 164
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "processing item: %s [%d]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 166
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    .line 167
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v8}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackByIdentifier(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v0

    .line 171
    .local v0, "currentPack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    if-nez v0, :cond_42

    .line 172
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->consumeNewPack(ILcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;

    move-result-object v1

    .line 177
    .local v1, "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    :goto_29
    if-eqz v1, :cond_41

    .line 178
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v3

    .line 179
    :try_start_2e
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 180
    monitor-exit v3
    :try_end_34
    .catchall {:try_start_2e .. :try_end_34} :catchall_47

    .line 181
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    new-array v3, v7, [Ljava/lang/String;

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getVersionKey()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v2, v1, v8, v3}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->submit(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)Lcom/adobe/creativesdk/aviary/internal/threading/Future;

    .line 186
    :cond_41
    return-void

    .line 174
    .end local v1    # "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    :cond_42
    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->consumeOldPack(ILcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;

    move-result-object v1

    .restart local v1    # "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    goto :goto_29

    .line 180
    :catchall_47
    move-exception v2

    :try_start_48
    monitor-exit v3
    :try_end_49
    .catchall {:try_start_48 .. :try_end_49} :catchall_47

    throw v2
.end method

.method static insertNewContentFromJson(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;IILjava/lang/String;)V
    .registers 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    .param p2, "displayOrder"    # I
    .param p3, "visible"    # I
    .param p4, "assetBaseUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 457
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "insertNewContentFromJson"

    invoke-interface {v6, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 459
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 461
    invoke-static {p1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 462
    const-string v9, "Invalid Error Code"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getCode()I

    move-result v6

    if-nez v6, :cond_1f9

    move v6, v7

    :goto_18
    invoke-static {v9, v6}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 463
    const-string v9, "Identifier is null"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIdentifier()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1fc

    move v6, v7

    :goto_28
    invoke-static {v9, v6}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 467
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 468
    .local v0, "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentValues;>;"
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 471
    .local v4, "values":Landroid/content/ContentValues;
    const-string v6, "pack_identifier"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIdentifier()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 472
    const-string v6, "pack_type"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getPackType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    const-string v6, "pack_versionKey"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getVersionKey()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 474
    const-string v6, "pack_displayOrder"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 475
    const-string v6, "pack_visible"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 476
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 479
    new-instance v4, Landroid/content/ContentValues;

    .end local v4    # "values":Landroid/content/ContentValues;
    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 480
    .restart local v4    # "values":Landroid/content/ContentValues;
    const-string v6, "content_previewURL"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getPreviewURL()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 481
    const-string v6, "content_previewVersion"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getPreviewVersion()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    const-string v6, "content_contentURL"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getContentURL()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    const-string v6, "content_contentVersion"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getContentVersion()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    const-string v6, "content_iconUrl"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIconURL()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    const-string v6, "content_iconVersion"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIconVersion()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    const-string v9, "content_isFree"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->isFree()Z

    move-result v6

    if-eqz v6, :cond_1ff

    move v6, v7

    :goto_dc
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v9, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 487
    const-string v6, "content_purchased"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 488
    const-string v6, "content_iconNeedDownload"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 489
    const-string v6, "content_displayName"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDisplayName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 490
    const-string v6, "content_displayDescription"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDisplayDescription()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 491
    const-string v6, "content_numItems"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getItems()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 492
    const-string v9, "content_isFreeWithLogin"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->isFreeWithLogin()Z

    move-result v6

    if-eqz v6, :cond_202

    move v6, v7

    :goto_121
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v9, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 495
    const-string v6, "content_author"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getAuthor()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 496
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getAuthorHyperlink()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_205

    .line 497
    const-string v6, "content_authorHyperlink"

    invoke-virtual {v4, v6}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 501
    :goto_140
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getSocialMediaString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_210

    .line 502
    const-string v6, "content_socialMediaString"

    invoke-virtual {v4, v6}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 507
    :goto_14f
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getShopBackgroundColor()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_21b

    .line 508
    const-string v6, "content_shopBackgroundColor"

    invoke-virtual {v4, v6}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 513
    :goto_15e
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getFeatureImageURL()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_18b

    .line 514
    const-string v6, "content_featureImageURL"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getFeatureImageURL()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 515
    const-string v6, "content_featureImageVersion"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getFeatureImageVersion()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    :cond_18b
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDetailImageURL()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1b8

    .line 519
    const-string v6, "content_detailImageURL"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDetailImageURL()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 520
    const-string v6, "content_detailImageVersion"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDetailImageVersion()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 523
    :cond_1b8
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 524
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getItems()Ljava/util/List;

    move-result-object v2

    .line 526
    .local v2, "items":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1c3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_226

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;

    .line 527
    .local v1, "item":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;
    new-instance v4, Landroid/content/ContentValues;

    .end local v4    # "values":Landroid/content/ContentValues;
    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 528
    .restart local v4    # "values":Landroid/content/ContentValues;
    const-string v9, "item_identifier"

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->getIdentifier()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    const-string v9, "item_displayName"

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->getDisplayName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->getOptions()[B

    move-result-object v9

    if-eqz v9, :cond_1f5

    .line 531
    const-string v9, "item_options"

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->getOptions()[B

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 533
    :cond_1f5
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c3

    .end local v0    # "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentValues;>;"
    .end local v1    # "item":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;
    .end local v2    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;>;"
    .end local v4    # "values":Landroid/content/ContentValues;
    :cond_1f9
    move v6, v8

    .line 462
    goto/16 :goto_18

    :cond_1fc
    move v6, v8

    .line 463
    goto/16 :goto_28

    .restart local v0    # "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentValues;>;"
    .restart local v4    # "values":Landroid/content/ContentValues;
    :cond_1ff
    move v6, v8

    .line 486
    goto/16 :goto_dc

    :cond_202
    move v6, v8

    .line 492
    goto/16 :goto_121

    .line 499
    :cond_205
    const-string v6, "content_authorHyperlink"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getAuthorHyperlink()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_140

    .line 504
    :cond_210
    const-string v6, "content_socialMediaString"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getSocialMediaString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_14f

    .line 510
    :cond_21b
    const-string v6, "content_shopBackgroundColor"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getShopBackgroundColor()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_15e

    .line 537
    .restart local v2    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;>;"
    :cond_226
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Landroid/content/ContentValues;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Landroid/content/ContentValues;

    .line 538
    .local v5, "valuesArray":[Landroid/content/ContentValues;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v9, "bulk/insertPackContentAndItems"

    .line 539
    invoke-static {p0, v9}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    .line 538
    invoke-virtual {v6, v9, v5}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    move-result v3

    .line 541
    .local v3, "result":I
    if-lez v3, :cond_256

    move v6, v7

    :goto_243
    invoke-static {v6}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 543
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "added new item with id: %d"

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v7, v8

    invoke-interface {v6, v9, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 544
    return-void

    :cond_256
    move v6, v8

    .line 541
    goto :goto_243
.end method

.method private updateContentFromJson(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;I)Z
    .registers 32
    .param p1, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    .param p2, "currentPack"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .param p3, "displayOrder"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Ljava/lang/AssertionError;,
            Landroid/os/RemoteException;,
            Landroid/content/OperationApplicationException;
        }
    .end annotation

    .prologue
    .line 326
    const/16 v2, 0x8

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "content_id"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "content_packId"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, "content_iconVersion"

    aput-object v3, v4, v2

    const/4 v2, 0x3

    const-string v3, "content_previewVersion"

    aput-object v3, v4, v2

    const/4 v2, 0x4

    const-string v3, "content_contentVersion"

    aput-object v3, v4, v2

    const/4 v2, 0x5

    const-string v3, "content_featureImageVersion"

    aput-object v3, v4, v2

    const/4 v2, 0x6

    const-string v3, "content_detailImageVersion"

    aput-object v3, v4, v2

    const/4 v2, 0x7

    const-string v3, "content_previewPath"

    aput-object v3, v4, v2

    .line 337
    .local v4, "projection":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pack/id/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 338
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/content"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 337
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v20

    .line 344
    .local v20, "currentCursor":Landroid/database/Cursor;
    const-string v2, "currentCursor is null"

    move-object/from16 v0, v20

    invoke-static {v2, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 345
    const-string v2, "currentCursor.moveToFirst failed"

    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    invoke-static {v2, v3}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 347
    const/4 v2, 0x0

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    .line 348
    .local v16, "currentContentId":J
    const/4 v2, 0x2

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 349
    .local v14, "currentContentIconVersion":Ljava/lang/String;
    const/4 v2, 0x3

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 350
    .local v18, "currentContentPreviewVersion":Ljava/lang/String;
    const/4 v2, 0x4

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 351
    .local v19, "currentContentVersion":Ljava/lang/String;
    const/4 v2, 0x5

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 352
    .local v13, "currentContentFeatureImageVersion":Ljava/lang/String;
    const/4 v2, 0x6

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 353
    .local v12, "currentContentDetailImageVersion":Ljava/lang/String;
    const/4 v2, 0x7

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 355
    .local v15, "currentContentPreviewPath":Ljava/lang/String;
    invoke-static/range {v20 .. v20}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 357
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIconVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_374

    const/16 v23, 0x1

    .line 358
    .local v23, "iconChanged":Z
    :goto_b0
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getPreviewVersion()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_378

    const/16 v26, 0x1

    .line 359
    .local v26, "previewChanged":Z
    :goto_be
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getContentVersion()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_37c

    const/4 v10, 0x1

    .line 360
    .local v10, "contentChanged":Z
    :goto_cb
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getFeatureImageVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_37f

    const/16 v22, 0x1

    .line 361
    .local v22, "featureImageChanged":Z
    :goto_d7
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDetailImageVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_383

    const/16 v21, 0x1

    .line 364
    .local v21, "featureDetailImageChanged":Z
    :goto_e3
    new-instance v25, Landroid/content/ContentValues;

    invoke-direct/range {v25 .. v25}, Landroid/content/ContentValues;-><init>()V

    .line 365
    .local v25, "packValues":Landroid/content/ContentValues;
    const-string v2, "pack_versionKey"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getVersionKey()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v25

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    const-string v2, "pack_displayOrder"

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, v25

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 367
    const-string v2, "pack_visible"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, v25

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 370
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 371
    .local v11, "contentValues":Landroid/content/ContentValues;
    const-string v2, "content_displayName"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    const-string v2, "content_displayDescription"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDisplayDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    const-string v3, "content_isFree"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->isFree()Z

    move-result v2

    if-eqz v2, :cond_387

    const/4 v2, 0x1

    :goto_12a
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 374
    const-string v2, "content_numItems"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 375
    const-string v2, "content_shopBackgroundColor"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getShopBackgroundColor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    const-string v3, "content_isFreeWithLogin"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->isFreeWithLogin()Z

    move-result v2

    if-eqz v2, :cond_38a

    const/4 v2, 0x1

    :goto_154
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 378
    if-eqz v23, :cond_192

    .line 379
    const-string v2, "content_iconVersion"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIconVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    const-string v2, "content_iconUrl"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getIconURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    const-string v2, "content_iconNeedDownload"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 384
    :cond_192
    if-eqz v26, :cond_1ea

    .line 385
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "need to remove the previews"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 387
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1b0

    .line 389
    :try_start_1a1
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "trying to delete previews"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 390
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->cleanDirectory(Ljava/io/File;)V
    :try_end_1b0
    .catch Ljava/lang/Throwable; {:try_start_1a1 .. :try_end_1b0} :catch_38d

    .line 397
    :cond_1b0
    :goto_1b0
    const-string v2, "content_previewVersion"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getPreviewVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    const-string v2, "content_previewURL"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getPreviewURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    const-string v2, "content_previewPath"

    invoke-virtual {v11, v2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 400
    const-string v2, "content_previewNeedDownload"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 403
    :cond_1ea
    if-eqz v10, :cond_221

    .line 404
    const-string v2, "content_contentVersion"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getContentVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    const-string v2, "content_contentURL"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getContentURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 406
    const-string v2, "content_contentNeedDownload"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 409
    :cond_221
    if-eqz v22, :cond_258

    .line 410
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getFeatureImageURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_258

    .line 411
    const-string v2, "content_featureImageVersion"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getFeatureImageVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    const-string v2, "content_featureImageURL"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 413
    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getFeatureImageURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 412
    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    :cond_258
    if-eqz v21, :cond_28f

    .line 418
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDetailImageURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_28f

    .line 419
    const-string v2, "content_detailImageVersion"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDetailImageVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    const-string v2, "content_detailImageURL"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 421
    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->getDetailImageURL()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    :cond_28f
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    .line 427
    .local v24, "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pack/id/"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 429
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "/update"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v2

    .line 430
    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    .line 427
    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 432
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pack/id/"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 435
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v6

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "/content/id/"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, v16

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "/update"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 434
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 433
    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v2

    .line 436
    invoke-virtual {v2, v11}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v2

    .line 432
    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 438
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    .line 439
    .local v8, "authority":Landroid/net/Uri;
    const/4 v9, 0x0

    .line 441
    .local v9, "batchResult":[Landroid/content/ContentProviderResult;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v8}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v24

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    move-result-object v9

    .line 443
    const-string v2, "batch result is null"

    invoke-static {v2, v9}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 444
    const-string v3, "batch result size != 2"

    array-length v2, v9

    const/4 v5, 0x2

    if-ne v2, v5, :cond_39a

    const/4 v2, 0x1

    :goto_336
    invoke-static {v3, v2}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 445
    const/4 v2, 0x0

    aget-object v2, v9, v2

    if-eqz v2, :cond_39c

    const/4 v2, 0x0

    aget-object v2, v9, v2

    iget-object v2, v2, Landroid/content/ContentProviderResult;->count:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lez v2, :cond_39c

    const/4 v2, 0x1

    :goto_34a
    invoke-static {v2}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 446
    const/4 v2, 0x1

    aget-object v2, v9, v2

    if-eqz v2, :cond_39e

    const/4 v2, 0x1

    aget-object v2, v9, v2

    iget-object v2, v2, Landroid/content/ContentProviderResult;->count:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lez v2, :cond_39e

    const/4 v2, 0x1

    :goto_35e
    invoke-static {v2}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 448
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "updated content: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 449
    const/4 v2, 0x1

    return v2

    .line 357
    .end local v8    # "authority":Landroid/net/Uri;
    .end local v9    # "batchResult":[Landroid/content/ContentProviderResult;
    .end local v10    # "contentChanged":Z
    .end local v11    # "contentValues":Landroid/content/ContentValues;
    .end local v21    # "featureDetailImageChanged":Z
    .end local v22    # "featureImageChanged":Z
    .end local v23    # "iconChanged":Z
    .end local v24    # "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    .end local v25    # "packValues":Landroid/content/ContentValues;
    .end local v26    # "previewChanged":Z
    :cond_374
    const/16 v23, 0x0

    goto/16 :goto_b0

    .line 358
    .restart local v23    # "iconChanged":Z
    :cond_378
    const/16 v26, 0x0

    goto/16 :goto_be

    .line 359
    .restart local v26    # "previewChanged":Z
    :cond_37c
    const/4 v10, 0x0

    goto/16 :goto_cb

    .line 360
    .restart local v10    # "contentChanged":Z
    :cond_37f
    const/16 v22, 0x0

    goto/16 :goto_d7

    .line 361
    .restart local v22    # "featureImageChanged":Z
    :cond_383
    const/16 v21, 0x0

    goto/16 :goto_e3

    .line 373
    .restart local v11    # "contentValues":Landroid/content/ContentValues;
    .restart local v21    # "featureDetailImageChanged":Z
    .restart local v25    # "packValues":Landroid/content/ContentValues;
    :cond_387
    const/4 v2, 0x0

    goto/16 :goto_12a

    .line 376
    :cond_38a
    const/4 v2, 0x0

    goto/16 :goto_154

    .line 391
    :catch_38d
    move-exception v27

    .line 392
    .local v27, "t":Ljava/lang/Throwable;
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "error while deleting previews"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 393
    invoke-virtual/range {v27 .. v27}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_1b0

    .line 444
    .end local v27    # "t":Ljava/lang/Throwable;
    .restart local v8    # "authority":Landroid/net/Uri;
    .restart local v9    # "batchResult":[Landroid/content/ContentProviderResult;
    .restart local v24    # "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    :cond_39a
    const/4 v2, 0x0

    goto :goto_336

    .line 445
    :cond_39c
    const/4 v2, 0x0

    goto :goto_34a

    .line 446
    :cond_39e
    const/4 v2, 0x0

    goto :goto_35e
.end method

.method private updateDisplayOrder(JI)Z
    .registers 13
    .param p1, "packId"    # J
    .param p3, "displayOrder"    # I

    .prologue
    const/4 v8, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 298
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 299
    .local v1, "values":Landroid/content/ContentValues;
    const-string v4, "pack_displayOrder"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 300
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "pack/id/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/update"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 301
    invoke-static {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v5, v1, v8, v8}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 302
    .local v0, "result":I
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "updated pack display order -> %d"

    new-array v6, v2, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 303
    if-lez v0, :cond_4c

    :goto_4b
    return v2

    :cond_4c
    move v2, v3

    goto :goto_4b
.end method

.method private updateVisibility(JI)Z
    .registers 11
    .param p1, "packId"    # J
    .param p3, "value"    # I

    .prologue
    const/4 v6, 0x0

    .line 314
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 315
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "pack_visible"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 316
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pack/id/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/update"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 317
    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3, v1, v6, v6}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 318
    .local v0, "result":I
    if-lez v0, :cond_3c

    const/4 v2, 0x1

    :goto_3b
    return v2

    :cond_3c
    const/4 v2, 0x0

    goto :goto_3b
.end method


# virtual methods
.method consume()V
    .registers 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 121
    .local v10, "t1":J
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 123
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->hasContent()Z

    move-result v14

    if-eqz v14, :cond_93

    .line 125
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getEnabledPacks()Ljava/util/HashMap;

    move-result-object v5

    .line 127
    .local v5, "items":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;>;"
    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 128
    .local v6, "itemsIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_21
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_4e

    .line 129
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 130
    .local v7, "key":Ljava/lang/String;
    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    .line 131
    .local v9, "packsType":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 134
    .local v8, "packTypeIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    const/4 v2, 0x0

    .line 136
    .local v2, "displayOrder":I
    :goto_38
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_21

    .line 137
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;

    .line 138
    .local v4, "item":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    if-eqz v4, :cond_4b

    .line 139
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->consumePack(ILcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;)V

    .line 141
    :cond_4b
    add-int/lit8 v2, v2, 0x1

    .line 142
    goto :goto_38

    .line 146
    .end local v2    # "displayOrder":I
    .end local v4    # "item":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    .end local v7    # "key":Ljava/lang/String;
    .end local v8    # "packTypeIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    .end local v9    # "packsType":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    :cond_4e
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v15

    .line 147
    :goto_53
    :try_start_53
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v14

    if-lez v14, :cond_92

    .line 148
    sget-object v14, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v16, "wait for locks... %d"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-interface {v14, v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_82
    .catchall {:try_start_53 .. :try_end_82} :catchall_8f

    .line 150
    :try_start_82
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v14}, Ljava/lang/Object;->wait()V
    :try_end_89
    .catch Ljava/lang/InterruptedException; {:try_start_82 .. :try_end_89} :catch_8a
    .catchall {:try_start_82 .. :try_end_89} :catchall_8f

    goto :goto_53

    .line 151
    :catch_8a
    move-exception v3

    .line 152
    .local v3, "e":Ljava/lang/InterruptedException;
    :try_start_8b
    invoke-virtual {v3}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_53

    .line 155
    .end local v3    # "e":Ljava/lang/InterruptedException;
    :catchall_8f
    move-exception v14

    monitor-exit v15
    :try_end_91
    .catchall {:try_start_8b .. :try_end_91} :catchall_8f

    throw v14

    :cond_92
    :try_start_92
    monitor-exit v15
    :try_end_93
    .catchall {:try_start_92 .. :try_end_93} :catchall_8f

    .line 158
    .end local v5    # "items":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;>;"
    .end local v6    # "itemsIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_93
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 159
    .local v12, "t2":J
    sget-object v14, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v15, "total time: %dms"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    sub-long v18, v12, v10

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-interface/range {v14 .. v16}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 160
    return-void
.end method

.method public getAddedOrUpdatedPackTypes()Ljava/util/HashSet;
    .registers 2
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
    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->notificationList:Ljava/util/HashSet;

    return-object v0
.end method

.method public getExceptions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mExceptions:Ljava/util/List;

    return-object v0
.end method
