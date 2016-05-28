.class public final Lcom/facebook/internal/FileLruCache;
.super Ljava/lang/Object;
.source "FileLruCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/internal/FileLruCache$BufferFile;,
        Lcom/facebook/internal/FileLruCache$CloseCallbackOutputStream;,
        Lcom/facebook/internal/FileLruCache$CopyingInputStream;,
        Lcom/facebook/internal/FileLruCache$Limits;,
        Lcom/facebook/internal/FileLruCache$ModifiedFile;,
        Lcom/facebook/internal/FileLruCache$StreamCloseCallback;,
        Lcom/facebook/internal/FileLruCache$StreamHeader;
    }
.end annotation


# static fields
.field static final TAG:Ljava/lang/String;

.field private static final bufferIndex:Ljava/util/concurrent/atomic/AtomicLong;


# instance fields
.field private final directory:Ljava/io/File;

.field private isTrimInProgress:Z

.field private isTrimPending:Z

.field private lastClearCacheTime:Ljava/util/concurrent/atomic/AtomicLong;

.field private final limits:Lcom/facebook/internal/FileLruCache$Limits;

.field private final lock:Ljava/lang/Object;

.field private final tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    const-class v0, Lcom/facebook/internal/FileLruCache;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/internal/FileLruCache;->TAG:Ljava/lang/String;

    .line 64
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lcom/facebook/internal/FileLruCache;->bufferIndex:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/internal/FileLruCache$Limits;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "limits"    # Lcom/facebook/internal/FileLruCache$Limits;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/facebook/internal/FileLruCache;->lastClearCacheTime:Ljava/util/concurrent/atomic/AtomicLong;

    .line 76
    iput-object p2, p0, Lcom/facebook/internal/FileLruCache;->tag:Ljava/lang/String;

    .line 77
    iput-object p3, p0, Lcom/facebook/internal/FileLruCache;->limits:Lcom/facebook/internal/FileLruCache$Limits;

    .line 78
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/internal/FileLruCache;->directory:Ljava/io/File;

    .line 79
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/internal/FileLruCache;->lock:Ljava/lang/Object;

    .line 82
    iget-object v0, p0, Lcom/facebook/internal/FileLruCache;->directory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_32

    iget-object v0, p0, Lcom/facebook/internal/FileLruCache;->directory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_37

    .line 84
    :cond_32
    iget-object v0, p0, Lcom/facebook/internal/FileLruCache;->directory:Ljava/io/File;

    invoke-static {v0}, Lcom/facebook/internal/FileLruCache$BufferFile;->deleteAll(Ljava/io/File;)V

    .line 86
    :cond_37
    return-void
.end method

.method static synthetic access$0()Ljava/util/concurrent/atomic/AtomicLong;
    .registers 1

    .prologue
    .line 64
    sget-object v0, Lcom/facebook/internal/FileLruCache;->bufferIndex:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method static synthetic access$1(Lcom/facebook/internal/FileLruCache;)Ljava/util/concurrent/atomic/AtomicLong;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/facebook/internal/FileLruCache;->lastClearCacheTime:Ljava/util/concurrent/atomic/AtomicLong;

    return-object v0
.end method

