.class public Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;
.super Landroid/support/v4/app/Fragment;
.source "BehanceSDKLoginToTwitterHeadlessFragment.java"

# interfaces
.implements Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAuthURLFromTwitterTaskListener;
.implements Lcom/behance/sdk/asynctask/listeners/IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;
    }
.end annotation


# instance fields
.field private callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

.field private getAuthURLFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;

.field private getAuthURLFromTwitterTaskInProgress:Z

.field private retrieveAccessTokenFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;

.field private retrieveAccessTokenFromTwitterTaskInProgress:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 39
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->setRetainInstance(Z)V

    .line 40
    return-void
.end method

.method private isGetAuthURLFromTwitterTaskInProgress()Z
    .registers 2

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->getAuthURLFromTwitterTaskInProgress:Z

    return v0
.end method

.method private isRetrieveAccessTokenFromTwitterTaskInProgress()Z
    .registers 2

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->retrieveAccessTokenFromTwitterTaskInProgress:Z

    return v0
.end method

.method private setGetAuthURLFromTwitterTaskInProgress(Z)V
    .registers 2
    .param p1, "getAuthURLFromTwitterTaskInProgress"    # Z

    .prologue
    .line 47
    iput-boolean p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->getAuthURLFromTwitterTaskInProgress:Z

    .line 48
    return-void
.end method

.method private setRetrieveAccessTokenFromTwitterTaskInProgress(Z)V
    .registers 2
    .param p1, "retrieveAccessTokenFromTwitterTaskInProgress"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->retrieveAccessTokenFromTwitterTaskInProgress:Z

    .line 90
    return-void
.end method


# virtual methods
.method public getAuthURLFromTwitter(Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;)V
    .registers 7
    .param p1, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;

    .prologue
    const/4 v4, 0x1

    .line 51
    invoke-direct {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->isGetAuthURLFromTwitterTaskInProgress()Z

    move-result v0

    if-nez v0, :cond_21

    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->getAuthURLFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;

    if-nez v0, :cond_21

    .line 52
    new-instance v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;

    invoke-direct {v0, p0}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;-><init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAuthURLFromTwitterTaskListener;)V

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->getAuthURLFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;

    .line 53
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->getAuthURLFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v2, v4, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 54
    invoke-direct {p0, v4}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->setGetAuthURLFromTwitterTaskInProgress(Z)V

    .line 56
    :cond_21
    return-void
.end method

.method public onGetAuthURLFromTwitterFailure(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;)V
    .registers 4
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

    if-eqz v0, :cond_d

    .line 78
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->getException()Ljava/lang/Exception;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;->onGetAuthURLFromTwitterFailure(Ljava/lang/Exception;)V

    .line 80
    :cond_d
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->getAuthURLFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;

    .line 81
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->setGetAuthURLFromTwitterTaskInProgress(Z)V

    .line 82
    return-void
.end method

.method public onGetAuthURLFromTwitterSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;)V
    .registers 3
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

    if-eqz v0, :cond_9

    .line 69
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;->onGetAuthURLFromTwitterSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;)V

    .line 71
    :cond_9
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->getAuthURLFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;

    .line 72
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->setGetAuthURLFromTwitterTaskInProgress(Z)V

    .line 73
    return-void
.end method

.method public onRetrieveAccessTokenFromTwitterFailure(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V
    .registers 4
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

    if-eqz v0, :cond_d

    .line 104
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->getException()Ljava/lang/Exception;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;->onRetrieveAccessTokenFromTwitterFailure(Ljava/lang/Exception;)V

    .line 106
    :cond_d
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->setRetrieveAccessTokenFromTwitterTaskInProgress(Z)V

    .line 107
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->retrieveAccessTokenFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;

    .line 108
    return-void
.end method

.method public onRetrieveAccessTokenFromTwitterSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V
    .registers 3
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

    if-eqz v0, :cond_9

    .line 95
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;->onRetrieveAccessTokenFromTwitterSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V

    .line 97
    :cond_9
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->setRetrieveAccessTokenFromTwitterTaskInProgress(Z)V

    .line 98
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->retrieveAccessTokenFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;

    .line 99
    return-void
.end method

.method public retrieveAccessTokenFromTwitter(Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;)V
    .registers 7
    .param p1, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;

    .prologue
    const/4 v4, 0x1

    .line 59
    invoke-direct {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->isRetrieveAccessTokenFromTwitterTaskInProgress()Z

    move-result v0

    if-nez v0, :cond_25

    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->retrieveAccessTokenFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;

    if-nez v0, :cond_25

    .line 60
    new-instance v0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;

    invoke-virtual {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;-><init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->retrieveAccessTokenFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;

    .line 61
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->retrieveAccessTokenFromTwitterAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v2, v4, [Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 62
    invoke-direct {p0, v4}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->setRetrieveAccessTokenFromTwitterTaskInProgress(Z)V

    .line 64
    :cond_25
    return-void
.end method

.method public setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;

    .line 36
    return-void
.end method
