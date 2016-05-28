.class public Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;
.super Ljava/lang/Object;
.source "MobileCreationsDataSourceFactory.java"


# static fields
.field private static _allSourcesLoaded:Z

.field private static _dataSourcesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            "Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;",
            ">;"
        }
    .end annotation
.end field

.field private static _instance:Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

.field private static _loadedSourcesTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation
.end field

.field private static _numDataSourcesPending:I


# instance fields
.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 67
    const/4 v0, 0x0

    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_allSourcesLoaded:Z

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDataSourceTypes()Ljava/util/EnumSet;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceCompositions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLine:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceDraw:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceSketches:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-static {v0, v1, v2, v3}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;
    .registers 1

    .prologue
    .line 73
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_instance:Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    if-nez v0, :cond_b

    .line 74
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_instance:Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    .line 77
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_instance:Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    return-object v0
.end method

.method private static initializeDataSources()V
    .registers 6

    .prologue
    .line 88
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    sput-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_dataSourcesMap:Ljava/util/Map;

    .line 89
    const/4 v4, 0x0

    sput-boolean v4, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_allSourcesLoaded:Z

    .line 90
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    sput-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_loadedSourcesTypes:Ljava/util/List;

    .line 92
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getDataSourceTypes()Ljava/util/EnumSet;

    move-result-object v1

    .line 94
    .local v1, "dataSourceTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    invoke-virtual {v1}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_19
    :goto_19
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4e

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 96
    .local v3, "sourceType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->shouldShowComponent(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v5

    if-eqz v5, :cond_19

    .line 97
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v5

    invoke-direct {v0, v3, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 98
    .local v0, "dataSource":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/DataSourceDelegate;

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/DataSourceDelegate;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)V

    .line 99
    .local v2, "delegate":Lcom/adobe/creativesdk/foundation/internal/storage/DataSourceDelegate;
    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;)V

    .line 101
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_dataSourcesMap:Ljava/util/Map;

    invoke-interface {v5, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_19

    .line 105
    .end local v0    # "dataSource":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    .end local v2    # "delegate":Lcom/adobe/creativesdk/foundation/internal/storage/DataSourceDelegate;
    .end local v3    # "sourceType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    :cond_4e
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_dataSourcesMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    sput v4, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_numDataSourcesPending:I

    .line 106
    return-void
.end method

.method private loadDataSources()V
    .registers 5

    .prologue
    .line 110
    sget-boolean v1, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_allSourcesLoaded:Z

    if-nez v1, :cond_25

    .line 111
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_dataSourcesMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 112
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadItemsFromScratch(Z)Z

    goto :goto_e

    .line 115
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;>;"
    :cond_25
    return-void
.end method


# virtual methods
.method public getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    return-object v0
.end method

.method public getDataSourceByType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    .registers 3
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .prologue
    .line 134
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_dataSourcesMap:Ljava/util/Map;

    if-eqz v0, :cond_15

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_dataSourcesMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 135
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_dataSourcesMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    .line 137
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public getLoadedDataSourcesTypes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 142
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_loadedSourcesTypes:Ljava/util/List;

    return-object v0
.end method

.method public loadDataSources(Z)V
    .registers 3
    .param p1, "fromScratch"    # Z

    .prologue
    const/4 v0, 0x0

    .line 119
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_dataSourcesMap:Ljava/util/Map;

    .line 120
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_loadedSourcesTypes:Ljava/util/List;

    .line 121
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->initializeDataSources()V

    .line 122
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->loadDataSources()V

    .line 123
    return-void
.end method

.method public notifyDataSourceIsReady(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)V
    .registers 5
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .prologue
    .line 152
    sget v2, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_numDataSourcesPending:I

    add-int/lit8 v2, v2, -0x1

    sput v2, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_numDataSourcesPending:I

    .line 153
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getDataSourceByType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getCount()I

    move-result v2

    if-eqz v2, :cond_31

    .line 155
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 156
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "DataSourceReady"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeDataSourceReady:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-direct {v1, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 158
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 160
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_loadedSourcesTypes:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    .end local v0    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    :cond_31
    sget v2, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_numDataSourcesPending:I

    if-nez v2, :cond_38

    .line 163
    const/4 v2, 0x1

    sput-boolean v2, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_allSourcesLoaded:Z

    .line 164
    :cond_38
    return-void
.end method

.method public setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 2
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 171
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 172
    return-void
.end method
