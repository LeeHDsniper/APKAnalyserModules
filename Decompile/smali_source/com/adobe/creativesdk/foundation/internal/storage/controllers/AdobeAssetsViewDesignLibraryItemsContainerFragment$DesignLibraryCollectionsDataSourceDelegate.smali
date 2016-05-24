.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;
.super Ljava/lang/Object;
.source "AdobeAssetsViewDesignLibraryItemsContainerFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DesignLibraryCollectionsDataSourceDelegate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;)V
    .registers 2

    .prologue
    .line 264
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$1;

    .prologue
    .line 264
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;)V

    return-void
.end method


# virtual methods
.method public didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 284
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->ds_didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 285
    return-void
.end method

.method public didFinishLoading()V
    .registers 1

    .prologue
    .line 290
    return-void
.end method

.method public didLoadMoreDataWithCount(I)V
    .registers 4
    .param p1, "count"    # I

    .prologue
    const/4 v1, 0x0

    .line 279
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;

    invoke-virtual {v0, p1, v1, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->ds_didLoadMoreDataWithCount(ILcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;Ljava/util/ArrayList;)V

    .line 280
    return-void
.end method

.method public willLoadDataFromScratch()V
    .registers 2

    .prologue
    .line 269
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->ds_willLoadDataFromScratch()V

    .line 270
    return-void
.end method

.method public willLoadNextPageForExistingPackage()V
    .registers 1

    .prologue
    .line 275
    return-void
.end method
