.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;
.super Ljava/lang/Object;
.source "CdsManifestMessagesConsumer.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->consumeNewMessage(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

.field final synthetic val$messageType:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;Ljava/lang/String;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    .prologue
    .line 216
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->val$messageType:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 216
    check-cast p2, [Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;
    .param p2, "params"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 221
    :try_start_0
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessageContentDownloader;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    .line 222
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mServerRoot:Ljava/lang/String;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mDebug:Z
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Z

    move-result v4

    invoke-direct {v0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessageContentDownloader;-><init>(Ljava/lang/String;Z)V

    .line 225
    .local v0, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessageContentDownloader;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    aget-object v4, p2, v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mWifiOnly:Z
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Z

    move-result v5

    invoke-virtual {v0, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessageContentDownloader;->download(Landroid/content/Context;Ljava/lang/String;Z)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;

    .line 228
    .local v2, "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->val$messageType:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->insertNewMessageFromJson(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;Ljava/lang/String;)V
    invoke-static {v3, v2, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$800(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;Ljava/lang/String;)V
    :try_end_2d
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_2d} :catch_4c
    .catchall {:try_start_0 .. :try_end_2d} :catchall_80

    .line 234
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 235
    :try_start_34
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 236
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 237
    monitor-exit v4

    .line 239
    .end local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessageContentDownloader;
    .end local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;
    :goto_47
    const/4 v3, 0x0

    return-object v3

    .line 237
    .restart local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessageContentDownloader;
    .restart local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;
    :catchall_49
    move-exception v3

    monitor-exit v4
    :try_end_4b
    .catchall {:try_start_34 .. :try_end_4b} :catchall_49

    throw v3

    .line 229
    .end local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessageContentDownloader;
    .end local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;
    :catch_4c
    move-exception v1

    .line 230
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_4d
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mExceptions:Ljava/util/List;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 232
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V
    :try_end_62
    .catchall {:try_start_4d .. :try_end_62} :catchall_80

    .line 234
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 235
    :try_start_69
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 236
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 237
    monitor-exit v4

    goto :goto_47

    :catchall_7d
    move-exception v3

    monitor-exit v4
    :try_end_7f
    .catchall {:try_start_69 .. :try_end_7f} :catchall_7d

    throw v3

    .line 234
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_80
    move-exception v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 235
    :try_start_88
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 236
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 237
    monitor-exit v4
    :try_end_9b
    .catchall {:try_start_88 .. :try_end_9b} :catchall_9c

    throw v3

    :catchall_9c
    move-exception v3

    :try_start_9d
    monitor-exit v4
    :try_end_9e
    .catchall {:try_start_9d .. :try_end_9e} :catchall_9c

    throw v3
.end method
