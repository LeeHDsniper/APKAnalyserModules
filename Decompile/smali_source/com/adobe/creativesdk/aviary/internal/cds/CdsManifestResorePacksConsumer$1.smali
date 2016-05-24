.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;
.super Ljava/lang/Object;
.source "CdsManifestResorePacksConsumer.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->consumeNewPack()Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
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
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

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
    .line 156
    check-cast p2, [Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public varargs run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/String;)Ljava/lang/Object;
    .registers 10
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
    .line 163
    .local p1, "workerContext":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    .line 164
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mServerRoot:Ljava/lang/String;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mDebug:Z
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Z

    move-result v4

    invoke-direct {v0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;-><init>(Ljava/lang/String;Z)V

    .line 167
    .local v0, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    aget-object v4, p2, v4

    const/4 v5, 0x1

    aget-object v5, p2, v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mWifiOnly:Z
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Z

    move-result v6

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;->download(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;

    .line 170
    .local v2, "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    .line 171
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Landroid/content/Context;

    move-result-object v3

    const/16 v4, 0x2710

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$500(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v6

    .line 170
    invoke-static {v3, v2, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->insertNewContentFromJson(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;IILjava/lang/String;)V
    :try_end_3f
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3f} :catch_5e
    .catchall {:try_start_0 .. :try_end_3f} :catchall_8e

    .line 176
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 177
    :try_start_46
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 178
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 179
    monitor-exit v4

    .line 181
    .end local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .end local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :goto_59
    const/4 v3, 0x0

    return-object v3

    .line 179
    .restart local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .restart local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :catchall_5b
    move-exception v3

    monitor-exit v4
    :try_end_5d
    .catchall {:try_start_46 .. :try_end_5d} :catchall_5b

    throw v3

    .line 172
    .end local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .end local v2    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :catch_5e
    move-exception v1

    .line 173
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_5f
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 174
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mExceptions:Ljava/util/List;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/List;

    move-result-object v3

    new-instance v4, Ljava/lang/Exception;

    invoke-direct {v4, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_70
    .catchall {:try_start_5f .. :try_end_70} :catchall_8e

    .line 176
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 177
    :try_start_77
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 178
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 179
    monitor-exit v4

    goto :goto_59

    :catchall_8b
    move-exception v3

    monitor-exit v4
    :try_end_8d
    .catchall {:try_start_77 .. :try_end_8d} :catchall_8b

    throw v3

    .line 176
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_8e
    move-exception v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    monitor-enter v4

    .line 177
    :try_start_96
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 178
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 179
    monitor-exit v4
    :try_end_a9
    .catchall {:try_start_96 .. :try_end_a9} :catchall_aa

    throw v3

    :catchall_aa
    move-exception v3

    :try_start_ab
    monitor-exit v4
    :try_end_ac
    .catchall {:try_start_ab .. :try_end_ac} :catchall_aa

    throw v3
.end method
