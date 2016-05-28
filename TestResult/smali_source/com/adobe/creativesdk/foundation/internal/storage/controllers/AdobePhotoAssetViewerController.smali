.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;
.super Ljava/lang/Object;
.source "AdobePhotoAssetViewerController.java"


# static fields
.field private static _assetList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;"
        }
    .end annotation
.end field

.field private static _assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

.field private static _asset_collection_changed_observer:Ljava/util/Observer;

.field private static _asset_selection_changed_observer:Ljava/util/Observer;

.field private static _dataSource:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;",
            ">;"
        }
    .end annotation
.end field

.field private static _selectedIndex:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 170
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    .line 171
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_collection_changed_observer:Ljava/util/Observer;

    .line 172
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    .line 174
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$000()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    .registers 1

    .prologue
    .line 19
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    return-object v0
.end method

.method static synthetic access$102(I)I
    .registers 1
    .param p0, "x0"    # I

    .prologue
    .line 19
    sput p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_selectedIndex:I

    return p0
.end method

.method static synthetic access$200()Ljava/lang/ref/WeakReference;
    .registers 1

    .prologue
    .line 19
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$302(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 1
    .param p0, "x0"    # Ljava/util/ArrayList;

    .prologue
    .line 19
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetList:Ljava/util/ArrayList;

    return-object p0
.end method

.method static addSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V
    .registers 1
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 92
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->addSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V

    .line 93
    return-void
.end method

.method static containsAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Z
    .registers 2
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 102
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->containsAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Z

    move-result v0

    return v0
.end method

.method static count()I
    .registers 1

    .prologue
    .line 68
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetList:Ljava/util/ArrayList;

    if-eqz v0, :cond_b

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private static findIndex(Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)I
    .registers 7
    .param p1, "item"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ")I"
        }
    .end annotation

    .prologue
    .local p0, "assets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
    const/4 v2, -0x1

    .line 23
    if-nez p1, :cond_5

    move v1, v2

    .line 33
    :cond_4
    :goto_4
    return v1

    .line 26
    :cond_5
    const/4 v1, 0x0

    .line 27
    .local v1, "index":I
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .line 28
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->isEqualToAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    goto :goto_a

    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    :cond_1f
    move v1, v2

    .line 33
    goto :goto_4
.end method

.method static generateAssetArray(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V
    .registers 3
    .param p0, "dataSource"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .param p1, "item"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 37
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    .line 39
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->getAssets()Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetList:Ljava/util/ArrayList;

    .line 40
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetList:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->findIndex(Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)I

    move-result v0

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_selectedIndex:I

    .line 41
    return-void
.end method

.method static getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .registers 2
    .param p0, "pos"    # I

    .prologue
    .line 64
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetList:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    return-object v0
.end method

.method static declared-synchronized getCurrentAssetViewerActivity()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    .registers 2

    .prologue
    .line 167
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method static declared-synchronized getFileProvideAuthority()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;

    monitor-enter v0

    :try_start_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetViewerPreferences;->getFileProvideAuthority()Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_9

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_9
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method static getRenditionForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 2
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
            "<[B",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 111
    .local p1, "downloadRenditionCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobePhotoException;>;"
    invoke-static {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->getRenditionForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 112
    return-void
.end method

.method static getSelectedAssetCount()I
    .registers 1

    .prologue
    .line 107
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->selectedAssetCount()I

    move-result v0

    return v0
.end method

.method static getSelectedIndex()I
    .registers 1

    .prologue
    .line 56
    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_selectedIndex:I

    return v0
.end method

.method static getTotalAssetsCount()I
    .registers 1

    .prologue
    .line 72
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_19

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 73
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->getTotalAssetsCount()I

    move-result v0

    .line 75
    :goto_18
    return v0

    :cond_19
    const/4 v0, -0x1

    goto :goto_18
.end method

.method static isDataSourceValidForAssetViewerLaunch()Z
    .registers 1

    .prologue
    .line 44
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetList:Ljava/util/ArrayList;

    if-eqz v0, :cond_e

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_e

    .line 45
    const/4 v0, 0x1

    .line 47
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method static declared-synchronized isMenuEnabled()Z
    .registers 2

    .prologue
    .line 83
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;

    monitor-enter v0

    :try_start_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetViewerPreferences;->isMenuEnabled()Z
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_9

    move-result v1

    monitor-exit v0

    return v1

    :catchall_9
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method static isMultiSelectModeActive()Z
    .registers 1

    .prologue
    .line 79
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->isMultiSelectModeActive()Z

    move-result v0

    return v0
.end method

.method static loadNextPage()V
    .registers 1

    .prologue
    .line 51
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_17

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 52
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->loadNextPageOfData()V

    .line 53
    :cond_17
    return-void
.end method

.method static removeSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V
    .registers 1
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 97
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->removeSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V

    .line 98
    return-void
.end method

.method static declared-synchronized resetCurrentAdobeUXAssetViewerActivity()V
    .registers 4

    .prologue
    .line 157
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;

    monitor-enter v1

    :try_start_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 158
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 159
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobePhotoAssetsDataSourceDidLoadNewPageNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_collection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 160
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    .line 161
    const/4 v0, -0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_selectedIndex:I

    .line 162
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    .line 163
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_collection_changed_observer:Ljava/util/Observer;
    :try_end_30
    .catchall {:try_start_3 .. :try_end_30} :catchall_32

    .line 164
    monitor-exit v1

    return-void

    .line 157
    :catchall_32
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized setCurrentAssetViewerActivity(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;)V
    .registers 5
    .param p0, "activity"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    .prologue
    .line 115
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;

    monitor-enter v1

    :try_start_3
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    .line 116
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController$1;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController$1;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    .line 128
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController$2;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController$2;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_collection_changed_observer:Ljava/util/Observer;

    .line 145
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 148
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 151
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobePhotoAssetsDataSourceDidLoadNewPageNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_asset_collection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V
    :try_end_34
    .catchall {:try_start_3 .. :try_end_34} :catchall_36

    .line 154
    monitor-exit v1

    return-void

    .line 115
    :catchall_36
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static setSelectedIndex(I)V
    .registers 1
    .param p0, "index"    # I

    .prologue
    .line 60
    sput p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_selectedIndex:I

    .line 61
    return-void
.end method
