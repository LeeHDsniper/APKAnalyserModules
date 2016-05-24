.class public Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession;
.super Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
.source "AdobeNotificationSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession$1;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V
    .registers 5
    .param p1, "cloudEndpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 112
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 114
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession;->setUpService()V

    .line 115
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNotificationServiceDisconnectedNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession;->setDisconnectionNotifier(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;)V

    .line 116
    const-wide/16 v0, 0xf

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession;->setupOngoingConnectionTimer(JZ)V

    .line 117
    return-void
.end method

.method protected static getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .registers 7

    .prologue
    .line 62
    const/4 v3, 0x0

    .line 63
    .local v3, "serviceEndpointURL":Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v0

    .line 65
    .local v0, "environment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession$1;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_3a

    .line 78
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "An undefined authentication endpoint has been specified."

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    :goto_21
    const/4 v1, 0x0

    .line 84
    .local v1, "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :try_start_22
    new-instance v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    const/4 v4, 0x0

    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    sget-object v6, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeNotification:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-direct {v2, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;-><init>(Ljava/lang/String;Ljava/net/URL;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)V
    :try_end_2f
    .catch Ljava/net/MalformedURLException; {:try_start_22 .. :try_end_2f} :catch_37

    .end local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .local v2, "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    move-object v1, v2

    .line 89
    .end local v2    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .restart local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :goto_30
    return-object v1

    .line 68
    .end local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :pswitch_31
    const-string v3, "https://ans.adobe.io/ans/v1/notifications"

    .line 69
    goto :goto_21

    .line 73
    :pswitch_34
    const-string v3, "https://stg-ans.adobe.io/ans/v1/notifications"

    .line 74
    goto :goto_21

    .line 86
    .restart local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :catch_37
    move-exception v4

    goto :goto_30

    .line 65
    nop

    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_31
        :pswitch_34
        :pswitch_34
    .end packed-switch
.end method

.method public static getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    .registers 2
    .param p0, "cloudEndpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 102
    if-nez p0, :cond_6

    .line 104
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession;->getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    move-result-object p0

    .line 107
    :cond_6
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 108
    .local v0, "session":Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession;
    return-object v0
.end method


# virtual methods
.method public setUpService()V
    .registers 1

    .prologue
    .line 131
    return-void
.end method

.method public tearDownService()V
    .registers 1

    .prologue
    .line 136
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->tearDownService()V

    .line 137
    return-void
.end method
