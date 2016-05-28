.class public abstract Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;
.super Ljava/lang/Object;
.source "ThreadPool.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/threading/Future;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "Worker"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        "O:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/aviary/internal/threading/Future",
        "<TO;>;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field mCancelListener:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$CancelListener;

.field mError:Ljava/lang/Exception;

.field mIsCancelled:Z

.field mIsDone:Z

.field mListener:Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener",
            "<TO;>;"
        }
    .end annotation
.end field

.field mResult:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TO;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;


# direct methods
.method public varargs constructor <init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job",
            "<TI;TO;>;",
            "Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener",
            "<TO;>;[TI;)V"
        }
    .end annotation

    .prologue
    .line 143
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    .local p2, "callable":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Job<TI;TO;>;"
    .local p3, "listener":Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;, "Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener<TO;>;"
    .local p4, "params":[Ljava/lang/Object;, "[TI;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->this$0:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mListener:Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;

    .line 145
    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .registers 4
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    const/4 v1, 0x0

    .line 197
    monitor-enter p0

    .line 198
    :try_start_2
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mIsCancelled:Z

    if-eqz v0, :cond_8

    .line 199
    monitor-exit p0

    .line 203
    :goto_7
    return v1

    .line 201
    :cond_8
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mIsCancelled:Z

    .line 202
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->fireOnCancelEvent()V

    .line 203
    monitor-exit p0

    goto :goto_7

    .line 204
    :catchall_10
    move-exception v0

    monitor-exit p0
    :try_end_12
    .catchall {:try_start_2 .. :try_end_12} :catchall_10

    throw v0
.end method

.method protected fireOnCancelEvent()V
    .registers 3

    .prologue
    .line 148
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mCancelListener:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$CancelListener;

    if-eqz v0, :cond_12

    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->this$0:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mListenerHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->access$000(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 158
    :cond_12
    return-void
.end method

.method protected fireOnDoneEvent()V
    .registers 4

    .prologue
    .line 161
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mListener:Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;

    if-eqz v1, :cond_13

    .line 163
    move-object v0, p0

    .line 164
    .local v0, "sender":Lcom/adobe/creativesdk/aviary/internal/threading/Future;, "Lcom/adobe/creativesdk/aviary/internal/threading/Future<TO;>;"
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->this$0:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->mListenerHandler:Landroid/os/Handler;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->access$000(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;

    invoke-direct {v2, p0, v0}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;Lcom/adobe/creativesdk/aviary/internal/threading/Future;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 173
    .end local v0    # "sender":Lcom/adobe/creativesdk/aviary/internal/threading/Future;, "Lcom/adobe/creativesdk/aviary/internal/threading/Future<TO;>;"
    :cond_13
    return-void
.end method

.method public get()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TO;"
        }
    .end annotation

    .prologue
    .line 209
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    monitor-enter p0

    .line 210
    :goto_1
    :try_start_1
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mIsDone:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_19

    if-nez v1, :cond_1c

    .line 212
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_8} :catch_9
    .catchall {:try_start_5 .. :try_end_8} :catchall_19

    goto :goto_1

    .line 213
    :catch_9
    move-exception v0

    .line 214
    .local v0, "t":Ljava/lang/Throwable;
    :try_start_a
    # getter for: Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;->access$100()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 215
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    .line 219
    .end local v0    # "t":Ljava/lang/Throwable;
    :catchall_19
    move-exception v1

    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_a .. :try_end_1b} :catchall_19

    throw v1

    .line 218
    :cond_1c
    :try_start_1c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mResult:Ljava/lang/Object;

    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_19

    return-object v1
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 6
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
    .line 224
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    const-string v1, "non implemented"

    invoke-direct {v0, v1}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isCancelled()Z
    .registers 2

    .prologue
    .line 229
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mIsCancelled:Z

    return v0
.end method

.method public isDone()Z
    .registers 2

    .prologue
    .line 234
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mIsDone:Z

    return v0
.end method

.method protected setException(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 180
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mError:Ljava/lang/Exception;

    .line 181
    return-void
.end method

.method protected setIsDone()V
    .registers 2

    .prologue
    .line 184
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mIsDone:Z

    .line 185
    return-void
.end method

.method protected setResult(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TO;)V"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker<TI;TO;>;"
    .local p1, "result":Ljava/lang/Object;, "TO;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mResult:Ljava/lang/Object;

    .line 177
    return-void
.end method
