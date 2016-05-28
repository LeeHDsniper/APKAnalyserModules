.class Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;
.super Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForSingleClient;
.source "AdobeAuthSignInActivity.java"


# instance fields
.field private _forceReInitiateSignInDueToDeviceTokenImsFailure:Z

.field private _gotDeviceTokenFromSharedAccount:Z

.field private _ssoData:Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 286
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForSingleClient;-><init>()V

    .line 284
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_forceReInitiateSignInDueToDeviceTokenImsFailure:Z

    .line 287
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_gotDeviceTokenFromSharedAccount:Z

    .line 288
    return-void
.end method

.method private performCommonTokenHandling(Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;)V
    .registers 3
    .param p1, "ssoQueuedData"    # Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;

    .prologue
    .line 292
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;->tokenDetails:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    if-eqz v0, :cond_10

    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_forceReInitiateSignInDueToDeviceTokenImsFailure:Z

    if-nez v0, :cond_10

    .line 293
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;->tokenDetails:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceToken:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->handleDeviceTokenReceived(Ljava/lang/String;)V

    .line 297
    :goto_f
    return-void

    .line 295
    :cond_10
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->mAuthActivity:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->noSharedAccountContinueNormalSignIn()V

    goto :goto_f
.end method


# virtual methods
.method protected handleImsAccountResult(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "adobeId"    # Ljava/lang/String;
    .param p2, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 333
    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_gotDeviceTokenFromSharedAccount:Z

    if-nez v2, :cond_22

    .line 335
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    .line 336
    .local v0, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;-><init>()V

    .line 337
    .local v1, "tokenDetails":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEmailAddress()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->adobeId:Ljava/lang/String;

    .line 338
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceToken()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceToken:Ljava/lang/String;

    .line 339
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceTokenExpirationTime()Ljava/util/Date;

    move-result-object v2

    iput-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceExpirationTime:Ljava/util/Date;

    .line 341
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->addNewAccountToAccountManager(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;)V

    .line 343
    .end local v0    # "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .end local v1    # "tokenDetails":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;
    :cond_22
    return-void
.end method

.method protected handleResultFromIMS(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 5
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 301
    const/4 v0, 0x0

    .line 302
    .local v0, "shouldRetryNormalSignIn":Z
    if-eqz p1, :cond_29

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_ssoData:Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;

    if-eqz v1, :cond_29

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_ssoData:Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;->tokenDetails:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    if-eqz v1, :cond_29

    .line 304
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;->getErrorCode()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_OFFLINE:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-eq v1, v2, :cond_29

    .line 306
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->mAuthActivity:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    if-nez v1, :cond_28

    .line 307
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->isLastActivityClosedDuetoManualClose()Z

    move-result v1

    if-nez v1, :cond_29

    .line 309
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_forceReInitiateSignInDueToDeviceTokenImsFailure:Z

    .line 310
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_ssoData:Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->setQueuedResultData(Ljava/lang/Object;)V

    .line 327
    :goto_27
    return-void

    .line 315
    :cond_28
    const/4 v0, 0x1

    .line 321
    :cond_29
    if-eqz v0, :cond_34

    .line 322
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_gotDeviceTokenFromSharedAccount:Z

    .line 323
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->mAuthActivity:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->noSharedAccountContinueNormalSignIn()V

    goto :goto_27

    .line 326
    :cond_34
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForSingleClient;->handleResultFromIMS(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    goto :goto_27
.end method

.method public handleSharedTokenRequestResult(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;)V
    .registers 4
    .param p1, "tokenDetails"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    .prologue
    .line 347
    if-eqz p1, :cond_9

    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceToken:Ljava/lang/String;

    if-eqz v1, :cond_9

    .line 348
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_gotDeviceTokenFromSharedAccount:Z

    .line 351
    :cond_9
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;-><init>()V

    .line 352
    .local v0, "queuedData":Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;
    iput-object p1, v0, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;->tokenDetails:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    .line 353
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->_ssoData:Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;

    .line 355
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->mAuthActivity:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    if-nez v1, :cond_1a

    .line 357
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->setQueuedResultData(Ljava/lang/Object;)V

    .line 361
    :goto_19
    return-void

    .line 360
    :cond_1a
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->performCommonTokenHandling(Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;)V

    goto :goto_19
.end method

.method protected performProcessQueuedResult(Ljava/lang/Object;)V
    .registers 3
    .param p1, "queuedResultData"    # Ljava/lang/Object;

    .prologue
    .line 365
    move-object v0, p1

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;

    .line 366
    .local v0, "ssoQueuedData":Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->performCommonTokenHandling(Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;)V

    .line 367
    return-void
.end method

.method public setAccountManagerRequestCancelled()V
    .registers 3

    .prologue
    .line 370
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;-><init>()V

    .line 371
    .local v0, "queuedData":Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;->isRequesUserCancelled:Z

    .line 373
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->mAuthActivity:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    if-nez v1, :cond_10

    .line 374
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->setQueuedResultData(Ljava/lang/Object;)V

    .line 379
    :goto_f
    return-void

    .line 377
    :cond_10
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;->performCommonTokenHandling(Lcom/adobe/creativesdk/foundation/internal/auth/TrySSOQueuedData;)V

    goto :goto_f
.end method
