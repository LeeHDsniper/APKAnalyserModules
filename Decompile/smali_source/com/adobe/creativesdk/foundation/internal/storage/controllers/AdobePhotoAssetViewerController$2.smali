.class final Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController$2;
.super Ljava/lang/Object;
.source "AdobePhotoAssetViewerController.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->setCurrentAssetViewerActivity(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 4
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 133
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->access$000()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    if-nez v0, :cond_7

    .line 142
    :cond_6
    :goto_6
    return-void

    .line 136
    :cond_7
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->access$000()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;->fetchCurrentPageIndex()I

    move-result v0

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_selectedIndex:I
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->access$102(I)I

    .line 137
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->access$200()Ljava/lang/ref/WeakReference;

    move-result-object v0

    if-eqz v0, :cond_6

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->access$200()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 139
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->access$200()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->getAssets()Ljava/util/ArrayList;

    move-result-object v0

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetList:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->access$302(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 140
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->access$000()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;->handleAssetCollectionChanged()V

    goto :goto_6
.end method
