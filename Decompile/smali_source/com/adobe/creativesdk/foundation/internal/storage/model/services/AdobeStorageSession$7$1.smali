.class Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7$1;
.super Ljava/lang/Object;
.source "AdobeStorageSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;

    .prologue
    .line 958
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 3
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 961
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->val$editAssetCallback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;->onComplete()V

    .line 963
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 4
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 967
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->val$editAssetCallback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getAssetErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 968
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 4
    .param p1, "exception"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 973
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->val$editAssetCallback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getStorageError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 975
    return-void
.end method
