.class public Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKGetAlbumsAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 40
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;

    .line 46
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;)Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;
    .registers 12
    .param p1, "arg0"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 50
    new-instance v4, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;

    invoke-direct {v4}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;-><init>()V

    .line 52
    .local v4, "result":Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;
    const/4 v6, 0x0

    :try_start_8
    aget-object v5, p1, v6

    .line 53
    .local v5, "taskParams":Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;
    invoke-virtual {v5}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;->getContextWeakReference()Ljava/lang/ref/WeakReference;

    move-result-object v2

    .line 54
    .local v2, "contextWeakReference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/Context;>;"
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    .line 55
    .local v1, "context":Landroid/content/Context;
    if-eqz v1, :cond_23

    .line 56
    const/4 v6, 0x0

    invoke-virtual {v5}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;->isShowImageSelectionSources()Z

    move-result v7

    invoke-static {v1, v6, v7}, Lcom/behance/sdk/files/LocalImageLoader;->getAlbumsList(Landroid/content/Context;ZZ)Ljava/util/List;

    move-result-object v0

    .line 57
    .local v0, "albumsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;>;"
    invoke-virtual {v4, v0}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->setAlbumsList(Ljava/util/List;)V

    .line 71
    .end local v0    # "albumsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;>;"
    .end local v1    # "context":Landroid/content/Context;
    .end local v2    # "contextWeakReference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/Context;>;"
    .end local v5    # "taskParams":Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;
    :goto_22
    return-object v4

    .line 59
    .restart local v1    # "context":Landroid/content/Context;
    .restart local v2    # "contextWeakReference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/Context;>;"
    .restart local v5    # "taskParams":Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;
    :cond_23
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->setExceptionOccurred(Z)V

    .line 60
    new-instance v6, Ljava/lang/Exception;

    const-string v7, "Context is null"

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->setException(Ljava/lang/Exception;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_31} :catch_32
    .catch Ljava/lang/Error; {:try_start_8 .. :try_end_31} :catch_43

    goto :goto_22

    .line 62
    .end local v1    # "context":Landroid/content/Context;
    .end local v2    # "contextWeakReference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/Context;>;"
    .end local v5    # "taskParams":Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;
    :catch_32
    move-exception v3

    .line 63
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v4, v9}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->setExceptionOccurred(Z)V

    .line 64
    invoke-virtual {v4, v3}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->setException(Ljava/lang/Exception;)V

    .line 65
    sget-object v6, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v7, "Problem loading albums"

    new-array v8, v8, [Ljava/lang/Object;

    invoke-interface {v6, v3, v7, v8}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_22

    .line 66
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_43
    move-exception v3

    .line 67
    .local v3, "e":Ljava/lang/Error;
    invoke-virtual {v4, v9}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->setExceptionOccurred(Z)V

    .line 68
    new-instance v6, Ljava/lang/Exception;

    invoke-direct {v6, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v4, v6}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->setException(Ljava/lang/Exception;)V

    .line 69
    sget-object v6, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v7, "Problem loading albums"

    new-array v8, v8, [Ljava/lang/Object;

    invoke-interface {v6, v3, v7, v8}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_22
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 38
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;)Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;)V
    .registers 4
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;

    .prologue
    .line 76
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 77
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->getException()Ljava/lang/Exception;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;->onGetAlbumsTaskFailure(Ljava/lang/Exception;)V

    .line 81
    :goto_f
    return-void

    .line 79
    :cond_10
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->getAlbumsList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;->onGetAlbumsTaskSuccess(Ljava/util/List;)V

    goto :goto_f
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 38
    check-cast p1, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;)V

    return-void
.end method
