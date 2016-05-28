.class Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$5;
.super Ljava/lang/Object;
.source "AdobeANSSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->updateNotifications(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

.field final synthetic val$updateNotificationCallback:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    .prologue
    .line 360
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$5;->val$updateNotificationCallback:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 3
    .param p1, "exp"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 370
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$5;->val$updateNotificationCallback:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;->onError()V

    .line 371
    return-void
.end method

.method public onSuccess(Lorg/json/JSONObject;)V
    .registers 3
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 363
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$5;->val$updateNotificationCallback:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;->onSuccess(Lorg/json/JSONObject;)V

    .line 365
    return-void
.end method
