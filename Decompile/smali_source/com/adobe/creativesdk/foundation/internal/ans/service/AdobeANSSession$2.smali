.class Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$2;
.super Ljava/lang/Object;
.source "AdobeANSSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->unregisterDevice(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

.field final synthetic val$callback:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    .prologue
    .line 215
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$2;->val$callback:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 3
    .param p1, "exp"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 224
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$2;->val$callback:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;->onError()V

    .line 226
    return-void
.end method

.method public onSuccess(Lorg/json/JSONObject;)V
    .registers 3
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 218
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$2;->val$callback:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;->onSuccess()V

    .line 220
    return-void
.end method
