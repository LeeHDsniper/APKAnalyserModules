.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;
.super Ljava/lang/Object;
.source "AdobeAssetsViewDesignLibraryItemsContainerFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSource;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DesignLibraryItemsDataSourceWrapper"
.end annotation


# instance fields
.field _delegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;)V
    .registers 2

    .prologue
    .line 208
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$1;

    .prologue
    .line 208
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;)V

    return-void
.end method

.method private loadLibraryMetaData()V
    .registers 4

    .prologue
    .line 217
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;)V

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper$2;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->reloadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 236
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->count()I

    move-result v0

    return v0
.end method

.method public loadItemsFromScratch()Z
    .registers 2

    .prologue
    .line 245
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

    if-eqz v0, :cond_9

    .line 246
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;->willLoadDataFromScratch()V

    .line 248
    :cond_9
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->loadLibraryMetaData()V

    .line 249
    const/4 v0, 0x1

    return v0
.end method

.method public loadNextPageOfData()V
    .registers 1

    .prologue
    .line 255
    return-void
.end method

.method public resetDelegate()V
    .registers 2

    .prologue
    .line 259
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

    .line 260
    return-void
.end method

.method public setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;)V
    .registers 2
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

    .prologue
    .line 213
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryItemsDataSourceWrapper;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment$DesignLibraryCollectionsDataSourceDelegate;

    .line 214
    return-void
.end method
