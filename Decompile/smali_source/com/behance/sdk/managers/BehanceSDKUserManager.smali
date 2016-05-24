.class public Lcom/behance/sdk/managers/BehanceSDKUserManager;
.super Ljava/lang/Object;
.source "BehanceSDKUserManager.java"


# static fields
.field private static instance:Lcom/behance/sdk/managers/BehanceSDKUserManager;

.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-class v0, Lcom/behance/sdk/managers/BehanceSDKUserManager;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/managers/BehanceSDKUserManager;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .registers 1

    .prologue
    .line 41
    sget-object v0, Lcom/behance/sdk/managers/BehanceSDKUserManager;->instance:Lcom/behance/sdk/managers/BehanceSDKUserManager;

    if-nez v0, :cond_b

    .line 42
    new-instance v0, Lcom/behance/sdk/managers/BehanceSDKUserManager;

    invoke-direct {v0}, Lcom/behance/sdk/managers/BehanceSDKUserManager;-><init>()V

    sput-object v0, Lcom/behance/sdk/managers/BehanceSDKUserManager;->instance:Lcom/behance/sdk/managers/BehanceSDKUserManager;

    .line 44
    :cond_b
    sget-object v0, Lcom/behance/sdk/managers/BehanceSDKUserManager;->instance:Lcom/behance/sdk/managers/BehanceSDKUserManager;

    return-object v0
.end method


# virtual methods
.method public checkExpiryAndGetAccessToken()Ljava/lang/String;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 81
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v0

    .line 82
    .local v0, "authManager":Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v3

    .line 83
    .local v3, "identityManagementService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->hasValidAccessToken()Z

    move-result v5

    if-nez v5, :cond_4a

    .line 85
    :try_start_f
    sget-object v5, Lcom/behance/sdk/managers/BehanceSDKUserManager;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v6, "Access token expired. Trying to get new access token."

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-interface {v5, v6, v7}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 86
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->reAuthenticate()Z

    move-result v4

    .line 88
    .local v4, "reAuthenticateStatus":Z
    sget-object v5, Lcom/behance/sdk/managers/BehanceSDKUserManager;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v6, "Refreshed Access token status [%s]."

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-interface {v5, v6, v7}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    if-nez v4, :cond_4a

    .line 90
    new-instance v2, Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;

    const-string v5, "Problem refreshing access token"

    invoke-direct {v2, v5}, Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;-><init>(Ljava/lang/String;)V

    .line 91
    .local v2, "exception":Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;
    throw v2
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_38} :catch_38

    .line 93
    .end local v2    # "exception":Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;
    .end local v4    # "reAuthenticateStatus":Z
    :catch_38
    move-exception v1

    .line 95
    .local v1, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/behance/sdk/managers/BehanceSDKUserManager;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v6, "Device token expired."

    new-array v7, v10, [Ljava/lang/Object;

    invoke-interface {v5, v6, v7}, Lcom/behance/sdk/logger/ILogger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 96
    new-instance v2, Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;

    const-string v5, "Problem refreshing access token"

    invoke-direct {v2, v5}, Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;-><init>(Ljava/lang/String;)V

    .line 97
    .restart local v2    # "exception":Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;
    throw v2

    .line 100
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "exception":Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;
    :cond_4a
    sget-object v5, Lcom/behance/sdk/managers/BehanceSDKUserManager;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v6, "Access token is valid. Using the existing one."

    new-array v7, v10, [Ljava/lang/Object;

    invoke-interface {v5, v6, v7}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public isUserAnEnterpriseUser()Z
    .registers 4

    .prologue
    .line 61
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v0

    .line 62
    .local v0, "authManager":Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v1

    .line 63
    .local v1, "userProfile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    if-eqz v1, :cond_f

    .line 64
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->isEnterpriseUser()Z

    move-result v2

    .line 66
    :goto_e
    return v2

    :cond_f
    const/4 v2, 0x0

    goto :goto_e
.end method

.method public isUserAuthenticatedWithAdobe()Z
    .registers 3

    .prologue
    .line 51
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v0

    .line 52
    .local v0, "authManager":Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->isAuthenticated()Z

    move-result v1

    return v1
.end method

.method public isUserEntitledToUseBehance()Z
    .registers 4

    .prologue
    .line 56
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v0

    .line 57
    .local v0, "entitlementServices":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;
    const-string v1, "behance"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->isEntitledToService(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v1

    return v1
.end method
