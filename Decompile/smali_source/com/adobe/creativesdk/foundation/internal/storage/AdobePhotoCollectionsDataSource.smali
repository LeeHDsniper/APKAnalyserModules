.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
.super Ljava/lang/Object;
.source "AdobePhotoCollectionsDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;


# instance fields
.field private _catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

.field private _catalogLoaded:Z

.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field private _collections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;",
            ">;"
        }
    .end annotation
.end field

.field private _collectionsLoaded:Z

.field private _delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

.field private _emptyCatalog:Z

.field private _initialQueryRequested:Z

.field private _lastCollectionNameRequested:Ljava/lang/String;

.field private _queryForMoreData:Z


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 5
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;
    .param p2, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    .line 30
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .line 31
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalogLoaded:Z

    .line 32
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_queryForMoreData:Z

    .line 33
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collectionsLoaded:Z

    .line 34
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_initialQueryRequested:Z

    .line 35
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_lastCollectionNameRequested:Ljava/lang/String;

    .line 36
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_emptyCatalog:Z

    .line 38
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collections:Ljava/util/ArrayList;

    .line 69
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    .line 70
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .line 71
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalogLoaded:Z

    .line 72
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_queryForMoreData:Z

    .line 73
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collectionsLoaded:Z

    .line 74
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_initialQueryRequested:Z

    .line 75
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_lastCollectionNameRequested:Ljava/lang/String;

    .line 76
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_emptyCatalog:Z

    .line 77
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collections:Ljava/util/ArrayList;

    .line 78
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 79
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    return-object v0
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    return-object p1
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalogLoaded:Z

    return p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->loadFirstPage()V

    return-void
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collections:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collections:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$502(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_emptyCatalog:Z

    return p1
.end method

.method static synthetic access$602(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_queryForMoreData:Z

    return p1
.end method

.method static synthetic access$702(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_initialQueryRequested:Z

    return p1
.end method

.method static synthetic access$802(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_lastCollectionNameRequested:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$902(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collectionsLoaded:Z

    return p1
.end method

.method public static getRenditionForCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 11
    .param p0, "collection"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
            "<[B",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "downloadRenditionCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobePhotoException;>;"
    const/4 v1, 0x0

    .line 242
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getCoverAsset()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    move-result-object v0

    if-eqz v0, :cond_2b

    .line 243
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getCoverAsset()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getRenditions()Ljava/util/Map;

    move-result-object v8

    .line 244
    .local v8, "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    const-string v0, "thumbnail2x"

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_27

    .line 245
    const-string v0, "thumbnail2x"

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    .line 247
    .local v7, "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getCoverAsset()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    move-result-object v0

    invoke-virtual {v0, v7, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 286
    .end local v7    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    .end local v8    # "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    :goto_26
    return-void

    .line 249
    .restart local v8    # "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    :cond_27
    invoke-interface {p1, v1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_26

    .line 253
    .end local v8    # "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    :cond_2b
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->ADOBE_PHOTO_COLLECTION_SORT_BY_DATE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    const/4 v3, 0x1

    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;->ADOBE_PHOTO_COLLECTION_FLAG_ALL:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$9;

    invoke-direct {v5, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$9;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$10;

    invoke-direct {v6, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$10;-><init>(Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->listAssetsOnPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;ILcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    goto :goto_26
.end method

.method private loadCollectionsAfterName(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;",
            ">;>;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;>;>;"
    .local p3, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    const/4 v3, 0x0

    .line 155
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_queryForMoreData:Z

    if-nez v0, :cond_6

    .line 191
    :cond_5
    :goto_5
    return-void

    .line 158
    :cond_6
    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_queryForMoreData:Z

    .line 160
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_initialQueryRequested:Z

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_lastCollectionNameRequested:Ljava/lang/String;

    if-nez v0, :cond_1a

    .line 161
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_queryForMoreData:Z

    .line 162
    if-eqz p2, :cond_5

    .line 163
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_5

    .line 168
    :cond_1a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    const/16 v2, 0x14

    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$5;

    invoke-direct {v4, p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$5;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$6;

    invoke-direct {v5, p0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$6;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->listCollectionsAfterName(Ljava/lang/String;IZLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    goto :goto_5
.end method

.method private loadFirstPage()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    if-eqz v0, :cond_b

    .line 120
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;->willLoadFirstPage()V

    .line 122
    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_queryForMoreData:Z

    .line 123
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collectionsLoaded:Z

    .line 124
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_initialQueryRequested:Z

    .line 125
    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_lastCollectionNameRequested:Ljava/lang/String;

    .line 127
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_queryForMoreData:Z

    if-eqz v0, :cond_25

    .line 128
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Show first page of collections."

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    :cond_25
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$3;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$4;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V

    invoke-direct {p0, v3, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->loadCollectionsAfterName(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 150
    return-void
.end method


# virtual methods
.method public getCollections()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;",
            ">;"
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collections:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collections:Ljava/util/ArrayList;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public loadCatalog()V
    .registers 5

    .prologue
    .line 86
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collections:Ljava/util/ArrayList;

    if-eqz v0, :cond_9

    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 89
    :cond_9
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    if-eqz v0, :cond_12

    .line 90
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;->willLoadCatalog()V

    .line 92
    :cond_12
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;->AdobePhotoCatalogTypeLightroom:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$2;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V

    invoke-static {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->listCatalogOfType(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 116
    return-void
.end method

.method public loadItemsFromScratch()Z
    .registers 2

    .prologue
    .line 48
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->loadCatalog()V

    .line 49
    const/4 v0, 0x1

    return v0
.end method

.method public loadNextPageOfData()V
    .registers 4

    .prologue
    .line 195
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_collectionsLoaded:Z

    if-eqz v0, :cond_5

    .line 232
    :goto_4
    return-void

    .line 199
    :cond_5
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_queryForMoreData:Z

    if-eqz v0, :cond_16

    .line 200
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Show next page of collections."

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    :cond_16
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    if-eqz v0, :cond_1f

    .line 204
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;->willLoadNextPage()V

    .line 206
    :cond_1f
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_lastCollectionNameRequested:Ljava/lang/String;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$7;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$7;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$8;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource$8;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V

    invoke-direct {p0, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->loadCollectionsAfterName(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    goto :goto_4
.end method

.method public resetDelegate()V
    .registers 2

    .prologue
    .line 236
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->setDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;)V

    .line 237
    return-void
.end method

.method public setDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;)V
    .registers 2
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;

    .line 83
    return-void
.end method
