.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;
.source "AdobeAssetsViewPhotoCollectionContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;
    }
.end annotation


# instance fields
.field private _photoAssetsSelectionCountChange:Ljava/util/Observer;

.field private _photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

.field private _photoCollectionsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;

.field private _photosCollectionListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;-><init>()V

    .line 210
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    return-object v0
.end method


# virtual methods
.method protected getAssetSelectionCount()I
    .registers 2

    .prologue
    .line 146
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->selectedAssetCount()I

    move-result v0

    return v0
.end method

.method protected getAssetViewConfiguration(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    .registers 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 40
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotosViewContainerConfiguration;-><init>()V

    .line 41
    .local v0, "veiwConfig":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->createFromBundle(Landroid/os/Bundle;)V

    .line 42
    return-object v0
.end method

.method protected getContainerNameForRoot()Ljava/lang/String;
    .registers 2

    .prologue
    .line 152
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_csdk_myassets_main:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getCurrentTargetCollectionName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 158
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getDataSource()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    return-object v0
.end method

.method protected getEmptyStateViewId()I
    .registers 2

    .prologue
    .line 117
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_photo_assetbrowser_empty_state_view:I

    return v0
.end method

.method public handleAssetClickAction(Ljava/lang/Object;)V
    .registers 2
    .param p1, "originalAsset"    # Ljava/lang/Object;

    .prologue
    .line 201
    return-void
.end method

.method protected handleCancelSelectionUserAction()V
    .registers 1

    .prologue
    .line 180
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->resetSelectedAssets()V

    .line 181
    return-void
.end method

.method public handleLongClickOnAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 2
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 48
    return-void
.end method

.method protected handleOpenCurrentSelectedFilesUserAction()V
    .registers 3

    .prologue
    .line 175
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSETVIEW_OPEN_SELECTED_PHOTOS:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->postCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;)V

    .line 176
    return-void
.end method

.method protected hasActionBarOptions()Z
    .registers 2

    .prologue
    .line 52
    const/4 v0, 0x1

    return v0
.end method

.method protected hookUpDataSourceDelegate(Z)V
    .registers 4
    .param p1, "attach"    # Z

    .prologue
    .line 139
    if-eqz p1, :cond_9

    .line 140
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoCollectionsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->setDataSourceDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;)V

    .line 142
    :cond_9
    return-void
.end method

.method protected initializeFromViewConfiguration(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;)V
    .registers 2
    .param p1, "configuration"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    .prologue
    .line 59
    return-void
.end method

.method public navigateToCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;)V
    .registers 5
    .param p1, "inNavCommand"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;

    .prologue
    .line 187
    move-object v1, p1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;

    .line 190
    .local v1, "navToPhotoCollectionData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;-><init>()V

    .line 191
    .local v0, "navCommand":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;
    iget-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;->collectionGUID:Ljava/lang/String;

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;->collectionGUID:Ljava/lang/String;

    .line 192
    iget-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;->collectionName:Ljava/lang/String;

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;->collectionName:Ljava/lang/String;

    .line 193
    iget-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;->catalogGUID:Ljava/lang/String;

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;->catalogGUID:Ljava/lang/String;

    .line 194
    iget-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;->catalogName:Ljava/lang/String;

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;->catalogName:Ljava/lang/String;

    .line 195
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->NAVIGATE_TO_PHOTO_COLLECTION:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {p0, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    .line 196
    return-void
.end method

.method protected registerLocalNofications()V
    .registers 4

    .prologue
    .line 63
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->registerLocalNofications()V

    .line 65
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    if-nez v0, :cond_e

    .line 67
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    .line 75
    :cond_e
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 78
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 81
    return-void
.end method

.method protected resetAssetsListViewVisualLayout()V
    .registers 4

    .prologue
    .line 163
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photosCollectionListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->getMainView()Landroid/view/View;

    move-result-object v0

    .line 165
    .local v0, "gridMainView":Landroid/view/View;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_18

    .line 167
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 169
    :cond_18
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photosCollectionListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    .line 171
    return-void
.end method

.method protected setupAssetsDataSourceAndListViewControllers()V
    .registers 4

    .prologue
    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photosCollectionListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    if-eqz v0, :cond_5

    .line 113
    :goto_4
    return-void

    .line 100
    :cond_5
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photosCollectionListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photosCollectionListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->setContainerController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;)V

    .line 103
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$1;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoCollectionsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;

    .line 104
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoCollectionsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    .line 106
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photosCollectionListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->set_photoCollectionsDataSource(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V

    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photosCollectionListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->performInitialization(Landroid/content/Context;)V

    .line 110
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photosCollectionListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->loadCatalog()V

    goto :goto_4
.end method

.method protected unRegisterLocalNotifications()V
    .registers 4

    .prologue
    .line 85
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->unRegisterLocalNotifications()V

    .line 87
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 90
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 93
    return-void
.end method
