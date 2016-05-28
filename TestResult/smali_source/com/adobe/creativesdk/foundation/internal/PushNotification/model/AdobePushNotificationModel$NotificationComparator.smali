.class Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel$NotificationComparator;
.super Ljava/lang/Object;
.source "AdobePushNotificationModel.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NotificationComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    .prologue
    .line 501
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel$NotificationComparator;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;)I
    .registers 11
    .param p1, "notification1"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    .param p2, "notification2"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 506
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getTimestamp()J

    move-result-wide v4

    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getTimestamp()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-lez v3, :cond_13

    move v0, v2

    .line 507
    .local v0, "compare":Z
    :goto_f
    if-eqz v0, :cond_15

    .line 508
    const/4 v1, -0x1

    .line 513
    :cond_12
    :goto_12
    return v1

    .end local v0    # "compare":Z
    :cond_13
    move v0, v1

    .line 506
    goto :goto_f

    .line 509
    .restart local v0    # "compare":Z
    :cond_15
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getTimestamp()J

    move-result-wide v4

    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getTimestamp()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-nez v3, :cond_26

    move v0, v2

    .line 510
    :goto_22
    if-nez v0, :cond_12

    move v1, v2

    .line 513
    goto :goto_12

    :cond_26
    move v0, v1

    .line 509
    goto :goto_22
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 501
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    check-cast p2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel$NotificationComparator;->compare(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;)I

    move-result v0

    return v0
.end method
