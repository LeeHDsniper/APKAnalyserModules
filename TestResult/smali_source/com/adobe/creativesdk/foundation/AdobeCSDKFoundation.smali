.class public Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;
.super Ljava/lang/Object;
.source "AdobeCSDKFoundation.java"


# static fields
.field private static _appName:Ljava/lang/String;

.field private static _appVersion:Ljava/lang/String;

.field private static _clientID:Ljava/lang/String;

.field private static _clientSecret:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 37
    sput-object v0, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->_clientID:Ljava/lang/String;

    .line 38
    sput-object v0, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->_clientSecret:Ljava/lang/String;

    .line 39
    sput-object v0, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->_appName:Ljava/lang/String;

    .line 40
    sput-object v0, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->_appVersion:Ljava/lang/String;

    return-void
.end method

.method public static getApplicationName()Ljava/lang/String;
    .registers 1

    .prologue
    .line 106
    sget-object v0, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->_appName:Ljava/lang/String;

    return-object v0
.end method

.method public static getApplicationVersion()Ljava/lang/String;
    .registers 1

    .prologue
    .line 114
    sget-object v0, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->_appVersion:Ljava/lang/String;

    return-object v0
.end method

.method public static getVersion()Ljava/lang/String;
    .registers 1

    .prologue
    .line 45
    const-string v0, "0.6.6"

    return-object v0
.end method

.method public static initializeCSDKFoundation(Landroid/content/Context;)V
    .registers 6
    .param p0, "appContext"    # Landroid/content/Context;

    .prologue
    .line 58
    const/4 v0, 0x0

    .line 59
    .local v0, "creds":Lcom/adobe/creativesdk/foundation/auth/IAdobeAuthClientCredentials;
    instance-of v1, p0, Lcom/adobe/creativesdk/foundation/auth/IAdobeAuthClientCredentials;

    if-eqz v1, :cond_27

    move-object v0, p0

    .line 61
    check-cast v0, Lcom/adobe/creativesdk/foundation/auth/IAdobeAuthClientCredentials;

    .line 62
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/auth/IAdobeAuthClientCredentials;->getClientID()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->_clientID:Ljava/lang/String;

    .line 63
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/auth/IAdobeAuthClientCredentials;->getClientSecret()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->_clientSecret:Ljava/lang/String;

    .line 65
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->setApplicationContext(Landroid/content/Context;)V

    .line 67
    :try_start_1b
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedAuthManager()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->_clientID:Ljava/lang/String;

    sget-object v3, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->_clientSecret:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->setAuthenticationParameters(Ljava/lang/String;Ljava/lang/String;[B)V
    :try_end_27
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_1b .. :try_end_27} :catch_2c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1b .. :try_end_27} :catch_2a
    .catch Ljava/security/InvalidKeyException; {:try_start_1b .. :try_end_27} :catch_28

    .line 76
    :cond_27
    :goto_27
    return-void

    .line 72
    :catch_28
    move-exception v1

    goto :goto_27

    .line 70
    :catch_2a
    move-exception v1

    goto :goto_27

    .line 68
    :catch_2c
    move-exception v1

    goto :goto_27
.end method
