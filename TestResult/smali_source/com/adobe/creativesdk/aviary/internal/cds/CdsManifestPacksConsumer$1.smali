.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;
.super Ljava/lang/Object;
.source "CdsManifestPacksConsumer.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->consumeOldPack(ILcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
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

.field final synthetic val$currentPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

.field final synthetic val$displayOrder:I

.field final synthetic val$displayOrderMatch:Z

.field final synthetic val$isHidden:Z

.field final synthetic val$versionKeyMatch:Z


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;ZLcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;IZZ)V
    .registers 7
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .prologue
    .line 198
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$versionKeyMatch:Z

    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$currentPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    iput p4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$displayOrder:I

    iput-boolean p5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$displayOrderMatch:Z

    iput-boolean p6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$isHidden:Z

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
    .line 198
    check-cast p2, [Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/String;)Ljava/lang/Object;
    .registers 11
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;
    .param p2, "params"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 204
    :try_start_0
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    .line 205
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mServerRoot:Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mDebug:Z
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Z

    move-result v5

    invoke-direct {v0, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;-><init>(Ljava/lang/String;Z)V

    .line 208
    .local v0, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v5, p2, v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mWifiOnly:Z
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Z

    move-result v6

    invoke-virtual {v0, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;->download(Landroid/content/Context;Ljava/lang/String;Z)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;

    .line 210
    .local v3, "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    const/4 v2, 0x0

    .line 212
    .local v2, "notifyResolver":Z
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$versionKeyMatch:Z

    if-nez v4, :cond_82

    .line 213
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$currentPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$displayOrder:I

    # invokes: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->updateContentFromJson(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;I)Z
    invoke-static {v4, v3, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$500(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;I)Z

    move-result v2

    .line 214
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    move-result-object v4

    if-eqz v4, :cond_46

    .line 215
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->update()V

    .line 230
    :cond_46
    :goto_46
    if-eqz v2, :cond_66

    .line 231
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->notificationList:Ljava/util/HashSet;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$900(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/HashSet;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$currentPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 232
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mContext:Landroid/content/Context;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$currentPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v6

    invoke-static {v4, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyPackContentUpdate(Landroid/content/Context;J)V
    :try_end_66
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_66} :catch_a6
    .catchall {:try_start_0 .. :try_end_66} :catchall_f5

    .line 238
    :cond_66
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    monitor-enter v5

    .line 239
    :try_start_6d
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 240
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 241
    monitor-exit v5
    :try_end_80
    .catchall {:try_start_6d .. :try_end_80} :catchall_111

    .line 244
    .end local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .end local v2    # "notifyResolver":Z
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :goto_80
    const/4 v4, 0x0

    return-object v4

    .line 217
    .restart local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .restart local v2    # "notifyResolver":Z
    .restart local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :cond_82
    :try_start_82
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$displayOrderMatch:Z

    if-nez v4, :cond_d1

    .line 218
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$currentPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v6

    iget v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$displayOrder:I

    # invokes: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->updateDisplayOrder(JI)Z
    invoke-static {v4, v6, v7, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$700(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;JI)Z

    .line 219
    const/4 v2, 0x0

    .line 220
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    move-result-object v4

    if-eqz v4, :cond_46

    .line 221
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->update()V
    :try_end_a5
    .catch Ljava/lang/Throwable; {:try_start_82 .. :try_end_a5} :catch_a6
    .catchall {:try_start_82 .. :try_end_a5} :catchall_f5

    goto :goto_46

    .line 234
    .end local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .end local v2    # "notifyResolver":Z
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :catch_a6
    move-exception v1

    .line 235
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_a7
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mExceptions:Ljava/util/List;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1000(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_b3
    .catchall {:try_start_a7 .. :try_end_b3} :catchall_f5

    .line 238
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    monitor-enter v5

    .line 239
    :try_start_ba
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 240
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 241
    monitor-exit v5

    goto :goto_80

    :catchall_ce
    move-exception v4

    monitor-exit v5
    :try_end_d0
    .catchall {:try_start_ba .. :try_end_d0} :catchall_ce

    throw v4

    .line 223
    .end local v1    # "e":Ljava/lang/Throwable;
    .restart local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .restart local v2    # "notifyResolver":Z
    .restart local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :cond_d1
    :try_start_d1
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$isHidden:Z

    if-eqz v4, :cond_46

    .line 224
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->val$currentPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v6

    const/4 v5, 0x1

    # invokes: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->updateVisibility(JI)Z
    invoke-static {v4, v6, v7, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$800(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;JI)Z

    move-result v2

    .line 225
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    move-result-object v4

    if-eqz v4, :cond_46

    .line 226
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Operations;->update()V
    :try_end_f3
    .catch Ljava/lang/Throwable; {:try_start_d1 .. :try_end_f3} :catch_a6
    .catchall {:try_start_d1 .. :try_end_f3} :catchall_f5

    goto/16 :goto_46

    .line 238
    .end local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .end local v2    # "notifyResolver":Z
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :catchall_f5
    move-exception v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v5

    monitor-enter v5

    .line 239
    :try_start_fd
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 240
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;->access$1100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V

    .line 241
    monitor-exit v5
    :try_end_110
    .catchall {:try_start_fd .. :try_end_110} :catchall_114

    throw v4

    .restart local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .restart local v2    # "notifyResolver":Z
    .restart local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :catchall_111
    move-exception v4

    :try_start_112
    monitor-exit v5
    :try_end_113
    .catchall {:try_start_112 .. :try_end_113} :catchall_111

    throw v4

    .end local v0    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackContentDownloader;
    .end local v2    # "notifyResolver":Z
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
    :catchall_114
    move-exception v4

    :try_start_115
    monitor-exit v5
    :try_end_116
    .catchall {:try_start_115 .. :try_end_116} :catchall_114

    throw v4
.end method
