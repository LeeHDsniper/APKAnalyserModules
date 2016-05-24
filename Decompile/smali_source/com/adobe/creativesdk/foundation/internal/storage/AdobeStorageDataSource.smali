.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;
.super Ljava/lang/Object;
.source "AdobeStorageDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;
    }
.end annotation


# static fields
.field private static kItemsPerPageLimit:I


# instance fields
.field private _delegate:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;",
            ">;"
        }
    .end annotation
.end field

.field private _internalFilters:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

.field private _loadingItemsFromScratch:Z

.field private _pageLimit:I

.field private _targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

.field private _totalAssetsLoaded:I

.field abortLoadingMorePages:Z

.field abortLoadingMorePagesWhileFiltering:Z

.field displayAssets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation
.end field

.field filter:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;"
        }
    .end annotation
.end field

.field filterInclusive:Z

.field filterString:Ljava/lang/String;

.field items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation
.end field

.field loadingItems:Z

.field loadingItemsWhileFiltering:Z

.field recreateFilteredAssets:Z

.field public sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

.field sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 102
    const/16 v0, 0x14

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->kItemsPerPageLimit:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_loadingItemsFromScratch:Z

    .line 55
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_totalAssetsLoaded:I

    .line 56
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_pageLimit:I

    .line 166
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->createFreshSortIndexCollator()V

    .line 167
    return-void
.end method

