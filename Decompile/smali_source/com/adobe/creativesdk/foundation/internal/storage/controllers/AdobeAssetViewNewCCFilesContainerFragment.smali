.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;
.source "AdobeAssetViewNewCCFilesContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$StorageDataSourceDelegate;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;
    }
.end annotation


# instance fields
.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field private _dataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$StorageDataSourceDelegate;

.field private _forceRefreshAssetsListObserver:Ljava/util/Observer;

.field protected _gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

.field private _lastSavedInstanceState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;

.field protected _listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

.field private _searchBarOpened:Z

.field private _selectionTimeStampAtStop:I

.field private _storageAssetsSelectionCountChange:Ljava/util/Observer;

.field private _storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

.field private _tabDataSourceChangedObserver:Ljava/util/Observer;

.field private _targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;-><init>()V

    .line 69
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_selectionTimeStampAtStop:I

    .line 939
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->closeSearchBarIfOpen()V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_searchBarOpened:Z

    return v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_searchBarOpened:Z

    return p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->changeVisualDisplay(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;)V

    return-void
.end method

.method private changeVisualDisplay(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;)V
    .registers 3
    .param p1, "visualLayout"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    .prologue
    .line 394
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_WATERFALL:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    if-ne p1, v0, :cond_10

    .line 395
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->showAssetsAsGrid()V

    .line 400
    :goto_7
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;->refreshDueToDataChange()V

    .line 401
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->setLastVisualLayout(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;)V

    .line 402
    return-void

    .line 398
    :cond_10
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->showAssetsAsList()V

    goto :goto_7
.end method

.method private closeSearchBarIfOpen()V
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_actionBarController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;

    instance-of v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;

    if-eqz v0, :cond_d

    .line 221
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_actionBarController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->closeSearchViewIfOpen()V

    .line 223
    :cond_d
    return-void
.end method

.method private showAssetsAsGrid()V
    .registers 2

    .prologue
    .line 364
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->showAssetsAsGridAnimate(Z)V

    .line 365
    return-void
.end method

.method private showAssetsAsGridAnimate(Z)V
    .registers 6
    .param p1, "animate"    # Z

    .prologue
    .line 369
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    .line 370
    .local v1, "mainRootFrame":Landroid/widget/FrameLayout;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->getMainView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 371
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;->getMainView()Landroid/view/View;

    move-result-object v0

    .line 373
    .local v0, "gridMainView":Landroid/view/View;
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1d

    .line 375
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 377
    :cond_1d
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->setCurrentAssetViewController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;)V

    .line 378
    return-void
.end method

.method private showAssetsAsList()V
    .registers 2

    .prologue
    .line 347
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->showAssetsAsListAnimate(Z)V

    .line 348
    return-void
.end method

.method private showAssetsAsListAnimate(Z)V
    .registers 6
    .param p1, "animate"    # Z

    .prologue
    .line 352
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    .line 353
    .local v1, "mainRootFrame":Landroid/widget/FrameLayout;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;->getMainView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 354
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->getMainView()Landroid/view/View;

    move-result-object v0

    .line 356
    .local v0, "listMainView":Landroid/view/View;
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1d

    .line 357
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 359
    :cond_1d
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->setCurrentAssetViewController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;)V

    .line 360
    return-void
.end method

.method private showAssetsOfCurrentVisualLayout(Z)V
    .registers 4
    .param p1, "animate"    # Z

    .prologue
    .line 382
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    .line 383
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastVisualLayout()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    move-result-object v1

    if-ne v0, v1, :cond_c

    .line 385
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->showAssetsAsListAnimate(Z)V

    .line 390
    :goto_b
    return-void

    .line 388
    :cond_c
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->showAssetsAsGridAnimate(Z)V

    goto :goto_b
.end method


# virtual methods
.method protected createActionBarController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;
    .registers 2

    .prologue
    .line 446
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V

    return-object v0
.end method

.method protected ds_startedLoadingMoreFolders()V
    .registers 1

    .prologue
    .line 936
    return-void
.end method

.method protected ds_stoppedLoadingMoreFolders()V
    .registers 1

    .prologue
    .line 932
    return-void
.end method

.method protected getAssetSelectionCount()I
    .registers 2

    .prologue
    .line 310
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->selectedAssetCount()I

    move-result v0

    return v0
.end method

