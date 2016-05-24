.class Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;
.super Ljava/lang/Object;
.source "AdobePhotoAsset.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler",
        "<[B>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

.field final synthetic val$cacheKey:Ljava/lang/String;

.field final synthetic val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

.field final synthetic val$rendition:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 944
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->val$cacheKey:Ljava/lang/String;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->val$rendition:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onHit(Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .registers 3

    .prologue
    .line 944
    check-cast p1, [B

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->onHit([BLcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V

    return-void
.end method

.method public onHit([BLcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .registers 4
    .param p1, "data"    # [B
    .param p2, "location"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    .prologue
    .line 948
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    .line 949
    return-void
.end method

.method public onMiss()V
    .registers 7

    .prologue
    .line 954
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    const/4 v3, 0x0

    # setter for: Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->access$102(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 955
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    new-instance v3, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$1;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$1;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;)V

    # setter for: Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->access$202(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;)Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .line 963
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$2;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;)V

    .line 982
    .local v0, "assetSuccessCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<[B>;"
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$3;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;)V

    .line 1007
    .local v1, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    move-result-object v2

    if-nez v2, :cond_23

    .line 1018
    :goto_22
    return-void

    .line 1010
    :cond_23
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->val$rendition:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-virtual {v3, v4, v5, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v3

    # setter for: Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->access$102(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 1016
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    # getter for: Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->access$100(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    # getter for: Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->access$200(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->registerListener(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;)V

    goto :goto_22
.end method
