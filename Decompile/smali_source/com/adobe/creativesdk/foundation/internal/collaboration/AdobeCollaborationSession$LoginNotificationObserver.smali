.class Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoginNotificationObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;)V
    .registers 2

    .prologue
    .line 865
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    .param p2, "x1"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;

    .prologue
    .line 865
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;)V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 9
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 868
    move-object v2, p2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 870
    .local v2, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-eq v4, v5, :cond_13

    .line 871
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginExternalNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v4, v5, :cond_30

    .line 872
    :cond_13
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v1

    .line 873
    .local v1, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->service()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v0

    .line 874
    .local v0, "httpService":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setAccessToken(Ljava/lang/String;)V

    .line 875
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setSuspended(Z)V

    .line 876
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->getSharedModel()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->login()V

    .line 885
    .end local v0    # "httpService":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .end local v1    # "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    :cond_2f
    :goto_2f
    return-void

    .line 877
    :cond_30
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v4, v5, :cond_2f

    .line 878
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->service()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v3

    .line 879
    .local v3, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->clearQueuedRequests()V

    .line 880
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->reconnect()V

    .line 881
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setAccessToken(Ljava/lang/String;)V

    .line 882
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->getSharedModel()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->logout()V

    goto :goto_2f
.end method
