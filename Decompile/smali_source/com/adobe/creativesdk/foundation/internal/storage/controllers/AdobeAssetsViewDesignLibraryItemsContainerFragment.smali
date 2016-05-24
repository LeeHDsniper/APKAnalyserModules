.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;
.source "AdobeAssetsViewDesignLibraryItemsContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$1;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;
    }
.end annotation


# instance fields
.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field private _designLibraryCollectionsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

.field _designLibraryItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

.field private _designLibraryItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;

.field private _targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;-><init>()V

    .line 264
    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    return-object v0
.end method

.method public static getLibraryFolderFromHref(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .registers 11
    .param p0, "collectionhref"    # Ljava/lang/String;
    .param p1, "collectionParentHref"    # Ljava/lang/String;

    .prologue
    .line 59
    const/4 v6, 0x0

    .line 60
    .local v6, "library":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    const/4 v4, 0x0

    .local v4, "collectionUri":Ljava/net/URI;
    const/4 v1, 0x0

    .line 62
    .local v1, "collectionParentUri":Ljava/net/URI;
    :try_start_3
    new-instance v5, Ljava/net/URI;

    invoke-direct {v5, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_8} :catch_1e

    .line 63
    .end local v4    # "collectionUri":Ljava/net/URI;
    .local v5, "collectionUri":Ljava/net/URI;
    :try_start_8
    new-instance v2, Ljava/net/URI;

    invoke-direct {v2, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/net/URISyntaxException; {:try_start_8 .. :try_end_d} :catch_20

    .line 64
    .end local v1    # "collectionParentUri":Ljava/net/URI;
    .local v2, "collectionParentUri":Ljava/net/URI;
    :try_start_d
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v3

    .line 65
    .local v3, "collectionRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    .line 66
    .local v0, "collectionParentRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-direct {v7, v3, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    :try_end_1a
    .catch Ljava/net/URISyntaxException; {:try_start_d .. :try_end_1a} :catch_23

    .end local v6    # "library":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .local v7, "library":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    move-object v1, v2

    .end local v2    # "collectionParentUri":Ljava/net/URI;
    .restart local v1    # "collectionParentUri":Ljava/net/URI;
    move-object v4, v5

    .end local v5    # "collectionUri":Ljava/net/URI;
    .restart local v4    # "collectionUri":Ljava/net/URI;
    move-object v6, v7

    .line 71
    .end local v0    # "collectionParentRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v3    # "collectionRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v7    # "library":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .restart local v6    # "library":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    :goto_1d
    return-object v6

    .line 68
    :catch_1e
    move-exception v8

    goto :goto_1d

    .end local v4    # "collectionUri":Ljava/net/URI;
    .restart local v5    # "collectionUri":Ljava/net/URI;
    :catch_20
    move-exception v8

    move-object v4, v5

    .end local v5    # "collectionUri":Ljava/net/URI;
    .restart local v4    # "collectionUri":Ljava/net/URI;
    goto :goto_1d

    .end local v1    # "collectionParentUri":Ljava/net/URI;
    .end local v4    # "collectionUri":Ljava/net/URI;
    .restart local v2    # "collectionParentUri":Ljava/net/URI;
    .restart local v5    # "collectionUri":Ljava/net/URI;
    :catch_23
    move-exception v8

    move-object v1, v2

    .end local v2    # "collectionParentUri":Ljava/net/URI;
    .restart local v1    # "collectionParentUri":Ljava/net/URI;
    move-object v4, v5

    .end local v5    # "collectionUri":Ljava/net/URI;
    .restart local v4    # "collectionUri":Ljava/net/URI;
    goto :goto_1d
.end method


# virtual methods
.method protected getAssetSelectionCount()I
    .registers 2

    .prologue
    .line 141
    const/4 v0, 0x0

    return v0
.end method

.method protected getAssetViewConfiguration(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    .registers 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 45
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;-><init>()V

    .line 46
    .local v0, "viewConfig":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->createFromBundle(Landroid/os/Bundle;)V

    .line 47
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 48
    return-object v0
.end method

.method protected getContainerNameForRoot()Ljava/lang/String;
    .registers 2

    .prologue
    .line 147
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_csdk_myassets_main:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getCurrentTargetCollectionName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->isMetadataLoaded()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 153
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getName()Ljava/lang/String;

    move-result-object v0

    .line 156
    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method protected getDataSource()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;

    return-object v0
.end method

.method protected getEmptyStateViewId()I
    .registers 2

    .prologue
    .line 118
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_library_items_emptycollectioncell:I

    return v0
.end method

.method protected handleAppOrientationChange()V
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->refreshLayoutDueToOrientationChange()V

    .line 137
    return-void
.end method

.method public handleAssetClickAction(Ljava/lang/Object;)V
    .registers 7
    .param p1, "originalAsset"    # Ljava/lang/Object;

    .prologue
    .line 190
    move-object v1, p1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;

    .line 191
    .local v1, "oneUpData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;
    iget-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->library:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iget-object v3, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    iget v4, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->startIndex:I

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->createInstanceFromLibrary(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;Ljava/util/ArrayList;I)V

    .line 193
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 194
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 195
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->LIBRARY_ITEMS_ONE_UP_ACTIVITY_REQUEST:I

    invoke-virtual {v2, v0, v3}, Landroid/support/v4/app/FragmentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 196
    return-void
.end method

.method protected handleCancelSelectionUserAction()V
    .registers 1

    .prologue
    .line 180
    return-void
.end method

.method public handleLongClickOnAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 2
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 201
    return-void
.end method

.method protected handleOpenCurrentSelectedFilesUserAction()V
    .registers 1

    .prologue
    .line 175
    return-void
.end method

.method protected hasActionBarOptions()Z
    .registers 2

    .prologue
    .line 53
    const/4 v0, 0x1

    return v0
.end method

.method protected hookUpDataSourceDelegate(Z)V
    .registers 4
    .param p1, "attach"    # Z

    .prologue
    .line 129
    if-eqz p1, :cond_9

    .line 130
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryCollectionsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;)V

    .line 132
    :cond_9
    return-void
.end method

.method protected initializeFromViewConfiguration(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;)V
    .registers 5
    .param p1, "configuration"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    .prologue
    .line 75
    move-object v0, p1

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;

    .line 77
    .local v0, "designLibraryCollectionConfiguration":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;->getTargetCollectionHref()Ljava/lang/String;

    move-result-object v1

    .line 78
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;->getTargetParentCollectionHref()Ljava/lang/String;

    move-result-object v2

    .line 77
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->getLibraryFolderFromHref(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .line 79
    return-void
.end method

.method protected isContainerShowingRootCollection()Z
    .registers 2

    .prologue
    .line 91
    const/4 v0, 0x0

    return v0
.end method

.method public navigateToCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;)V
    .registers 2
    .param p1, "inNavCommand"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;

    .prologue
    .line 186
    return-void
.end method

.method protected resetAssetsListViewVisualLayout()V
    .registers 4

    .prologue
    .line 162
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->getMainView()Landroid/view/View;

    move-result-object v0

    .line 164
    .local v0, "gridMainView":Landroid/view/View;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_18

    .line 166
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 168
    :cond_18
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    .line 170
    return-void
.end method

.method protected setupAssetsDataSourceAndListViewControllers()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 103
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$1;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;

    .line 104
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$1;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryCollectionsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryCollectionsDataSourceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;)V

    .line 107
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .line 108
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->setClientViewConfiguration(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;)V

    .line 109
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->setContainerController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;)V

    .line 110
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->setTargetLibraryFolder(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 111
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->performInitialization(Landroid/content/Context;)V

    .line 113
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_designLibraryItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->loadItemsFromScratch()Z

    .line 114
    return-void
.end method
