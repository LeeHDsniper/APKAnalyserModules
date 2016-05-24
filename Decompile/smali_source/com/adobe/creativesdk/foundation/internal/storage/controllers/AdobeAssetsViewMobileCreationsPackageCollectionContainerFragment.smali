.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;
.source "AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$MobileCreationPackageCollectionsDataSourceDelegate;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$ActionBarController;
    }
.end annotation


# instance fields
.field _assetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

.field _assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

.field _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field _dataSourcesType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

.field _mcCollectionDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$MobileCreationPackageCollectionsDataSourceDelegate;

.field _reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

.field _storageAssetsSelectionCountChange:Ljava/util/Observer;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;-><init>()V

    .line 341
    return-void
.end method

.method public static getAssetDataSourceTypeFor(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .registers 3
    .param p0, "pages"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .prologue
    .line 196
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceFiles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 197
    .local v0, "type":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    instance-of v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    if-eqz v1, :cond_9

    .line 198
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceSketches:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 208
    :cond_8
    :goto_8
    return-object v0

    .line 199
    :cond_9
    instance-of v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    if-eqz v1, :cond_10

    .line 200
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLine:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    goto :goto_8

    .line 201
    :cond_10
    instance-of v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    if-eqz v1, :cond_17

    .line 202
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceDraw:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    goto :goto_8

    .line 203
    :cond_17
    instance-of v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    if-eqz v1, :cond_1e

    .line 204
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePSMix:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    goto :goto_8

    .line 205
    :cond_1e
    instance-of v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;

    if-eqz v1, :cond_8

    .line 206
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceCompositions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    goto :goto_8
.end method


# virtual methods
.method protected configureEmptyStateView(Landroid/view/View;)V
    .registers 6
    .param p1, "emptyFolderView"    # Landroid/view/View;

    .prologue
    .line 145
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_photo_asset_browser_empty_state_icon:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 146
    .local v0, "imageView":Landroid/view/View;
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 147
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_photo_asset_browser_empty_state_message:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 148
    .local v1, "textView":Landroid/widget/TextView;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_dataSourcesType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceSketches:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v2, v3, :cond_27

    .line 149
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_sketches_empty_collection:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    :goto_26
    return-void

    .line 151
    :cond_27
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_mobilecreations_empty_collection:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_26
.end method

.method protected createActionBarController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;
    .registers 2

    .prologue
    .line 298
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$ActionBarController;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$ActionBarController;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;)V

    return-object v0
.end method

.method protected getAssetSelectionCount()I
    .registers 2

    .prologue
    .line 236
    const/4 v0, 0x0

    return v0
.end method

.method protected getAssetViewConfiguration(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    .registers 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 58
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;-><init>()V

    .line 59
    .local v0, "veiwConfig":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->createFromBundle(Landroid/os/Bundle;)V

    .line 60
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getDataSourceType()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_dataSourcesType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 61
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 63
    return-object v0
.end method

.method protected getContainerNameForRoot()Ljava/lang/String;
    .registers 2

    .prologue
    .line 246
    const-string v0, "My assets"

    return-object v0
.end method

.method protected getCurrentTargetCollectionName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 251
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getDataSource()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;
    .registers 2

    .prologue
    .line 225
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    return-object v0
.end method

.method protected getEmptyStateViewId()I
    .registers 2

    .prologue
    .line 108
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_photo_assetbrowser_empty_state_view:I

    return v0
.end method

.method protected handleAppOrientationChange()V
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;->refreshLayoutDueToOrientationChange()V

    .line 242
    return-void
.end method

.method public handleAssetClickAction(Ljava/lang/Object;)V
    .registers 2
    .param p1, "originalAsset"    # Ljava/lang/Object;

    .prologue
    .line 294
    return-void
.end method

.method protected handleCancelSelectionUserAction()V
    .registers 1

    .prologue
    .line 273
    return-void
.end method

.method public handleLongClickOnAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 2
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 69
    return-void
.end method

.method protected handleOpenCurrentSelectedFilesUserAction()V
    .registers 1

    .prologue
    .line 268
    return-void
.end method

.method protected hasActionBarOptions()Z
    .registers 2

    .prologue
    .line 96
    const/4 v0, 0x1

    return v0
.end method

.method protected hookUpDataSourceDelegate(Z)V
    .registers 4
    .param p1, "attach"    # Z

    .prologue
    .line 230
    if-eqz p1, :cond_9

    .line 231
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_mcCollectionDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$MobileCreationPackageCollectionsDataSourceDelegate;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;)V

    .line 232
    :cond_9
    return-void
.end method

.method protected initializeFromViewConfiguration(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;)V
    .registers 2
    .param p1, "configuration"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    .prologue
    .line 103
    return-void
.end method

.method public loadMoreItemsFromDataSource()V
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadNextPageOfData()V

    .line 158
    return-void
.end method

.method public navigateToCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;)V
    .registers 3
    .param p1, "inNavCommand"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;

    .prologue
    .line 288
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->NAVIGATE_TO_MOBILECREATION_COLLECTION:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    .line 289
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "instance"    # Landroid/os/Bundle;

    .prologue
    .line 74
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 76
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    if-eqz v0, :cond_c

    .line 83
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->clearCache()V

    .line 84
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .line 86
    :cond_c
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->onDestroy()V

    .line 87
    return-void
.end method

.method protected registerLocalNofications()V
    .registers 4

    .prologue
    .line 113
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->registerLocalNofications()V

    .line 115
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    if-nez v0, :cond_e

    .line 116
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    .line 124
    :cond_e
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 127
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 129
    return-void
.end method

.method protected resetAssetsListViewVisualLayout()V
    .registers 4

    .prologue
    .line 256
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;->getMainView()Landroid/view/View;

    move-result-object v0

    .line 258
    .local v0, "gridMainView":Landroid/view/View;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_18

    .line 260
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 262
    :cond_18
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    .line 263
    return-void
.end method

.method protected setupAssetsDataSourceAndListViewControllers()V
    .registers 5

    .prologue
    .line 162
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    if-eqz v1, :cond_5

    .line 193
    :goto_4
    return-void

    .line 165
    :cond_5
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;-><init>()V

    .line 166
    .local v0, "cacheParams":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;
    const v1, 0x3dcccccd

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->setMemCacheSizePercent(F)V

    .line 168
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .line 169
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->addImageCache(Landroid/support/v4/app/FragmentManager;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;)V

    .line 173
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_dataSourcesType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    .line 174
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;->setContainerController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;)V

    .line 176
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;->setReusableImageWorker(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)V

    .line 178
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_dataSourcesType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getDataSourceByType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    .line 180
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    if-nez v1, :cond_60

    .line 181
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_dataSourcesType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    .line 183
    :cond_60
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$MobileCreationPackageCollectionsDataSourceDelegate;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$MobileCreationPackageCollectionsDataSourceDelegate;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$1;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_mcCollectionDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$MobileCreationPackageCollectionsDataSourceDelegate;

    .line 184
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_mcCollectionDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment$MobileCreationPackageCollectionsDataSourceDelegate;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;)V

    .line 186
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;->setMobileCreationCollectionsDataSource(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;)V

    .line 188
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;->performInitialization(Landroid/content/Context;)V

    .line 190
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsMobileCreationCollectionController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    .line 192
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_assetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadItemsFromScratch(Z)Z

    goto/16 :goto_4
.end method

.method protected unRegisterLocalNotifications()V
    .registers 4

    .prologue
    .line 134
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->unRegisterLocalNotifications()V

    .line 136
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 139
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->_storageAssetsSelectionCountChange:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 141
    return-void
.end method
