.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;
.super Ljava/lang/Object;
.source "CdsManifestPacksIconsConsumer.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->createJob()Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;
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
        "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)Ljava/lang/Object;
    .registers 17
    .param p2, "params"    # [Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            "Ljava/lang/Object;",
            ">;[",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
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
    .line 146
    .local p1, "workerContext":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    aget-object v11, p2, v1

    .line 147
    .local v11, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    const/4 v8, 0x0

    .line 148
    .local v8, "stream":Ljava/io/InputStream;
    const/4 v10, 0x0

    .line 151
    .local v10, "iconUrl":Ljava/lang/String;
    :try_start_5
    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getIconURL()Ljava/lang/String;

    move-result-object v10

    .line 152
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "iconUrl: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v10, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 153
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_55

    .line 154
    const-string v1, "http://"

    invoke-virtual {v10, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_55

    const-string v1, "https://"

    invoke-virtual {v10, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_55

    const-string v1, "file://"

    .line 155
    invoke-virtual {v10, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_55

    .line 156
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mManifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$100(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getAssetsBaseURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 159
    :cond_55
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    .line 162
    .local v9, "iconUri":Landroid/net/Uri;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->download(Ljava/lang/String;)Ljava/io/InputStream;
    invoke-static {v1, v10}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$200(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v8

    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackIconPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 165
    .local v13, "root":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 168
    .local v6, "iconDir":Ljava/io/File;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    .line 169
    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getId()J

    move-result-wide v2

    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v4

    invoke-virtual {v9}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v7

    .line 168
    # invokes: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->updatePackIcon(JJLjava/io/File;Ljava/lang/String;Ljava/io/InputStream;)I
    invoke-static/range {v1 .. v8}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$400(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;JJLjava/io/File;Ljava/lang/String;Ljava/io/InputStream;)I

    move-result v12

    .line 171
    .local v12, "result":I
    if-lez v12, :cond_d1

    .line 172
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$300(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->notifyPackContentUpdate(Landroid/content/Context;J)V
    :try_end_b2
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_b2} :catch_e5
    .catch Ljava/lang/AssertionError; {:try_start_5 .. :try_end_b2} :catch_125
    .catchall {:try_start_5 .. :try_end_b2} :catchall_168

    .line 183
    :goto_b2
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 184
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    monitor-enter v2

    .line 185
    :try_start_bc
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 186
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 187
    monitor-exit v2
    :try_end_cf
    .catchall {:try_start_bc .. :try_end_cf} :catchall_122

    .line 189
    .end local v6    # "iconDir":Ljava/io/File;
    .end local v9    # "iconUri":Landroid/net/Uri;
    .end local v12    # "result":I
    .end local v13    # "root":Ljava/lang/String;
    :goto_cf
    const/4 v1, 0x0

    return-object v1

    .line 174
    .restart local v6    # "iconDir":Ljava/io/File;
    .restart local v9    # "iconUri":Landroid/net/Uri;
    .restart local v12    # "result":I
    .restart local v13    # "root":Ljava/lang/String;
    :cond_d1
    :try_start_d1
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "onUpdatedPackIcon result: %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_e4
    .catch Ljava/lang/Exception; {:try_start_d1 .. :try_end_e4} :catch_e5
    .catch Ljava/lang/AssertionError; {:try_start_d1 .. :try_end_e4} :catch_125
    .catchall {:try_start_d1 .. :try_end_e4} :catchall_168

    goto :goto_b2

    .line 176
    .end local v6    # "iconDir":Ljava/io/File;
    .end local v9    # "iconUri":Landroid/net/Uri;
    .end local v12    # "result":I
    .end local v13    # "root":Ljava/lang/String;
    :catch_e5
    move-exception v0

    .line 177
    .local v0, "e":Ljava/lang/Exception;
    :try_start_e6
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "failed to download icon \'%s\': %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v10, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 178
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mExceptions:Ljava/util/List;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$500(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_101
    .catchall {:try_start_e6 .. :try_end_101} :catchall_168

    .line 183
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 184
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    monitor-enter v2

    .line 185
    :try_start_10b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 186
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 187
    monitor-exit v2

    goto :goto_cf

    :catchall_11f
    move-exception v1

    monitor-exit v2
    :try_end_121
    .catchall {:try_start_10b .. :try_end_121} :catchall_11f

    throw v1

    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v6    # "iconDir":Ljava/io/File;
    .restart local v9    # "iconUri":Landroid/net/Uri;
    .restart local v12    # "result":I
    .restart local v13    # "root":Ljava/lang/String;
    :catchall_122
    move-exception v1

    :try_start_123
    monitor-exit v2
    :try_end_124
    .catchall {:try_start_123 .. :try_end_124} :catchall_122

    throw v1

    .line 179
    .end local v6    # "iconDir":Ljava/io/File;
    .end local v9    # "iconUri":Landroid/net/Uri;
    .end local v12    # "result":I
    .end local v13    # "root":Ljava/lang/String;
    :catch_125
    move-exception v0

    .line 180
    .local v0, "e":Ljava/lang/AssertionError;
    :try_start_126
    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "failed to updated icon \'%s\': %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v10, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 181
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mExceptions:Ljava/util/List;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$500(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/List;

    move-result-object v1

    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_146
    .catchall {:try_start_126 .. :try_end_146} :catchall_168

    .line 183
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 184
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    monitor-enter v2

    .line 185
    :try_start_150
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 186
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 187
    monitor-exit v2

    goto/16 :goto_cf

    :catchall_165
    move-exception v1

    monitor-exit v2
    :try_end_167
    .catchall {:try_start_150 .. :try_end_167} :catchall_165

    throw v1

    .line 183
    .end local v0    # "e":Ljava/lang/AssertionError;
    :catchall_168
    move-exception v1

    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 184
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    monitor-enter v2

    .line 185
    :try_start_173
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 186
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->mLocks:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;->access$600(Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 187
    monitor-exit v2
    :try_end_186
    .catchall {:try_start_173 .. :try_end_186} :catchall_187

    throw v1

    :catchall_187
    move-exception v1

    :try_start_188
    monitor-exit v2
    :try_end_189
    .catchall {:try_start_188 .. :try_end_189} :catchall_187

    throw v1
.end method

.method public bridge synthetic run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 140
    check-cast p2, [Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;->run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
