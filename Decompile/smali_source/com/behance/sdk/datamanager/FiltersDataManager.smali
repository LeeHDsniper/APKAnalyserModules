.class public Lcom/behance/sdk/datamanager/FiltersDataManager;
.super Ljava/lang/Object;
.source "FiltersDataManager.java"

# interfaces
.implements Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;


# static fields
.field private static final FILTERS_DATA_MANAGER:Lcom/behance/sdk/datamanager/FiltersDataManager;


# instance fields
.field private creativeFields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;"
        }
    .end annotation
.end field

.field private listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;",
            ">;"
        }
    .end annotation
.end field

.field private loadCreativeFieldsAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;

.field private loadCreativeFieldsTaskInProgress:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    new-instance v0, Lcom/behance/sdk/datamanager/FiltersDataManager;

    invoke-direct {v0}, Lcom/behance/sdk/datamanager/FiltersDataManager;-><init>()V

    sput-object v0, Lcom/behance/sdk/datamanager/FiltersDataManager;->FILTERS_DATA_MANAGER:Lcom/behance/sdk/datamanager/FiltersDataManager;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->listeners:Ljava/util/List;

    .line 48
    return-void
.end method

.method public static getInstance()Lcom/behance/sdk/datamanager/FiltersDataManager;
    .registers 1

    .prologue
    .line 51
    sget-object v0, Lcom/behance/sdk/datamanager/FiltersDataManager;->FILTERS_DATA_MANAGER:Lcom/behance/sdk/datamanager/FiltersDataManager;

    return-object v0
.end method

.method private loadCreativeFieldsFromServer(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V
    .registers 4
    .param p1, "iUserCredentials"    # Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->loadCreativeFieldsAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;

    if-nez v0, :cond_1c

    .line 84
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/behance/sdk/datamanager/FiltersDataManager;->setLoadCreativeFieldsTaskInProgress(Z)V

    .line 85
    new-instance v0, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;

    invoke-direct {v0, p0}, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;-><init>(Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;)V

    iput-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->loadCreativeFieldsAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;

    .line 86
    iget-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->loadCreativeFieldsAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->setUserCredentials(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V

    .line 87
    iget-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->loadCreativeFieldsAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 89
    :cond_1c
    return-void
.end method

.method private notifyListenersOnLoadCreativeFieldSuccess()V
    .registers 4

    .prologue
    .line 75
    iget-object v1, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->listeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_20

    .line 76
    iget-object v1, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->listeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;

    .line 77
    .local v0, "listener":Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;
    iget-object v2, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->creativeFields:Ljava/util/List;

    invoke-interface {v0, v2}, Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;->onCreativeFieldsLoadingSuccess(Ljava/util/List;)V

    goto :goto_e

    .line 80
    .end local v0    # "listener":Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;
    :cond_20
    return-void
.end method

.method private setLoadCreativeFieldsTaskInProgress(Z)V
    .registers 2
    .param p1, "loadCreativeFieldsTaskInProgress"    # Z

    .prologue
    .line 92
    iput-boolean p1, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->loadCreativeFieldsTaskInProgress:Z

    .line 93
    return-void
.end method


# virtual methods
.method public addListener(Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;

    .prologue
    .line 55
    if-eqz p1, :cond_f

    iget-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    .line 56
    iget-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    :cond_f
    return-void
.end method

.method public isLoadCreativeFieldsTaskInProgress()Z
    .registers 2

    .prologue
    .line 97
    iget-boolean v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->loadCreativeFieldsTaskInProgress:Z

    return v0
.end method

.method public loadCreativeFields(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V
    .registers 3
    .param p1, "iUserCredentials"    # Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->creativeFields:Ljava/util/List;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->creativeFields:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 68
    :cond_c
    invoke-direct {p0, p1}, Lcom/behance/sdk/datamanager/FiltersDataManager;->loadCreativeFieldsFromServer(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V

    .line 72
    :goto_f
    return-void

    .line 70
    :cond_10
    invoke-direct {p0}, Lcom/behance/sdk/datamanager/FiltersDataManager;->notifyListenersOnLoadCreativeFieldSuccess()V

    goto :goto_f
.end method

.method public onLoadCreativeFieldsFailure(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 120
    iget-object v1, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->listeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 121
    iget-object v1, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->listeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;

    .line 122
    .local v0, "listener":Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;
    invoke-interface {v0, p1}, Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;->onCreativeFieldsLoadingFailure(Ljava/lang/Exception;)V

    goto :goto_e

    .line 125
    .end local v0    # "listener":Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;
    :cond_1e
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->loadCreativeFieldsAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;

    .line 126
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/behance/sdk/datamanager/FiltersDataManager;->setLoadCreativeFieldsTaskInProgress(Z)V

    .line 127
    return-void
.end method

.method public onLoadCreativeFieldsSuccess(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "fields":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    iget-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->creativeFields:Ljava/util/List;

    if-nez v0, :cond_f

    .line 107
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->creativeFields:Ljava/util/List;

    .line 108
    :cond_f
    iget-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->creativeFields:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 109
    iget-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->creativeFields:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 110
    invoke-direct {p0}, Lcom/behance/sdk/datamanager/FiltersDataManager;->notifyListenersOnLoadCreativeFieldSuccess()V

    .line 111
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/datamanager/FiltersDataManager;->loadCreativeFieldsAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;

    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/datamanager/FiltersDataManager;->setLoadCreativeFieldsTaskInProgress(Z)V

    .line 113
    return-void
.end method
