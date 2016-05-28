.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
.super Ljava/lang/Object;
.source "AdobePhotoAssetsDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;


# instance fields
.field private _assets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;"
        }
    .end annotation
.end field

.field private _assetsLoaded:Z

.field private _collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

.field private _delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

.field private _emptyCollection:Z

.field private _initialQueryRequested:Z

.field private _nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

.field private _queryForMoreData:Z

.field private _sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

.field private _totalNumberOfPhotos:I

.field private _uniqueAssets:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;)V
    .registers 6
    .param p1, "collection"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    .param p2, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    .line 70
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastCollectionSortType()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    .line 71
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    .line 73
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assetsLoaded:Z

    .line 74
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_queryForMoreData:Z

    .line 75
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_initialQueryRequested:Z

    .line 76
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_emptyCollection:Z

    .line 77
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    .line 78
    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_totalNumberOfPhotos:I

    .line 79
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assets:Ljava/util/ArrayList;

    .line 80
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_uniqueAssets:Ljava/util/HashSet;

    .line 82
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .prologue
    .line 28
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_totalNumberOfPhotos:I

    return v0
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .param p1, "x1"    # I

    .prologue
    .line 28
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_totalNumberOfPhotos:I

    return p1
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_emptyCollection:Z

    return p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assets:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$202(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assets:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)Ljava/util/HashSet;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_uniqueAssets:Ljava/util/HashSet;

    return-object v0
.end method

.method static synthetic access$302(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Ljava/util/HashSet;)Ljava/util/HashSet;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .param p1, "x1"    # Ljava/util/HashSet;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_uniqueAssets:Ljava/util/HashSet;

    return-object p1
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_queryForMoreData:Z

    return p1
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    return-object v0
.end method

