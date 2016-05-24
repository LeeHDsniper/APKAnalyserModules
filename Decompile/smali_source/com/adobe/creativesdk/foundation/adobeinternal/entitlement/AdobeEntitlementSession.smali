.class public Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;
.super Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
.source "AdobeEntitlementSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$8;
    }
.end annotation


# static fields
.field private static _sharedSession:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;


# instance fields
.field protected _cacheConfigured:Z

.field _networkReachability:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

.field private _refreshTimer:Ljava/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 107
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_sharedSession:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V
    .registers 5
    .param p1, "cloudEndpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    const/4 v2, 0x0

    .line 115
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 116
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->setUpService()V

    .line 117
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeEntitlementServiceDisconnectedNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->setDisconnectionNotifier(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;)V

    .line 118
    const-wide/16 v0, 0xf

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->setupOngoingConnectionTimer(JZ)V

    .line 119
    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_cacheConfigured:Z

    .line 120
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postUserProfileData(Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->refreshUserProfile()V

    return-void
.end method

.method private static getRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "urlString"    # Ljava/lang/String;
    .param p1, "baseUrlString"    # Ljava/lang/String;

    .prologue
    .line 275
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 276
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 278
    :cond_d
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 279
    const/4 v0, 0x0

    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 281
    :cond_20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .registers 7

    .prologue
    .line 147
    const/4 v3, 0x0

    .line 148
    .local v3, "serviceEndpointURL":Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v0

    .line 150
    .local v0, "environment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    sget-object v4, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$8;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_3a

    .line 163
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "An undefined authentication endpoint has been specified."

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    :goto_21
    const/4 v1, 0x0

    .line 169
    .local v1, "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :try_start_22
    new-instance v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    const/4 v4, 0x0

    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    sget-object v6, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeEntitlement:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-direct {v2, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;-><init>(Ljava/lang/String;Ljava/net/URL;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)V
    :try_end_2f
    .catch Ljava/net/MalformedURLException; {:try_start_22 .. :try_end_2f} :catch_37

    .end local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .local v2, "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    move-object v1, v2

    .line 173
    .end local v2    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .restart local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :goto_30
    return-object v1

    .line 153
    .end local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :pswitch_31
    const-string v3, "https://entitlements.adobe.io"

    .line 154
    goto :goto_21

    .line 158
    :pswitch_34
    const-string v3, "https://entitlements-stage.adobe.io"

    .line 159
    goto :goto_21

    .line 170
    .restart local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :catch_37
    move-exception v4

    goto :goto_30

    .line 150
    nop

    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_31
        :pswitch_34
        :pswitch_34
    .end packed-switch
.end method

.method public static getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;
    .registers 2
    .param p0, "cloudEndpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 178
    if-nez p0, :cond_6

    .line 180
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    move-result-object p0

    .line 183
    :cond_6
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 184
    .local v0, "session":Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;
    return-object v0
.end method

.method public static getSharedSession()Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;
    .registers 3

    .prologue
    .line 136
    const-class v2, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    monitor-enter v2

    .line 137
    :try_start_3
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_sharedSession:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    if-nez v1, :cond_11

    .line 138
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    move-result-object v0

    .line 139
    .local v0, "endpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    move-result-object v1

    sput-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_sharedSession:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    .line 141
    :cond_11
    monitor-exit v2
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_15

    .line 142
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_sharedSession:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    return-object v1

    .line 141
    :catchall_15
    move-exception v1

    :try_start_16
    monitor-exit v2
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    throw v1
.end method

.method private postUserProfileData(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 7
    .param p1, "parsedData"    # Lorg/json/JSONObject;
    .param p2, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 285
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 287
    .local v0, "info":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "AdobeEntitlementSessionUserProfileData"

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    const-string v2, "AdobeEntitlementSessionEndPoint"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getCloudEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    const-string v2, "AdobeEntitlementSessionAccessToken"

    invoke-virtual {v0, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeEntilementUserProfileDataFetchNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-direct {v1, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 291
    .local v1, "userProfileDataFetchNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 292
    return-void
.end method

.method private refreshUserProfile()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 655
    invoke-static {}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getSharedAuthManager()Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_43

    .line 657
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_networkReachability:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    if-nez v0, :cond_2c

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_2c

    .line 658
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->createAndGetNetworkReachability()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_networkReachability:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    .line 659
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_networkReachability:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->startNotification(Landroid/content/Context;)Z

    .line 661
    :cond_2c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_networkReachability:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    if-eqz v0, :cond_43

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_networkReachability:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z

    move-result v0

    if-eqz v0, :cond_43

    .line 662
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2, v2, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getUserProfileForToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 665
    :cond_43
    return-void
.end method

.method private setupRefreshTimer(J)V
    .registers 10
    .param p1, "timeInterval"    # J

    .prologue
    .line 640
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_refreshTimer:Ljava/util/Timer;

    if-nez v0, :cond_17

    .line 642
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_refreshTimer:Ljava/util/Timer;

    .line 643
    new-instance v1, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$7;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$7;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;)V

    .line 649
    .local v1, "task":Ljava/util/TimerTask;
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_refreshTimer:Ljava/util/Timer;

    move-wide v2, p1

    move-wide v4, p1

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 651
    .end local v1    # "task":Ljava/util/TimerTask;
    :cond_17
    return-void
.end method

.method private stopRefreshTimer()V
    .registers 3

    .prologue
    .line 669
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_refreshTimer:Ljava/util/Timer;

    if-eqz v0, :cond_10

    .line 670
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_refreshTimer:Ljava/util/Timer;

    monitor-enter v1

    .line 671
    :try_start_7
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_refreshTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 672
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_refreshTimer:Ljava/util/Timer;

    .line 673
    monitor-exit v1

    .line 675
    :cond_10
    return-void

    .line 673
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_11

    throw v0
.end method


# virtual methods
.method protected errorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    .registers 7
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "details"    # Ljava/lang/String;

    .prologue
    .line 254
    const/4 v0, 0x0

    .line 256
    .local v0, "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0x190

    if-ne v1, v2, :cond_1a

    .line 258
    new-instance v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .end local v0    # "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    sget-object v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorBadRequest:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 265
    .restart local v0    # "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    :cond_10
    :goto_10
    if-nez v0, :cond_19

    .line 267
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;->AdobeEntitlementErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;

    const/4 v2, 0x0

    invoke-static {v1, v2, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/entitlement/AdobeEntitlementErrorUtils;->errorWithCode(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementErrorCode;Ljava/lang/Exception;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementException;

    move-result-object v0

    .line 270
    :cond_19
    return-object v0

    .line 260
    :cond_1a
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v1

    const/16 v2, 0x191

    if-ne v1, v2, :cond_10

    .line 262
    new-instance v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .end local v0    # "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    sget-object v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorAuthenticationFailed:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .restart local v0    # "error":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    goto :goto_10
.end method

.method protected getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 12
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "data"    # [B
    .param p4, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .param p5, "handler"    # Landroid/os/Handler;

    .prologue
    .line 616
    if-nez p2, :cond_10

    .line 619
    invoke-virtual {p1, p3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setBody([B)V

    .line 620
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    invoke-virtual {v0, p1, v1, p4, p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v0

    .line 631
    :goto_f
    return-object v0

    .line 623
    :cond_10
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-ne v0, v1, :cond_27

    .line 625
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v0

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDownloadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v0

    goto :goto_f

    .line 631
    :cond_27
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v0

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForUploadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v0

    goto :goto_f
.end method

.method public getUserProfileForToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 31
    .param p1, "accessToken"    # Ljava/lang/String;
    .param p4, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;",
            "Landroid/os/Handler;",
            ")",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;"
        }
    .end annotation

    .prologue
    .line 430
    .local p2, "successBlock":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lorg/json/JSONObject;>;"
    .local p3, "errorBlock":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getUserProfileFromCache()Lorg/json/JSONObject;

    move-result-object v11

    .line 431
    .local v11, "cachedUserProfile":Lorg/json/JSONObject;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    if-eqz v4, :cond_4d

    .line 432
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->createAndGetNetworkReachability()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    move-result-object v20

    .line 433
    .local v20, "sharedNetworkReachability":Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->startNotification(Landroid/content/Context;)Z

    .line 434
    invoke-virtual/range {v20 .. v20}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z

    move-result v4

    if-nez v4, :cond_4a

    .line 435
    if-eqz v11, :cond_35

    .line 436
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-virtual {v0, v11, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postResponseToSuccessBlock(Lorg/json/JSONObject;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Landroid/os/Handler;)V

    .line 441
    :goto_32
    const/16 v21, 0x0

    .line 553
    .end local v20    # "sharedNetworkReachability":Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
    :goto_34
    return-object v21

    .line 438
    .restart local v20    # "sharedNetworkReachability":Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
    :cond_35
    new-instance v19, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v4, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorOffline:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-object/from16 v0, v19

    invoke-direct {v0, v4}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 439
    .local v19, "exception":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postResposeToErrorBlock(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)V

    goto :goto_32

    .line 443
    .end local v19    # "exception":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_4a
    invoke-virtual/range {v20 .. v20}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->stopNotification()V

    .line 449
    .end local v20    # "sharedNetworkReachability":Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
    :cond_4d
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v4

    if-nez v4, :cond_66

    .line 451
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postResponseToSuccessBlock(Lorg/json/JSONObject;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Landroid/os/Handler;)V

    .line 452
    const/16 v21, 0x0

    goto :goto_34

    .line 455
    :cond_66
    if-nez v11, :cond_c1

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_c1

    const/16 v25, 0x1

    .line 458
    .local v25, "useFallbackDataOnFailure":Z
    :goto_74
    const-string v24, "/api/v2/profile"

    .line 460
    .local v24, "urlString":Ljava/lang/String;
    const/16 v22, 0x0

    .line 462
    .local v22, "url":Ljava/net/URL;
    :try_start_78
    new-instance v23, Ljava/net/URL;

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v24

    invoke-static {v0, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v23

    invoke-direct {v0, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_91
    .catch Ljava/net/MalformedURLException; {:try_start_78 .. :try_end_91} :catch_c4

    .end local v22    # "url":Ljava/net/URL;
    .local v23, "url":Ljava/net/URL;
    move-object/from16 v22, v23

    .line 467
    .end local v23    # "url":Ljava/net/URL;
    .restart local v22    # "url":Ljava/net/URL;
    :goto_93
    new-instance v13, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v13}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 468
    .local v13, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 469
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v13, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 471
    move/from16 v9, v25

    .line 472
    .local v9, "finalUseFallbackDataOnFailure":Z
    const/4 v14, 0x0

    const/4 v15, 0x0

    new-instance v4, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p4

    move-object/from16 v10, p3

    invoke-direct/range {v4 .. v11}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$4;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Landroid/os/Handler;ZLcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Lorg/json/JSONObject;)V

    move-object/from16 v12, p0

    move-object/from16 v16, v4

    move-object/from16 v17, p4

    invoke-virtual/range {v12 .. v17}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v21

    .line 553
    .local v21, "taskHandle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    goto/16 :goto_34

    .line 455
    .end local v9    # "finalUseFallbackDataOnFailure":Z
    .end local v13    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v21    # "taskHandle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .end local v22    # "url":Ljava/net/URL;
    .end local v24    # "urlString":Ljava/lang/String;
    .end local v25    # "useFallbackDataOnFailure":Z
    :cond_c1
    const/16 v25, 0x0

    goto :goto_74

    .line 463
    .restart local v22    # "url":Ljava/net/URL;
    .restart local v24    # "urlString":Ljava/lang/String;
    .restart local v25    # "useFallbackDataOnFailure":Z
    :catch_c4
    move-exception v18

    .line 464
    .local v18, "e":Ljava/net/MalformedURLException;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, v18

    invoke-static {v4, v5, v6, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_93
.end method

.method public getUserProfileFromCache()Lorg/json/JSONObject;
    .registers 23

    .prologue
    .line 297
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAdobeID()Ljava/lang/String;

    move-result-object v5

    .line 304
    .local v5, "guid":Ljava/lang/String;
    new-instance v19, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1Output;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1Output;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;)V

    .line 305
    .local v19, "op":Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1Output;
    if-eqz v5, :cond_46

    .line 307
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v4

    const-string v6, "profile"

    const-string v8, "com.adobe.cc.entitlements"

    invoke-virtual {v4, v5, v6, v8}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getTimestampForGUID(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Date;

    move-result-object v11

    .line 312
    .local v11, "cacheTimestamp":Ljava/util/Date;
    if-eqz v11, :cond_46

    .line 314
    const-wide/32 v16, 0x278d00

    .line 315
    .local v16, "expirationTime":J
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    invoke-virtual {v11}, Ljava/util/Date;->getTime()J

    move-result-wide v20

    sub-long v8, v8, v20

    const-wide/16 v20, 0x3e8

    div-long v14, v8, v20

    .line 317
    .local v14, "currentTime":J
    cmp-long v4, v14, v16

    if-lez v4, :cond_4b

    .line 320
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v4

    const-string v6, "profile"

    const-string v8, "com.adobe.cc.entitlements"

    invoke-virtual {v4, v5, v6, v8}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeItemWithGUID(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 366
    .end local v11    # "cacheTimestamp":Ljava/util/Date;
    .end local v14    # "currentTime":J
    .end local v16    # "expirationTime":J
    :cond_46
    :goto_46
    move-object/from16 v0, v19

    iget-object v4, v0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1Output;->result:Lorg/json/JSONObject;

    return-object v4

    .line 324
    .restart local v11    # "cacheTimestamp":Ljava/util/Date;
    .restart local v14    # "currentTime":J
    .restart local v16    # "expirationTime":J
    :cond_4b
    new-instance v18, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct/range {v18 .. v18}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 325
    .local v18, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v12

    .line 327
    .local v12, "condition":Ljava/util/concurrent/locks/Condition;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-static {v4}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v7

    .line 328
    .local v7, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v4

    const-string v6, "profile"

    const-string v8, "com.adobe.cc.entitlements"

    new-instance v9, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v9, v0, v1, v2, v12}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;Ljava/util/concurrent/locks/ReentrantLock;Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1Output;Ljava/util/concurrent/locks/Condition;)V

    const/4 v10, 0x0

    invoke-virtual/range {v4 .. v10}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getObjectFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z

    .line 353
    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 354
    :goto_74
    move-object/from16 v0, v19

    iget-boolean v4, v0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$1Output;->isDone:Z

    if-nez v4, :cond_8b

    .line 356
    :try_start_7a
    invoke-interface {v12}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_7d
    .catch Ljava/lang/InterruptedException; {:try_start_7a .. :try_end_7d} :catch_7e

    goto :goto_74

    .line 357
    :catch_7e
    move-exception v13

    .line 358
    .local v13, "e":Ljava/lang/InterruptedException;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v6, "AdobeDCXCompositeXfer.internalDownloadComponents"

    invoke-virtual {v13}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v6, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_74

    .line 361
    .end local v13    # "e":Ljava/lang/InterruptedException;
    :cond_8b
    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_46
.end method

.method protected isCacheConfigured()Z
    .registers 2

    .prologue
    .line 239
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_cacheConfigured:Z

    return v0
.end method

.method postResponseToSuccessBlock(Lorg/json/JSONObject;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Landroid/os/Handler;)V
    .registers 6
    .param p1, "userProfile"    # Lorg/json/JSONObject;
    .param p2, "accessToken"    # Ljava/lang/String;
    .param p4, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Lorg/json/JSONObject;",
            ">;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 371
    .local p3, "successBlock":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lorg/json/JSONObject;>;"
    if-eqz p3, :cond_c

    .line 372
    if-eqz p4, :cond_d

    .line 373
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$2;

    invoke-direct {v0, p0, p3, p1, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$2;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lorg/json/JSONObject;Ljava/lang/String;)V

    invoke-virtual {p4, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 385
    :cond_c
    :goto_c
    return-void

    .line 381
    :cond_d
    invoke-interface {p3, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 382
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->postUserProfileData(Lorg/json/JSONObject;Ljava/lang/String;)V

    goto :goto_c
.end method

.method postResposeToErrorBlock(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)V
    .registers 5
    .param p1, "exception"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
    .param p3, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;",
            "Landroid/os/Handler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 391
    .local p2, "errorBlock":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    if-eqz p2, :cond_c

    .line 392
    if-eqz p3, :cond_d

    .line 393
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$3;

    invoke-direct {v0, p0, p2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession$3;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    invoke-virtual {p3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 404
    :cond_c
    :goto_c
    return-void

    .line 400
    :cond_d
    invoke-interface {p2, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    goto :goto_c
.end method

.method public refreshEndpoint()V
    .registers 2

    .prologue
    .line 192
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->configureEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 193
    return-void
.end method

.method public setUpService()V
    .registers 10

    .prologue
    .line 198
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    .line 200
    .local v0, "adobeID":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->isCacheConfigured()Z

    move-result v1

    if-nez v1, :cond_2f

    if-eqz v0, :cond_2f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2f

    .line 202
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLRU:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    invoke-static {v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v6

    .line 203
    .local v6, "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    const/4 v8, 0x0

    .line 205
    .local v8, "error":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :try_start_1d
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v1

    const-string v2, "com.adobe.cc.entitlements"

    const/16 v3, 0x64

    const-wide/high16 v4, 0x41a0000000000000L

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->configureCache(Ljava/lang/String;IDLjava/util/EnumSet;)V
    :try_end_2a
    .catch Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException; {:try_start_1d .. :try_end_2a} :catch_36

    .line 209
    :goto_2a
    if-nez v8, :cond_39

    .line 210
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_cacheConfigured:Z

    .line 218
    .end local v6    # "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    .end local v8    # "error":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :cond_2f
    :goto_2f
    const-wide/32 v2, 0x2932e00

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->setupRefreshTimer(J)V

    .line 219
    return-void

    .line 206
    .restart local v6    # "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    .restart local v8    # "error":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :catch_36
    move-exception v7

    .line 207
    .local v7, "e":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    move-object v8, v7

    goto :goto_2a

    .line 214
    .end local v7    # "e":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :cond_39
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2f
.end method

.method public tearDownService()V
    .registers 4

    .prologue
    .line 223
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    const-string v1, "com.adobe.cc.entitlements"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->doesCacheExist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 225
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    const-string v1, "com.adobe.cc.entitlements"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->printStatistics(Ljava/lang/String;)V

    .line 227
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    const-string v1, "com.adobe.cc.entitlements"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeCache(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2e

    .line 229
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Removal of cache failed"

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    :cond_2e
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->_cacheConfigured:Z

    .line 235
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->stopRefreshTimer()V

    .line 236
    return-void
.end method
