.class final Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController$2;
.super Ljava/lang/Object;
.source "AdobeAssetViewerController.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->setCurrentAssetViewerActivity(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 7
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 157
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->access$000()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v2

    if-nez v2, :cond_7

    .line 173
    :cond_6
    :goto_6
    return-void

    .line 160
    :cond_7
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->access$000()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v2

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;->fetchCurrentPageIndex()I

    move-result v2

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_selectedIndex:I
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->access$102(I)I

    .line 162
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->access$200()Ljava/lang/ref/WeakReference;

    move-result-object v2

    if-eqz v2, :cond_6

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->access$200()Ljava/lang/ref/WeakReference;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 164
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_dataSource:Ljava/lang/ref/WeakReference;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->access$200()Ljava/lang/ref/WeakReference;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->flattenedItems()Ljava/util/ArrayList;

    move-result-object v1

    .line 165
    .local v1, "fullList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->access$302(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 166
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3e
    :goto_3e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_56

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 167
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    instance-of v3, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v3, :cond_3e

    .line 168
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_filteredAssetList:Ljava/util/ArrayList;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->access$300()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3e

    .line 171
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :cond_56
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->_assetViewerActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->access$000()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v2

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;->handleAssetCollectionChanged()V

    goto :goto_6
.end method
