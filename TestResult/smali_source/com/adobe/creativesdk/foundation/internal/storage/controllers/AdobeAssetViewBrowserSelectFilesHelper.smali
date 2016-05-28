.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;
.super Ljava/lang/Object;
.source "AdobeAssetViewBrowserSelectFilesHelper.java"


# static fields
.field public static ASSETBROWSER_ASSETS_SELECTION_LIST:Ljava/lang/String;

.field public static ASSETBROWSER_LIBRARY_SELECTION_LIST:Ljava/lang/String;

.field public static ASSETBROWSER_MOBILE_PACKAGE_SELECTION_ITEM:Ljava/lang/String;

.field public static ASSETBROWSER_PHOTOS_SELECTION_LIST:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    const-string v0, "ADOBE_ASSETBROWSER_ASSETFILE_SELECTION_LIST"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_ASSETS_SELECTION_LIST:Ljava/lang/String;

    .line 40
    const-string v0, "ADOBE_ASSETBROWSER_PHOTOASSET_SELECTION_LIST"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_PHOTOS_SELECTION_LIST:Ljava/lang/String;

    .line 41
    const-string v0, "ADOBE_ASSETBROWSER_LIBRARY_SELECTION_LIST"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_LIBRARY_SELECTION_LIST:Ljava/lang/String;

    .line 42
    const-string v0, "ASSETBROWSER_MOBILE_PACKAGE_SELECTION_ITEM"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_MOBILE_PACKAGE_SELECTION_ITEM:Ljava/lang/String;

    return-void
.end method

.method public static getCurrentSelectedFilesAsIntentResultData()Landroid/content/Intent;
    .registers 9

    .prologue
    .line 47
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->selectedAssets()Ljava/util/ArrayList;

    move-result-object v5

    .line 48
    .local v5, "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .local v6, "selectionInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;>;"
    if-eqz v5, :cond_2d

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_2d

    .line 51
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_15
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    move-object v1, v0

    .line 53
    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 54
    .local v1, "assetfile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    new-instance v8, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;

    invoke-direct {v8, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    .line 57
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v1    # "assetfile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :cond_2d
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->resetSelectedAssets()V

    .line 58
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->resetSelectedAssets()V

    .line 60
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 61
    .local v3, "intent":Landroid/content/Intent;
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_ASSETS_SELECTION_LIST:Ljava/lang/String;

    invoke-virtual {v3, v7, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 63
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->hasSelection()Z

    move-result v7

    if-eqz v7, :cond_50

    .line 64
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->getSelectedLibraryItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v4

    .line 65
    .local v4, "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_LIBRARY_SELECTION_LIST:Ljava/lang/String;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->getItemID()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 68
    .end local v4    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_50
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->hasSelection()Z

    move-result v7

    if-eqz v7, :cond_63

    .line 69
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->getSelectedPackageItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v2

    .line 70
    .local v2, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_MOBILE_PACKAGE_SELECTION_ITEM:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getGUID()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 74
    .end local v2    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :cond_63
    return-object v3
.end method

.method public static getCurrentSelectedPhotosAsIntentResultData()Landroid/content/Intent;
    .registers 3

    .prologue
    .line 80
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->resetSelectedAssets()V

    .line 82
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 85
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->selectedAssets()Ljava/util/ArrayList;

    move-result-object v1

    .line 87
    .local v1, "selectedPhotoAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->resetSelectedAssets()V

    .line 88
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->resetSelectedAssets()V

    .line 90
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_PHOTOS_SELECTION_LIST:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 92
    return-object v0
.end method
