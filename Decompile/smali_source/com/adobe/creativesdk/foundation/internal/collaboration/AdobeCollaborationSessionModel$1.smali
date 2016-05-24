.class Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;
.super Ljava/util/TimerTask;
.source "AdobeCollaborationSessionModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->HTTPServiceDidDisconnect(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

.field triedReconnecting:Z

.field final synthetic val$service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

.field final synthetic val$timer:Ljava/util/Timer;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Ljava/util/Timer;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->val$service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->val$timer:Ljava/util/Timer;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 80
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->triedReconnecting:Z

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 84
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->val$service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 86
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->cancel()Z

    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->val$timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 104
    :goto_10
    return-void

    .line 91
    :cond_11
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->triedReconnecting:Z

    if-nez v0, :cond_1e

    .line 93
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->val$service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->reconnect()V

    .line 94
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->triedReconnecting:Z

    goto :goto_10

    .line 99
    :cond_1e
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageServiceDisconnectedNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 100
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->cancel()Z

    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;->val$timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    goto :goto_10
.end method
