.class final Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$5;
.super Ljava/lang/Object;
.source "AdobeNotificationManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->unRegisterDevice()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 310
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 1

    .prologue
    .line 319
    return-void
.end method

.method public onSuccess()V
    .registers 2

    .prologue
    .line 313
    const/4 v0, 0x0

    # setter for: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$202(Ljava/lang/String;)Ljava/lang/String;

    .line 314
    return-void
.end method
