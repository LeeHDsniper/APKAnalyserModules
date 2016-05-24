.class public abstract Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.super Landroid/os/AsyncTask;
.source "AdobeImageAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Params:",
        "Ljava/lang/Object;",
        "Progress:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask",
        "<TParams;TProgress;TResult;>;"
    }
.end annotation


# static fields
.field private static final S_HANDLER:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 26
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->S_HANDLER:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask<TParams;TProgress;TResult;>;"
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method private isUiThread()Z
    .registers 5

    .prologue
    .line 29
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask<TParams;TProgress;TResult;>;"
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)TResult;"
        }
    .end annotation

    .prologue
    .line 118
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "params":[Ljava/lang/Object;, "[TParams;"
    const/4 v0, 0x0

    return-object v0
.end method

.method protected doPostExecute(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    return-void
.end method

.method protected doPreExecute()V
    .registers 1

    .prologue
    .line 114
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask<TParams;TProgress;TResult;>;"
    return-void
.end method

.method protected varargs doProgressUpdate([Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "values":[Ljava/lang/Object;, "[TProgress;"
    return-void
.end method

.method public final varargs executeInParallel([Ljava/lang/Object;)Landroid/os/AsyncTask;
    .registers 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)",
            "Landroid/os/AsyncTask",
            "<TParams;TProgress;TResult;>;"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "params":[Ljava/lang/Object;, "[TParams;"
    sget-boolean v1, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_11:Z

    if-eqz v1, :cond_11

    .line 132
    :try_start_4
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_9
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_4 .. :try_end_9} :catch_b

    move-result-object v1

    .line 137
    :goto_a
    return-object v1

    .line 133
    :catch_b
    move-exception v0

    .line 134
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v1

    goto :goto_a

    .line 137
    .end local v0    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :cond_11
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v1

    goto :goto_a
.end method

.method protected final onPostExecute(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->isUiThread()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 71
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->doPostExecute(Ljava/lang/Object;)V

    .line 82
    :goto_9
    return-void

    .line 73
    :cond_a
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->S_HANDLER:Landroid/os/Handler;

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_9
.end method

.method protected onPreExecute()V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 44
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask<TParams;TProgress;TResult;>;"
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->isUiThread()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 45
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->doPreExecute()V

    .line 56
    :goto_9
    return-void

    .line 47
    :cond_a
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->S_HANDLER:Landroid/os/Handler;

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_9
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 93
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;, "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask<TParams;TProgress;TResult;>;"
    .local p1, "values":[Ljava/lang/Object;, "[TProgress;"
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->isUiThread()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 94
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->doProgressUpdate([Ljava/lang/Object;)V

    .line 104
    :goto_9
    return-void

    .line 96
    :cond_a
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->S_HANDLER:Landroid/os/Handler;

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask$3;-><init>(Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_9
.end method
