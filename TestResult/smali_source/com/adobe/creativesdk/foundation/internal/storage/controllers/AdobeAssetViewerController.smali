.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;
.super Ljava/lang/Object;
.source "AdobeAssetViewerController.java"


# static fields
.field private static _assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

.field private static _asset_collection_changed_observer:Ljava/util/Observer;

.field private static _asset_selection_changed_observer:Ljava/util/Observer;

.field private static _dataSource:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;",
            ">;"
        }
    .end annotation
.end field

.field private static _filteredAssetList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
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

    .line 203
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    .line 204
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_collection_changed_observer:Ljava/util/Observer;

    .line 205
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    .line 207
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method static synthetic access$000()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    .registers 1

    .prologue
    .line 33
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    return-object v0
.end method

.method static synthetic access$102(I)I
    .registers 1
    .param p0, "x0"    # I

    .prologue
    .line 33
    sput p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_selectedIndex:I

    return p0
.end method

.method static synthetic access$200()Ljava/lang/ref/WeakReference;
    .registers 1

    .prologue
    .line 33
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$300()Ljava/util/ArrayList;
    .registers 1

    .prologue
    .line 33
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$302(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 1
    .param p0, "x0"    # Ljava/util/ArrayList;

    .prologue
    .line 33
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;

    return-object p0
.end method

.method static addSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 1
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 120
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->addSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V

    .line 121
    return-void
.end method

.method static containsAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Z
    .registers 2
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 130
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->containsAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Z

    move-result v0

    return v0
.end method

.method static count()I
    .registers 1

    .prologue
    .line 97
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;

    if-eqz v0, :cond_b

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private static findIndex(Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I
    .registers 7
    .param p1, "item"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ")I"
        }
    .end annotation

    .prologue
    .local p0, "assets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    const/4 v2, -0x1

    .line 37
    if-nez p1, :cond_5

    move v1, v2

    .line 47
    :cond_4
    :goto_4
    return v1

    .line 40
    :cond_5
    const/4 v1, 0x0

    .line 41
    .local v1, "index":I
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 42
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 45
    add-int/lit8 v1, v1, 0x1

    .line 46
    goto :goto_a

    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :cond_1f
    move v1, v2

    .line 47
    goto :goto_4
.end method

.method static generateAssetArray(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 3
    .param p0, "dataSource"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;
    .param p1, "item"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 51
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    .line 62
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->purifiedAssetsToDisplay()Ljava/util/ArrayList;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;

    .line 63
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->findIndex(Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I

    move-result v0

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_selectedIndex:I

    .line 64
    return-void
.end method

.method static getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .registers 2
    .param p0, "pos"    # I

    .prologue
    .line 93
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    return-object v0
.end method

.method public static declared-synchronized getCurrentAssetViewerActivity()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    .registers 2

    .prologue
    .line 200
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
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
    .line 108
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;

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

.method static getSelectedAssetCount()I
    .registers 1

    .prologue
    .line 135
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->selectedAssetCount()I

    move-result v0

    return v0
.end method

.method static getSelectedIndex()I
    .registers 1

    .prologue
    .line 85
    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_selectedIndex:I

    return v0
.end method

.method public static isDataSourceValidForAssetViewerLaunch()Z
    .registers 1

    .prologue
    .line 74
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;

    if-eqz v0, :cond_e

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_e

    .line 75
    const/4 v0, 0x1

    .line 77
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method static declared-synchronized isMenuEnabled()Z
    .registers 2

    .prologue
    .line 105
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;

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
    .line 101
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeActive()Z

    move-result v0

    return v0
.end method

.method static loadNextPage()Z
    .registers 1

    .prologue
    .line 81
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1c

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1c

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadNextPage()Z

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v0, 0x1

    :goto_1b
    return v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method static removeSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 1
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 125
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->removeSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V

    .line 126
    return-void
.end method

.method static declared-synchronized resetCurrentAdobeUXAssetViewerActivity()V
    .registers 4

    .prologue
    .line 188
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;

    monitor-enter v1

    :try_start_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 189
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 190
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageDataSourceDidLoadNewPageNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_collection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 191
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    .line 193
    const/4 v0, -0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_selectedIndex:I

    .line 195
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    .line 196
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_collection_changed_observer:Ljava/util/Observer;
    :try_end_30
    .catchall {:try_start_3 .. :try_end_30} :catchall_32

    .line 197
    monitor-exit v1

    return-void

    .line 188
    :catchall_32
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized setCurrentAssetViewerActivity(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;)V
    .registers 5
    .param p0, "activity"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    .prologue
    .line 139
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;

    monitor-enter v1

    :try_start_3
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    .line 140
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController$1;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController$1;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    .line 152
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController$2;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController$2;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_collection_changed_observer:Ljava/util/Observer;

    .line 176
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 179
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_selection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 182
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageDataSourceDidLoadNewPageNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_asset_collection_changed_observer:Ljava/util/Observer;

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V
    :try_end_34
    .catchall {:try_start_3 .. :try_end_34} :catchall_36

    .line 185
    monitor-exit v1

    return-void

    .line 139
    :catchall_36
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static setSelectedIndex(I)V
    .registers 1
    .param p0, "index"    # I

    .prologue
    .line 89
    sput p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_selectedIndex:I

    .line 90
    return-void
.end method
