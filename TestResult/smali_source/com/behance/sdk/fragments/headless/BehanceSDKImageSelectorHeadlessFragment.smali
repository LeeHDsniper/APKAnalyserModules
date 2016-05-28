.class public Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;
.super Landroid/support/v4/app/Fragment;
.source "BehanceSDKImageSelectorHeadlessFragment.java"

# interfaces
.implements Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;
    }
.end annotation


# instance fields
.field private albumsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
            ">;"
        }
    .end annotation
.end field

.field private albumsLoadingInProgress:Z

.field private callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;

.field private getAlbumsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 47
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsLoadingInProgress:Z

    .line 48
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->setRetainInstance(Z)V

    .line 49
    return-void
.end method

.method private setAlbumsLoadingInProgress(Z)V
    .registers 2
    .param p1, "albumsLoadingInProgress"    # Z

    .prologue
    .line 71
    iput-boolean p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsLoadingInProgress:Z

    .line 72
    return-void
.end method


# virtual methods
.method public clearAlbumsCache()V
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsList:Ljava/util/List;

    if-eqz v0, :cond_c

    .line 61
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsList:Ljava/util/List;

    .line 64
    :cond_c
    return-void
.end method

.method public getAlbumsList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsList:Ljava/util/List;

    return-object v0
.end method

.method public isAlbumsLoadingInProgress()Z
    .registers 2

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsLoadingInProgress:Z

    return v0
.end method

.method public loadAlbums(Landroid/content/Context;Z)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "withImageSelectionSources"    # Z

    .prologue
    const/4 v4, 0x1

    .line 75
    invoke-virtual {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->isAlbumsLoadingInProgress()Z

    move-result v2

    if-nez v2, :cond_2d

    .line 76
    invoke-direct {p0, v4}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->setAlbumsLoadingInProgress(Z)V

    .line 77
    new-instance v1, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;

    invoke-direct {v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;-><init>()V

    .line 78
    .local v1, "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 79
    .local v0, "contextRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/Context;>;"
    invoke-virtual {v1, v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;->setContextWeakReference(Ljava/lang/ref/WeakReference;)V

    .line 80
    invoke-virtual {v1, p2}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;->setShowImageSelectionSources(Z)V

    .line 81
    new-instance v2, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;

    invoke-direct {v2, p0}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;-><init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;)V

    iput-object v2, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->getAlbumsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;

    .line 82
    iget-object v2, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->getAlbumsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;

    sget-object v3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v4, v4, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-virtual {v2, v3, v4}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 84
    .end local v0    # "contextRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/Context;>;"
    .end local v1    # "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetAlbumsTaskParams;
    :cond_2d
    return-void
.end method

.method public onGetAlbumsTaskFailure(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 104
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->setAlbumsLoadingInProgress(Z)V

    .line 105
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->getAlbumsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;

    .line 106
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;

    if-eqz v0, :cond_10

    .line 107
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;->onGetAlbumsFailure(Ljava/lang/Exception;)V

    .line 109
    :cond_10
    return-void
.end method

.method public onGetAlbumsTaskSuccess(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 88
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;>;"
    if-eqz p1, :cond_17

    .line 89
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsList:Ljava/util/List;

    if-nez v0, :cond_d

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsList:Ljava/util/List;

    .line 92
    :cond_d
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 93
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->albumsList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 95
    :cond_17
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->setAlbumsLoadingInProgress(Z)V

    .line 96
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->getAlbumsTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsAsyncTask;

    .line 97
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;

    if-eqz v0, :cond_27

    .line 98
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;

    invoke-interface {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;->onGetAlbumsSuccess()V

    .line 100
    :cond_27
    return-void
.end method

.method public setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;

    .line 53
    return-void
.end method
