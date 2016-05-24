.class public Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;
.super Ljava/util/concurrent/ThreadPoolExecutor;
.source "AdobeNetworkHttpRequestExecutor.java"


# instance fields
.field private _isPaused:Z

.field private pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

.field private unpaused:Ljava/util/concurrent/locks/Condition;


# direct methods
.method public constructor <init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V
    .registers 8
    .param p1, "corePoolSize"    # I
    .param p2, "maximumPoolSize"    # I
    .param p3, "keepAliveTime"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p6, "workQueue":Ljava/util/concurrent/BlockingQueue;, "Ljava/util/concurrent/BlockingQueue<Ljava/lang/Runnable;>;"
    invoke-direct/range {p0 .. p6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->_isPaused:Z

    .line 29
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 30
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->unpaused:Ljava/util/concurrent/locks/Condition;

    .line 35
    return-void
.end method


# virtual methods
.method protected beforeExecute(Ljava/lang/Thread;Ljava/lang/Runnable;)V
    .registers 6
    .param p1, "t"    # Ljava/lang/Thread;
    .param p2, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 39
    invoke-super {p0, p1, p2}, Ljava/util/concurrent/ThreadPoolExecutor;->beforeExecute(Ljava/lang/Thread;Ljava/lang/Runnable;)V

    .line 40
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 42
    :goto_8
    :try_start_8
    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->_isPaused:Z

    if-eqz v1, :cond_1c

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->unpaused:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_11
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_11} :catch_12
    .catchall {:try_start_8 .. :try_end_11} :catchall_22

    goto :goto_8

    .line 43
    :catch_12
    move-exception v0

    .line 44
    .local v0, "ie":Ljava/lang/InterruptedException;
    :try_start_13
    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V
    :try_end_16
    .catchall {:try_start_13 .. :try_end_16} :catchall_22

    .line 46
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 48
    .end local v0    # "ie":Ljava/lang/InterruptedException;
    :goto_1b
    return-void

    .line 46
    :cond_1c
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_1b

    :catchall_22
    move-exception v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1
.end method

.method public declared-synchronized pause()V
    .registers 3

    .prologue
    .line 51
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_17

    .line 53
    const/4 v0, 0x1

    :try_start_7
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->_isPaused:Z
    :try_end_9
    .catchall {:try_start_7 .. :try_end_9} :catchall_10

    .line 55
    :try_start_9
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_17

    .line 57
    monitor-exit p0

    return-void

    .line 55
    :catchall_10
    move-exception v0

    :try_start_11
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
    :try_end_17
    .catchall {:try_start_11 .. :try_end_17} :catchall_17

    .line 51
    :catchall_17
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized resume()V
    .registers 3

    .prologue
    .line 60
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_1c

    .line 62
    const/4 v0, 0x0

    :try_start_7
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->_isPaused:Z

    .line 63
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->unpaused:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_15

    .line 65
    :try_start_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_13
    .catchall {:try_start_e .. :try_end_13} :catchall_1c

    .line 67
    monitor-exit p0

    return-void

    .line 65
    :catchall_15
    move-exception v0

    :try_start_16
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pauseLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
    :try_end_1c
    .catchall {:try_start_16 .. :try_end_1c} :catchall_1c

    .line 60
    :catchall_1c
    move-exception v0

    monitor-exit p0

    throw v0
.end method
