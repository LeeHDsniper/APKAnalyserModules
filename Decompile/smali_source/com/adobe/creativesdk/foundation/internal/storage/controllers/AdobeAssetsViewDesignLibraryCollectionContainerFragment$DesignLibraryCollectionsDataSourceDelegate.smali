.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$DesignLibraryCollectionsDataSourceDelegate;
.super Ljava/lang/Object;
.source "AdobeAssetsViewDesignLibraryCollectionContainerFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DesignLibraryCollectionsDataSourceDelegate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;)V
    .registers 2

    .prologue
    .line 180
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$1;

    .prologue
    .line 180
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$DesignLibraryCollectionsDataSourceDelegate;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;)V

    return-void
.end method


# virtual methods
.method public didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;->ds_didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 201
    return-void
.end method

.method public didFinishLoading()V
    .registers 3

    .prologue
    .line 206
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;->_designDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getCount()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;->ds_didFinishLoading(I)V

    .line 207
    return-void
.end method

.method public didLoadMoreDataWithCount(I)V
    .registers 5
    .param p1, "count"    # I

    .prologue
    const/4 v2, 0x0

    .line 195
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;->_designDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getCount()I

    move-result v1

    invoke-virtual {v0, v1, v2, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;->ds_didLoadMoreDataWithCount(ILcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;Ljava/util/ArrayList;)V

    .line 196
    return-void
.end method

.method public willLoadDataFromScratch()V
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;->ds_willLoadDataFromScratch()V

    .line 186
    return-void
.end method

.method public willLoadNextPageForExistingPackage()V
    .registers 2

    .prologue
    .line 190
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;->ds_willLoadNextPageForExistingCollection()V

    .line 191
    return-void
.end method
