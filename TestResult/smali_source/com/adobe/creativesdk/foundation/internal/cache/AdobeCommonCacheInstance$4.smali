.class Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;
.super Ljava/lang/Object;
.source "AdobeCommonCacheInstance.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getObjectFromDiskWithGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

.field final synthetic val$callback:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;

.field final synthetic val$guid:Ljava/lang/String;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$options:Ljava/util/EnumSet;

.field final synthetic val$startTime:Ljava/util/Date;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;Ljava/util/Date;Ljava/util/EnumSet;)V
    .registers 8
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .prologue
    .line 682
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$guid:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$key:Ljava/lang/String;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$callback:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;

    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$handler:Landroid/os/Handler;

    iput-object p6, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$startTime:Ljava/util/Date;

    iput-object p7, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$options:Ljava/util/EnumSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 19

    .prologue
    .line 686
    :try_start_0
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 687
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v11, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Got Read lock in getObjectFromDiskWithGUID.Current lock count "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v13}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 688
    new-instance v6, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$guid:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheDirectoryForGuid(Ljava/lang/String;)Ljava/io/File;
    invoke-static {v10, v11}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$100(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$key:Ljava/lang/String;

    invoke-direct {v6, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 690
    .local v6, "inputFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_bf

    .line 691
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v11, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Disk Miss for key "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$key:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 692
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$callback:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$handler:Landroid/os/Handler;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->callMissHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$200(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
    :try_end_85
    .catchall {:try_start_0 .. :try_end_85} :catchall_1c9

    .line 730
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 731
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v11, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Read lock released in getObjectFromDiskWithGUID.Holding "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v13}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 733
    :goto_be
    return-void

    .line 695
    :cond_bf
    const/4 v4, 0x0

    .line 696
    .local v4, "fis":Ljava/io/FileInputStream;
    const/4 v8, 0x0

    .line 698
    .local v8, "ois":Ljava/io/ObjectInputStream;
    :try_start_c1
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_c6
    .catch Ljava/io/IOException; {:try_start_c1 .. :try_end_c6} :catch_19c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_c1 .. :try_end_c6} :catch_204
    .catchall {:try_start_c1 .. :try_end_c6} :catchall_233

    .line 699
    .end local v4    # "fis":Ljava/io/FileInputStream;
    .local v5, "fis":Ljava/io/FileInputStream;
    :try_start_c6
    new-instance v9, Ljava/io/ObjectInputStream;

    invoke-direct {v9, v5}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_cb
    .catch Ljava/io/IOException; {:try_start_c6 .. :try_end_cb} :catch_252
    .catch Ljava/lang/ClassNotFoundException; {:try_start_c6 .. :try_end_cb} :catch_24b
    .catchall {:try_start_c6 .. :try_end_cb} :catchall_244

    .line 700
    .end local v8    # "ois":Ljava/io/ObjectInputStream;
    .local v9, "ois":Ljava/io/ObjectInputStream;
    :try_start_cb
    invoke-virtual {v9}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v7

    .line 702
    .local v7, "object":Ljava/lang/Object;, "TT;"
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    .line 703
    .local v3, "endTime":Ljava/util/Date;
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$guid:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$key:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v14

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$startTime:Ljava/util/Date;

    invoke-virtual {v13}, Ljava/util/Date;->getTime()J

    move-result-wide v16

    sub-long v14, v14, v16

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->logDiskCacheHit(Ljava/lang/String;Ljava/lang/String;J)V
    invoke-static {v10, v11, v12, v14, v15}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$300(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;Ljava/lang/String;J)V

    .line 704
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$guid:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$key:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v11, v12, v13}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$400(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->addEntryToCacheMetadata(Ljava/io/File;Ljava/lang/String;)V
    invoke-static {v10, v6, v11}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$500(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/io/File;Ljava/lang/String;)V

    .line 707
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$callback:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$handler:Landroid/os/Handler;

    sget-object v13, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;->AdobeCommonCacheHitLocationDisk:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->callHitHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    invoke-static {v10, v11, v12, v7, v13}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$600(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V

    .line 709
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$options:Ljava/util/EnumSet;

    sget-object v11, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-virtual {v10, v11}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_14e

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCacheSize:D
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$700(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)D

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmpl-double v10, v10, v12

    if-lez v10, :cond_14e

    .line 710
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->memCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$800(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$guid:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$key:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v11, v12, v13}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$400(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11, v7}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_14e
    .catch Ljava/io/IOException; {:try_start_cb .. :try_end_14e} :catch_256
    .catch Ljava/lang/ClassNotFoundException; {:try_start_cb .. :try_end_14e} :catch_24e
    .catchall {:try_start_cb .. :try_end_14e} :catchall_247

    .line 721
    :cond_14e
    if-eqz v5, :cond_153

    .line 722
    :try_start_150
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    .line 723
    :cond_153
    if-eqz v9, :cond_158

    .line 724
    invoke-virtual {v9}, Ljava/io/ObjectInputStream;->close()V
    :try_end_158
    .catch Ljava/io/IOException; {:try_start_150 .. :try_end_158} :catch_195
    .catchall {:try_start_150 .. :try_end_158} :catchall_1c9

    :cond_158
    move-object v8, v9

    .end local v9    # "ois":Ljava/io/ObjectInputStream;
    .restart local v8    # "ois":Ljava/io/ObjectInputStream;
    move-object v4, v5

    .line 730
    .end local v3    # "endTime":Ljava/util/Date;
    .end local v5    # "fis":Ljava/io/FileInputStream;
    .end local v7    # "object":Ljava/lang/Object;, "TT;"
    .restart local v4    # "fis":Ljava/io/FileInputStream;
    :cond_15a
    :goto_15a
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v10}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 731
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v11, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Read lock released in getObjectFromDiskWithGUID.Holding "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v13}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_be

    .line 725
    .end local v4    # "fis":Ljava/io/FileInputStream;
    .end local v8    # "ois":Ljava/io/ObjectInputStream;
    .restart local v3    # "endTime":Ljava/util/Date;
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "object":Ljava/lang/Object;, "TT;"
    .restart local v9    # "ois":Ljava/io/ObjectInputStream;
    :catch_195
    move-exception v2

    .line 726
    .local v2, "e":Ljava/io/IOException;
    :try_start_196
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_199
    .catchall {:try_start_196 .. :try_end_199} :catchall_1c9

    move-object v8, v9

    .end local v9    # "ois":Ljava/io/ObjectInputStream;
    .restart local v8    # "ois":Ljava/io/ObjectInputStream;
    move-object v4, v5

    .line 728
    .end local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "fis":Ljava/io/FileInputStream;
    goto :goto_15a

    .line 713
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "endTime":Ljava/util/Date;
    .end local v7    # "object":Ljava/lang/Object;, "TT;"
    :catch_19c
    move-exception v2

    .line 714
    .restart local v2    # "e":Ljava/io/IOException;
    :goto_19d
    :try_start_19d
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v11, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "Unable to read map from cache"

    invoke-static {v10, v11, v12, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 715
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$callback:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$handler:Landroid/os/Handler;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->callMissHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$200(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
    :try_end_1b9
    .catchall {:try_start_19d .. :try_end_1b9} :catchall_233

    .line 721
    if-eqz v4, :cond_1be

    .line 722
    :try_start_1bb
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    .line 723
    :cond_1be
    if-eqz v8, :cond_15a

    .line 724
    invoke-virtual {v8}, Ljava/io/ObjectInputStream;->close()V
    :try_end_1c3
    .catch Ljava/io/IOException; {:try_start_1bb .. :try_end_1c3} :catch_1c4
    .catchall {:try_start_1bb .. :try_end_1c3} :catchall_1c9

    goto :goto_15a

    .line 725
    :catch_1c4
    move-exception v2

    .line 726
    :try_start_1c5
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1c8
    .catchall {:try_start_1c5 .. :try_end_1c8} :catchall_1c9

    goto :goto_15a

    .line 730
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "inputFile":Ljava/io/File;
    .end local v8    # "ois":Ljava/io/ObjectInputStream;
    :catchall_1c9
    move-exception v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v11}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 731
    sget-object v11, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v12, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Read lock released in getObjectFromDiskWithGUID.Holding "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->diskReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v14}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->getReadLockCount()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v11, v12, v13}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    throw v10

    .line 716
    .restart local v4    # "fis":Ljava/io/FileInputStream;
    .restart local v6    # "inputFile":Ljava/io/File;
    .restart local v8    # "ois":Ljava/io/ObjectInputStream;
    :catch_204
    move-exception v2

    .line 717
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    :goto_205
    :try_start_205
    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v11, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    const-string v12, "Unable to read map from cache"

    invoke-static {v10, v11, v12, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 718
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$callback:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4;->val$handler:Landroid/os/Handler;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->callMissHandler(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
    invoke-static {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$200(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
    :try_end_221
    .catchall {:try_start_205 .. :try_end_221} :catchall_233

    .line 721
    if-eqz v4, :cond_226

    .line 722
    :try_start_223
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    .line 723
    :cond_226
    if-eqz v8, :cond_15a

    .line 724
    invoke-virtual {v8}, Ljava/io/ObjectInputStream;->close()V
    :try_end_22b
    .catch Ljava/io/IOException; {:try_start_223 .. :try_end_22b} :catch_22d
    .catchall {:try_start_223 .. :try_end_22b} :catchall_1c9

    goto/16 :goto_15a

    .line 725
    :catch_22d
    move-exception v2

    .line 726
    .local v2, "e":Ljava/io/IOException;
    :try_start_22e
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_231
    .catchall {:try_start_22e .. :try_end_231} :catchall_1c9

    goto/16 :goto_15a

    .line 720
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_233
    move-exception v10

    .line 721
    :goto_234
    if-eqz v4, :cond_239

    .line 722
    :try_start_236
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V

    .line 723
    :cond_239
    if-eqz v8, :cond_23e

    .line 724
    invoke-virtual {v8}, Ljava/io/ObjectInputStream;->close()V
    :try_end_23e
    .catch Ljava/io/IOException; {:try_start_236 .. :try_end_23e} :catch_23f
    .catchall {:try_start_236 .. :try_end_23e} :catchall_1c9

    .line 727
    :cond_23e
    :goto_23e
    :try_start_23e
    throw v10

    .line 725
    :catch_23f
    move-exception v2

    .line 726
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_243
    .catchall {:try_start_23e .. :try_end_243} :catchall_1c9

    goto :goto_23e

    .line 720
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    :catchall_244
    move-exception v10

    move-object v4, v5

    .end local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "fis":Ljava/io/FileInputStream;
    goto :goto_234

    .end local v4    # "fis":Ljava/io/FileInputStream;
    .end local v8    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v9    # "ois":Ljava/io/ObjectInputStream;
    :catchall_247
    move-exception v10

    move-object v8, v9

    .end local v9    # "ois":Ljava/io/ObjectInputStream;
    .restart local v8    # "ois":Ljava/io/ObjectInputStream;
    move-object v4, v5

    .end local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "fis":Ljava/io/FileInputStream;
    goto :goto_234

    .line 716
    .end local v4    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    :catch_24b
    move-exception v2

    move-object v4, v5

    .end local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "fis":Ljava/io/FileInputStream;
    goto :goto_205

    .end local v4    # "fis":Ljava/io/FileInputStream;
    .end local v8    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v9    # "ois":Ljava/io/ObjectInputStream;
    :catch_24e
    move-exception v2

    move-object v8, v9

    .end local v9    # "ois":Ljava/io/ObjectInputStream;
    .restart local v8    # "ois":Ljava/io/ObjectInputStream;
    move-object v4, v5

    .end local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "fis":Ljava/io/FileInputStream;
    goto :goto_205

    .line 713
    .end local v4    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    :catch_252
    move-exception v2

    move-object v4, v5

    .end local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_19d

    .end local v4    # "fis":Ljava/io/FileInputStream;
    .end local v8    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v9    # "ois":Ljava/io/ObjectInputStream;
    :catch_256
    move-exception v2

    move-object v8, v9

    .end local v9    # "ois":Ljava/io/ObjectInputStream;
    .restart local v8    # "ois":Ljava/io/ObjectInputStream;
    move-object v4, v5

    .end local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_19d
.end method
