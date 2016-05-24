.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;
.super Ljava/lang/Object;
.source "CdsManifestPacksConsumer.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->consumeNewPack(ILcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
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
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

.field final synthetic val$item:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;

.field final synthetic val$order:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;ILcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 255
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->val$order:I

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->val$item:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;

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
    .line 255
    check-cast p2, [Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public varargs run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/String;)Ljava/lang/Object;
    .registers 11
    .param p2, "params"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 262
    .local p1, "workerContext":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .line 263
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mServerRoot:Ljava/lang/String;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mDebug:Z
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Z

    move-result v4

    invoke-direct {v0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;-><init>(Ljava/lang/String;Z)V

    .line 266
    .local v0, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    aget-object v4, p2, v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mWifiOnly:Z
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Z

    move-result v5

    invoke-virtual {v0, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;->download(Landroid/content/Context;Ljava/lang/String;Z)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;

    .line 269
    .local v2, "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Landroid/content/Context;

    move-result-object v3

    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->val$order:I

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v2, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->insertNewContentFromJson(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;IILjava/lang/String;)V

    .line 270
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    move-result-object v3

    if-eqz v3, :cond_4d

    .line 271
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->add()V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_4d} :catch_6c
    .catchall {:try_start_0 .. :try_end_4d} :catchall_bf

    .line 281
    :cond_4d
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 282
    :try_start_54
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 283
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 284
    monitor-exit v4

    .line 286
    .end local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .end local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :goto_67
    const/4 v3, 0x0

    return-object v3

    .line 284
    .restart local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .restart local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :catchall_69
    move-exception v3

    monitor-exit v4
    :try_end_6b
    .catchall {:try_start_54 .. :try_end_6b} :catchall_69

    throw v3

    .line 273
    .end local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .end local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :catch_6c
    move-exception v1

    .line 274
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_6d
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mExceptions:Ljava/util/List;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 275
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 276
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->val$item:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;

    if-eqz v3, :cond_98

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->val$item:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_98

    .line 277
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "error with: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->val$item:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 279
    :cond_98
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V
    :try_end_a1
    .catchall {:try_start_6d .. :try_end_a1} :catchall_bf

    .line 281
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 282
    :try_start_a8
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 283
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 284
    monitor-exit v4

    goto :goto_67

    :catchall_bc
    move-exception v3

    monitor-exit v4
    :try_end_be
    .catchall {:try_start_a8 .. :try_end_be} :catchall_bc

    throw v3

    .line 281
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_bf
    move-exception v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 282
    :try_start_c7
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 283
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 284
    monitor-exit v4
    :try_end_da
    .catchall {:try_start_c7 .. :try_end_da} :catchall_db

    throw v3

    :catchall_db
    move-exception v3

    :try_start_dc
    monitor-exit v4
    :try_end_dd
    .catchall {:try_start_dc .. :try_end_dd} :catchall_db

    throw v3
.end method