.method static synthetic access$602(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_initialQueryRequested:Z

    return p1
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    return-object v0
.end method

.method static synthetic access$702(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    return-object p1
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Ljava/util/ArrayList;)Z
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->appendAssets(Ljava/util/ArrayList;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$902(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assetsLoaded:Z

    return p1
.end method

.method private appendAssets(Ljava/util/ArrayList;)Z
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 295
    .local p1, "assets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
    const/4 v2, 0x0

    .line 296
    .local v2, "pullAnotherPage":Z
    const/4 v4, 0x0

    .line 298
    .local v4, "skippedNumberOfAssets":F
    if-nez p1, :cond_6

    move v3, v2

    .line 328
    .end local v2    # "pullAnotherPage":Z
    .local v3, "pullAnotherPage":I
    :goto_5
    return v3

    .line 301
    .end local v3    # "pullAnotherPage":I
    .restart local v2    # "pullAnotherPage":Z
    :cond_6
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .line 303
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_uniqueAssets:Ljava/util/HashSet;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getGUID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_28

    .line 305
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assets:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 309
    :cond_28
    const/high16 v6, 0x3f800000

    add-float/2addr v4, v6

    goto :goto_a

    .line 313
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    :cond_2c
    iget v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_totalNumberOfPhotos:I

    if-nez v5, :cond_38

    .line 315
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assets:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    iput v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_totalNumberOfPhotos:I

    .line 319
    :cond_38
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    int-to-float v5, v5

    div-float v1, v4, v5

    .line 320
    .local v1, "percentSkipped":F
    float-to-double v6, v1

    const-wide v8, 0x3fe6666666666666L

    cmpl-double v5, v6, v8

    if-ltz v5, :cond_5d

    .line 322
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "More than 70% of the last page had duplicate values. Pulling the next page."

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    const/4 v2, 0x1

    .line 324
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_queryForMoreData:Z

    .line 325
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->loadNextPageOfData()V

    :cond_5d
    move v3, v2

    .line 328
    .restart local v3    # "pullAnotherPage":I
    goto :goto_5
.end method

.method public static getRenditionForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 5
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
    .line 332
    .local p1, "downloadRenditionCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobePhotoException;>;"
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getRenditions()Ljava/util/Map;

    move-result-object v1

    .line 333
    .local v1, "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    const-string v2, "thumbnail2x"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_18

    .line 334
    const-string v2, "thumbnail2x"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    .line 336
    .local v0, "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 341
    .end local v0    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    :goto_17
    return-void

    .line 338
    :cond_18
    const/4 v2, 0x0

    invoke-interface {p1, v2}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_17
.end method

.method private loadAssetsOnPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 12
    .param p1, "page"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .param p2, "sortType"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;>;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 173
    .local p3, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;>;"
    .local p4, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_queryForMoreData:Z

    if-nez v0, :cond_5

    .line 245
    :cond_4
    :goto_4
    return-void

    .line 176
    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_queryForMoreData:Z

    .line 178
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_initialQueryRequested:Z

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    if-nez v0, :cond_1a

    .line 179
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_queryForMoreData:Z

    .line 181
    if-eqz p3, :cond_4

    .line 182
    const/4 v0, 0x0

    invoke-interface {p3, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_4

    .line 188
    :cond_1a
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->ADOBE_PHOTO_COLLECTION_SORT_BY_DATE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    .line 189
    .local v2, "sort":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;->ADOBE_PHOTO_SORT_TYPE_CUSTOM:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    if-ne p2, v0, :cond_22

    .line 191
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->ADOBE_PHOTO_COLLECTION_SORT_BY_CUSTOM_ORDER:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    .line 194
    :cond_22
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    const/16 v3, 0x14

    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;->ADOBE_PHOTO_COLLECTION_FLAG_ALL:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;

    invoke-direct {v5, p0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$6;

    invoke-direct {v6, p0, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$6;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->listAssetsOnPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;ILcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    goto :goto_4
.end method


# virtual methods
.method public getAssets()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assets:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assets:Ljava/util/ArrayList;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getTotalAssetsCount()I
    .registers 2

    .prologue
    .line 54
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_totalNumberOfPhotos:I

    return v0
.end method

.method public hasMorePages()Z
    .registers 2

    .prologue
    .line 165
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_initialQueryRequested:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public loadFirstPage()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    const/4 v1, 0x0

    .line 93
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assets:Ljava/util/ArrayList;

    if-eqz v0, :cond_b

    .line 94
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 96
    :cond_b
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    if-eqz v0, :cond_14

    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;->willLoadFirstPage()V

    .line 99
    :cond_14
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assetsLoaded:Z

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_queryForMoreData:Z

    .line 101
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_initialQueryRequested:Z

    .line 102
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_emptyCollection:Z

    .line 103
    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    .line 104
    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_totalNumberOfPhotos:I

    .line 106
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Show first page for photos with sorting by "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;->ADOBE_PHOTO_SORT_TYPE_TIME:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    if-ne v0, v4, :cond_66

    const-string v0, "time"

    :goto_3c
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_collection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)V

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$2;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->assetCount(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 121
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)V

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$4;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)V

    invoke-direct {p0, v5, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->loadAssetsOnPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 162
    return-void

    .line 106
    :cond_66
    const-string v0, "custom order"

    goto :goto_3c
.end method

.method public loadItemsFromScratch()Z
    .registers 2

    .prologue
    .line 50
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->loadFirstPage()V

    .line 51
    const/4 v0, 0x1

    return v0
.end method

.method public loadNextPageOfData()V
    .registers 6

    .prologue
    .line 249
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_assetsLoaded:Z

    if-eqz v0, :cond_5

    .line 287
    :goto_4
    return-void

    .line 253
    :cond_5
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_queryForMoreData:Z

    if-eqz v0, :cond_2f

    .line 254
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Show first page for photos with sorting by "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;->ADOBE_PHOTO_SORT_TYPE_TIME:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    if-ne v0, v4, :cond_4a

    const-string v0, "time"

    :goto_24
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    :cond_2f
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    if-eqz v0, :cond_38

    .line 259
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;->willLoadNextPage()V

    .line 261
    :cond_38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$7;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$7;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)V

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$8;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$8;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)V

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->loadAssetsOnPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    goto :goto_4

    .line 254
    :cond_4a
    const-string v0, "custom order"

    goto :goto_24
.end method

.method public resetDelegate()V
    .registers 2

    .prologue
    .line 291
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->setDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;)V

    .line 292
    return-void
.end method

.method public setDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;)V
    .registers 2
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;

    .line 86
    return-void
.end method
