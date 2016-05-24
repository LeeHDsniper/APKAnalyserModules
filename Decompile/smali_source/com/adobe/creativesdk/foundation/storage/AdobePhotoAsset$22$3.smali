.class Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$3;
.super Ljava/lang/Object;
.source "AdobePhotoAsset.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->onMiss()V
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
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    .prologue
    .line 982
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$3;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 987
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$3;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->handleCommonUploadCompletionBookKeeping()V

    .line 989
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    if-eqz v1, :cond_45

    move-object v0, p1

    .line 990
    check-cast v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .line 991
    .local v0, "networkException":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorCancelled:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    if-ne v1, v2, :cond_1e

    .line 992
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$3;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCancellation()V

    .line 1003
    .end local v0    # "networkException":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .end local p1    # "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    :goto_1d
    return-void

    .line 994
    .restart local v0    # "networkException":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .restart local p1    # "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    :cond_1e
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to download data for photo asset "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$3;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    iget-object v4, v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    # getter for: Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_name:Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->access$000(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1d

    .line 997
    .end local v0    # "networkException":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_45
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    if-eqz v1, :cond_53

    .line 998
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$3;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->val$downloadRenditionCallback:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local p1    # "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    invoke-interface {v1, p1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onError(Ljava/lang/Object;)V

    goto :goto_1d

    .line 1000
    .restart local p1    # "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    :cond_53
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to download data for photo asset "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$3;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    iget-object v4, v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    # getter for: Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_name:Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->access$000(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1d
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 982
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22$3;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method
