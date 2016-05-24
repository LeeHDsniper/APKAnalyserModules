.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;
.source "AdobeAssetsViewPhotoCollectionListViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController$PhotosCollectionListViewBaseAdapter;
    }
.end annotation


# instance fields
.field private _photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

.field private rightMargin:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;-><init>(Landroid/content/Context;)V

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->rightMargin:I

    .line 34
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->_photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;

    .prologue
    .line 23
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->rightMargin:I

    return v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;
    .param p1, "x1"    # I

    .prologue
    .line 23
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->rightMargin:I

    return p1
.end method


# virtual methods
.method protected createAssetItemsAdapter(Landroid/content/Context;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController$PhotosCollectionListViewBaseAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController$PhotosCollectionListViewBaseAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;Landroid/content/Context;)V

    return-object v0
.end method

.method protected getPhotoCollectionNavigationCommand(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;
    .registers 4
    .param p1, "targetCollection"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    .prologue
    .line 43
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;-><init>()V

    .line 45
    .local v0, "navCommand":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getGUID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;->collectionGUID:Ljava/lang/String;

    .line 46
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;->collectionName:Ljava/lang/String;

    .line 47
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getCatalog()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getGUID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;->catalogGUID:Ljava/lang/String;

    .line 48
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getCatalog()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToPhotoCollectionData;->catalogName:Ljava/lang/String;

    .line 50
    return-object v0
.end method

.method protected handleListItemClick(I)V
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 55
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->_assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;->getAssetItemData(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    move-result-object v0

    .line 56
    .local v0, "assetCellData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    if-eqz v0, :cond_12

    iget-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    if-eqz v2, :cond_12

    iget-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    instance-of v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    if-nez v2, :cond_13

    .line 62
    :cond_12
    :goto_12
    return-void

    .line 60
    :cond_13
    iget-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    .line 61
    .local v1, "photoCollection":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->getPhotoCollectionNavigationCommand(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;->navigateToCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;)V

    goto :goto_12
.end method

.method public set_photoCollectionsDataSource(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;)V
    .registers 2
    .param p1, "dataSource"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionListViewController;->_photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    .line 30
    return-void
.end method