.method protected getAssetViewConfiguration(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    .registers 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 81
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;-><init>()V

    .line 82
    .local v0, "viewContainerConfiguration":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->createFromBundle(Landroid/os/Bundle;)V

    .line 83
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 84
    return-object v0
.end method

.method protected getContainerNameForRoot()Ljava/lang/String;
    .registers 2

    .prologue
    .line 315
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_csdk_myassets_main:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getCurrentTargetCollectionName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 320
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getDataSource()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    return-object v0
.end method

.method protected getInternalFilters()Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;
    .registers 2

    .prologue
    .line 201
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getTargetCollection()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    return-object v0
.end method

.method protected handleAnyListCellViewsRefresh()V
    .registers 4

    .prologue
    const/4 v2, -0x1

    .line 248
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_selectionTimeStampAtStop:I

    if-eq v0, v2, :cond_18

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    if-eqz v0, :cond_18

    .line 249
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_selectionTimeStampAtStop:I

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->getCurrentSelectionTimeStamp()I

    move-result v1

    if-eq v0, v1, :cond_18

    .line 250
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;->refreshOnlyListView()V

    .line 253
    :cond_18
    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_selectionTimeStampAtStop:I

    .line 254
    return-void
.end method

.method protected handleAnyListConfigChange()Z
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->resetSortIndexCollator()Z

    move-result v0

    return v0
.end method

.method public handleAppOrientationChange()V
    .registers 2

    .prologue
    .line 947
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    instance-of v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    if-eqz v0, :cond_13

    .line 948
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;->refreshLayoutDueToOrientationChange()V

    .line 951
    :cond_13
    :goto_13
    return-void

    .line 949
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    instance-of v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    if-eqz v0, :cond_13

    .line 950
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->refreshLayoutDueToOrientationChange()V

    goto :goto_13
.end method

.method public handleAssetClickAction(Ljava/lang/Object;)V
    .registers 4
    .param p1, "originalAsset"    # Ljava/lang/Object;

    .prologue
    .line 104
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-nez v1, :cond_5

    .line 109
    :goto_4
    return-void

    :cond_5
    move-object v0, p1

    .line 107
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 108
    .local v0, "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->openOneUpViewActivityFromAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V

    goto :goto_4
.end method

.method protected handleCancelSelectionUserAction()V
    .registers 1

    .prologue
    .line 134
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->resetSelectedAssets()V

    .line 135
    return-void
.end method

.method protected handleCollaborationVisibilty(Z)V
    .registers 2
    .param p1, "isMainAssetFrameVisible"    # Z

    .prologue
    .line 860
    return-void
.end method

.method public handleCurrentNetworkStatusWithUpload(Z)V
    .registers 2
    .param p1, "isOnline"    # Z

    .prologue
    .line 863
    return-void
.end method

.method public handleLongClickOnAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 2
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 100
    return-void
.end method

.method protected handleOnStop()V
    .registers 2

    .prologue
    .line 237
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->handleOnStop()V

    .line 238
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->getCurrentSelectionTimeStamp()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_selectionTimeStampAtStop:I

    .line 239
    return-void
.end method

.method protected handleOpenCurrentSelectedFilesUserAction()V
    .registers 3

    .prologue
    .line 129
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSETVIEW_OPEN_SELECTED_FILES:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->postCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;)V

    .line 130
    return-void
.end method

.method protected handlePostOffline()V
    .registers 1

    .prologue
    .line 244
    return-void
.end method

.method protected hasActionBarOptions()Z
    .registers 2

    .prologue
    .line 113
    const/4 v0, 0x1

    return v0
.end method

.method protected hideCollaborationAndNotificationIcon()V
    .registers 1

    .prologue
    .line 405
    return-void
.end method

.method protected hookUpDataSourceDelegate(Z)V
    .registers 4
    .param p1, "attach"    # Z

    .prologue
    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_dataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$StorageDataSourceDelegate;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->setAdobeStorageDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;)V

    .line 125
    return-void
.end method

.method protected initializeCCFilesContainerFromCollectionHref(Ljava/lang/String;)V
    .registers 4
    .param p1, "targetCollectionHref"    # Ljava/lang/String;

    .prologue
    .line 151
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->getAssetFolderFromHref(Ljava/lang/String;Z)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v0

    .line 152
    .local v0, "targetFolder":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 153
    return-void
.end method

