.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$2;
.super Ljava/lang/Object;
.source "AdobeAssetsViewMobileCreationPackageItemsContainerFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->loadMetadata()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    .prologue
    .line 244
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 6
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 247
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;

    if-nez v0, :cond_7

    .line 251
    :goto_6
    return-void

    .line 250
    :cond_7
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper;->_delegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;

    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;->getData()Ljava/util/HashMap;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/util/HashMap;)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationsPackageCollectionsDataSourceDelegate;->didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    goto :goto_6
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 244
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment$MobileCreationPackageItemsDataSourceWrapper$2;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method
