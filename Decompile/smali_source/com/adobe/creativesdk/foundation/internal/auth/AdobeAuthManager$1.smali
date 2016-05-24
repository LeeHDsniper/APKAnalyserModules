.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1;
.super Ljava/lang/Object;
.source "AdobeAuthManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->logout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

.field final synthetic val$adobeID:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;Ljava/lang/String;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .prologue
    .line 258
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1;->val$adobeID:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccess()V
    .registers 4

    .prologue
    .line 261
    const-string v1, "Logout Success"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1;->val$adobeID:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 267
    .local v0, "loginLogoutNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 270
    return-void
.end method
