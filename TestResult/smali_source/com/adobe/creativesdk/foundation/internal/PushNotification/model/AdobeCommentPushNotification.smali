.class public Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;
.super Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
.source "AdobeCommentPushNotification.java"


# instance fields
.field private comment:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;-><init>()V

    .line 10
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;->ADOBE_PUSH_NOTIFICATION_TYPE_COMMENT:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->setNotificationType(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)V

    .line 11
    return-void
.end method


# virtual methods
.method public getComment()Ljava/lang/String;
    .registers 2

    .prologue
    .line 14
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobeCommentPushNotification;->comment:Ljava/lang/String;

    return-object v0
.end method
