.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
.super Ljava/lang/Object;
.source "AdobeAuthIdentityManagementService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$17;
    }
.end annotation


# static fields
.field private static final IMS_CREATIVE_SDK_SCOPES:[Ljava/lang/String;

.field private static volatile sharedInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;


# instance fields
.field private accessToken:Ljava/lang/String;

.field private accessTokenExpirationTime:Ljava/util/Date;

.field private adobeID:Ljava/lang/String;

.field private final authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

.field private cipher:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

.field private cipherKey:[B

.field private clientID:Ljava/lang/String;

.field private clientScope:Ljava/lang/String;

.field private clientSecret:Ljava/lang/String;

.field private clientState:Ljava/lang/String;

.field private continuationToken:Ljava/lang/String;

.field private deviceID:Ljava/lang/String;

.field private deviceName:Ljava/lang/String;

.field private deviceToken:Ljava/lang/String;

.field private deviceTokenExpirationTime:Ljava/util/Date;

.field private displayName:Ljava/lang/String;

.field private emailAddress:Ljava/lang/String;

.field private emailVerified:Ljava/lang/String;

.field private entitlements:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private environment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

.field private firstName:Ljava/lang/String;

.field private grantType:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

.field private imsHost:Ljava/lang/String;

.field private isEnterPrise:Ljava/lang/String;

.field private lastName:Ljava/lang/String;

.field private networkService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

.field private password:[C

.field private refreshToken:Ljava/lang/String;

.field private refreshTokenExpirationTime:Ljava/util/Date;

.field private sharedDeviceToken:Ljava/lang/String;

.field private username:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 64
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->sharedInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    .line 2152
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "creative_sdk"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "AdobeID"

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->IMS_CREATIVE_SDK_SCOPES:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    .line 76
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->setSharedKeychain(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;)V

    .line 77
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIMSEnvironmentProductionUS:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setEnvironment(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;)V

    .line 78
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setAdditionalClientScopes([Ljava/lang/String;)V

    .line 81
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAuthAESKeyMgr;->getFoundationAuthAESKey()[B

    move-result-object v0

    .line 82
    .local v0, "app_AESKey":[B
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setCipherKey([B)V

    .line 84
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
    .param p3, "x3"    # Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    .prologue
    .line 62
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->profileFromServiceWithAccessToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lorg/json/JSONException;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .param p1, "x1"    # Lorg/json/JSONException;
    .param p2, "x2"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    .prologue
    .line 62
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->onJSONException(Lorg/json/JSONException;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->createAuthError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setDeviceTokenExpiration(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Ljava/util/Date;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .param p1, "x1"    # Ljava/util/Date;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setDeviceTokenExpirationTime(Ljava/util/Date;)V

    return-void
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Ljava/util/Date;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .param p1, "x1"    # Ljava/util/Date;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setRefreshTokenExpirationTime(Ljava/util/Date;)V

    return-void
.end method

.method private createAuthError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 436
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorOffline:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    if-ne v0, v1, :cond_10

    .line 437
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_OFFLINE:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    .line 438
    :goto_f
    return-object v0

    :cond_10
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_NETWORK_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    goto :goto_f
.end method

.method public static getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .registers 2

    .prologue
    .line 108
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->sharedInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    if-nez v0, :cond_13

    .line 109
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    monitor-enter v1

    .line 110
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->sharedInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    if-nez v0, :cond_12

    .line 111
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->sharedInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    .line 113
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 115
    :cond_13
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->sharedInstance:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    return-object v0

    .line 113
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method private makeHTTPOperationForURL(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/util/Map;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V
    .registers 11
    .param p1, "tokenURL"    # Ljava/net/URL;
    .param p2, "method"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    .param p4, "contentType"    # Ljava/lang/String;
    .param p5, "handler"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1761
    .local p3, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v2, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/util/Map;)V

    .line 1764
    .local v2, "urlRequest":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-ne p2, v3, :cond_1a

    invoke-interface {p3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1a

    .line 1765
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAdobeID()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->adobeID:Ljava/lang/String;

    .line 1766
    invoke-virtual {v2, p3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setQueryParams(Ljava/util/Map;)V

    .line 1769
    :cond_1a
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPOST:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-ne p2, v3, :cond_21

    .line 1770
    invoke-virtual {v2, p3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setBody(Ljava/util/Map;)V

    .line 1773
    :cond_21
    if-eqz p4, :cond_28

    .line 1774
    const-string v3, "Content-Type"

    invoke-virtual {v2, v3, p4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1779
    :cond_28
    :try_start_28
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2d} :catch_35

    .line 1784
    .local v0, "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_2d
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->networkService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    invoke-virtual {v3, v2, v4, p5, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 1786
    return-void

    .line 1780
    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :catch_35
    move-exception v1

    .line 1781
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_2d
.end method

.method private onJSONException(Lorg/json/JSONException;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V
    .registers 6
    .param p1, "e"    # Lorg/json/JSONException;
    .param p2, "callbackClient"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    .prologue
    .line 424
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error parsing JSON"

    invoke-static {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 425
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-interface {p2, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 426
    return-void
.end method

.method private profileFromServiceWithAccessToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 9
    .param p1, "accessToken"    # Ljava/lang/String;
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
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2026
    .local p2, "successBlock":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lorg/json/JSONObject;>;"
    .local p3, "errorBlock":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    move-result-object v1

    .line 2028
    .local v1, "entitlementSession":Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->refreshEndpoint()V

    .line 2032
    :try_start_7
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_c} :catch_1a

    .line 2039
    .local v2, "handler":Landroid/os/Handler;
    :goto_c
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$15;

    invoke-direct {v3, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$15;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$16;

    invoke-direct {v4, p0, p3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$16;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    invoke-virtual {v1, p1, v3, v4, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getUserProfileForToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 2088
    return-void

    .line 2033
    .end local v2    # "handler":Landroid/os/Handler;
    :catch_1a
    move-exception v0

    .line 2034
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    .restart local v2    # "handler":Landroid/os/Handler;
    goto :goto_c
.end method

.method private removeAnySharedSSOAcount()V
    .registers 3

    .prologue
    .line 780
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceID()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_7

    .line 785
    :goto_6
    return-void

    .line 783
    :cond_7
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 784
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->removeCurrentSharedAdobeIDFromAccountManager(Landroid/content/Context;)V

    goto :goto_6
.end method

.method private resetKeys()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1982
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->resetTokens()V

    .line 1984
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->adobeID:Ljava/lang/String;

    .line 1985
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessToken:Ljava/lang/String;

    .line 1986
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    .line 1987
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->sharedDeviceToken:Ljava/lang/String;

    .line 1988
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    .line 1989
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->continuationToken:Ljava/lang/String;

    .line 1990
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessTokenExpirationTime:Ljava/util/Date;

    .line 1991
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceTokenExpirationTime:Ljava/util/Date;

    .line 1992
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshTokenExpirationTime:Ljava/util/Date;

    .line 1993
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->displayName:Ljava/lang/String;

    .line 1994
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->firstName:Ljava/lang/String;

    .line 1995
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->lastName:Ljava/lang/String;

    .line 1996
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->entitlements:Ljava/util/Set;

    .line 1997
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->emailAddress:Ljava/lang/String;

    .line 1998
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->emailVerified:Ljava/lang/String;

    .line 1999
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->username:Ljava/lang/String;

    .line 2000
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->password:[C

    .line 2001
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->isEnterPrise:Ljava/lang/String;

    .line 2002
    return-void
.end method

.method private setAccessTokenExpirationTime(Ljava/util/Date;)V
    .registers 3
    .param p1, "accessTokenExpirationTime"    # Ljava/util/Date;

    .prologue
    .line 1224
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessTokenExpirationTime:Ljava/util/Date;

    .line 1225
    const-string v0, "AccessTokenExpiration"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1226
    return-void
.end method

.method private setDeviceTokenExpiration(Ljava/lang/String;)V
    .registers 6
    .param p1, "deviceToken"    # Ljava/lang/String;

    .prologue
    .line 1258
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1259
    .local v0, "calendar":Ljava/util/Calendar;
    const/16 v2, 0xd

    const v3, 0xf099c0

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->add(II)V

    .line 1260
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 1261
    .local v1, "defaultExpiry":Ljava/util/Date;
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setDeviceTokenExpirationTime(Ljava/util/Date;)V

    .line 1263
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$10;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$10;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;)V

    invoke-virtual {p0, p1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getTokenExpirationTime(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    .line 1307
    return-void
.end method

.method private setDeviceTokenExpirationTime(Ljava/util/Date;)V
    .registers 3
    .param p1, "deviceTokenExpirationTime"    # Ljava/util/Date;

    .prologue
    .line 1248
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceTokenExpirationTime:Ljava/util/Date;

    .line 1249
    const-string v0, "DeviceTokenExpiration"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1250
    return-void
.end method

.method private setRefreshTokenExpiration(Ljava/lang/String;)V
    .registers 5
    .param p1, "refreshToken"    # Ljava/lang/String;

    .prologue
    .line 1405
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1406
    .local v0, "cal":Ljava/util/Calendar;
    const/16 v1, 0xd

    const v2, 0x127500

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    .line 1407
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setRefreshTokenExpirationTime(Ljava/util/Date;)V

    .line 1409
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$12;

    invoke-direct {v1, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$12;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Ljava/util/Calendar;)V

    invoke-virtual {p0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getTokenExpirationTime(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    .line 1453
    return-void
.end method

.method private setRefreshTokenExpirationTime(Ljava/util/Date;)V
    .registers 3
    .param p1, "refreshTokenExpirationTime"    # Ljava/util/Date;

    .prologue
    .line 1385
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshTokenExpirationTime:Ljava/util/Date;

    .line 1386
    const-string v0, "RefreshTokenExpiration"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1387
    return-void
.end method


# virtual methods
.method addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1539
    if-eqz p1, :cond_a

    if-eqz p2, :cond_a

    .line 1540
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->updateOrAddKey(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1544
    :cond_9
    :goto_9
    return-void

    .line 1541
    :cond_a
    if-eqz p1, :cond_9

    .line 1542
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->deleteKey(Ljava/lang/String;)V

    goto :goto_9
.end method

.method fetchEntitlements()V
    .registers 2

    .prologue
    .line 1852
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->fetchEntitlements(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    .line 1853
    return-void
.end method

.method public fetchEntitlements(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V
    .registers 2
    .param p1, "client"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    .prologue
    .line 1929
    return-void
.end method

.method public getAccessToken()Ljava/lang/String;
    .registers 7

    .prologue
    .line 921
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessToken:Ljava/lang/String;

    if-nez v1, :cond_28

    .line 922
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAccessTokenExpiration()Ljava/util/Date;

    move-result-object v0

    .line 923
    .local v0, "expirationDate":Ljava/util/Date;
    if-eqz v0, :cond_28

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_28

    .line 924
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAccessToken()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessToken:Ljava/lang/String;

    .line 927
    .end local v0    # "expirationDate":Ljava/util/Date;
    :cond_28
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessToken:Ljava/lang/String;

    return-object v1
.end method

.method protected getAccessToken(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V
    .registers 8
    .param p1, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    .prologue
    .line 449
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceID()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_a

    .line 450
    invoke-interface {p1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onInvalidDeviceId()V

    .line 491
    :goto_9
    return-void

    .line 453
    :cond_a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_14

    .line 454
    invoke-interface {p1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onInvalidClientId()V

    goto :goto_9

    .line 458
    :cond_14
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientSecret()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1e

    .line 459
    invoke-interface {p1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onInvalidClientSecret()V

    goto :goto_9

    .line 463
    :cond_1e
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 465
    .local v3, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "grant_type"

    const-string v1, "device"

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 466
    const-string v0, "device_id"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceID()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    const-string v0, "client_id"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 468
    const-string v0, "client_secret"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientSecret()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    const-string v0, "redirect_uri"

    const-string v1, "signin://complete"

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    const-string v0, "scope"

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientScope:Ljava/lang/String;

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    const-string v1, "username"

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->username:Ljava/lang/String;

    if-nez v0, :cond_7c

    const-string v0, ""

    :goto_5b
    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    const-string v0, "password"

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->password:[C

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([C)V

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceURL()Ljava/net/URL;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPOST:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const-string v4, "application/x-www-form-urlencoded"

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$4;

    invoke-direct {v5, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->makeHTTPOperationForURL(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/util/Map;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    goto :goto_9

    .line 471
    :cond_7c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->username:Ljava/lang/String;

    goto :goto_5b
.end method

.method public getAccessTokenExpirationTime()Ljava/util/Date;
    .registers 5

    .prologue
    .line 1206
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessTokenExpirationTime:Ljava/util/Date;

    if-nez v1, :cond_c

    .line 1207
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAccessTokenExpiration()Ljava/util/Date;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessTokenExpirationTime:Ljava/util/Date;

    .line 1210
    :cond_c
    const/4 v0, 0x0

    .line 1211
    .local v0, "expirationData":Ljava/util/Date;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessTokenExpirationTime:Ljava/util/Date;

    if-eqz v1, :cond_1c

    .line 1212
    new-instance v0, Ljava/util/Date;

    .end local v0    # "expirationData":Ljava/util/Date;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessTokenExpirationTime:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 1214
    .restart local v0    # "expirationData":Ljava/util/Date;
    :cond_1c
    return-object v0
.end method

.method protected getAccessTokenWithAuthCode(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V
    .registers 9
    .param p1, "authCode"    # Ljava/lang/String;
    .param p2, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    .prologue
    .line 502
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_a

    .line 503
    invoke-interface {p2}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onInvalidClientId()V

    .line 544
    :goto_9
    return-void

    .line 507
    :cond_a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientSecret()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_14

    .line 509
    invoke-interface {p2}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onInvalidClientSecret()V

    goto :goto_9

    .line 514
    :cond_14
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 516
    .local v3, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "grant_type"

    const-string v1, "authorization_code"

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 517
    const-string v0, "code"

    invoke-interface {v3, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->grantType:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->AdobeAuthIMSGrantTypeDevice:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    if-ne v0, v1, :cond_34

    .line 520
    const-string v0, "device_id"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceID()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 523
    :cond_34
    const-string v0, "client_id"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 524
    const-string v0, "client_secret"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientSecret()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    const-string v0, "redirect_uri"

    const-string v1, "signin://complete"

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getTokenURL()Ljava/net/URL;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPOST:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const-string v4, "application/x-www-form-urlencoded"

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$5;

    invoke-direct {v5, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$5;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->makeHTTPOperationForURL(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/util/Map;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    goto :goto_9
.end method

.method public getAccessTokenWithDeviceToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V
    .registers 9
    .param p1, "deviceToken"    # Ljava/lang/String;
    .param p2, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    .prologue
    .line 554
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceID()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_a

    .line 555
    invoke-interface {p2}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onInvalidDeviceId()V

    .line 591
    :goto_9
    return-void

    .line 558
    :cond_a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_14

    .line 559
    invoke-interface {p2}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onInvalidClientId()V

    goto :goto_9

    .line 562
    :cond_14
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientSecret()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1e

    .line 563
    invoke-interface {p2}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onInvalidClientSecret()V

    goto :goto_9

    .line 567
    :cond_1e
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 568
    .local v3, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "grant_type"

    const-string v1, "device"

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    const-string v0, "device_token"

    invoke-interface {v3, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 570
    const-string v0, "device_id"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceID()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 571
    const-string v0, "client_id"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 572
    const-string v0, "client_secret"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientSecret()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    const-string v0, "redirect_uri"

    const-string v1, "signin://complete"

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 574
    const-string v0, "scope"

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientScope:Ljava/lang/String;

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 578
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getTokenURL()Ljava/net/URL;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPOST:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const-string v4, "application/x-www-form-urlencoded"

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$6;

    invoke-direct {v5, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$6;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->makeHTTPOperationForURL(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/util/Map;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    goto :goto_9
.end method

.method public getAdobeID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 901
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->adobeID:Ljava/lang/String;

    if-nez v0, :cond_c

    .line 902
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->adobeID:Ljava/lang/String;

    .line 904
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->adobeID:Ljava/lang/String;

    return-object v0
.end method

.method getAuthURL()Ljava/net/URL;
    .registers 7

    .prologue
    .line 1551
    const/4 v1, 0x0

    .line 1553
    .local v1, "url":Ljava/net/URL;
    :try_start_1
    new-instance v2, Ljava/net/URL;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->imsHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/authorize/v1"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_1b
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1b} :catch_1d

    .end local v1    # "url":Ljava/net/URL;
    .local v2, "url":Ljava/net/URL;
    move-object v1, v2

    .line 1557
    .end local v2    # "url":Ljava/net/URL;
    .restart local v1    # "url":Ljava/net/URL;
    :goto_1c
    return-object v1

    .line 1554
    :catch_1d
    move-exception v0

    .line 1555
    .local v0, "mue":Ljava/net/MalformedURLException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Invalid auth URL"

    invoke-static {v3, v4, v5, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1c
.end method

.method public getCipher()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;
    .registers 2

    .prologue
    .line 2006
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->cipher:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    return-object v0
.end method

.method public getClientID()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1143
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientID:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 1144
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    const-string v1, "ClientId"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientID:Ljava/lang/String;

    .line 1145
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientID:Ljava/lang/String;

    return-object v0
.end method

.method public getClientSecret()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1160
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientSecret:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 1161
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    const-string v1, "ClientSecret"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientSecret:Ljava/lang/String;

    .line 1162
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientSecret:Ljava/lang/String;

    return-object v0
.end method

.method public getClientState()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1174
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientState:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 1175
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    const-string v1, "ClientState"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientState:Ljava/lang/String;

    .line 1176
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientState:Ljava/lang/String;

    return-object v0
.end method

.method getCurrentLocale()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1603
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceID()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1190
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceID:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 1191
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    const-string v1, "DeviceId"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceID:Ljava/lang/String;

    .line 1192
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceID:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1126
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceName:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 1127
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    const-string v1, "DeviceName"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->findKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceName:Ljava/lang/String;

    .line 1128
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceName:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceToken()Ljava/lang/String;
    .registers 7

    .prologue
    .line 1046
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    if-nez v1, :cond_28

    .line 1047
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getDeviceTokenExpiration()Ljava/util/Date;

    move-result-object v0

    .line 1048
    .local v0, "expirationDate":Ljava/util/Date;
    if-eqz v0, :cond_28

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_28

    .line 1049
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getDeviceToken()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    .line 1052
    .end local v0    # "expirationDate":Ljava/util/Date;
    :cond_28
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    return-object v1
.end method

.method public getDeviceTokenExpirationTime()Ljava/util/Date;
    .registers 5

    .prologue
    .line 1232
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceTokenExpirationTime:Ljava/util/Date;

    if-nez v1, :cond_c

    .line 1233
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getDeviceTokenExpiration()Ljava/util/Date;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceTokenExpirationTime:Ljava/util/Date;

    .line 1235
    :cond_c
    const/4 v0, 0x0

    .line 1236
    .local v0, "expirationData":Ljava/util/Date;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceTokenExpirationTime:Ljava/util/Date;

    if-eqz v1, :cond_1c

    .line 1237
    new-instance v0, Ljava/util/Date;

    .end local v0    # "expirationData":Ljava/util/Date;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceTokenExpirationTime:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 1239
    .restart local v0    # "expirationData":Ljava/util/Date;
    :cond_1c
    return-object v0
.end method

.method getDeviceURL()Ljava/net/URL;
    .registers 7

    .prologue
    .line 1564
    const/4 v1, 0x0

    .line 1566
    .local v1, "url":Ljava/net/URL;
    :try_start_1
    new-instance v2, Ljava/net/URL;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->imsHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/login/v1/device"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_1b
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1b} :catch_1d

    .end local v1    # "url":Ljava/net/URL;
    .local v2, "url":Ljava/net/URL;
    move-object v1, v2

    .line 1570
    .end local v2    # "url":Ljava/net/URL;
    .restart local v1    # "url":Ljava/net/URL;
    :goto_1c
    return-object v1

    .line 1567
    :catch_1d
    move-exception v0

    .line 1568
    .local v0, "mue":Ljava/net/MalformedURLException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Invalid device url"

    invoke-static {v3, v4, v5, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1c
.end method

.method public getDisplayName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 942
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->displayName:Ljava/lang/String;

    if-nez v0, :cond_c

    .line 943
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->displayName:Ljava/lang/String;

    .line 945
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getEmailAddress()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1010
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->emailAddress:Ljava/lang/String;

    if-nez v0, :cond_c

    .line 1011
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getEmailAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->emailAddress:Ljava/lang/String;

    .line 1013
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->emailAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    .registers 2

    .prologue
    .line 1505
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->environment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    return-object v0
.end method

.method public getFirstName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 973
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->firstName:Ljava/lang/String;

    if-nez v0, :cond_c

    .line 974
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getFirstName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->firstName:Ljava/lang/String;

    .line 976
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->firstName:Ljava/lang/String;

    return-object v0
.end method

.method public getIsEnterPrise()Ljava/lang/String;
    .registers 2

    .prologue
    .line 957
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->isEnterPrise:Ljava/lang/String;

    if-nez v0, :cond_c

    .line 958
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getEnterpriseInfo()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->isEnterPrise:Ljava/lang/String;

    .line 960
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->isEnterPrise:Ljava/lang/String;

    return-object v0
.end method

.method getLastName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 991
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->lastName:Ljava/lang/String;

    if-nez v0, :cond_c

    .line 992
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getLastName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->lastName:Ljava/lang/String;

    .line 994
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->lastName:Ljava/lang/String;

    return-object v0
.end method

.method public getRefreshToken()Ljava/lang/String;
    .registers 7

    .prologue
    .line 1069
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    if-nez v1, :cond_28

    .line 1070
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getRefreshTokenExpiration()Ljava/util/Date;

    move-result-object v0

    .line 1071
    .local v0, "expirationDate":Ljava/util/Date;
    if-eqz v0, :cond_28

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_28

    .line 1072
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getRefreshToken()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    .line 1075
    .end local v0    # "expirationDate":Ljava/util/Date;
    :cond_28
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    return-object v1
.end method

.method public getRefreshTokenExpirationTime()Ljava/util/Date;
    .registers 5

    .prologue
    .line 1371
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshTokenExpirationTime:Ljava/util/Date;

    if-nez v1, :cond_c

    .line 1372
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getRefreshTokenExpiration()Ljava/util/Date;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshTokenExpirationTime:Ljava/util/Date;

    .line 1374
    :cond_c
    const/4 v0, 0x0

    .line 1375
    .local v0, "expirationData":Ljava/util/Date;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshTokenExpirationTime:Ljava/util/Date;

    if-eqz v1, :cond_1c

    .line 1376
    new-instance v0, Ljava/util/Date;

    .end local v0    # "expirationData":Ljava/util/Date;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshTokenExpirationTime:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 1378
    .restart local v0    # "expirationData":Ljava/util/Date;
    :cond_1c
    return-object v0
.end method

.method public getSignInURL()Ljava/net/URL;
    .registers 9

    .prologue
    .line 1626
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAuthURL()Ljava/net/URL;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1628
    .local v4, "urlStr":Ljava/lang/String;
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->grantType:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->AdobeAuthIMSGrantTypeAuthorization:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    if-ne v5, v6, :cond_7d

    .line 1629
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "?redirect_uri=signin%%3A%%2F%%2Fcomplete&scope="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientScope:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&idp_flow=login&client_id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&dc=false&locale="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getCurrentLocale()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1646
    :goto_43
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientState()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_77

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientState()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_77

    .line 1647
    const/4 v0, 0x0

    .line 1649
    .local v0, "clientState":Ljava/lang/String;
    :try_start_56
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientState()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_5f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_56 .. :try_end_5f} :catch_ef

    move-result-object v0

    .line 1654
    :goto_60
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&state="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1657
    .end local v0    # "clientState":Ljava/lang/String;
    :cond_77
    :try_start_77
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_7c
    .catch Ljava/net/MalformedURLException; {:try_start_77 .. :try_end_7c} :catch_ff

    .line 1660
    :goto_7c
    return-object v5

    .line 1634
    :cond_7d
    :try_start_7d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceID()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1635
    .local v1, "deviceId":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_90
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_7d .. :try_end_90} :catch_dc

    move-result-object v2

    .line 1643
    .local v2, "deviceName":Ljava/lang/String;
    :goto_91
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "?redirect_uri=signin%%3A%%2F%%2Fcomplete&scope="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientScope:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&idp_flow=login&response_type=device&device_id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&device_name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&client_id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&dc=false&locale="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getCurrentLocale()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_43

    .line 1636
    .end local v1    # "deviceId":Ljava/lang/String;
    .end local v2    # "deviceName":Ljava/lang/String;
    :catch_dc
    move-exception v3

    .line 1638
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Error during encode"

    invoke-static {v5, v6, v7, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1639
    const-string v1, ""

    .line 1640
    .restart local v1    # "deviceId":Ljava/lang/String;
    const-string v2, ""

    .restart local v2    # "deviceName":Ljava/lang/String;
    goto :goto_91

    .line 1650
    .end local v1    # "deviceId":Ljava/lang/String;
    .end local v2    # "deviceName":Ljava/lang/String;
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "clientState":Ljava/lang/String;
    :catch_ef
    move-exception v3

    .line 1651
    .restart local v3    # "e":Ljava/io/UnsupportedEncodingException;
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Error during encode process"

    invoke-static {v5, v6, v7, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_60

    .line 1658
    .end local v0    # "clientState":Ljava/lang/String;
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_ff
    move-exception v3

    .line 1659
    .local v3, "e":Ljava/net/MalformedURLException;
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Sign in url is malformed"

    invoke-static {v5, v6, v7, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1660
    const/4 v5, 0x0

    goto/16 :goto_7c
.end method

.method getSignOutURL()Ljava/net/URL;
    .registers 6

    .prologue
    .line 1610
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->imsHost:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/logout/v1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1612
    .local v1, "urlStr":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "access_token"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessToken:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "client_id"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "client_secret"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientSecret()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1615
    :try_start_6e
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_73
    .catch Ljava/net/MalformedURLException; {:try_start_6e .. :try_end_73} :catch_74

    .line 1618
    :goto_73
    return-object v2

    .line 1616
    :catch_74
    move-exception v0

    .line 1617
    .local v0, "e":Ljava/net/MalformedURLException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Malformed exception"

    invoke-static {v2, v3, v4, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1618
    const/4 v2, 0x0

    goto :goto_73
.end method

.method public getSignUpURL()Ljava/net/URL;
    .registers 9

    .prologue
    .line 1668
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAuthURL()Ljava/net/URL;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1670
    .local v4, "urlStr":Ljava/lang/String;
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->grantType:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->AdobeAuthIMSGrantTypeAuthorization:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    if-ne v5, v6, :cond_7d

    .line 1671
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "?redirect_uri=signin%%3A%%2F%%2Fcomplete&scope="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientScope:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&idp_flow=create_account&client_id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&locale="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getCurrentLocale()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1686
    :goto_43
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientState()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_77

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientState()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_77

    .line 1687
    const/4 v0, 0x0

    .line 1689
    .local v0, "clientState":Ljava/lang/String;
    :try_start_56
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientState()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_5f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_56 .. :try_end_5f} :catch_ed

    move-result-object v0

    .line 1694
    :goto_60
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&state="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1698
    .end local v0    # "clientState":Ljava/lang/String;
    :cond_77
    :try_start_77
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_7c
    .catch Ljava/net/MalformedURLException; {:try_start_77 .. :try_end_7c} :catch_fd

    .line 1701
    :goto_7c
    return-object v5

    .line 1676
    :cond_7d
    :try_start_7d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceID()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1677
    .local v1, "deviceID":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-static {v5, v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_90
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_7d .. :try_end_90} :catch_dc

    move-result-object v2

    .line 1683
    .local v2, "deviceName":Ljava/lang/String;
    :goto_91
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "?redirect_uri=signin%%3A%%2F%%2Fcomplete&scope="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientScope:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&idp_flow=create_account&response_type=device&device_id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&device_name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&client_id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&locale="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getCurrentLocale()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_43

    .line 1678
    .end local v1    # "deviceID":Ljava/lang/String;
    .end local v2    # "deviceName":Ljava/lang/String;
    :catch_dc
    move-exception v3

    .line 1679
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    const/4 v1, 0x0

    .line 1680
    .restart local v1    # "deviceID":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1681
    .restart local v2    # "deviceName":Ljava/lang/String;
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Error during encode process"

    invoke-static {v5, v6, v7, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_91

    .line 1690
    .end local v1    # "deviceID":Ljava/lang/String;
    .end local v2    # "deviceName":Ljava/lang/String;
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "clientState":Ljava/lang/String;
    :catch_ed
    move-exception v3

    .line 1691
    .restart local v3    # "e":Ljava/io/UnsupportedEncodingException;
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Error during encode process"

    invoke-static {v5, v6, v7, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_60

    .line 1699
    .end local v0    # "clientState":Ljava/lang/String;
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_fd
    move-exception v3

    .line 1700
    .local v3, "e":Ljava/net/MalformedURLException;
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Malformed url"

    invoke-static {v5, v6, v7, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1701
    const/4 v5, 0x0

    goto/16 :goto_7c
.end method

.method public getTokenExpirationTime(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V
    .registers 9
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "client"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;

    .prologue
    .line 1463
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientSecret()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_17

    .line 1464
    :cond_c
    new-instance v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorBadRequest:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    invoke-interface {p2, v0}, Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    .line 1489
    :goto_16
    return-void

    .line 1468
    :cond_17
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1469
    .local v3, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "token"

    invoke-interface {v3, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1470
    const-string v0, "client_id"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1472
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getValidateTokenURL()Ljava/net/URL;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const-string v4, "application/x-www-form-urlencoded"

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$13;

    invoke-direct {v5, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$13;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->makeHTTPOperationForURL(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/util/Map;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    goto :goto_16
.end method

.method getTokenURL()Ljava/net/URL;
    .registers 7

    .prologue
    .line 1577
    const/4 v1, 0x0

    .line 1579
    .local v1, "url":Ljava/net/URL;
    :try_start_1
    new-instance v2, Ljava/net/URL;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->imsHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/token/v1"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_1b
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1b} :catch_1d

    .end local v1    # "url":Ljava/net/URL;
    .local v2, "url":Ljava/net/URL;
    move-object v1, v2

    .line 1583
    .end local v2    # "url":Ljava/net/URL;
    .restart local v1    # "url":Ljava/net/URL;
    :goto_1c
    return-object v1

    .line 1580
    :catch_1d
    move-exception v0

    .line 1581
    .local v0, "mue":Ljava/net/MalformedURLException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Invalid token url"

    invoke-static {v3, v4, v5, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1c
.end method

.method getValidateTokenURL()Ljava/net/URL;
    .registers 7

    .prologue
    .line 1590
    const/4 v1, 0x0

    .line 1592
    .local v1, "url":Ljava/net/URL;
    :try_start_1
    new-instance v2, Ljava/net/URL;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->imsHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/validate_token/v1"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_1b
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1b} :catch_1d

    .end local v1    # "url":Ljava/net/URL;
    .local v2, "url":Ljava/net/URL;
    move-object v1, v2

    .line 1596
    .end local v2    # "url":Ljava/net/URL;
    .restart local v1    # "url":Ljava/net/URL;
    :goto_1c
    return-object v1

    .line 1593
    :catch_1d
    move-exception v0

    .line 1594
    .local v0, "mue":Ljava/net/MalformedURLException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Invalid validate token url"

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c
.end method

.method protected parseFromProfile(Lorg/json/JSONObject;)V
    .registers 2
    .param p1, "profileData"    # Lorg/json/JSONObject;

    .prologue
    .line 1789
    return-void
.end method

.method protected parseResponse(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;Z)V
    .registers 11
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;
    .param p2, "fromDeviceToken"    # Z

    .prologue
    .line 1811
    const-string v3, "userId"

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setAdobeID(Ljava/lang/String;)V

    .line 1812
    const-string v3, "access_token"

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setAccessToken(Ljava/lang/String;)V

    .line 1814
    const-string v3, "device_token"

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 1815
    const-string v3, "device_token"

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setDeviceToken(Ljava/lang/String;)V

    .line 1816
    const-string v3, "device_token"

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setDeviceTokenExpiration(Ljava/lang/String;)V

    .line 1819
    :cond_2c
    const-string v3, "refresh_token"

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_48

    if-nez p2, :cond_48

    .line 1820
    const-string v3, "refresh_token"

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setRefreshToken(Ljava/lang/String;)V

    .line 1821
    const-string v3, "refresh_token"

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setRefreshTokenExpiration(Ljava/lang/String;)V

    .line 1824
    :cond_48
    const-string v3, "continuation_token"

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setContinuationToken(Ljava/lang/String;)V

    .line 1831
    const-string v3, "expires_in"

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1833
    .local v1, "expirationTimeStr":Ljava/lang/String;
    if-eqz v1, :cond_7c

    .line 1834
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 1835
    .local v2, "time":Ljava/lang/Long;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1838
    .local v0, "calendar":Ljava/util/Calendar;
    const/16 v3, 0xd

    invoke-virtual {v2}, Ljava/lang/Long;->intValue()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Ljava/util/Calendar;->add(II)V

    .line 1839
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setAccessTokenExpirationTime(Ljava/util/Date;)V

    .line 1845
    .end local v0    # "calendar":Ljava/util/Calendar;
    .end local v2    # "time":Ljava/lang/Long;
    :goto_78
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->fetchEntitlements()V

    .line 1846
    return-void

    .line 1841
    :cond_7c
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setAccessTokenExpirationTime(Ljava/util/Date;)V

    goto :goto_78
.end method

.method refreshAccessToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V
    .registers 9
    .param p1, "refreshToken"    # Ljava/lang/String;
    .param p2, "client"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    .prologue
    .line 1714
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_a

    .line 1715
    invoke-interface {p2}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onInvalidClientId()V

    .line 1748
    :goto_9
    return-void

    .line 1718
    :cond_a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientSecret()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_14

    .line 1719
    invoke-interface {p2}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onInvalidClientSecret()V

    goto :goto_9

    .line 1723
    :cond_14
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1724
    .local v3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "grant_type"

    const-string v1, "refresh_token"

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1725
    const-string v0, "refresh_token"

    invoke-virtual {v3, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1726
    const-string v0, "client_id"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1727
    const-string v0, "client_secret"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientSecret()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1729
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getTokenURL()Ljava/net/URL;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPOST:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const-string v4, "application/x-www-form-urlencoded"

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$14;

    invoke-direct {v5, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$14;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->makeHTTPOperationForURL(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/util/Map;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    goto :goto_9
.end method

.method setAccessToken(Ljava/lang/String;)V
    .registers 3
    .param p1, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 934
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->accessToken:Ljava/lang/String;

    .line 935
    const-string v0, "AccessToken"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 936
    return-void
.end method

.method public setAdditionalClientScopes([Ljava/lang/String;)V
    .registers 10
    .param p1, "clientScopeList"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 877
    new-instance v2, Ljava/util/LinkedHashSet;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->IMS_CREATIVE_SDK_SCOPES:[Ljava/lang/String;

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 879
    .local v2, "scopes":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    if-eqz p1, :cond_28

    .line 880
    array-length v5, p1

    move v3, v4

    :goto_10
    if-ge v3, v5, :cond_28

    aget-object v1, p1, v3

    .line 882
    .local v1, "scope":Ljava/lang/String;
    const-string v6, "\\s"

    const-string v7, ""

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 883
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_25

    .line 884
    invoke-virtual {v2, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 880
    :cond_25
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    .line 888
    .end local v1    # "scope":Ljava/lang/String;
    :cond_28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 889
    .local v0, "buff":Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_31
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_47

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 890
    .restart local v1    # "scope":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_31

    .line 893
    .end local v1    # "scope":Ljava/lang/String;
    :cond_47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v4, v3}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientScope:Ljava/lang/String;

    .line 895
    return-void
.end method

.method setAdobeID(Ljava/lang/String;)V
    .registers 4
    .param p1, "adobeID"    # Ljava/lang/String;

    .prologue
    .line 913
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->adobeID:Ljava/lang/String;

    .line 914
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    const-string v1, "AdobeID"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->updateOrAddKey(Ljava/lang/String;Ljava/lang/Object;)V

    .line 915
    return-void
.end method

.method public setAuthenticationParameters(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "clientID"    # Ljava/lang/String;
    .param p2, "clientSecret"    # Ljava/lang/String;
    .param p3, "clientState"    # Ljava/lang/String;
    .param p4, "deviceID"    # Ljava/lang/String;
    .param p5, "deviceName"    # Ljava/lang/String;

    .prologue
    .line 133
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setClientID(Ljava/lang/String;)V

    .line 134
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setClientSecret(Ljava/lang/String;)V

    .line 135
    invoke-virtual {p0, p3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setClientState(Ljava/lang/String;)V

    .line 136
    invoke-virtual {p0, p4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setDeviceID(Ljava/lang/String;)V

    .line 137
    invoke-virtual {p0, p5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setDeviceName(Ljava/lang/String;)V

    .line 138
    return-void
.end method

.method public setCipherKey([B)V
    .registers 6
    .param p1, "encryptionKey"    # [B

    .prologue
    const/4 v3, 0x0

    .line 2010
    if-nez p1, :cond_4

    .line 2020
    :goto_3
    return-void

    .line 2012
    :cond_4
    array-length v1, p1

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->cipherKey:[B

    .line 2013
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->cipherKey:[B

    array-length v2, p1

    invoke-static {p1, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2015
    :try_start_f
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->cipherKey:[B

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;->createInstance([B)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->cipher:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCommonCipher;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_17} :catch_18

    goto :goto_3

    .line 2017
    :catch_18
    move-exception v0

    .line 2018
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "CSDK Foundation Auth : Cannot create Cipher Instance !"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method setClientID(Ljava/lang/String;)V
    .registers 3
    .param p1, "clientID"    # Ljava/lang/String;

    .prologue
    .line 1152
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientID:Ljava/lang/String;

    .line 1153
    const-string v0, "ClientId"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1154
    return-void
.end method

.method setClientSecret(Ljava/lang/String;)V
    .registers 3
    .param p1, "clientSecret"    # Ljava/lang/String;

    .prologue
    .line 1169
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientSecret:Ljava/lang/String;

    .line 1170
    const-string v0, "ClientSecret"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1171
    return-void
.end method

.method public setClientState(Ljava/lang/String;)V
    .registers 3
    .param p1, "clientState"    # Ljava/lang/String;

    .prologue
    .line 1180
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->clientState:Ljava/lang/String;

    .line 1181
    const-string v0, "ClientState"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1182
    return-void
.end method

.method setContinuationToken(Ljava/lang/String;)V
    .registers 3
    .param p1, "continuationToken"    # Ljava/lang/String;

    .prologue
    .line 1102
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->continuationToken:Ljava/lang/String;

    .line 1103
    const-string v0, "ContinuationToken"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1104
    return-void
.end method

.method protected setDeviceID(Ljava/lang/String;)V
    .registers 3
    .param p1, "deviceID"    # Ljava/lang/String;

    .prologue
    .line 1201
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceID:Ljava/lang/String;

    .line 1202
    const-string v0, "DeviceId"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1203
    return-void
.end method

.method setDeviceName(Ljava/lang/String;)V
    .registers 3
    .param p1, "deviceName"    # Ljava/lang/String;

    .prologue
    .line 1135
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceName:Ljava/lang/String;

    .line 1136
    const-string v0, "DeviceName"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1137
    return-void
.end method

.method setDeviceToken(Ljava/lang/String;)V
    .registers 3
    .param p1, "deviceToken"    # Ljava/lang/String;

    .prologue
    .line 1061
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    .line 1062
    const-string v0, "DeviceToken"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1063
    return-void
.end method

.method setDisplayName(Ljava/lang/String;)V
    .registers 3
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 952
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->displayName:Ljava/lang/String;

    .line 953
    const-string v0, "DisplayName"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 954
    return-void
.end method

.method setEmailAddress(Ljava/lang/String;)V
    .registers 3
    .param p1, "emailAddress"    # Ljava/lang/String;

    .prologue
    .line 1020
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->emailAddress:Ljava/lang/String;

    .line 1021
    const-string v0, "Email"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1022
    return-void
.end method

.method setEmailVerified(Ljava/lang/String;)V
    .registers 3
    .param p1, "emailVerified"    # Ljava/lang/String;

    .prologue
    .line 1038
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->emailVerified:Ljava/lang/String;

    .line 1039
    const-string v0, "EmailVerified"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1040
    return-void
.end method

.method public setEnvironment(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;)V
    .registers 6
    .param p1, "environment"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    .prologue
    .line 840
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$17;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_34

    .line 859
    const-string v1, "https://ims-na1.adobelogin.com/ims"

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->imsHost:Ljava/lang/String;

    .line 864
    :goto_f
    const-string v0, "Adobe Creative SDK"

    .line 865
    .local v0, "applicationName":Ljava/lang/String;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->imsHost:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->networkService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 867
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->environment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    .line 868
    return-void

    .line 843
    .end local v0    # "applicationName":Ljava/lang/String;
    :pswitch_1e
    const-string v1, "https://ims-na1-stg1.adobelogin.com/ims"

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->imsHost:Ljava/lang/String;

    goto :goto_f

    .line 847
    :pswitch_23
    const-string v1, "https://ims-na1-qa1.adobelogin.com/ims"

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->imsHost:Ljava/lang/String;

    goto :goto_f

    .line 851
    :pswitch_28
    const-string v1, "https://ims-na1-qa2.adobelogin.com/ims"

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->imsHost:Ljava/lang/String;

    goto :goto_f

    .line 855
    :pswitch_2d
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeInvalidIMSHostException;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeInvalidIMSHostException;-><init>()V

    throw v1

    .line 840
    nop

    :pswitch_data_34
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_23
        :pswitch_28
        :pswitch_2d
    .end packed-switch
.end method

.method setFirstName(Ljava/lang/String;)V
    .registers 3
    .param p1, "firstName"    # Ljava/lang/String;

    .prologue
    .line 983
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->firstName:Ljava/lang/String;

    .line 984
    const-string v0, "FirstName"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 985
    return-void
.end method

.method public setGrantType(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;)V
    .registers 2
    .param p1, "grantType"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->grantType:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    .line 148
    return-void
.end method

.method public setIsEnterPrise(Ljava/lang/String;)V
    .registers 3
    .param p1, "isEnterPrise"    # Ljava/lang/String;

    .prologue
    .line 965
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->isEnterPrise:Ljava/lang/String;

    .line 966
    const-string v0, "EnterpriseInfo"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 968
    return-void
.end method

.method setLastName(Ljava/lang/String;)V
    .registers 3
    .param p1, "lastName"    # Ljava/lang/String;

    .prologue
    .line 1002
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->lastName:Ljava/lang/String;

    .line 1003
    const-string v0, "LastName"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1004
    return-void
.end method

.method setRefreshToken(Ljava/lang/String;)V
    .registers 3
    .param p1, "refreshToken"    # Ljava/lang/String;

    .prologue
    .line 1084
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    .line 1085
    const-string v0, "RefreshToken"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->addToKeychain(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1086
    return-void
.end method

.method public signIn(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V
    .registers 4
    .param p1, "callbackClient"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    .prologue
    const/4 v1, 0x0

    .line 158
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceToken()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    .line 159
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getRefreshToken()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    .line 161
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceID()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    if-eqz v0, :cond_21

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_21

    .line 162
    :cond_1f
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    .line 166
    :cond_21
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getRefreshToken()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_33

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    if-eqz v0, :cond_35

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 167
    :cond_33
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    .line 170
    :cond_35
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->username:Ljava/lang/String;

    if-eqz v0, :cond_43

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->username:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_43

    .line 171
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->username:Ljava/lang/String;

    .line 174
    :cond_43
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->password:[C

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->password:[C

    array-length v0, v0

    if-nez v0, :cond_4e

    .line 175
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->password:[C

    .line 178
    :cond_4e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    if-eqz v0, :cond_5d

    .line 179
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshToken:Ljava/lang/String;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->refreshAccessToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V

    .line 414
    :goto_5c
    return-void

    .line 258
    :cond_5d
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    if-eqz v0, :cond_6c

    .line 259
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->deviceToken:Ljava/lang/String;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$2;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessTokenWithDeviceToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V

    goto :goto_5c

    .line 341
    :cond_6c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->username:Ljava/lang/String;

    if-eqz v0, :cond_74

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->password:[C

    if-nez v0, :cond_7a

    .line 342
    :cond_74
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;->AdobeAuthIMSInfoNeededUsernameAndPassword:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    invoke-interface {p1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onInfoNeeded(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;)V

    goto :goto_5c

    .line 345
    :cond_7a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->authKeychain:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->resetTokens()V

    .line 347
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$3;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V

    goto :goto_5c
.end method

.method public signInWithAuthCode(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V
    .registers 4
    .param p1, "authCode"    # Ljava/lang/String;
    .param p2, "client"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    .prologue
    .line 601
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;

    invoke-direct {v0, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessTokenWithAuthCode(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V

    .line 678
    return-void
.end method

.method public signInWithDeviceToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V
    .registers 4
    .param p1, "deviceToken"    # Ljava/lang/String;
    .param p2, "client"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    .prologue
    .line 688
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setDeviceTokenExpiration(Ljava/lang/String;)V

    .line 689
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;

    invoke-direct {v0, p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessTokenWithDeviceToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V

    .line 751
    return-void
.end method

.method public signOut(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;)V
    .registers 8
    .param p1, "signoutClient"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;

    .prologue
    .line 794
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 795
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 798
    .local v3, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$9;

    invoke-direct {v5, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$9;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;)V

    .line 817
    .local v5, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSignOutURL()Ljava/net/URL;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const/4 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->makeHTTPOperationForURL(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/util/Map;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    .line 819
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->resetKeys()V

    .line 820
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->removeAnySharedSSOAcount()V

    .line 831
    .end local v3    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    :goto_21
    return-void

    .line 826
    :cond_22
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->resetKeys()V

    .line 827
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->removeAnySharedSSOAcount()V

    .line 828
    invoke-interface {p1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;->onSuccess()V

    goto :goto_21
.end method
