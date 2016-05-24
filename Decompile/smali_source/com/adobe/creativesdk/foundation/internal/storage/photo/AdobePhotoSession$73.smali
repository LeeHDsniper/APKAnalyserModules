.class Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;
.super Ljava/lang/Object;
.source "AdobePhotoSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

.field final synthetic val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

.field final synthetic val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

.field final synthetic val$fromAsset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    .prologue
    .line 4221
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->val$fromAsset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 10
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 4224
    const/4 v0, 0x0

    .line 4225
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v1

    .line 4226
    .local v1, "statusCode":I
    const/16 v2, 0xc8

    if-ne v1, v2, :cond_2e

    .line 4227
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v3, "PhotoSession:downloadRendition"

    const-string v4, "Rendition retrieve for asset %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->val$fromAsset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 4231
    :goto_22
    if-nez v0, :cond_35

    .line 4232
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 4235
    :goto_2d
    return-void

    .line 4229
    :cond_2e
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    goto :goto_22

    .line 4234
    :cond_35
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    goto :goto_2d
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    const/4 v4, 0x0

    .line 4239
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v1

    .line 4240
    .local v1, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    const/4 v0, 0x0

    .line 4241
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    if-eqz v1, :cond_16

    .line 4242
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    .line 4250
    :goto_10
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 4251
    return-void

    .line 4244
    :cond_16
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    if-ne v2, v3, :cond_2a

    .line 4245
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v3

    invoke-direct {v0, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .restart local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    goto :goto_10

    .line 4247
    :cond_2a
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v3

    invoke-direct {v0, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .restart local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    goto :goto_10
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 4256
    return-void
.end method
