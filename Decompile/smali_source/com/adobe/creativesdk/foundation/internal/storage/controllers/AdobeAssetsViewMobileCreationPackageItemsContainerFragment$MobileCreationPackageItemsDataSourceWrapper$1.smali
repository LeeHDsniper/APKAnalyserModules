.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$1;
.super Ljava/lang/Object;
.source "AdobeAssetsViewMobileCreationPackageItemsContainerFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->loadMetadata()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    .prologue
    .line 234
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion()V
    .registers 4

    .prologue
    .line 237
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;

    if-nez v1, :cond_7

    .line 243
    :goto_6
    return-void

    .line 240
    :cond_7
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_targetPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->setContainerFragmentTitle(Ljava/lang/String;)V

    .line 241
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_targetPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v1

    if-nez v1, :cond_31

    const/4 v0, 0x0

    .line 242
    .local v0, "count":I
    :goto_29
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;->didFinishLoading()V

    goto :goto_6

    .line 241
    .end local v0    # "count":I
    :cond_31
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->_targetPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_29
.end method
