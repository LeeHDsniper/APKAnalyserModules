.class public Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;
.super Ljava/lang/Object;
.source "BehanceSDKProfileLocationsDataManager.java"

# interfaces
.implements Lcom/behance/sdk/listeners/IGetCitiesAsyncTaskListener;
.implements Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;
.implements Lcom/behance/sdk/listeners/IGetStatesOfCountryAsyncTaskListener;


# static fields
.field private static instance:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;


# instance fields
.field private activeCountryId:Ljava/lang/String;

.field private activeGetCitiesParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

.field private citiesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;",
            ">;"
        }
    .end annotation
.end field

.field private clientId:Ljava/lang/String;

.field private countriesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;",
            ">;"
        }
    .end annotation
.end field

.field private getCitiesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;

.field private getCitiesAsyncTaskInProgress:Z

.field private getCountriesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;

.field private getCountriesTaskInProgress:Z

.field private getStatesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;

.field private getStatesAsyncTaskInProgress:Z

.field private listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet",
            "<",
            "Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;",
            ">;"
        }
    .end annotation
.end field

.field private statesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->countriesList:Ljava/util/List;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->statesList:Ljava/util/List;

    .line 47
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    .line 49
    invoke-direct {p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setCredentials()V

    .line 50
    return-void
.end method

.method public static getInstance()Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;
    .registers 1

    .prologue
    .line 59
    sget-object v0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->instance:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    if-nez v0, :cond_b

    .line 60
    new-instance v0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    invoke-direct {v0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;-><init>()V

    sput-object v0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->instance:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    .line 62
    :cond_b
    sget-object v0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->instance:Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;

    return-object v0
.end method

.method private loadCountriesFromServer()V
    .registers 5

    .prologue
    const/4 v2, 0x1

    .line 74
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCountriesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;

    if-nez v1, :cond_2a

    .line 75
    invoke-direct {p0, v2}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setGetCountriesTaskInProgress(Z)V

    .line 76
    new-instance v1, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;

    invoke-direct {v1, p0}, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;-><init>(Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;)V

    iput-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCountriesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;

    .line 77
    new-instance v0, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;

    invoke-direct {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;-><init>()V

    .line 79
    .local v0, "params":Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->clientId:Ljava/lang/String;

    if-nez v1, :cond_1b

    .line 80
    invoke-direct {p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setCredentials()V

    .line 81
    :cond_1b
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->clientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;->setClientId(Ljava/lang/String;)V

    .line 83
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCountriesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;

    new-array v2, v2, [Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 85
    .end local v0    # "params":Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
    :cond_2a
    return-void
.end method

.method private loadStatesFromServer(Ljava/lang/String;)V
    .registers 6
    .param p1, "countryId"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 153
    invoke-virtual {p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->isGetStatesAsyncTaskInProgress()Z

    move-result v1

    if-nez v1, :cond_33

    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getStatesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;

    if-nez v1, :cond_33

    .line 154
    invoke-direct {p0, v2}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setGetStatesAsyncTaskInProgress(Z)V

    .line 155
    new-instance v1, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;

    invoke-direct {v1, p0}, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;-><init>(Lcom/behance/sdk/listeners/IGetStatesOfCountryAsyncTaskListener;)V

    iput-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getStatesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;

    .line 156
    new-instance v0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;

    invoke-direct {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;-><init>()V

    .line 157
    .local v0, "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;
    invoke-virtual {v0, p1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;->setCountryId(Ljava/lang/String;)V

    .line 159
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->clientId:Ljava/lang/String;

    if-nez v1, :cond_24

    .line 160
    invoke-direct {p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setCredentials()V

    .line 161
    :cond_24
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->clientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;->setClientId(Ljava/lang/String;)V

    .line 163
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getStatesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;

    new-array v2, v2, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 165
    .end local v0    # "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;
    :cond_33
    return-void
.end method

.method private notifyListenersOnGetCountriesSuccess()V
    .registers 4

    .prologue
    .line 88
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_20

    .line 89
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;

    .line 90
    .local v0, "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    iget-object v2, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->countriesList:Ljava/util/List;

    invoke-interface {v0, v2}, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;->onCountriesLoadingSuccess(Ljava/util/List;)V

    goto :goto_e

    .line 93
    .end local v0    # "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    :cond_20
    return-void
.end method

.method private notifyListenersOnGetStatesSuccess(Ljava/lang/String;Ljava/util/List;)V
    .registers 6
    .param p1, "countryId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 168
    .local p2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 169
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;

    .line 170
    .local v0, "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    invoke-interface {v0, p1, p2}, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;->onStatesLoadingSuccess(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_e

    .line 173
    .end local v0    # "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    :cond_1e
    return-void
.end method

.method private notifyOnGetCitiesSuccessListeners(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/util/List;)V
    .registers 6
    .param p1, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 241
    .local p2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 242
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;

    .line 243
    .local v0, "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    invoke-interface {v0, p1, p2}, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;->onCitiesLoadingSuccess(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/util/List;)V

    goto :goto_e

    .line 246
    .end local v0    # "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    :cond_1e
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCitiesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;

    .line 247
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setGetCitiesAsyncTaskInProgress(Z)V

    .line 248
    return-void
.end method

.method private searchCitiesOnServer(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;)V
    .registers 5
    .param p1, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    .prologue
    const/4 v1, 0x1

    .line 217
    iput-object p1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->activeGetCitiesParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    .line 218
    invoke-direct {p0, v1}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setGetCitiesAsyncTaskInProgress(Z)V

    .line 220
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCitiesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;

    if-eqz v0, :cond_12

    .line 221
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCitiesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->cancel(Z)Z

    .line 222
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCitiesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;

    .line 225
    :cond_12
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->clientId:Ljava/lang/String;

    if-nez v0, :cond_19

    .line 226
    invoke-direct {p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setCredentials()V

    .line 227
    :cond_19
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->clientId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->setClientId(Ljava/lang/String;)V

    .line 229
    new-instance v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;

    invoke-direct {v0, p0}, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;-><init>(Lcom/behance/sdk/listeners/IGetCitiesAsyncTaskListener;)V

    iput-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCitiesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;

    .line 230
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCitiesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;

    new-array v1, v1, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 231
    return-void
.end method

.method private setCredentials()V
    .registers 4

    .prologue
    .line 53
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;

    move-result-object v0

    .line 54
    .local v0, "manager":Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;
    invoke-virtual {v0}, Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v1

    .line 55
    .local v1, "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    invoke-interface {v1}, Lcom/behance/sdk/IBehanceSDKUserCredentials;->getClientId()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->clientId:Ljava/lang/String;

    .line 56
    return-void
.end method

.method private setGetCitiesAsyncTaskInProgress(Z)V
    .registers 2
    .param p1, "getCitiesAsyncTaskInProgress"    # Z

    .prologue
    .line 200
    iput-boolean p1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCitiesAsyncTaskInProgress:Z

    .line 201
    return-void
.end method

.method private setGetCountriesTaskInProgress(Z)V
    .registers 2
    .param p1, "getCountriesTaskInProgress"    # Z

    .prologue
    .line 132
    iput-boolean p1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCountriesTaskInProgress:Z

    .line 133
    return-void
.end method

.method private setGetStatesAsyncTaskInProgress(Z)V
    .registers 2
    .param p1, "getStatesAsyncTaskInProgress"    # Z

    .prologue
    .line 140
    iput-boolean p1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getStatesAsyncTaskInProgress:Z

    .line 141
    return-void
.end method


# virtual methods
.method public addListener(Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;

    .prologue
    .line 116
    if-eqz p1, :cond_f

    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    .line 117
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    .line 119
    :cond_f
    return-void
.end method

.method public isGetCountriesTaskInProgress()Z
    .registers 2

    .prologue
    .line 128
    iget-boolean v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCountriesTaskInProgress:Z

    return v0
.end method

.method public isGetStatesAsyncTaskInProgress()Z
    .registers 2

    .prologue
    .line 136
    iget-boolean v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getStatesAsyncTaskInProgress:Z

    return v0
.end method

.method public loadCountries()V
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->countriesList:Ljava/util/List;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->countriesList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 67
    :cond_c
    invoke-direct {p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->loadCountriesFromServer()V

    .line 71
    :goto_f
    return-void

    .line 69
    :cond_10
    invoke-direct {p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->notifyListenersOnGetCountriesSuccess()V

    goto :goto_f
.end method

.method public loadStates(Ljava/lang/String;)V
    .registers 4
    .param p1, "countryId"    # Ljava/lang/String;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->activeCountryId:Ljava/lang/String;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->activeCountryId:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->statesList:Ljava/util/List;

    if-eqz v0, :cond_18

    .line 145
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->activeCountryId:Ljava/lang/String;

    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->statesList:Ljava/util/List;

    invoke-direct {p0, v0, v1}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->notifyListenersOnGetStatesSuccess(Ljava/lang/String;Ljava/util/List;)V

    .line 150
    :goto_17
    return-void

    .line 147
    :cond_18
    iput-object p1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->activeCountryId:Ljava/lang/String;

    .line 148
    invoke-direct {p0, p1}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->loadStatesFromServer(Ljava/lang/String;)V

    goto :goto_17
.end method

.method public onGetCitiesFailure(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/lang/Exception;)V
    .registers 6
    .param p1, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 252
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 253
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;

    .line 254
    .local v0, "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    invoke-interface {v0, p1, p2}, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;->onCitiesLoadingFailure(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/lang/Exception;)V

    goto :goto_e

    .line 257
    .end local v0    # "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    :cond_1e
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCitiesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;

    .line 258
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setGetCitiesAsyncTaskInProgress(Z)V

    .line 259
    return-void
.end method

.method public onGetCitiesSuccess(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/util/List;)V
    .registers 4
    .param p1, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 235
    .local p2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->activeGetCitiesParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    invoke-virtual {p1, v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 236
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->notifyOnGetCitiesSuccessListeners(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/util/List;)V

    .line 238
    :cond_b
    return-void
.end method

.method public onGetCountriesFailure(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 106
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 107
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;

    .line 108
    .local v0, "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    invoke-interface {v0, p1}, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;->onCountriesLoadingFailure(Ljava/lang/Exception;)V

    goto :goto_e

    .line 111
    .end local v0    # "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    :cond_1e
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCountriesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;

    .line 112
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setGetCountriesTaskInProgress(Z)V

    .line 113
    return-void
.end method

.method public onGetCountriesSuccess(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 97
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->countriesList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 98
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->countriesList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 99
    invoke-direct {p0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->notifyListenersOnGetCountriesSuccess()V

    .line 100
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getCountriesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;

    .line 101
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setGetCountriesTaskInProgress(Z)V

    .line 102
    return-void
.end method

.method public onGetStatesFailure(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 6
    .param p1, "countryId"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 186
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 187
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;

    .line 188
    .local v0, "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    invoke-interface {v0, p1, p2}, Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;->onStatesLoadingFailure(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_e

    .line 191
    .end local v0    # "listener":Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
    :cond_1e
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getStatesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;

    .line 192
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setGetStatesAsyncTaskInProgress(Z)V

    .line 193
    return-void
.end method

.method public onGetStatesSuccess(Ljava/lang/String;Ljava/util/List;)V
    .registers 4
    .param p1, "countryId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 177
    .local p2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->statesList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 178
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->statesList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 179
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->notifyListenersOnGetStatesSuccess(Ljava/lang/String;Ljava/util/List;)V

    .line 180
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->getStatesAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;

    .line 181
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->setGetStatesAsyncTaskInProgress(Z)V

    .line 182
    return-void
.end method

.method public removeListener(Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;

    .prologue
    .line 122
    if-eqz p1, :cond_7

    .line 123
    iget-object v0, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->listenersSet:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    .line 125
    :cond_7
    return-void
.end method

.method public searchForCities(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "countryId"    # Ljava/lang/String;
    .param p2, "stateId"    # Ljava/lang/String;
    .param p3, "citySearchStr"    # Ljava/lang/String;

    .prologue
    .line 204
    new-instance v0, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    invoke-direct {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;-><init>()V

    .line 205
    .local v0, "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
    invoke-virtual {v0, p1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->setCountryId(Ljava/lang/String;)V

    .line 206
    invoke-virtual {v0, p2}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->setStateId(Ljava/lang/String;)V

    .line 207
    invoke-virtual {v0, p3}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->setCitySearchStr(Ljava/lang/String;)V

    .line 209
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->citiesList:Ljava/util/List;

    if-eqz v1, :cond_26

    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->activeGetCitiesParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    if-eqz v1, :cond_26

    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->activeGetCitiesParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    invoke-virtual {v1, v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 210
    iget-object v1, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->activeGetCitiesParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    iget-object v2, p0, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->citiesList:Ljava/util/List;

    invoke-direct {p0, v1, v2}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->notifyOnGetCitiesSuccessListeners(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/util/List;)V

    .line 214
    :goto_25
    return-void

    .line 212
    :cond_26
    invoke-direct {p0, v0}, Lcom/behance/sdk/datamanager/BehanceSDKProfileLocationsDataManager;->searchCitiesOnServer(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;)V

    goto :goto_25
.end method
