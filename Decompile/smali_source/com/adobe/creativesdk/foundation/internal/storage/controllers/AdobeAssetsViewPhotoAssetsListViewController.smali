.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;
.source "AdobeAssetsViewPhotoAssetsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;
    }
.end annotation


# instance fields
.field private _photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;-><init>(Landroid/content/Context;)V

    .line 24
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    return-object v0
.end method


# virtual methods
.method protected createAssetItemsAdapter(Landroid/content/Context;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;Landroid/content/Context;)V

    return-object v0
.end method

.method public getSelectionOverallVisibility()Z
    .registers 2

    .prologue
    .line 28
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->isMultiSelectModeActive()Z

    move-result v0

    return v0
.end method

.method protected handleListItemClick(I)V
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 40
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->_assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;->getAssetItemData(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    move-result-object v0

    .line 41
    .local v0, "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;

    iget-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;->handleAssetClickAction(Ljava/lang/Object;)V

    .line 42
    return-void
.end method

.method public set_photoAssetsDataSource(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)V
    .registers 2
    .param p1, "dataSource"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .line 20
    return-void
.end method
