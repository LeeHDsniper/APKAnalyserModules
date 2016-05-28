.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;
.super Ljava/lang/Object;
.source "AdobeAssetsViewPhotoCollectionContainerFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/IAdobePhotoCollectionsDataSourceDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhotoCollectionsDataSourceDelegate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;)V
    .registers 2

    .prologue
    .line 210
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$1;

    .prologue
    .line 210
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;)V

    return-void
.end method

.method private loadDataFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;Z)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    .param p2, "firstPage"    # Z

    .prologue
    const/4 v1, 0x0

    .line 245
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->ds_handleLoadDataErrorCommon()V

    move-object v0, p1

    .line 246
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .line 247
    .local v0, "photoError":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;->getData()Ljava/util/HashMap;

    move-result-object v2

    if-eqz v2, :cond_2b

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;->getData()Ljava/util/HashMap;

    move-result-object v2

    const-string v3, "AdobeNetworkHTTPStatus"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;->getData()Ljava/util/HashMap;

    move-result-object v2

    const-string v3, "AdobeNetworkHTTPStatus"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 249
    .local v1, "statusCode":I
    :cond_2b
    instance-of v2, p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    if-eqz v2, :cond_32

    .line 250
    sparse-switch v1, :sswitch_data_42

    .line 263
    :cond_32
    :goto_32
    return-void

    .line 252
    :sswitch_33
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->markAsWentOffline()V

    goto :goto_32

    .line 257
    :sswitch_39
    if-eqz p2, :cond_32

    .line 258
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->ds_handleLoadDataErrorShowEmptyAssetsView()V

    goto :goto_32

    .line 250
    nop

    :sswitch_data_42
    .sparse-switch
        0x191 -> :sswitch_39
        0x194 -> :sswitch_39
        0x258 -> :sswitch_33
    .end sparse-switch
.end method


# virtual methods
.method public loadCatalogFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 216
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->loadDataFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;Z)V

    return-void
.end method

.method public loadCatalogSucceeded(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)V
    .registers 2
    .param p1, "catalog"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .prologue
    .line 213
    return-void
.end method

.method public loadFirstPageFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 224
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->loadDataFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;Z)V

    return-void
.end method

.method public loadFirstPageSucceeded()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 220
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->_photoCollectionsDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->getCount()I

    move-result v1

    invoke-virtual {v0, v1, v2, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->ds_didLoadMoreDataWithCount(ILcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;Ljava/util/ArrayList;)V

    .line 221
    return-void
.end method

.method public loadNextPageOfDataFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 230
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->loadDataFailed(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;Z)V

    return-void
.end method

.method public loadNextPageOfDataSucceeded()V
    .registers 1

    .prologue
    .line 227
    return-void
.end method

.method public willLoadCatalog()V
    .registers 2

    .prologue
    .line 234
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->ds_willLoadDataFromScratch()V

    .line 235
    return-void
.end method

.method public willLoadFirstPage()V
    .registers 2

    .prologue
    .line 238
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->ds_willLoadNextPageForNonExistingCollection()V

    return-void
.end method

.method public willLoadNextPage()V
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment$PhotoCollectionsDataSourceDelegate;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;->ds_willLoadNextPageForExistingCollection()V

    return-void
.end method
