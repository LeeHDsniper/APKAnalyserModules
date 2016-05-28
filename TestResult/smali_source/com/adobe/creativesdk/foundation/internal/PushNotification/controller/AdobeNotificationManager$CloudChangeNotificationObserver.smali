.class Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$CloudChangeNotificationObserver;
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
    name = "CloudChangeNotificationObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 2

    .prologue
    .line 1052
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$CloudChangeNotificationObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$1;

    .prologue
    .line 1052
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$CloudChangeNotificationObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 6
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 1057
    move-object v0, p2

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 1058
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNotificationManagerSwitchedToPrivateCloudNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v1, v2, :cond_11

    .line 1059
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$CloudChangeNotificationObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleSwitchToPrivateCloud()V
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$2100(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    .line 1062
    :goto_10
    return-void

    .line 1061
    :cond_11
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$CloudChangeNotificationObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleSwitchToPublicCloud()V
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$2200(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    goto :goto_10
.end method
