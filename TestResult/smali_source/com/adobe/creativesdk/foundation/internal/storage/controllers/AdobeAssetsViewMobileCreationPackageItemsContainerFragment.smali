.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;
.source "AdobeAssetsViewMobileCreationPackageItemsContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$1;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;
    }
.end annotation


# instance fields
.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field private _mcPackageItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

.field private _mcdatSouorceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;

.field _mobilePackageItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;

.field _reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

.field private _targetPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;-><init>()V

    .line 280
    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_targetPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mcPackageItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    return-object v0
.end method

.method public static getPackagePagesFromHref(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .registers 11
    .param p0, "collectionhref"    # Ljava/lang/String;
    .param p1, "collectionParentHref"    # Ljava/lang/String;

    .prologue
    .line 70
    const/4 v6, 0x0

    .line 71
    .local v6, "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    const/4 v4, 0x0

    .local v4, "collectionUri":Ljava/net/URI;
    const/4 v1, 0x0

    .line 73
    .local v1, "collectionParentUri":Ljava/net/URI;
    :try_start_3
    new-instance v5, Ljava/net/URI;

    invoke-direct {v5, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_8} :catch_62

    .line 74
    .end local v4    # "collectionUri":Ljava/net/URI;
    .local v5, "collectionUri":Ljava/net/URI;
    :try_start_8
    new-instance v2, Ljava/net/URI;

    invoke-direct {v2, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/net/URISyntaxException; {:try_start_8 .. :try_end_d} :catch_64

    .line 75
    .end local v1    # "collectionParentUri":Ljava/net/URI;
    .local v2, "collectionParentUri":Ljava/net/URI;
    :try_start_d
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v3

    .line 76
    .local v3, "collectionRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    .line 77
    .local v0, "collectionParentRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    const-string v8, "/adobedraw/"

    invoke-virtual {p0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_26

    .line 78
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    invoke-direct {v7, v3, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .end local v6    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .local v7, "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    move-object v6, v7

    .end local v7    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .restart local v6    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    :cond_23
    :goto_23
    move-object v1, v2

    .end local v2    # "collectionParentUri":Ljava/net/URI;
    .restart local v1    # "collectionParentUri":Ljava/net/URI;
    move-object v4, v5

    .line 91
    .end local v0    # "collectionParentRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v3    # "collectionRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v5    # "collectionUri":Ljava/net/URI;
    .restart local v4    # "collectionUri":Ljava/net/URI;
    :goto_25
    return-object v6

    .line 79
    .end local v1    # "collectionParentUri":Ljava/net/URI;
    .end local v4    # "collectionUri":Ljava/net/URI;
    .restart local v0    # "collectionParentRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .restart local v2    # "collectionParentUri":Ljava/net/URI;
    .restart local v3    # "collectionRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .restart local v5    # "collectionUri":Ljava/net/URI;
    :cond_26
    const-string v8, "/adobesketch/"

    invoke-virtual {p0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_35

    .line 80
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    invoke-direct {v7, v3, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .end local v6    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .restart local v7    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    move-object v6, v7

    .end local v7    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .restart local v6    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    goto :goto_23

    .line 81
    :cond_35
    const-string v8, "/adobe-line/"

    invoke-virtual {p0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_44

    .line 82
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    invoke-direct {v7, v3, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .end local v6    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .restart local v7    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    move-object v6, v7

    .end local v7    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .restart local v6    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    goto :goto_23

    .line 83
    :cond_44
    const-string v8, "/adobe-psmix/"

    invoke-virtual {p0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_53

    .line 84
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    invoke-direct {v7, v3, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .end local v6    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .restart local v7    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    move-object v6, v7

    .end local v7    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .restart local v6    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    goto :goto_23

    .line 85
    :cond_53
    const-string v8, "/adobe-layup/"

    invoke-virtual {p0, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_23

    .line 86
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;

    invoke-direct {v7, v3, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    :try_end_60
    .catch Ljava/net/URISyntaxException; {:try_start_d .. :try_end_60} :catch_67

    .end local v6    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .restart local v7    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    move-object v6, v7

    .end local v7    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .restart local v6    # "packagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    goto :goto_23

    .line 88
    .end local v0    # "collectionParentRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v2    # "collectionParentUri":Ljava/net/URI;
    .end local v3    # "collectionRC":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v5    # "collectionUri":Ljava/net/URI;
    .restart local v1    # "collectionParentUri":Ljava/net/URI;
    .restart local v4    # "collectionUri":Ljava/net/URI;
    :catch_62
    move-exception v8

    goto :goto_25

    .end local v4    # "collectionUri":Ljava/net/URI;
    .restart local v5    # "collectionUri":Ljava/net/URI;
    :catch_64
    move-exception v8

    move-object v4, v5

    .end local v5    # "collectionUri":Ljava/net/URI;
    .restart local v4    # "collectionUri":Ljava/net/URI;
    goto :goto_25

    .end local v1    # "collectionParentUri":Ljava/net/URI;
    .end local v4    # "collectionUri":Ljava/net/URI;
    .restart local v2    # "collectionParentUri":Ljava/net/URI;
    .restart local v5    # "collectionUri":Ljava/net/URI;
    :catch_67
    move-exception v8

    move-object v1, v2

    .end local v2    # "collectionParentUri":Ljava/net/URI;
    .restart local v1    # "collectionParentUri":Ljava/net/URI;
    move-object v4, v5

    .end local v5    # "collectionUri":Ljava/net/URI;
    .restart local v4    # "collectionUri":Ljava/net/URI;
    goto :goto_25
.end method


# virtual methods
.method protected getAssetSelectionCount()I
    .registers 2

    .prologue
    .line 146
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->selectedAssetCount()I

    move-result v0

    return v0
.end method

.method protected getAssetViewConfiguration(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    .registers 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 56
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;-><init>()V

    .line 57
    .local v0, "viewConfig":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->createFromBundle(Landroid/os/Bundle;)V

    .line 58
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 59
    return-object v0
.end method

.method protected getContainerNameForRoot()Ljava/lang/String;
    .registers 2

    .prologue
    .line 152
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_csdk_myassets_main:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getCurrentTargetCollectionName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_targetPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_targetPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->isMetadataLoaded()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 158
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_targetPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getName()Ljava/lang/String;

    move-result-object v0

    .line 161
    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method protected getDataSource()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mcPackageItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    return-object v0
.end method

.method protected handleAppOrientationChange()V
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mobilePackageItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;->refreshLayoutDueToOrientationChange()V

    .line 142
    return-void
.end method

.method public handleAssetClickAction(Ljava/lang/Object;)V
    .registers 7
    .param p1, "originalAsset"    # Ljava/lang/Object;

    .prologue
    .line 195
    move-object v1, p1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;

    .line 196
    .local v1, "oneUpData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;
    iget-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;->_packagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    iget-object v3, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    iget v4, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;->startIndex:I

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->createInstanceFromPackage(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;Ljava/util/ArrayList;I)V

    .line 198
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 199
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 200
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->MOBILE_PACKAGE_ITEMS_ONE_UP_ACTIVITY_REQUEST:I

    invoke-virtual {v2, v0, v3}, Landroid/support/v4/app/FragmentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 201
    return-void
.end method

.method protected handleCancelSelectionUserAction()V
    .registers 1

    .prologue
    .line 184
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->resetSelectedAssets()V

    .line 185
    return-void
.end method

.method public handleLongClickOnAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 2
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 206
    return-void
.end method

.method protected handleOpenCurrentSelectedFilesUserAction()V
    .registers 3

    .prologue
    .line 179
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSETVIEW_OPEN_SELECTED_FILES:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->postCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;)V

    .line 180
    return-void
.end method

.method protected hasActionBarOptions()Z
    .registers 2

    .prologue
    .line 64
    const/4 v0, 0x1

    return v0
.end method

.method protected hookUpDataSourceDelegate(Z)V
    .registers 4
    .param p1, "attach"    # Z

    .prologue
    .line 134
    if-eqz p1, :cond_9

    .line 135
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mcPackageItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mcdatSouorceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;)V

    .line 137
    :cond_9
    return-void
.end method

.method protected initializeFromViewConfiguration(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;)V
    .registers 5
    .param p1, "configuration"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    .prologue
    .line 95
    move-object v0, p1

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;

    .line 97
    .local v0, "mcPackageCollectionConfiguration":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;->getTargetCollectionHref()Ljava/lang/String;

    move-result-object v1

    .line 98
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;->getTargetParentCollectionHref()Ljava/lang/String;

    move-result-object v2

    .line 97
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getPackagePagesFromHref(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_targetPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 99
    return-void
.end method

.method protected isContainerShowingRootCollection()Z
    .registers 2

    .prologue
    .line 103
    const/4 v0, 0x0

    return v0
.end method

.method public navigateToCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;)V
    .registers 2
    .param p1, "inNavCommand"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;

    .prologue
    .line 191
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    if-eqz v0, :cond_c

    .line 213
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->clearCache()V

    .line 214
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .line 216
    :cond_c
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->onDestroy()V

    .line 217
    return-void
.end method

.method protected resetAssetsListViewVisualLayout()V
    .registers 4

    .prologue
    .line 167
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mobilePackageItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;->getMainView()Landroid/view/View;

    move-result-object v0

    .line 169
    .local v0, "gridMainView":Landroid/view/View;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_18

    .line 171
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 173
    :cond_18
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mobilePackageItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    .line 175
    return-void
.end method

.method protected setupAssetsDataSourceAndListViewControllers()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 108
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    invoke-direct {v1, p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$1;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mcPackageItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    .line 109
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;

    invoke-direct {v1, p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$1;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mcdatSouorceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;

    .line 110
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mcPackageItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mcdatSouorceDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;)V

    .line 112
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;-><init>()V

    .line 113
    .local v0, "cacheParams":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;
    const v1, 0x3dcccccd

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->setMemCacheSizePercent(F)V

    .line 115
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .line 116
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->addImageCache(Landroid/support/v4/app/FragmentManager;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;)V

    .line 118
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mobilePackageItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;

    .line 119
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mobilePackageItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;->setContainerController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;)V

    .line 120
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mobilePackageItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_targetPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;->setTargetPackage(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V

    .line 121
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mobilePackageItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;->performInitialization(Landroid/content/Context;)V

    .line 122
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mobilePackageItemsListViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController;->setReusableImageWorker(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)V

    .line 124
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_mcPackageItemsWrapperDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->loadItemsFromScratch()Z

    .line 125
    return-void
.end method
