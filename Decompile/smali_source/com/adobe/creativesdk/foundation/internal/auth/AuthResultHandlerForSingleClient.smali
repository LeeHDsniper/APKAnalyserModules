.class Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForSingleClient;
.super Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
.source "AdobeAuthSignInActivity.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 247
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleAuthCodeReceived(Ljava/lang/String;)V
    .registers 4
    .param p1, "authCode"    # Ljava/lang/String;

    .prologue
    .line 257
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    .line 258
    .local v0, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForSingleClient;->createImsClientCommon()Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->signInWithAuthCode(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    .line 259
    return-void
.end method

.method public handleDeviceTokenReceived(Ljava/lang/String;)V
    .registers 4
    .param p1, "deviceToken"    # Ljava/lang/String;

    .prologue
    .line 264
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    .line 265
    .local v0, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForSingleClient;->createImsClientCommon()Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->signInWithDeviceToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    .line 266
    return-void
.end method

.method protected performProcessQueuedResult(Ljava/lang/Object;)V
    .registers 2
    .param p1, "queuedResultData"    # Ljava/lang/Object;

    .prologue
    .line 252
    return-void
.end method
