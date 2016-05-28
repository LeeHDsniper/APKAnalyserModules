.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;
.super Ljava/lang/Object;
.source "CdsManifestMessagesConsumer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;
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


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    const-string v0, "CdsManifestMessagesConsumer"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "wifiOnly"    # Z
    .param p3, "threadPoolExecutor"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .param p4, "manifestParser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mWifiOnly:Z

    .line 52
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    .line 53
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 54
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 55
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getServerUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mServerRoot:Ljava/lang/String;

    .line 56
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->isDebug(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mDebug:Z

    .line 57
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mExceptions:Ljava/util/List;

    .line 59
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$1;)V
    .registers 6
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Z
    .param p3, "x2"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .param p4, "x3"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .param p5, "x4"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$1;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;-><init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mServerRoot:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mDebug:Z

    return v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mWifiOnly:Z

    return v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;Ljava/lang/String;)V
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;
    .param p2, "x2"    # Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    .param p3, "x3"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;,
            Landroid/os/RemoteException;,
            Landroid/content/OperationApplicationException;
        }
    .end annotation

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->updateMessageFromJson(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mExceptions:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;
    .param p2, "x2"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->insertNewMessageFromJson(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;Ljava/lang/String;)V

    return-void
.end method

.method private consumeMessage(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;Ljava/lang/String;)V
    .registers 12
    .param p1, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    .param p2, "messageType"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 141
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "checking message: %s"

    new-array v4, v8, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 143
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    .line 144
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "msg_id"

    aput-object v5, v4, v7

    const-string v5, "msg_identifier"

    aput-object v5, v4, v8

    const/4 v5, 0x2

    const-string v6, "msg_versionKey"

    aput-object v6, v4, v5

    .line 143
    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getMessageByIdentifier(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;

    move-result-object v0

    .line 149
    .local v0, "currentMessage":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    if-nez v0, :cond_4b

    .line 150
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->consumeNewMessage(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;

    move-result-object v1

    .line 155
    .local v1, "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    :goto_31
    if-eqz v1, :cond_53

    .line 156
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v3

    .line 157
    :try_start_36
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 158
    monitor-exit v3
    :try_end_3c
    .catchall {:try_start_36 .. :try_end_3c} :catchall_50

    .line 159
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mThreadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    const/4 v3, 0x0

    new-array v4, v8, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getVersionKey()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-virtual {v2, v1, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->submit(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)Lcom/adobe/creativesdk/aviary/internal/threading/Future;

    .line 163
    :goto_4a
    return-void

    .line 152
    .end local v1    # "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    :cond_4b
    invoke-direct {p0, p1, v0, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->consumeOldMessage(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;

    move-result-object v1

    .restart local v1    # "job":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    goto :goto_31

    .line 158
    :catchall_50
    move-exception v2

    :try_start_51
    monitor-exit v3
    :try_end_52
    .catchall {:try_start_51 .. :try_end_52} :catchall_50

    throw v2

    .line 161
    :cond_53
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "job is null"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_4a
.end method

.method private consumeNewMessage(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    .registers 4
    .param p1, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    .param p2, "messageType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            "Ljava/lang/String;",
            ")",
            "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 216
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;

    invoke-direct {v0, p0, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;Ljava/lang/String;)V

    return-object v0
.end method

.method private consumeOldMessage(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
    .registers 9
    .param p1, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    .param p2, "currentMessage"    # Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    .param p3, "messageType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;",
            "Ljava/lang/String;",
            ")",
            "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 170
    if-eqz p1, :cond_5

    if-nez p2, :cond_6

    .line 211
    :cond_5
    :goto_5
    return-object v0

    .line 174
    :cond_6
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getVersionKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 178
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getVersionKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getVersionKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 180
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "need to update the message: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 182
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$1;

    invoke-direct {v0, p0, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;Ljava/lang/String;)V

    goto :goto_5
.end method

.method private insertNewMessageFromJson(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;Ljava/lang/String;)V
    .registers 21
    .param p1, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;
    .param p2, "messageType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 339
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 341
    const-string v13, "Invalid message type"

    move-object/from16 v0, p2

    invoke-static {v13, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 342
    const-string v13, "CdsMessageContentParser is null"

    move-object/from16 v0, p1

    invoke-static {v13, v0}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 344
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getBeginDate()J

    move-result-wide v2

    .line 345
    .local v2, "beginDate":J
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getEndDate()J

    move-result-wide v6

    .line 346
    .local v6, "endDate":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 348
    .local v10, "now":J
    cmp-long v13, v6, v10

    if-gez v13, :cond_43

    .line 349
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "message already expired. Skipping.."

    invoke-interface {v13, v14}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 350
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "beginDate: %d, endDate: %d"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 385
    :cond_42
    :goto_42
    return-void

    .line 355
    :cond_43
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    .line 356
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getIdentifier()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    const-string v17, "msg_id"

    aput-object v17, v15, v16

    invoke-static {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getMessageByIdentifier(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;

    move-result-object v4

    .line 357
    .local v4, "current":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    if-nez v4, :cond_42

    .line 361
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 362
    .local v8, "messageValues":Landroid/content/ContentValues;
    const-string v13, "msg_identifier"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getIdentifier()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    const-string v13, "msg_versionKey"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getVersionKey()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    const-string v13, "msg_type"

    move-object/from16 v0, p2

    invoke-virtual {v8, v13, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 367
    .local v5, "messageContentValues":Landroid/content/ContentValues;
    const-string v14, "msgcnt_actionButton"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->isSplitButton()Z

    move-result v13

    if-eqz v13, :cond_13e

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getActionButtonText()Ljava/lang/String;

    move-result-object v13

    :goto_89
    invoke-virtual {v5, v14, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    const-string v13, "msgcnt_beginDate"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getBeginDate()J

    move-result-wide v14

    invoke-static {v14, v15}, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->toSqlDateTime(J)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    const-string v13, "msgcnt_contentIdentifier"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getContentIdentifier()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    const-string v13, "msgcnt_contentURL"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getContentURL()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    const-string v13, "msgcnt_dismissButton"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getDismissButtonText()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    const-string v13, "msgcnt_endDate"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getEndDate()J

    move-result-wide v14

    invoke-static {v14, v15}, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->toSqlDateTime(J)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    const-string v13, "msgcnt_layoutStyle"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getLayoutStyle()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    const-string v13, "msgcnt_paragraph"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getParagraph()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    const-string v14, "msgcnt_showNewBanner"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->isShowNewBanner()Z

    move-result v13

    if-eqz v13, :cond_141

    const/4 v13, 0x1

    :goto_f5
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v5, v14, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 376
    const-string v13, "msgcnt_title"

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getTitle()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    const/4 v13, 0x2

    new-array v12, v13, [Landroid/content/ContentValues;

    const/4 v13, 0x0

    aput-object v8, v12, v13

    const/4 v13, 0x1

    aput-object v5, v12, v13

    .line 380
    .local v12, "valuesArray":[Landroid/content/ContentValues;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    const-string v15, "bulk/insertMessageAndContent"

    .line 381
    invoke-static {v14, v15}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v14

    invoke-virtual {v13, v14, v12}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    move-result v9

    .line 382
    .local v9, "result":I
    if-lez v9, :cond_143

    const/4 v13, 0x1

    :goto_127
    invoke-static {v13}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 384
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "added new message with id: %d"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_42

    .line 367
    .end local v9    # "result":I
    .end local v12    # "valuesArray":[Landroid/content/ContentValues;
    :cond_13e
    const/4 v13, 0x0

    goto/16 :goto_89

    .line 375
    :cond_141
    const/4 v13, 0x0

    goto :goto_f5

    .line 382
    .restart local v9    # "result":I
    .restart local v12    # "valuesArray":[Landroid/content/ContentValues;
    :cond_143
    const/4 v13, 0x0

    goto :goto_127
.end method

.method private updateMessageFromJson(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;Ljava/lang/String;)V
    .registers 16
    .param p1, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;
    .param p2, "currentMessage"    # Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    .param p3, "messageType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;,
            Ljava/lang/AssertionError;,
            Landroid/os/RemoteException;,
            Landroid/content/OperationApplicationException;
        }
    .end annotation

    .prologue
    .line 262
    invoke-static {p1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 263
    invoke-static {p2}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 264
    invoke-static {p3}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 266
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getVersionKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getVersionKey()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1f

    .line 267
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "versionKey identical"

    invoke-interface {v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 324
    :goto_1e
    return-void

    .line 272
    :cond_1f
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    .line 273
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "msg_id"

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getMessageByIdentifier(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;

    move-result-object v2

    .line 274
    .local v2, "currentMessageContent":Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;
    const-string v8, "currentMessageContent is null"

    if-eqz v2, :cond_1e4

    const/4 v7, 0x1

    :goto_36
    invoke-static {v8, v7}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 276
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    .line 277
    .local v5, "messageValues":Landroid/content/ContentValues;
    const-string v7, "msg_identifier"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getIdentifier()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    const-string v7, "msg_versionKey"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getVersionKey()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    const-string v7, "msg_type"

    invoke-virtual {v5, v7, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 282
    .local v4, "messageContentValues":Landroid/content/ContentValues;
    const-string v8, "msgcnt_actionButton"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->isSplitButton()Z

    move-result v7

    if-eqz v7, :cond_1e7

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getActionButtonText()Ljava/lang/String;

    move-result-object v7

    :goto_66
    invoke-virtual {v4, v8, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    const-string v7, "msgcnt_beginDate"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getBeginDate()J

    move-result-wide v8

    invoke-static {v8, v9}, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->toSqlDateTime(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    const-string v7, "msgcnt_contentIdentifier"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getContentIdentifier()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    const-string v7, "msgcnt_contentURL"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getContentURL()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    const-string v7, "msgcnt_dismissButton"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getDismissButtonText()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    const-string v7, "msgcnt_endDate"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getEndDate()J

    move-result-wide v8

    invoke-static {v8, v9}, Lcom/adobe/creativesdk/aviary/internal/utils/DateTimeUtils;->toSqlDateTime(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    const-string v7, "msgcnt_layoutStyle"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getLayoutStyle()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    const-string v7, "msgcnt_paragraph"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getParagraph()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    const-string v8, "msgcnt_showNewBanner"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->isShowNewBanner()Z

    move-result v7

    if-eqz v7, :cond_1ea

    const/4 v7, 0x1

    :goto_d0
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v8, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 291
    const-string v7, "msgcnt_title"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->getTitle()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 294
    .local v3, "extras":Landroid/os/Bundle;
    const-string v7, "messageId"

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getId()J

    move-result-wide v8

    invoke-virtual {v3, v7, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 295
    const-string v7, "messageContentId"

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getId()J

    move-result-wide v8

    invoke-virtual {v3, v7, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 296
    const-string v7, "messageValues"

    invoke-virtual {v3, v7, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 297
    const-string v7, "messageContentValues"

    invoke-virtual {v3, v7, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 299
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 300
    .local v6, "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "message/id/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 302
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getId()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/update"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 301
    invoke-static {v7}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v7

    .line 303
    invoke-virtual {v7, v5}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v7

    .line 300
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 305
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "message/id/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 308
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getId()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/content/id/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getId()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/update"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 307
    invoke-static {v7, v8}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 306
    invoke-static {v7}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v7

    .line 309
    invoke-virtual {v7, v4}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v7

    .line 305
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 311
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    const/4 v8, 0x0

    invoke-static {v7, v8}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 312
    .local v0, "authority":Landroid/net/Uri;
    const/4 v1, 0x0

    .line 314
    .local v1, "batchResult":[Landroid/content/ContentProviderResult;
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "authority: %s - %s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v0, v9, v10

    const/4 v10, 0x1

    invoke-virtual {v0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-interface {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 315
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    invoke-virtual {v0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v6}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    move-result-object v1

    .line 317
    const-string v7, "batch result is null"

    invoke-static {v7, v1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 318
    const-string v8, "batch result size != 2"

    array-length v7, v1

    const/4 v9, 0x2

    if-ne v7, v9, :cond_1ed

    const/4 v7, 0x1

    :goto_1ae
    invoke-static {v8, v7}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V

    .line 319
    const/4 v7, 0x0

    aget-object v7, v1, v7

    if-eqz v7, :cond_1ef

    const/4 v7, 0x0

    aget-object v7, v1, v7

    iget-object v7, v7, Landroid/content/ContentProviderResult;->count:Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-lez v7, :cond_1ef

    const/4 v7, 0x1

    :goto_1c2
    invoke-static {v7}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 320
    const/4 v7, 0x1

    aget-object v7, v1, v7

    if-eqz v7, :cond_1f1

    const/4 v7, 0x1

    aget-object v7, v1, v7

    iget-object v7, v7, Landroid/content/ContentProviderResult;->count:Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-lez v7, :cond_1f1

    const/4 v7, 0x1

    :goto_1d6
    invoke-static {v7}, Ljunit/framework/Assert;->assertTrue(Z)V

    .line 323
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/MessageColumns$MessageCursorWrapper;->getId()J

    move-result-wide v8

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyMessageContentUpdate(Landroid/content/Context;J)V

    goto/16 :goto_1e

    .line 274
    .end local v0    # "authority":Landroid/net/Uri;
    .end local v1    # "batchResult":[Landroid/content/ContentProviderResult;
    .end local v3    # "extras":Landroid/os/Bundle;
    .end local v4    # "messageContentValues":Landroid/content/ContentValues;
    .end local v5    # "messageValues":Landroid/content/ContentValues;
    .end local v6    # "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    :cond_1e4
    const/4 v7, 0x0

    goto/16 :goto_36

    .line 282
    .restart local v4    # "messageContentValues":Landroid/content/ContentValues;
    .restart local v5    # "messageValues":Landroid/content/ContentValues;
    :cond_1e7
    const/4 v7, 0x0

    goto/16 :goto_66

    .line 290
    :cond_1ea
    const/4 v7, 0x0

    goto/16 :goto_d0

    .line 318
    .restart local v0    # "authority":Landroid/net/Uri;
    .restart local v1    # "batchResult":[Landroid/content/ContentProviderResult;
    .restart local v3    # "extras":Landroid/os/Bundle;
    .restart local v6    # "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    :cond_1ed
    const/4 v7, 0x0

    goto :goto_1ae

    .line 319
    :cond_1ef
    const/4 v7, 0x0

    goto :goto_1c2

    .line 320
    :cond_1f1
    const/4 v7, 0x0

    goto :goto_1d6
.end method


# virtual methods
.method consume()V
    .registers 21

    .prologue
    .line 99
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 103
    .local v10, "t1":J
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->hasMessages()Z

    move-result v9

    if-eqz v9, :cond_9c

    .line 104
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getMessages()Ljava/util/HashMap;

    move-result-object v8

    .line 105
    .local v8, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;>;"
    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 107
    .local v5, "keyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_21
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_59

    .line 108
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 109
    .local v4, "key":Ljava/lang/String;
    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "processing messages: %s"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v4, v15, v16

    invoke-interface {v9, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 111
    invoke-virtual {v8, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 112
    .local v6, "list":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 114
    .local v7, "listIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    :cond_45
    :goto_45
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_21

    .line 115
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;

    .line 116
    .local v3, "item":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    if-eqz v3, :cond_45

    .line 119
    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->consumeMessage(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;Ljava/lang/String;)V

    goto :goto_45

    .line 124
    .end local v3    # "item":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    .end local v4    # "key":Ljava/lang/String;
    .end local v6    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    .end local v7    # "listIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    :cond_59
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v14

    .line 125
    :goto_5e
    :try_start_5e
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v9

    if-lez v9, :cond_9b

    .line 126
    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v15, "wait for locks... %d"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, v16

    invoke-interface {v9, v15, v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_8b
    .catchall {:try_start_5e .. :try_end_8b} :catchall_98

    .line 128
    :try_start_8b
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v9}, Ljava/lang/Object;->wait()V
    :try_end_92
    .catch Ljava/lang/InterruptedException; {:try_start_8b .. :try_end_92} :catch_93
    .catchall {:try_start_8b .. :try_end_92} :catchall_98

    goto :goto_5e

    .line 129
    :catch_93
    move-exception v2

    .line 130
    .local v2, "e":Ljava/lang/InterruptedException;
    :try_start_94
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_5e

    .line 133
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :catchall_98
    move-exception v9

    monitor-exit v14
    :try_end_9a
    .catchall {:try_start_94 .. :try_end_9a} :catchall_98

    throw v9

    :cond_9b
    :try_start_9b
    monitor-exit v14
    :try_end_9c
    .catchall {:try_start_9b .. :try_end_9c} :catchall_98

    .line 136
    .end local v5    # "keyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v8    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;>;"
    :cond_9c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 137
    .local v12, "t2":J
    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "total time: %dms"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    sub-long v18, v12, v10

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v9, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 138
    return-void
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
    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mExceptions:Ljava/util/List;

    return-object v0
.end method
