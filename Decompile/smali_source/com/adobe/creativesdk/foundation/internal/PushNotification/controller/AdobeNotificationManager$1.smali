.class final Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$1;
.super Ljava/lang/Object;
.source "AdobeNotificationManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 5
    .param p1, "err"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 175
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v1, "AdobeNotificationManager.requestRendition"

    const-string v2, "Rendition error"

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$1;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onError(Ljava/lang/Object;)V

    .line 177
    return-void
.end method

.method public onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 4
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 169
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$1;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    .line 170
    return-void
.end method
