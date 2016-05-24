.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;
.source "AdobeAssetsViewPhotoAssetsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "PhotosAssetsListViewBaseAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;Landroid/content/Context;)V

    .line 48
    return-void
.end method


# virtual methods
.method protected getPhotosList()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;->_photoCollectionsList:Ljava/util/ArrayList;

    if-nez v0, :cond_29

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    move-result-object v0

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->getAssets()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_29

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->_photoAssetsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->getAssets()Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;->_photoCollectionsList:Ljava/util/ArrayList;

    .line 59
    :cond_29
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsListViewController$PhotosAssetsListViewBaseAdapter;->_photoCollectionsList:Ljava/util/ArrayList;

    return-object v0
.end method

.method protected handleCellPostCreation(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;)V
    .registers 2
    .param p1, "cellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;

    .prologue
    .line 64
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->forceHideBottomTitleBar()V

    .line 65
    return-void
.end method

.method protected isAssetSelectable(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z
    .registers 3
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 52
    const/4 v0, 0x1

    return v0
.end method
