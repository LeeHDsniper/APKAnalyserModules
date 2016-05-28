.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;
.super Ljava/lang/Object;
.source "CdsManifestPacksIconsConsumer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;
    }
.end annotation


# static fields
.field private static final WRITE_DISK_LOCK:Ljava/lang/Object;

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

.field private final mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

.field private final mPackList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private final mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

.field private final mWifiOnly:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-string v0, "CdsManifestPacksIconsConsumer"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 37
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->WRITE_DISK_LOCK:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;ZLjava/util/ArrayList;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p3, "threadPool"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .param p4, "wifiOnly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;",
            "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;",
            "Z",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p5, "packList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mContext:Landroid/content/Context;

    .line 51
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 52
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 53
    iput-boolean p4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mWifiOnly:Z

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mExceptions:Ljava/util/List;

    .line 55
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 56
    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mPackList:Ljava/util/ArrayList;

    .line 57
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;ZLjava/util/ArrayList;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;)V
    .registers 7
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p3, "x2"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .param p4, "x3"    # Z
    .param p5, "x4"    # Ljava/util/ArrayList;
    .param p6, "x5"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;

    .prologue
    .line 35
    invoke-direct/range {p0 .. p5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;ZLjava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    .registers 1

    .prologue
    .line 35
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;Ljava/lang/String;)Ljava/io/InputStream;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->download(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;JJLjava/io/File;Ljava/lang/String;Ljava/io/InputStream;)I
    .registers 9
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;
    .param p1, "x1"    # J
    .param p3, "x2"    # J
    .param p5, "x3"    # Ljava/io/File;
    .param p6, "x4"    # Ljava/lang/String;
    .param p7, "x5"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct/range {p0 .. p7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->updatePackIcon(JJLjava/io/File;Ljava/lang/String;Ljava/io/InputStream;)I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mExceptions:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method private consumePack(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V
    .registers 11
    .param p1, "pack"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 108
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v5

    if-nez v5, :cond_b

    .line 126
    :cond_a
    :goto_a
    return-void

    .line 112
    :cond_b
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getIconPath()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1f

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getIconNeedDownload()I

    move-result v5

    if-lez v5, :cond_45

    .line 113
    :cond_1f
    const/4 v2, 0x1

    .line 119
    .local v2, "needToDownload":Z
    :goto_20
    if-eqz v2, :cond_a

    .line 120
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "%s need to download icon"

    new-array v7, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-interface {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 122
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->createJob()Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;

    move-result-object v1

    .line 123
    .local v1, "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;Ljava/lang/Object;>;"
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 124
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    const/4 v6, 0x0

    new-array v3, v3, [Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    aput-object p1, v3, v4

    invoke-virtual {v5, v1, v6, v3}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->submit(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)Lcom/adobe/creativesdk/aviary/internal/threading/Future;

    goto :goto_a

    .line 115
    .end local v1    # "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;Ljava/lang/Object;>;"
    .end local v2    # "needToDownload":Z
    :cond_45
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getIconPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 116
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_5a

    move v2, v3

    .restart local v2    # "needToDownload":Z
    :goto_59
    goto :goto_20

    .end local v2    # "needToDownload":Z
    :cond_5a
    move v2, v4

    goto :goto_59
.end method

.method private createJob()Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 140
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)V

    return-object v0
.end method

.method private download(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 4
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 131
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mWifiOnly:Z

    if-eqz v0, :cond_17

    .line 132
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 133
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Not connected"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 136
    :cond_17
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->hunt(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method private updatePackIcon(JJLjava/io/File;Ljava/lang/String;Ljava/io/InputStream;)I
    .registers 21
    .param p1, "contentId"    # J
    .param p3, "packId"    # J
    .param p5, "iconDir"    # Ljava/io/File;
    .param p6, "iconName"    # Ljava/lang/String;
    .param p7, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 207
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 209
    const-string v6, "iconDir is null"

    move-object/from16 v0, p5

    invoke-static {v6, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 212
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->WRITE_DISK_LOCK:Ljava/lang/Object;

    monitor-enter v7

    .line 213
    :try_start_d
    invoke-virtual/range {p5 .. p5}, Ljava/io/File;->mkdirs()Z

    .line 214
    invoke-static/range {p5 .. p5}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->createNoMediaFile(Ljava/io/File;)V

    .line 215
    monitor-exit v7
    :try_end_14
    .catchall {:try_start_d .. :try_end_14} :catchall_92

    .line 217
    const-string v6, "iconDir is not a valid directory"

    invoke-virtual/range {p5 .. p5}, Ljava/io/File;->isDirectory()Z

    move-result v7

    invoke-static {v6, v7}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 220
    if-eqz p6, :cond_95

    .line 221
    new-instance v3, Ljava/io/File;

    move-object/from16 v0, p5

    move-object/from16 v1, p6

    invoke-direct {v3, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 230
    .local v3, "iconFile":Ljava/io/File;
    :goto_28
    new-instance v2, Ljava/io/FileOutputStream;

    const/4 v6, 0x1

    invoke-direct {v2, v3, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 232
    .local v2, "foStream":Ljava/io/FileOutputStream;
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->WRITE_DISK_LOCK:Ljava/lang/Object;

    monitor-enter v7

    .line 233
    :try_start_31
    move-object/from16 v0, p7

    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 234
    monitor-exit v7
    :try_end_37
    .catchall {:try_start_31 .. :try_end_37} :catchall_a0

    .line 236
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 238
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 239
    .local v5, "values":Landroid/content/ContentValues;
    const-string v6, "content_iconPath"

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    const-string v6, "content_iconNeedDownload"

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 242
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mContext:Landroid/content/Context;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "pack/id/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-wide/from16 v0, p3

    invoke-virtual {v8, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/content/id/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/update"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 243
    invoke-static {v7, v8}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 242
    invoke-virtual {v6, v7, v5, v8, v9}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    .line 246
    .local v4, "result":I
    const-string v7, "!(result > 0)"

    if-lez v4, :cond_a3

    const/4 v6, 0x1

    :goto_8e
    invoke-static {v7, v6}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 247
    return v4

    .line 215
    .end local v2    # "foStream":Ljava/io/FileOutputStream;
    .end local v3    # "iconFile":Ljava/io/File;
    .end local v4    # "result":I
    .end local v5    # "values":Landroid/content/ContentValues;
    :catchall_92
    move-exception v6

    :try_start_93
    monitor-exit v7
    :try_end_94
    .catchall {:try_start_93 .. :try_end_94} :catchall_92

    throw v6

    .line 223
    :cond_95
    const-string v6, "icon-"

    const-string v7, ".png"

    move-object/from16 v0, p5

    invoke-static {v6, v7, v0}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    .restart local v3    # "iconFile":Ljava/io/File;
    goto :goto_28

    .line 234
    .restart local v2    # "foStream":Ljava/io/FileOutputStream;
    :catchall_a0
    move-exception v6

    :try_start_a1
    monitor-exit v7
    :try_end_a2
    .catchall {:try_start_a1 .. :try_end_a2} :catchall_a0

    throw v6

    .line 246
    .restart local v4    # "result":I
    .restart local v5    # "values":Landroid/content/ContentValues;
    :cond_a3
    const/4 v6, 0x0

    goto :goto_8e
.end method


# virtual methods
.method consume()V
    .registers 14

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v2, 0x0

    .line 64
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mPackList:Ljava/util/ArrayList;

    if-eqz v0, :cond_20

    .line 67
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mPackList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 68
    .local v9, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    :goto_10
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_62

    .line 69
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .line 70
    .local v10, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->consumePack(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V

    goto :goto_10

    .line 74
    .end local v9    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    .end local v10    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    :cond_20
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mContext:Landroid/content/Context;

    const-string v3, "pack/content/list"

    .line 75
    invoke-static {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 77
    .local v7, "cursor":Landroid/database/Cursor;
    if-eqz v7, :cond_62

    .line 78
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "cursor.size: %d"

    new-array v2, v12, [Ljava/lang/Object;

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v11

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 80
    :goto_4a
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_5f

    .line 81
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v10

    .line 83
    .restart local v10    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v6

    .line 84
    .local v6, "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    invoke-virtual {v10, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->setContent(Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;)V

    .line 85
    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->consumePack(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V

    goto :goto_4a

    .line 88
    .end local v6    # "content":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    .end local v10    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    :cond_5f
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 93
    .end local v7    # "cursor":Landroid/database/Cursor;
    :cond_62
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v1

    .line 94
    :goto_65
    :try_start_65
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-lez v0, :cond_92

    .line 95
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "wait for locks... %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_84
    .catchall {:try_start_65 .. :try_end_84} :catchall_8f

    .line 97
    :try_start_84
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_89
    .catch Ljava/lang/InterruptedException; {:try_start_84 .. :try_end_89} :catch_8a
    .catchall {:try_start_84 .. :try_end_89} :catchall_8f

    goto :goto_65

    .line 98
    :catch_8a
    move-exception v8

    .line 99
    .local v8, "e":Ljava/lang/InterruptedException;
    :try_start_8b
    invoke-virtual {v8}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_65

    .line 102
    .end local v8    # "e":Ljava/lang/InterruptedException;
    :catchall_8f
    move-exception v0

    monitor-exit v1
    :try_end_91
    .catchall {:try_start_8b .. :try_end_91} :catchall_8f

    throw v0

    :cond_92
    :try_start_92
    monitor-exit v1
    :try_end_93
    .catchall {:try_start_92 .. :try_end_93} :catchall_8f

    .line 103
    return-void
.end method

.method getExceptions()Ljava/util/List;
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
    .line 60
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mExceptions:Ljava/util/List;

    return-object v0
.end method
