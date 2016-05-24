.class Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;
.super Ljava/lang/Object;
.source "AdobeStorageSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->moveAssetUtil(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

.field final synthetic val$editAssetCallback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

.field final synthetic val$self:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .prologue
    .line 951
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->val$editAssetCallback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->val$self:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 7
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 954
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_e

    .line 955
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->val$editAssetCallback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;->onComplete()V

    .line 979
    :cond_d
    :goto_d
    return-void

    .line 956
    :cond_e
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0xca

    if-ne v1, v2, :cond_d

    .line 958
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;

    const-wide/16 v2, 0x1

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->val$self:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7$1;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;)V

    invoke-direct {v0, v2, v3, v1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;-><init>(JLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;)V

    .line 977
    .local v0, "responseHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->startMonitoringServiceEndPoint(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    goto :goto_d
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 982
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getStorageError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 983
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->val$editAssetCallback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 984
    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 989
    return-void
.end method
