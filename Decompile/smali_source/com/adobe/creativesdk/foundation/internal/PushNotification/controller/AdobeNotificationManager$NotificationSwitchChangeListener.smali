.class Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$NotificationSwitchChangeListener;
.super Ljava/lang/Object;
.source "AdobeNotificationManager.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NotificationSwitchChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 2

    .prologue
    .line 1065
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$NotificationSwitchChangeListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$1;

    .prologue
    .line 1065
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$NotificationSwitchChangeListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 7
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 1070
    move-object v0, p2

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 1071
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v2

    const-string v3, "notification_state"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 1072
    .local v1, "status":Z
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->setNotificationSwitchStatus(Z)V

    .line 1073
    const/4 v2, 0x1

    if-ne v1, v2, :cond_25

    .line 1075
    # getter for: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$200()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_24

    .line 1076
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$NotificationSwitchChangeListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->registerDevice()V
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$100(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    .line 1081
    :cond_24
    :goto_24
    return-void

    .line 1078
    :cond_25
    # getter for: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$200()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_24

    .line 1079
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->unRegisterDevice()V

    goto :goto_24
.end method