.method protected initializeFromViewConfiguration(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;)V
    .registers 3
    .param p1, "configuration"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getTargetCollectionHref()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->initializeCCFilesContainerFromCollectionHref(Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method protected isContainerShowingRootCollection()Z
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;->isRootCollection(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected isRestoredDataSourceChanged()Z
    .registers 4

    .prologue
    .line 232
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;

    move-result-object v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getTargetCollection()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->isFolderMarkedAsChanged(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Z)Z

    move-result v0

    return v0
.end method

.method protected isSearchBarOpened()Z
    .registers 2

    .prologue
    .line 866
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_searchBarOpened:Z

    return v0
.end method

.method public navigateToCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;)V
    .registers 5
    .param p1, "navCommand"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;

    .prologue
    .line 89
    move-object v0, p1

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToAssetFolderData;

    .line 91
    .local v0, "navToAssetFolder":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToAssetFolderData;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToCollectionCommand;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToCollectionCommand;-><init>()V

    .line 92
    .local v1, "navToCollectionCommand":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToCollectionCommand;
    iget-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToAssetFolderData;->collectionHref:Ljava/lang/String;

    iput-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToCollectionCommand;->collectionHref:Ljava/lang/String;

    .line 93
    iget-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToAssetFolderData;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    iput-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToCollectionCommand;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 94
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->NAVIGATE_TO_COLLECTION:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {p0, v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    .line 95
    return-void
.end method

.method protected openOneUpViewActivityFromAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 5
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 139
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-static {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->generateAssetArray(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 141
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isDataSourceValidForAssetViewerLaunch()Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 142
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 143
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 144
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 145
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->ASSET_ONE_UP_ACTIVITY_REQUEST:I

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 147
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_2d
    return-void
.end method

.method protected registerLocalNofications()V
    .registers 4

    .prologue
    .line 263
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->registerLocalNofications()V

    .line 265
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    if-nez v0, :cond_e

    .line 267
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    .line 275
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_forceRefreshAssetsListObserver:Ljava/util/Observer;

    if-nez v0, :cond_19

    .line 276
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_forceRefreshAssetsListObserver:Ljava/util/Observer;

    .line 285
    :cond_19
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_tabDataSourceChangedObserver:Ljava/util/Observer;

    if-nez v0, :cond_24

    .line 286
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$3;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_tabDataSourceChangedObserver:Ljava/util/Observer;

    .line 294
    :cond_24
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 297
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 300
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeCCFilesForceRefreshAssetsList:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_forceRefreshAssetsListObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 303
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeUxTabDataSourceChanged:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_tabDataSourceChangedObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 306
    return-void
.end method

.method public reloadAssetItemsFromDataSourceDueToSwipeRefresh()V
    .registers 1

    .prologue
    .line 226
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->closeSearchBarIfOpen()V

    .line 227
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->reloadAssetItemsFromDataSourceDueToSwipeRefresh()V

    .line 228
    return-void
.end method

.method protected resetAssetsListViewVisualLayout()V
    .registers 2

    .prologue
    .line 430
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->showAssetsOfCurrentVisualLayout(Z)V

    .line 431
    return-void
.end method

.method protected restoreCurrentAssetsListControllerState()V
    .registers 3

    .prologue
    .line 420
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_lastSavedInstanceState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;

    if-eqz v0, :cond_e

    .line 421
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastVisualLayout()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_lastSavedInstanceState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;->_visualLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    if-eq v0, v1, :cond_f

    .line 426
    :cond_e
    :goto_e
    return-void

    .line 424
    :cond_f
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->restoreCurrentAssetsListControllerState()V

    .line 425
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_lastSavedInstanceState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;

    goto :goto_e
.end method

.method protected saveCurrentAssetsListControllerState()V
    .registers 3

    .prologue
    .line 412
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->saveCurrentAssetsListControllerState()V

    .line 413
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_lastSavedInstanceState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;

    .line 414
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_lastSavedInstanceState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastVisualLayout()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesFragmentState;->_visualLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    .line 415
    return-void
.end method

.method protected setCurrentAssetViewController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;)V
    .registers 2
    .param p1, "listViewController"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;

    .prologue
    .line 342
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    .line 343
    return-void
.end method

.method protected setupAssetsDataSourceAndListViewControllers()V
    .registers 3

    .prologue
    .line 166
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    if-eqz v0, :cond_5

    .line 198
    :goto_4
    return-void

    .line 169
    :cond_5
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$StorageDataSourceDelegate;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$StorageDataSourceDelegate;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_dataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$StorageDataSourceDelegate;

    .line 171
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    .line 172
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->setTargetCollection(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V

    .line 173
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_dataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$StorageDataSourceDelegate;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->setAdobeStorageDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;)V

    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getMimeTypesFilter()Ljava/util/EnumSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->setFilter(Ljava/util/EnumSet;)V

    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getIsMimeTypeFilterInclusive()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->setInclusiveFilter(Z)V

    .line 178
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getInternalFilters()Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->SetDataInternalFilters(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;)V

    .line 180
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->setupGridViewController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;->setContainerController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;)V

    .line 183
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->setupSectionalListViewController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    .line 184
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->setContainerController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;)V

    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;->setAssetListViewerConfiguration(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;)V

    .line 187
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->setAssetListViewerConfiguration(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;)V

    .line 189
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;->performInitialization(Landroid/content/Context;)V

    .line 190
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->performInitialization(Landroid/content/Context;)V

    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;->setStorageDataSource(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)V

    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->setStorageDataSource(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)V

    .line 196
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadItemsFromScratch(Z)Z

    goto/16 :goto_4
.end method

.method protected setupGridViewController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;
    .registers 3

    .prologue
    .line 206
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected setupSectionalListViewController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;
    .registers 3

    .prologue
    .line 211
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected showCollaborationAndNotificationIcon()V
    .registers 1

    .prologue
    .line 409
    return-void
.end method

.method protected unRegisterLocalNotifications()V
    .registers 4

    .prologue
    .line 325
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->unRegisterLocalNotifications()V

    .line 327
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 330
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 333
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeCCFilesForceRefreshAssetsList:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_forceRefreshAssetsListObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 336
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeUxTabDataSourceChanged:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_tabDataSourceChangedObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 338
    return-void
.end method
