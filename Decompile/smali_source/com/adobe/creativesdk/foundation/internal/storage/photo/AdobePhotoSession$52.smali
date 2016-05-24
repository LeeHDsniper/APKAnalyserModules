.class Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;
.super Ljava/lang/Object;
.source "AdobePhotoSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getAssetCountInCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

.field final synthetic val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

.field final synthetic val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    .prologue
    .line 2942
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 10
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 2945
    const/4 v3, 0x0

    .line 2946
    .local v3, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    .line 2947
    .local v5, "statusCode":I
    const/4 v0, 0x0

    .line 2948
    .local v0, "assetsCount":Ljava/lang/Integer;
    const/16 v7, 0xc8

    if-ne v5, v7, :cond_2c

    .line 2950
    const/4 v4, 0x0

    .line 2952
    .local v4, "obj":Lorg/json/JSONObject;
    :try_start_b
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils;->JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_12
    .catch Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException; {:try_start_b .. :try_end_12} :catch_29

    move-result-object v4

    .line 2956
    :goto_13
    if-eqz v4, :cond_21

    .line 2958
    :try_start_15
    const-string v7, "total_count"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 2959
    .local v6, "total":I
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, v6}, Ljava/lang/Integer;-><init>(I)V
    :try_end_20
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_20} :catch_39

    .end local v0    # "assetsCount":Ljava/lang/Integer;
    .local v1, "assetsCount":Ljava/lang/Integer;
    move-object v0, v1

    .line 2968
    .end local v1    # "assetsCount":Ljava/lang/Integer;
    .end local v4    # "obj":Lorg/json/JSONObject;
    .end local v6    # "total":I
    .restart local v0    # "assetsCount":Ljava/lang/Integer;
    :cond_21
    :goto_21
    if-nez v3, :cond_33

    .line 2969
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v7, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 2972
    :goto_28
    return-void

    .line 2953
    .restart local v4    # "obj":Lorg/json/JSONObject;
    :catch_29
    move-exception v2

    .line 2954
    .local v2, "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    move-object v3, v2

    goto :goto_13

    .line 2966
    .end local v2    # "e":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    .end local v4    # "obj":Lorg/json/JSONObject;
    :cond_2c
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-static {v7, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v3

    goto :goto_21

    .line 2971
    :cond_33
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v7, v3}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    goto :goto_28

    .line 2960
    .restart local v4    # "obj":Lorg/json/JSONObject;
    :catch_39
    move-exception v7

    goto :goto_21
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    const/4 v4, 0x0

    .line 2976
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-static {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v1

    .line 2977
    .local v1, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    const/4 v0, 0x0

    .line 2978
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    if-eqz v1, :cond_16

    .line 2979
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    .line 2987
    :goto_10
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 2988
    return-void

    .line 2981
    :cond_16
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    if-ne v2, v3, :cond_2a

    .line 2982
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_NOT_ENTITLED_TO_SERVICE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v3

    invoke-direct {v0, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .restart local v0    # "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    goto :goto_10

    .line 2984
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
    .line 2993
    return-void
.end method