.method static synthetic access$2(Lcom/facebook/internal/FileLruCache;Ljava/lang/String;Ljava/io/File;)V
    .registers 3

    .prologue
    .line 239
    invoke-direct {p0, p1, p2}, Lcom/facebook/internal/FileLruCache;->renameToTargetAndTrim(Ljava/lang/String;Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$3(Lcom/facebook/internal/FileLruCache;)V
    .registers 1

    .prologue
    .line 280
    invoke-direct {p0}, Lcom/facebook/internal/FileLruCache;->trim()V

    return-void
.end method

.method private postTrim()V
    .registers 4

    .prologue
    .line 267
    iget-object v1, p0, Lcom/facebook/internal/FileLruCache;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 268
    :try_start_3
    iget-boolean v0, p0, Lcom/facebook/internal/FileLruCache;->isTrimPending:Z

    if-nez v0, :cond_16

    .line 269
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/internal/FileLruCache;->isTrimPending:Z

    .line 270
    invoke-static {}, Lcom/facebook/Settings;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v2, Lcom/facebook/internal/FileLruCache$3;

    invoke-direct {v2, p0}, Lcom/facebook/internal/FileLruCache$3;-><init>(Lcom/facebook/internal/FileLruCache;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 267
    :cond_16
    monitor-exit v1

    .line 278
    return-void

    .line 267
    :catchall_18
    move-exception v0

    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_18

    throw v0
.end method

.method private renameToTargetAndTrim(Ljava/lang/String;Ljava/io/File;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "buffer"    # Ljava/io/File;

    .prologue
    .line 240
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/facebook/internal/FileLruCache;->directory:Ljava/io/File;

    invoke-static {p1}, Lcom/facebook/internal/Utility;->md5hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 247
    .local v0, "target":Ljava/io/File;
    invoke-virtual {p2, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_14

    .line 248
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 251
    :cond_14
    invoke-direct {p0}, Lcom/facebook/internal/FileLruCache;->postTrim()V

    .line 252
    return-void
.end method

.method private trim()V
    .registers 19

    .prologue
    .line 281
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/facebook/internal/FileLruCache;->lock:Ljava/lang/Object;

    monitor-enter v11

    .line 282
    const/4 v10, 0x0

    :try_start_6
    move-object/from16 v0, p0

    iput-boolean v10, v0, Lcom/facebook/internal/FileLruCache;->isTrimPending:Z

    .line 283
    const/4 v10, 0x1

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lcom/facebook/internal/FileLruCache;->isTrimInProgress:Z

    .line 281
    monitor-exit v11
    :try_end_10
    .catchall {:try_start_6 .. :try_end_10} :catchall_61

    .line 286
    :try_start_10
    sget-object v10, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    sget-object v11, Lcom/facebook/internal/FileLruCache;->TAG:Ljava/lang/String;

    const-string v12, "trim started"

    invoke-static {v10, v11, v12}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    new-instance v6, Ljava/util/PriorityQueue;

    invoke-direct {v6}, Ljava/util/PriorityQueue;-><init>()V

    .line 288
    .local v6, "heap":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/facebook/internal/FileLruCache$ModifiedFile;>;"
    const-wide/16 v8, 0x0

    .line 289
    .local v8, "size":J
    const-wide/16 v2, 0x0

    .line 290
    .local v2, "count":J
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/facebook/internal/FileLruCache;->directory:Ljava/io/File;

    invoke-static {}, Lcom/facebook/internal/FileLruCache$BufferFile;->excludeBufferFiles()Ljava/io/FilenameFilter;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v5

    .line 291
    .local v5, "filesToTrim":[Ljava/io/File;
    if-eqz v5, :cond_34

    .line 292
    array-length v11, v5

    const/4 v10, 0x0

    :goto_32
    if-lt v10, v11, :cond_64

    .line 303
    :cond_34
    :goto_34
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/facebook/internal/FileLruCache;->limits:Lcom/facebook/internal/FileLruCache$Limits;

    invoke-virtual {v10}, Lcom/facebook/internal/FileLruCache$Limits;->getByteCount()I

    move-result v10

    int-to-long v10, v10

    cmp-long v10, v8, v10

    if-gtz v10, :cond_a9

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/facebook/internal/FileLruCache;->limits:Lcom/facebook/internal/FileLruCache$Limits;

    invoke-virtual {v10}, Lcom/facebook/internal/FileLruCache$Limits;->getFileCount()I
    :try_end_48
    .catchall {:try_start_10 .. :try_end_48} :catchall_da

    move-result v10

    int-to-long v10, v10

    cmp-long v10, v2, v10

    if-gtz v10, :cond_a9

    .line 311
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/facebook/internal/FileLruCache;->lock:Ljava/lang/Object;

    monitor-enter v11

    .line 312
    const/4 v10, 0x0

    :try_start_54
    move-object/from16 v0, p0

    iput-boolean v10, v0, Lcom/facebook/internal/FileLruCache;->isTrimInProgress:Z

    .line 313
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/facebook/internal/FileLruCache;->lock:Ljava/lang/Object;

    invoke-virtual {v10}, Ljava/lang/Object;->notifyAll()V

    .line 311
    monitor-exit v11
    :try_end_60
    .catchall {:try_start_54 .. :try_end_60} :catchall_f1

    .line 316
    return-void

    .line 281
    .end local v2    # "count":J
    .end local v5    # "filesToTrim":[Ljava/io/File;
    .end local v6    # "heap":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/facebook/internal/FileLruCache$ModifiedFile;>;"
    .end local v8    # "size":J
    :catchall_61
    move-exception v10

    :try_start_62
    monitor-exit v11
    :try_end_63
    .catchall {:try_start_62 .. :try_end_63} :catchall_61

    throw v10

    .line 292
    .restart local v2    # "count":J
    .restart local v5    # "filesToTrim":[Ljava/io/File;
    .restart local v6    # "heap":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/facebook/internal/FileLruCache$ModifiedFile;>;"
    .restart local v8    # "size":J
    :cond_64
    :try_start_64
    aget-object v4, v5, v10

    .line 293
    .local v4, "file":Ljava/io/File;
    new-instance v7, Lcom/facebook/internal/FileLruCache$ModifiedFile;

    invoke-direct {v7, v4}, Lcom/facebook/internal/FileLruCache$ModifiedFile;-><init>(Ljava/io/File;)V

    .line 294
    .local v7, "modified":Lcom/facebook/internal/FileLruCache$ModifiedFile;
    invoke-virtual {v6, v7}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 295
    sget-object v12, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    sget-object v13, Lcom/facebook/internal/FileLruCache;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "  trim considering time="

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->getModified()J

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    .line 296
    const-string v15, " name="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v7}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->getFile()Ljava/io/File;

    move-result-object v15

    invoke-virtual {v15}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 295
    invoke-static {v12, v13, v14}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v12

    add-long/2addr v8, v12

    .line 299
    const-wide/16 v12, 0x1

    add-long/2addr v2, v12

    .line 292
    add-int/lit8 v10, v10, 0x1

    goto :goto_32

    .line 304
    .end local v4    # "file":Ljava/io/File;
    .end local v7    # "modified":Lcom/facebook/internal/FileLruCache$ModifiedFile;
    :cond_a9
    invoke-virtual {v6}, Ljava/util/PriorityQueue;->remove()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/facebook/internal/FileLruCache$ModifiedFile;

    invoke-virtual {v10}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->getFile()Ljava/io/File;

    move-result-object v4

    .line 305
    .restart local v4    # "file":Ljava/io/File;
    sget-object v10, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    sget-object v11, Lcom/facebook/internal/FileLruCache;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "  trim removing "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v10

    sub-long/2addr v8, v10

    .line 307
    const-wide/16 v10, 0x1

    sub-long/2addr v2, v10

    .line 308
    invoke-virtual {v4}, Ljava/io/File;->delete()Z
    :try_end_d8
    .catchall {:try_start_64 .. :try_end_d8} :catchall_da

    goto/16 :goto_34

    .line 310
    .end local v2    # "count":J
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "filesToTrim":[Ljava/io/File;
    .end local v6    # "heap":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/facebook/internal/FileLruCache$ModifiedFile;>;"
    .end local v8    # "size":J
    :catchall_da
    move-exception v10

    .line 311
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/facebook/internal/FileLruCache;->lock:Ljava/lang/Object;

    monitor-enter v11

    .line 312
    const/4 v12, 0x0

    :try_start_e1
    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/facebook/internal/FileLruCache;->isTrimInProgress:Z

    .line 313
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/facebook/internal/FileLruCache;->lock:Ljava/lang/Object;

    invoke-virtual {v12}, Ljava/lang/Object;->notifyAll()V

    .line 311
    monitor-exit v11
    :try_end_ed
    .catchall {:try_start_e1 .. :try_end_ed} :catchall_ee

    .line 315
    throw v10

    .line 311
    :catchall_ee
    move-exception v10

    :try_start_ef
    monitor-exit v11
    :try_end_f0
    .catchall {:try_start_ef .. :try_end_f0} :catchall_ee

    throw v10

    .restart local v2    # "count":J
    .restart local v5    # "filesToTrim":[Ljava/io/File;
    .restart local v6    # "heap":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Lcom/facebook/internal/FileLruCache$ModifiedFile;>;"
    .restart local v8    # "size":J
    :catchall_f1
    move-exception v10

    :try_start_f2
    monitor-exit v11
    :try_end_f3
    .catchall {:try_start_f2 .. :try_end_f3} :catchall_f1

    throw v10
.end method


# virtual methods
.method public clearCache()V
    .registers 5

    .prologue
    .line 225
    iget-object v1, p0, Lcom/facebook/internal/FileLruCache;->directory:Ljava/io/File;

    invoke-static {}, Lcom/facebook/internal/FileLruCache$BufferFile;->excludeBufferFiles()Ljava/io/FilenameFilter;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    .line 226
    .local v0, "filesToDelete":[Ljava/io/File;
    iget-object v1, p0, Lcom/facebook/internal/FileLruCache;->lastClearCacheTime:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 227
    if-eqz v0, :cond_21

    .line 228
    invoke-static {}, Lcom/facebook/Settings;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/facebook/internal/FileLruCache$2;

    invoke-direct {v2, p0, v0}, Lcom/facebook/internal/FileLruCache$2;-><init>(Lcom/facebook/internal/FileLruCache;[Ljava/io/File;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 237
    :cond_21
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/facebook/internal/FileLruCache;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;
    .registers 20
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "contentTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v6, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/facebook/internal/FileLruCache;->directory:Ljava/io/File;

    invoke-static/range {p1 .. p1}, Lcom/facebook/internal/Utility;->md5hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v6, v13, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 121
    .local v6, "file":Ljava/io/File;
    const/4 v10, 0x0

    .line 123
    .local v10, "input":Ljava/io/FileInputStream;
    :try_start_e
    new-instance v11, Ljava/io/FileInputStream;

    invoke-direct {v11, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_13} :catch_29

    .line 128
    .end local v10    # "input":Ljava/io/FileInputStream;
    .local v11, "input":Ljava/io/FileInputStream;
    new-instance v4, Ljava/io/BufferedInputStream;

    const/16 v13, 0x2000

    invoke-direct {v4, v11, v13}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 129
    .local v4, "buffered":Ljava/io/BufferedInputStream;
    const/4 v12, 0x0

    .line 132
    .local v12, "success":Z
    :try_start_1b
    invoke-static {v4}, Lcom/facebook/internal/FileLruCache$StreamHeader;->readHeader(Ljava/io/InputStream;)Lorg/json/JSONObject;
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_9d

    move-result-object v8

    .line 133
    .local v8, "header":Lorg/json/JSONObject;
    if-nez v8, :cond_2c

    .line 157
    if-nez v12, :cond_26

    .line 158
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V

    .line 134
    :cond_26
    const/4 v4, 0x0

    move-object v10, v11

    .line 155
    .end local v4    # "buffered":Ljava/io/BufferedInputStream;
    .end local v8    # "header":Lorg/json/JSONObject;
    .end local v11    # "input":Ljava/io/FileInputStream;
    .end local v12    # "success":Z
    .restart local v10    # "input":Ljava/io/FileInputStream;
    :goto_28
    return-object v4

    .line 124
    :catch_29
    move-exception v5

    .line 125
    .local v5, "e":Ljava/io/IOException;
    const/4 v4, 0x0

    goto :goto_28

    .line 137
    .end local v5    # "e":Ljava/io/IOException;
    .end local v10    # "input":Ljava/io/FileInputStream;
    .restart local v4    # "buffered":Ljava/io/BufferedInputStream;
    .restart local v8    # "header":Lorg/json/JSONObject;
    .restart local v11    # "input":Ljava/io/FileInputStream;
    .restart local v12    # "success":Z
    :cond_2c
    :try_start_2c
    const-string v13, "key"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 138
    .local v7, "foundKey":Ljava/lang/String;
    if-eqz v7, :cond_3c

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_39
    .catchall {:try_start_2c .. :try_end_39} :catchall_9d

    move-result v13

    if-nez v13, :cond_44

    .line 157
    :cond_3c
    if-nez v12, :cond_41

    .line 158
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V

    .line 139
    :cond_41
    const/4 v4, 0x0

    move-object v10, v11

    .end local v11    # "input":Ljava/io/FileInputStream;
    .restart local v10    # "input":Ljava/io/FileInputStream;
    goto :goto_28

    .line 142
    .end local v10    # "input":Ljava/io/FileInputStream;
    .restart local v11    # "input":Ljava/io/FileInputStream;
    :cond_44
    :try_start_44
    const-string v13, "tag"

    const/4 v14, 0x0

    invoke-virtual {v8, v13, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 144
    .local v9, "headerContentTag":Ljava/lang/String;
    if-nez p2, :cond_4f

    if-nez v9, :cond_59

    .line 145
    :cond_4f
    if-eqz p2, :cond_61

    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_56
    .catchall {:try_start_44 .. :try_end_56} :catchall_9d

    move-result v13

    if-nez v13, :cond_61

    .line 157
    :cond_59
    if-nez v12, :cond_5e

    .line 158
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V

    .line 146
    :cond_5e
    const/4 v4, 0x0

    move-object v10, v11

    .end local v11    # "input":Ljava/io/FileInputStream;
    .restart local v10    # "input":Ljava/io/FileInputStream;
    goto :goto_28

    .line 149
    .end local v10    # "input":Ljava/io/FileInputStream;
    .restart local v11    # "input":Ljava/io/FileInputStream;
    :cond_61
    :try_start_61
    new-instance v13, Ljava/util/Date;

    invoke-direct {v13}, Ljava/util/Date;-><init>()V

    invoke-virtual {v13}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 150
    .local v2, "accessTime":J
    sget-object v13, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    sget-object v14, Lcom/facebook/internal/FileLruCache;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "Setting lastModified to "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " for "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 151
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 150
    invoke-static {v13, v14, v15}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    invoke-virtual {v6, v2, v3}, Ljava/io/File;->setLastModified(J)Z
    :try_end_95
    .catchall {:try_start_61 .. :try_end_95} :catchall_9d

    .line 154
    const/4 v12, 0x1

    .line 157
    if-nez v12, :cond_9b

    .line 158
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V

    :cond_9b
    move-object v10, v11

    .line 155
    .end local v11    # "input":Ljava/io/FileInputStream;
    .restart local v10    # "input":Ljava/io/FileInputStream;
    goto :goto_28

    .line 156
    .end local v2    # "accessTime":J
    .end local v7    # "foundKey":Ljava/lang/String;
    .end local v8    # "header":Lorg/json/JSONObject;
    .end local v9    # "headerContentTag":Ljava/lang/String;
    .end local v10    # "input":Ljava/io/FileInputStream;
    .restart local v11    # "input":Ljava/io/FileInputStream;
    :catchall_9d
    move-exception v13

    .line 157
    if-nez v12, :cond_a3

    .line 158
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V

    .line 160
    :cond_a3
    throw v13
.end method

.method public interceptAndPut(Ljava/lang/String;Ljava/io/InputStream;)Ljava/io/InputStream;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 258
    invoke-virtual {p0, p1}, Lcom/facebook/internal/FileLruCache;->openPutStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0

    .line 259
    .local v0, "output":Ljava/io/OutputStream;
    new-instance v1, Lcom/facebook/internal/FileLruCache$CopyingInputStream;

    invoke-direct {v1, p2, v0}, Lcom/facebook/internal/FileLruCache$CopyingInputStream;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    return-object v1
.end method

.method openPutStream(Ljava/lang/String;)Ljava/io/OutputStream;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/facebook/internal/FileLruCache;->openPutStream(Ljava/lang/String;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public openPutStream(Ljava/lang/String;Ljava/lang/String;)Ljava/io/OutputStream;
    .registers 20
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "contentTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/facebook/internal/FileLruCache;->directory:Ljava/io/File;

    invoke-static {v3}, Lcom/facebook/internal/FileLruCache$BufferFile;->newFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v6

    .line 169
    .local v6, "buffer":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 170
    invoke-virtual {v6}, Ljava/io/File;->createNewFile()Z

    move-result v3

    if-nez v3, :cond_2a

    .line 171
    new-instance v3, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v14, "Could not create file at "

    invoke-direct {v7, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 174
    :cond_2a
    const/4 v11, 0x0

    .line 176
    .local v11, "file":Ljava/io/FileOutputStream;
    :try_start_2b
    new-instance v11, Ljava/io/FileOutputStream;

    .end local v11    # "file":Ljava/io/FileOutputStream;
    invoke-direct {v11, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_30
    .catch Ljava/io/FileNotFoundException; {:try_start_2b .. :try_end_30} :catch_6d

    .line 182
    .restart local v11    # "file":Ljava/io/FileOutputStream;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 183
    .local v4, "bufferFileCreateTime":J
    new-instance v2, Lcom/facebook/internal/FileLruCache$1;

    move-object/from16 v3, p0

    move-object/from16 v7, p1

    invoke-direct/range {v2 .. v7}, Lcom/facebook/internal/FileLruCache$1;-><init>(Lcom/facebook/internal/FileLruCache;JLjava/io/File;Ljava/lang/String;)V

    .line 196
    .local v2, "renameToTargetCallback":Lcom/facebook/internal/FileLruCache$StreamCloseCallback;
    new-instance v9, Lcom/facebook/internal/FileLruCache$CloseCallbackOutputStream;

    invoke-direct {v9, v11, v2}, Lcom/facebook/internal/FileLruCache$CloseCallbackOutputStream;-><init>(Ljava/io/OutputStream;Lcom/facebook/internal/FileLruCache$StreamCloseCallback;)V

    .line 197
    .local v9, "cleanup":Lcom/facebook/internal/FileLruCache$CloseCallbackOutputStream;
    new-instance v8, Ljava/io/BufferedOutputStream;

    const/16 v3, 0x2000

    invoke-direct {v8, v9, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 198
    .local v8, "buffered":Ljava/io/BufferedOutputStream;
    const/4 v13, 0x0

    .line 202
    .local v13, "success":Z
    :try_start_4a
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    .line 203
    .local v12, "header":Lorg/json/JSONObject;
    const-string v3, "key"

    move-object/from16 v0, p1

    invoke-virtual {v12, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 204
    invoke-static/range {p2 .. p2}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_63

    .line 205
    const-string v3, "tag"

    move-object/from16 v0, p2

    invoke-virtual {v12, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 208
    :cond_63
    invoke-static {v8, v12}, Lcom/facebook/internal/FileLruCache$StreamHeader;->writeHeader(Ljava/io/OutputStream;Lorg/json/JSONObject;)V
    :try_end_66
    .catch Lorg/json/JSONException; {:try_start_4a .. :try_end_66} :catch_8f
    .catchall {:try_start_4a .. :try_end_66} :catchall_b1

    .line 210
    const/4 v13, 0x1

    .line 217
    if-nez v13, :cond_6c

    .line 218
    invoke-virtual {v8}, Ljava/io/BufferedOutputStream;->close()V

    .line 211
    :cond_6c
    return-object v8

    .line 177
    .end local v2    # "renameToTargetCallback":Lcom/facebook/internal/FileLruCache$StreamCloseCallback;
    .end local v4    # "bufferFileCreateTime":J
    .end local v8    # "buffered":Ljava/io/BufferedOutputStream;
    .end local v9    # "cleanup":Lcom/facebook/internal/FileLruCache$CloseCallbackOutputStream;
    .end local v11    # "file":Ljava/io/FileOutputStream;
    .end local v12    # "header":Lorg/json/JSONObject;
    .end local v13    # "success":Z
    :catch_6d
    move-exception v10

    .line 178
    .local v10, "e":Ljava/io/FileNotFoundException;
    sget-object v3, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    const/4 v7, 0x5

    sget-object v14, Lcom/facebook/internal/FileLruCache;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "Error creating buffer output stream: "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v3, v7, v14, v15}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V

    .line 179
    new-instance v3, Ljava/io/IOException;

    invoke-virtual {v10}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 212
    .end local v10    # "e":Ljava/io/FileNotFoundException;
    .restart local v2    # "renameToTargetCallback":Lcom/facebook/internal/FileLruCache$StreamCloseCallback;
    .restart local v4    # "bufferFileCreateTime":J
    .restart local v8    # "buffered":Ljava/io/BufferedOutputStream;
    .restart local v9    # "cleanup":Lcom/facebook/internal/FileLruCache$CloseCallbackOutputStream;
    .restart local v11    # "file":Ljava/io/FileOutputStream;
    .restart local v13    # "success":Z
    :catch_8f
    move-exception v10

    .line 214
    .local v10, "e":Lorg/json/JSONException;
    :try_start_90
    sget-object v3, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    const/4 v7, 0x5

    sget-object v14, Lcom/facebook/internal/FileLruCache;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "Error creating JSON header for cache file: "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v3, v7, v14, v15}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;ILjava/lang/String;Ljava/lang/String;)V

    .line 215
    new-instance v3, Ljava/io/IOException;

    invoke-virtual {v10}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_b1
    .catchall {:try_start_90 .. :try_end_b1} :catchall_b1

    .line 216
    .end local v10    # "e":Lorg/json/JSONException;
    :catchall_b1
    move-exception v3

    .line 217
    if-nez v13, :cond_b7

    .line 218
    invoke-virtual {v8}, Ljava/io/BufferedOutputStream;->close()V

    .line 220
    :cond_b7
    throw v3
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 263
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "{FileLruCache: tag:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/facebook/internal/FileLruCache;->tag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " file:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/internal/FileLruCache;->directory:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
