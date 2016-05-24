.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;
.source "AdobeAssetsViewPhotoAssetsContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment$PhotoAssetsDataSourceDelegate;
    }
.end annotation


# instance fields
.field private _photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

.field private _photoAssetsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment$PhotoAssetsDataSourceDelegate;

.field private _photoAssetsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

.field private _photoAssetsSelectionCountChange:Ljava/util/Observer;

.field private _selectionTimeStampAtStop:I

.field private _targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;-><init>()V

    .line 39
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_selectionTimeStampAtStop:I

    .line 238
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    return-object v0
.end method

.method private setTargetCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;)V
    .registers 2
    .param p1, "targetCollection"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    .line 88
    return-void
.end method


# virtual methods
.method protected getAssetSelectionCount()I
    .registers 2

    .prologue
    .line 133
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->selectedAssetCount()I

    move-result v0

    return v0
.end method

.method protected getAssetViewConfiguration(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    .registers 3
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 43
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;-><init>()V

    .line 44
    .local v0, "viewContainerConfiguration":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->createFromBundle(Landroid/os/Bundle;)V

    .line 45
    return-object v0
.end method

.method protected getContainerNameForRoot()Ljava/lang/String;
    .registers 2

    .prologue
    .line 138
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_csdk_myassets_main:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getCurrentTargetCollectionName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getDataSource()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    return-object v0
.end method

.method protected getEmptyStateViewId()I
    .registers 2

    .prologue
    .line 96
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_photo_assetbrowser_empty_state_view:I

    return v0
.end method

.method getPhotoCollectionFromHref(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    .registers 7
    .param p1, "configuration"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;

    .prologue
    .line 66
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->getTargetCollectionCatalogName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->getTargetCollectionCatalogGUID()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v4

    invoke-direct {v0, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 67
    .local v0, "catalog":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->getTargetCollectionName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;->getTargetCollectionGUID()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)V

    .line 69
    .local v1, "targetCollection":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    return-object v1
.end method

.method protected handleAnyListCellViewsRefresh()V
    .registers 4

    .prologue
    const/4 v2, -0x1

    .line 229
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_selectionTimeStampAtStop:I

    if-eq v0, v2, :cond_16

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    if-eqz v0, :cond_16

    .line 230
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_selectionTimeStampAtStop:I

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->getCurrentSelectionTimeStamp()I

    move-result v1

    if-eq v0, v1, :cond_16

    .line 231
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->refreshOnlyListView()V

    .line 234
    :cond_16
    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_selectionTimeStampAtStop:I

    .line 235
    return-void
.end method

.method public handleAssetClickAction(Ljava/lang/Object;)V
    .registers 5
    .param p1, "originalAsset"    # Ljava/lang/Object;

    .prologue
    .line 164
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    if-nez v1, :cond_5

    .line 174
    .end local p1    # "originalAsset":Ljava/lang/Object;
    :cond_4
    :goto_4
    return-void

    .line 167
    .restart local p1    # "originalAsset":Ljava/lang/Object;
    :cond_5
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .end local p1    # "originalAsset":Ljava/lang/Object;
    invoke-static {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->generateAssetArray(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V

    .line 169
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->isDataSourceValidForAssetViewerLaunch()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 170
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 171
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 172
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->PHOTO_ONE_UP_ACTIVITY_REQUEST:I

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_4
.end method

.method protected handleCancelSelectionUserAction()V
    .registers 1

    .prologue
    .line 183
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->resetSelectedAssets()V

    .line 184
    return-void
.end method

.method public handleLongClickOnAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 2
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 57
    return-void
.end method

.method protected handleOnStop()V
    .registers 2

    .prologue
    .line 223
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->handleOnStop()V

    .line 224
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->getCurrentSelectionTimeStamp()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_selectionTimeStampAtStop:I

    .line 225
    return-void
.end method

.method protected handleOpenCurrentSelectedFilesUserAction()V
    .registers 3

    .prologue
    .line 178
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSETVIEW_OPEN_SELECTED_PHOTOS:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->postCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;)V

    .line 179
    return-void
.end method

.method protected handlePostOnCreateView(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 74
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->handlePostOnCreateView(Landroid/os/Bundle;)V

    .line 75
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_selectionTimeStampAtStop:I

    .line 76
    return-void
.end method

.method protected hasActionBarOptions()Z
    .registers 2

    .prologue
    .line 61
    const/4 v0, 0x1

    return v0
.end method

.method protected hookUpDataSourceDelegate(Z)V
    .registers 4
    .param p1, "attach"    # Z

    .prologue
    .line 125
    if-eqz p1, :cond_a

    .line 126
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment$PhotoAssetsDataSourceDelegate;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->setDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;)V

    .line 129
    :goto_9
    return-void

    .line 128
    :cond_a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->setDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;)V

    goto :goto_9
.end method

.method protected initializeFromViewConfiguration(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;)V
    .registers 3
    .param p1, "configuration"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    .prologue
    .line 81
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;

    .end local p1    # "configuration":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->getPhotoCollectionFromHref(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    move-result-object v0

    .line 82
    .local v0, "targetCollection":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->setTargetCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;)V

    .line 83
    return-void
.end method

.method protected isContainerShowingRootCollection()Z
    .registers 2

    .prologue
    .line 91
    const/4 v0, 0x0

    return v0
.end method

.method public loadMoreItemsFromDataSource()V
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->hasMorePages()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 51
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->loadMoreItemsFromDataSource()V

    .line 52
    :cond_b
    return-void
.end method

.method public navigateToCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;)V
    .registers 2
    .param p1, "navCommand"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;

    .prologue
    .line 160
    return-void
.end method

.method protected registerLocalNofications()V
    .registers 4

    .prologue
    .line 189
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->registerLocalNofications()V

    .line 191
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    if-nez v0, :cond_e

    .line 193
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    .line 201
    :cond_e
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 204
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 207
    return-void
.end method

.method protected resetAssetsListViewVisualLayout()V
    .registers 4

    .prologue
    .line 148
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->getMainView()Landroid/view/View;

    move-result-object v0

    .line 150
    .local v0, "gridMainView":Landroid/view/View;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_18

    .line 152
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 154
    :cond_18
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    .line 155
    return-void
.end method

.method protected setupAssetsDataSourceAndListViewControllers()V
    .registers 4

    .prologue
    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    if-eqz v0, :cond_5

    .line 116
    :goto_4
    return-void

    .line 104
    :cond_5
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->setContainerController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;)V

    .line 107
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment$PhotoAssetsDataSourceDelegate;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment$PhotoAssetsDataSourceDelegate;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment$1;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment$PhotoAssetsDataSourceDelegate;

    .line 108
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment$PhotoAssetsDataSourceDelegate;

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoAssetsDataSourceDelegate;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .line 110
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->set_photoAssetsDataSource(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)V

    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->performInitialization(Landroid/content/Context;)V

    .line 114
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    .line 115
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->loadFirstPage()V

    goto :goto_4
.end method

.method protected unRegisterLocalNotifications()V
    .registers 4

    .prologue
    .line 211
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->unRegisterLocalNotifications()V

    .line 213
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 216
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 219
    return-void
.end method
