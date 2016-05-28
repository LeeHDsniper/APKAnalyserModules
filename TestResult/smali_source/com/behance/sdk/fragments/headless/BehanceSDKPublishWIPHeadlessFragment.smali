.class public Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;
.super Landroid/support/v4/app/Fragment;
.source "BehanceSDKPublishWIPHeadlessFragment.java"

# interfaces
.implements Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;
    }
.end annotation


# instance fields
.field private callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

.field private getFacebookUserIdInProgress:Z

.field private getUserWIPsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;

.field private getUserWIPsTaskInProgress:Z

.field private userWIPsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 56
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 39
    iput-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsTaskInProgress:Z

    .line 43
    iput-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getFacebookUserIdInProgress:Z

    .line 57
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->setRetainInstance(Z)V

    .line 58
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;)Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

    return-object v0
.end method

.method private populateAuthParams(Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;)V
    .registers 5
    .param p1, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;

    .prologue
    .line 65
    invoke-static {}, Lcom/behance/sdk/managers/AddWIPManager;->getInstance()Lcom/behance/sdk/managers/AddWIPManager;

    move-result-object v1

    .line 66
    .local v1, "wipManager":Lcom/behance/sdk/managers/AddWIPManager;
    invoke-virtual {v1}, Lcom/behance/sdk/managers/AddWIPManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v0

    .line 67
    .local v0, "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    invoke-interface {v0}, Lcom/behance/sdk/IBehanceSDKUserCredentials;->getClientId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;->setClientId(Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method private setGetUserWIPsTaskInProgress(Z)V
    .registers 2
    .param p1, "getUserWIPsTaskInProgress"    # Z

    .prologue
    .line 75
    iput-boolean p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsTaskInProgress:Z

    .line 76
    return-void
.end method

.method private setUserWIPsList(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p1, "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->userWIPsList:Ljava/util/List;

    .line 116
    return-void
.end method


# virtual methods
.method public getUserWIPsList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->userWIPsList:Ljava/util/List;

    return-object v0
.end method

.method public isGetUserWIPsTaskInProgress()Z
    .registers 2

    .prologue
    .line 71
    iget-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsTaskInProgress:Z

    return v0
.end method

.method public loadFacebookUserId(Lcom/facebook/Session;)V
    .registers 5
    .param p1, "activeSession"    # Lcom/facebook/Session;

    .prologue
    const/4 v2, 0x1

    .line 119
    invoke-virtual {p0, v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->setGetFacebookUserIdInProgress(Z)V

    .line 120
    new-instance v1, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$1;

    invoke-direct {v1, p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$1;-><init>(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;)V

    invoke-static {p1, v1}, Lcom/facebook/Request;->newMeRequest(Lcom/facebook/Session;Lcom/facebook/Request$GraphUserCallback;)Lcom/facebook/Request;

    move-result-object v0

    .line 133
    .local v0, "meRequest":Lcom/facebook/Request;
    new-array v1, v2, [Lcom/facebook/Request;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/facebook/Request;->executeBatchAsync([Lcom/facebook/Request;)Lcom/facebook/RequestAsyncTask;

    .line 134
    return-void
.end method

.method public loadUserWIPsFromServer()V
    .registers 8

    .prologue
    const/4 v5, 0x1

    .line 79
    invoke-virtual {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->isGetUserWIPsTaskInProgress()Z

    move-result v3

    if-nez v3, :cond_38

    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;

    if-nez v3, :cond_38

    .line 80
    invoke-direct {p0, v5}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->setGetUserWIPsTaskInProgress(Z)V

    .line 81
    new-instance v0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;

    invoke-direct {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;-><init>()V

    .line 82
    .local v0, "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;
    invoke-static {}, Lcom/behance/sdk/managers/AddWIPManager;->getInstance()Lcom/behance/sdk/managers/AddWIPManager;

    move-result-object v2

    .line 83
    .local v2, "wipManager":Lcom/behance/sdk/managers/AddWIPManager;
    invoke-virtual {v2}, Lcom/behance/sdk/managers/AddWIPManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v1

    .line 84
    .local v1, "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    invoke-interface {v1}, Lcom/behance/sdk/IBehanceSDKUserCredentials;->getUserBehanceAccountId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;->setUserId(Ljava/lang/String;)V

    .line 85
    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->populateAuthParams(Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;)V

    .line 86
    new-instance v3, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;

    invoke-direct {v3, p0}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;-><init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;)V

    iput-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;

    .line 87
    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;

    sget-object v4, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v5, v5, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    invoke-virtual {v3, v4, v5}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 89
    .end local v0    # "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;
    .end local v1    # "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    .end local v2    # "wipManager":Lcom/behance/sdk/managers/AddWIPManager;
    :cond_38
    return-void
.end method

.method public onGetUserWIPsTaskFailure(Ljava/lang/Exception;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

    if-eqz v0, :cond_9

    .line 104
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;->onGetUserWIPsFailure(Ljava/lang/Exception;)V

    .line 106
    :cond_9
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;

    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->setGetUserWIPsTaskInProgress(Z)V

    .line 108
    return-void
.end method

.method public onGetUserWIPsTaskSuccess(Ljava/util/List;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;)V
    .registers 4
    .param p2, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;",
            ")V"
        }
    .end annotation

    .prologue
    .line 93
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    invoke-direct {p0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->setUserWIPsList(Ljava/util/List;)V

    .line 94
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

    if-eqz v0, :cond_c

    .line 95
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

    invoke-interface {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;->onGetUserWIPsSuccess()V

    .line 97
    :cond_c
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;

    .line 98
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->setGetUserWIPsTaskInProgress(Z)V

    .line 99
    return-void
.end method

.method public setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

    .line 62
    return-void
.end method

.method public setGetFacebookUserIdInProgress(Z)V
    .registers 2
    .param p1, "getFacebookUserIdInProgress"    # Z

    .prologue
    .line 141
    iput-boolean p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getFacebookUserIdInProgress:Z

    .line 142
    return-void
.end method
