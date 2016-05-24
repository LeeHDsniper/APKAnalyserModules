.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;
.super Ljava/lang/Object;
.source "AdobeAssetPackage.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->loadDCXManifest(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

.field final synthetic val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

.field final synthetic val$successCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

.field final synthetic val$weakThis:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;Ljava/lang/ref/WeakReference;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    .prologue
    .line 135
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$weakThis:Ljava/lang/ref/WeakReference;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$successCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 12
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 142
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v6

    const/16 v7, 0x194

    if-ne v6, v7, :cond_3e

    .line 144
    const-string v7, "The requested manifest for package %s not found. This is most likely due to an empty asset package (no manifest)."

    const/4 v6, 0x1

    new-array v8, v6, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->getDescription()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 148
    .local v2, "message":Ljava/lang/String;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    if-eqz v6, :cond_36

    .line 150
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 153
    .local v5, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    sget-object v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorFileReadFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-direct {v1, v6, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/util/HashMap;)V

    .line 155
    .local v1, "error":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v6, v1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 182
    .end local v1    # "error":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    .end local v2    # "message":Ljava/lang/String;
    .end local v5    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_35
    return-void

    .line 160
    .restart local v2    # "message":Ljava/lang/String;
    :cond_36
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v7, "AdobeAssetPackage.loadDCXManifest"

    invoke-static {v6, v7, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_35

    .line 166
    .end local v2    # "message":Ljava/lang/String;
    :cond_3e
    const/4 v3, 0x0

    .line 168
    .local v3, "mfst":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    :try_start_3f
    new-instance v4, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;-><init>(Ljava/lang/String;)V
    :try_end_48
    .catch Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException; {:try_start_3f .. :try_end_48} :catch_6f

    .line 169
    .end local v3    # "mfst":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    .local v4, "mfst":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    :try_start_48
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getCompositeId()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->GUID:Ljava/lang/String;

    .line 170
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;->getName()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->name:Ljava/lang/String;

    .line 175
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$successCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    if-eqz v6, :cond_6d

    .line 176
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$successCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v6, v4}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V
    :try_end_6d
    .catch Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException; {:try_start_48 .. :try_end_6d} :catch_76

    :cond_6d
    move-object v3, v4

    .line 179
    .end local v4    # "mfst":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    .restart local v3    # "mfst":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    goto :goto_35

    .line 177
    :catch_6f
    move-exception v0

    .line 178
    .local v0, "e":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;
    :goto_70
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v6, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    goto :goto_35

    .line 177
    .end local v0    # "e":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;
    .end local v3    # "mfst":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    .restart local v4    # "mfst":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    :catch_76
    move-exception v0

    move-object v3, v4

    .end local v4    # "mfst":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    .restart local v3    # "mfst":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    goto :goto_70
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 187
    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 192
    return-void
.end method