.method private RunInternalFilters(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 375
    .local p1, "inItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_internalFilters:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    if-nez v2, :cond_5

    .line 392
    .end local p1    # "inItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :goto_4
    return-object p1

    .line 378
    .restart local p1    # "inItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 379
    .local v0, "filteredItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_e
    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 381
    .local v1, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_internalFilters:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;->FilterOnlyFolders:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    if-ne v3, v4, :cond_28

    .line 383
    instance-of v3, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    if-eqz v3, :cond_e

    .line 384
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 386
    :cond_28
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_internalFilters:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;->FilterOnlyFiles:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    if-ne v3, v4, :cond_e

    .line 388
    instance-of v3, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v3, :cond_e

    .line 389
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .end local v1    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :cond_36
    move-object p1, v0

    .line 392
    goto :goto_4
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->RunInternalFilters(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    .prologue
    .line 38
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_totalAssetsLoaded:I

    return v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;
    .param p1, "x1"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_totalAssetsLoaded:I

    return p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_loadingItemsFromScratch:Z

    return v0
.end method

.method static synthetic access$202(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 38
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_loadingItemsFromScratch:Z

    return p1
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->createFreshSortIndexCollator()V

    return-void
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    return-object v0
.end method

.method private createFreshSortIndexCollator()V
    .registers 3

    .prologue
    .line 608
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortType()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    .line 610
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne v0, v1, :cond_1c

    .line 612
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    .line 613
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    .line 620
    :goto_1b
    return-void

    .line 617
    :cond_1c
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    .line 618
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    goto :goto_1b
.end method

.method private getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_delegate:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_delegate:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method


# virtual methods
.method public SetDataInternalFilters(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;)V
    .registers 2
    .param p1, "filters"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_internalFilters:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    .line 122
    return-void
.end method

.method public assetsToDisplay()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 180
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    return-object v0
.end method

.method public count()I
    .registers 2

    .prologue
    .line 278
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public fetchAndFilterAllAdditionalPages()V
    .registers 5

    .prologue
    .line 771
    iget-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItemsWhileFiltering:Z

    if-eqz v3, :cond_5

    .line 839
    :cond_4
    :goto_4
    return-void

    .line 777
    :cond_5
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->hasNextPage()Z

    move-result v3

    if-eqz v3, :cond_29

    .line 779
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItemsWhileFiltering:Z

    .line 781
    const/4 v2, 0x0

    .line 782
    .local v2, "pageLimit":I
    if-nez v2, :cond_15

    .line 784
    sget v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->kItemsPerPageLimit:I

    .line 787
    :cond_15
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    .line 788
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v0, :cond_1e

    .line 789
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->didStartLoadingMorePagesToFilter()V

    .line 791
    :cond_1e
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)V

    .line 831
    .local v1, "nextPageDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v3, v2, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getNextPage(ILcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V

    goto :goto_4

    .line 835
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    .end local v1    # "nextPageDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;
    .end local v2    # "pageLimit":I
    :cond_29
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    .line 836
    .restart local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v0, :cond_4

    .line 837
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->didStopLoadingMorePagesToFilter()V

    goto :goto_4
.end method

.method public filterWithSearchString(Ljava/lang/String;)V
    .registers 11
    .param p1, "search"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    .line 709
    iget-boolean v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItems:Z

    if-eqz v7, :cond_8

    .line 711
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    .line 767
    :cond_7
    :goto_7
    return-void

    .line 715
    :cond_8
    if-eqz p1, :cond_85

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_85

    .line 717
    const/4 v5, 0x0

    .line 718
    .local v5, "toBeSearched":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    const/4 v3, 0x0

    .line 719
    .local v3, "isSameSizeButDifferent":Z
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    if-eqz v7, :cond_2b

    .line 720
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-ne v7, v8, :cond_6f

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_6f

    move v3, v6

    .line 722
    :cond_2b
    :goto_2b
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    if-eqz v7, :cond_3b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-lt v7, v8, :cond_3d

    :cond_3b
    if-eqz v3, :cond_71

    .line 724
    :cond_3d
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    .line 730
    :goto_3f
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    .line 731
    const/4 v0, 0x0

    .line 733
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 734
    .local v2, "iCaseSearch":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_4f
    :goto_4f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_74

    .line 736
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 737
    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_4f

    .line 738
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4f

    .line 720
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v2    # "iCaseSearch":Ljava/lang/String;
    .end local v4    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_6f
    const/4 v3, 0x0

    goto :goto_2b

    .line 728
    :cond_71
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    goto :goto_3f

    .line 741
    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .restart local v2    # "iCaseSearch":Ljava/lang/String;
    .restart local v4    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_74
    iput-boolean v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->recreateFilteredAssets:Z

    .line 744
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    .line 746
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v1

    .line 747
    .local v1, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v1, :cond_81

    .line 748
    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->didClearFilterString()V

    .line 751
    :cond_81
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->fetchAndFilterAllAdditionalPages()V

    goto :goto_7

    .line 755
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v1    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    .end local v2    # "iCaseSearch":Ljava/lang/String;
    .end local v3    # "isSameSizeButDifferent":Z
    .end local v4    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    .end local v5    # "toBeSearched":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_85
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    .line 759
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    .line 760
    iput-boolean v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->recreateFilteredAssets:Z

    .line 762
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v1

    .line 763
    .restart local v1    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v1, :cond_7

    .line 764
    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->didClearFilterString()V

    goto/16 :goto_7
.end method

.method public getAdobeStorageSortIndexCollation()Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;
    .registers 2

    .prologue
    .line 849
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    return-object v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->count()I

    move-result v0

    return v0
.end method

.method public getSortType()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    return-object v0
.end method

.method public loadItemsFromScratch()Z
    .registers 2

    .prologue
    .line 71
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadItemsFromScratch(Z)Z

    move-result v0

    return v0
.end method

.method public loadItemsFromScratch(Z)Z
    .registers 7
    .param p1, "fromScratch"    # Z

    .prologue
    const/4 v3, 0x0

    .line 308
    iget-boolean v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItems:Z

    if-eqz v4, :cond_a

    .line 310
    iget-boolean v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->abortLoadingMorePages:Z

    if-nez v4, :cond_a

    .line 370
    :goto_9
    return v3

    .line 314
    :cond_a
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    if-eqz v4, :cond_49

    .line 316
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_loadingItemsFromScratch:Z

    .line 317
    if-eqz p1, :cond_33

    .line 319
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->resetFilterString()V

    .line 320
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->resetPaging()V

    .line 322
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    .line 323
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    .line 324
    iput v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_totalAssetsLoaded:I

    .line 326
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    .line 327
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v0, :cond_33

    .line 328
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->willLoadDataFromScratch()V

    .line 330
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    :cond_33
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->hasNextPage()Z

    move-result v3

    if-eqz v3, :cond_83

    .line 332
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    .line 333
    .restart local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v0, :cond_44

    .line 334
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->willLoadNextPageForExistingCollection()V

    .line 336
    :cond_44
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadNextPage()Z

    move-result v3

    goto :goto_9

    .line 341
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    :cond_49
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    .line 342
    .restart local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v0, :cond_52

    .line 343
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->willLoadNextPageForNonExistingCollection()V

    .line 345
    :cond_52
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    .line 346
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    .line 352
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->SORT_STATE_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    if-ne v3, v4, :cond_7d

    .line 353
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .line 358
    .local v1, "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    :goto_6a
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne v3, v4, :cond_80

    .line 359
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_NAME:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    .line 366
    .local v2, "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    :goto_72
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getRootOrderedByField(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 368
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadNextPage()Z

    move-result v3

    goto :goto_9

    .line 355
    .end local v1    # "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    .end local v2    # "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    :cond_7d
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .restart local v1    # "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    goto :goto_6a

    .line 361
    :cond_80
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_MODIFIED:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    .restart local v2    # "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    goto :goto_72

    .line 370
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    .end local v1    # "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    .end local v2    # "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    :cond_83
    const/4 v3, 0x1

    goto :goto_9
.end method

.method public loadNextPage()Z
    .registers 6

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 403
    iget-boolean v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItems:Z

    if-eqz v4, :cond_b

    .line 405
    iget-boolean v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->abortLoadingMorePages:Z

    if-nez v4, :cond_b

    .line 604
    :cond_a
    :goto_a
    return v2

    .line 408
    :cond_b
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->hasNextPage()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 411
    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItems:Z

    .line 414
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_pageLimit:I

    if-nez v2, :cond_1d

    .line 415
    sget v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->kItemsPerPageLimit:I

    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_pageLimit:I

    .line 416
    :cond_1d
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_pageLimit:I

    .line 417
    .local v1, "totalPagesLimit":I
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;I)V

    .line 602
    .local v0, "nextPageDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_pageLimit:I

    invoke-virtual {v2, v4, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getNextPage(ILcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V

    move v2, v3

    .line 604
    goto :goto_a
.end method

.method public loadNextPageOfData()V
    .registers 2

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadItemsFromScratch(Z)Z

    .line 77
    return-void
.end method

.method public purifiedAssetsToDisplay()Ljava/util/ArrayList;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 193
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    if-nez v5, :cond_7

    move-object v1, v3

    .line 265
    :cond_6
    :goto_6
    return-object v1

    .line 196
    :cond_7
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;->FilterOnlyFiles:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->SetDataInternalFilters(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;)V

    .line 197
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    invoke-direct {p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->RunInternalFilters(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    .line 198
    .local v1, "fileAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->SetDataInternalFilters(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;)V

    .line 200
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filter:Ljava/util/EnumSet;

    if-eqz v5, :cond_6

    .line 203
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 205
    .local v3, "purifiedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_22
    :goto_22
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .local v2, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    move-object v0, v2

    .line 207
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 208
    .local v0, "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->shouldFilterOutAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Z

    move-result v4

    .line 209
    .local v4, "shouldFilterOutAsset":Z
    if-nez v4, :cond_22

    .line 210
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .end local v0    # "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v2    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v4    # "shouldFilterOutAsset":Z
    :cond_3b
    move-object v1, v3

    .line 265
    goto :goto_6
.end method

.method public resetDelegate()V
    .registers 2

    .prologue
    .line 81
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->setAdobeStorageDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;)V

    .line 82
    return-void
.end method

.method public resetFilterString()V
    .registers 2

    .prologue
    .line 627
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    .line 628
    return-void
.end method

.method public resetSortIndexCollator()Z
    .registers 4

    .prologue
    .line 635
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortType()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    move-result-object v1

    .line 636
    .local v1, "lastSortType":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne v2, v1, :cond_a

    .line 638
    const/4 v2, 0x0

    .line 645
    :goto_9
    return v2

    .line 642
    :cond_a
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    move-result-object v0

    .line 644
    .local v0, "lastSortState":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;
    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortCollectionByType(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;)V

    .line 645
    const/4 v2, 0x1

    goto :goto_9
.end method

.method public setAdobeStorageDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;)V
    .registers 3
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    .prologue
    .line 111
    if-eqz p1, :cond_a

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    :goto_7
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_delegate:Ljava/lang/ref/WeakReference;

    .line 112
    return-void

    .line 111
    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setFilter(Ljava/util/EnumSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 147
    .local p1, "mimeFilter":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filter:Ljava/util/EnumSet;

    .line 148
    return-void
.end method

.method public setInclusiveFilter(Z)V
    .registers 2
    .param p1, "inclusive"    # Z

    .prologue
    .line 151
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterInclusive:Z

    .line 152
    return-void
.end method

.method public setTargetCollection(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V
    .registers 2
    .param p1, "targetCollection"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 161
    return-void
.end method

.method shouldFilterOutAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Z
    .registers 5
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filter:Ljava/util/EnumSet;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getType()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterInclusive:Z

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->shouldFilterAssetMimeType(Ljava/util/EnumSet;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public sortCollectionByType(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;)V
    .registers 9
    .param p1, "sortType"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;
    .param p2, "sortState"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    .prologue
    const/4 v5, 0x1

    .line 651
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne p1, v3, :cond_50

    .line 653
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    instance-of v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;

    if-nez v3, :cond_12

    .line 654
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;

    invoke-direct {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAlphaIndexCollation;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    .line 663
    :cond_12
    :goto_12
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    .line 664
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    iput-object p2, v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    .line 670
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->SORT_STATE_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    if-ne p2, v3, :cond_62

    .line 671
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .line 675
    .local v1, "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    :goto_1e
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne v3, v4, :cond_65

    .line 676
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_NAME:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    .line 682
    .local v2, "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    :goto_26
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v3, v2, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->resetPagingOrderedByField(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)V

    .line 683
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    .line 684
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v0, :cond_34

    .line 685
    invoke-interface {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->didSortByType(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;)V

    .line 687
    :cond_34
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    .line 689
    iget-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItems:Z

    if-eqz v3, :cond_3d

    .line 691
    iput-boolean v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->abortLoadingMorePages:Z

    .line 694
    :cond_3d
    iget-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItemsWhileFiltering:Z

    if-eqz v3, :cond_4c

    .line 696
    iput-boolean v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->abortLoadingMorePagesWhileFiltering:Z

    .line 698
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    .line 699
    if-eqz v0, :cond_4c

    .line 700
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->didStopLoadingMorePagesToFilter()V

    .line 704
    :cond_4c
    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadItemsFromScratch(Z)Z

    .line 705
    return-void

    .line 657
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    .end local v1    # "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    .end local v2    # "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    :cond_50
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_TIME:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne p1, v3, :cond_12

    .line 659
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    instance-of v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;

    if-nez v3, :cond_12

    .line 660
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;

    invoke-direct {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageTimeIndexCollation;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    goto :goto_12

    .line 673
    :cond_62
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .restart local v1    # "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    goto :goto_1e

    .line 678
    :cond_65
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_MODIFIED:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    .restart local v2    # "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    goto :goto_26
.end method
