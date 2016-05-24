.class Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;
.super Ljava/lang/Object;
.source "AdobeStorageSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getRendition(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;ILjava/lang/String;ILcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

.field final synthetic val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;

.field final synthetic val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .prologue
    .line 2024
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 6
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 2029
    const/4 v0, 0x0

    .line 2030
    .local v0, "err":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v1

    .line 2032
    .local v1, "status":I
    const/16 v2, 0xc8

    if-eq v1, v2, :cond_d

    const/16 v2, 0x130

    if-ne v1, v2, :cond_17

    .line 2034
    :cond_d
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;->onComplete([B)V

    .line 2043
    :goto_16
    return-void

    .line 2038
    :cond_17
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;->val$resource:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getAssetErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 2039
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;->onError(Ljava/lang/Object;)V

    goto :goto_16
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 2052
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getStorageError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 2064
    .local v0, "err":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;

    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;->onError(Ljava/lang/Object;)V

    .line 2065
    return-void
.end method

.method public onProgress(D)V
    .registers 4
    .param p1, "progressPercent"    # D

    .prologue
    .line 2047
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$19;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;

    invoke-interface {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;->onProgress(D)V

    .line 2048
    return-void
.end method
