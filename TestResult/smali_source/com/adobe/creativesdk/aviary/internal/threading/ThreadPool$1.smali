.class Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;
.super Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;
.source "ThreadPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->submit(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)Lcom/adobe/creativesdk/aviary/internal/threading/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker",
        "<TI;TO;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

.field final synthetic val$job:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;

.field final synthetic val$params:[Ljava/lang/Object;


# direct methods
.method varargs constructor <init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .prologue
    .line 68
    .local p2, "callable":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job<TI;TO;>;"
    .local p3, "listener":Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;, "Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener<TO;>;"
    .local p4, "params":[Ljava/lang/Object;, "[TI;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    iput-object p5, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;->val$job:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;

    iput-object p6, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;->val$params:[Ljava/lang/Object;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;-><init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 5
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TO;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 96
    const/4 v0, 0x0

    return-object v0
.end method

.method public run()V
    .registers 6

    .prologue
    .line 71
    const/4 v2, 0x0

    .line 72
    .local v2, "result":Ljava/lang/Object;, "TO;"
    const/4 v1, 0x0

    .line 74
    .local v1, "error":Ljava/lang/Exception;
    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;->mIsCancelled:Z

    if-nez v3, :cond_e

    .line 76
    :try_start_6
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;->val$job:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;->val$params:[Ljava/lang/Object;

    invoke-interface {v3, p0, v4}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;->run(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_d} :catch_22

    move-result-object v2

    .line 83
    .end local v2    # "result":Ljava/lang/Object;, "TO;"
    :cond_e
    :goto_e
    monitor-enter p0

    .line 84
    if-eqz v1, :cond_14

    .line 85
    :try_start_11
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;->setException(Ljava/lang/Exception;)V

    .line 87
    :cond_14
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;->setResult(Ljava/lang/Object;)V

    .line 88
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;->setIsDone()V

    .line 89
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 90
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_11 .. :try_end_1e} :catchall_2c

    .line 91
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$1;->fireOnDoneEvent()V

    .line 92
    return-void

    .line 77
    .restart local v2    # "result":Ljava/lang/Object;, "TO;"
    :catch_22
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 79
    new-instance v1, Ljava/lang/Exception;

    .end local v1    # "error":Ljava/lang/Exception;
    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .restart local v1    # "error":Ljava/lang/Exception;
    goto :goto_e

    .line 90
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "result":Ljava/lang/Object;, "TO;"
    :catchall_2c
    move-exception v3

    :try_start_2d
    monitor-exit p0
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2c

    throw v3
.end method
