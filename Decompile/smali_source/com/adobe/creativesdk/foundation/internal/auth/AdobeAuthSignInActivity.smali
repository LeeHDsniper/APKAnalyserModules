.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;
.super Landroid/support/v7/app/ActionBarActivity;
.source "AdobeAuthSignInActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;
    }
.end annotation


# static fields
.field private static _activityClosedDueToManualClose:Z


# instance fields
.field private _signInFragment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

.field signInFragmentTag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 399
    const/4 v0, 0x0

    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->_activityClosedDueToManualClose:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 391
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivity;-><init>()V

    .line 397
    const-string v0, "SignInfragment"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->signInFragmentTag:Ljava/lang/String;

    .line 639
    return-void
.end method

.method static synthetic access$002(Z)Z
    .registers 1
    .param p0, "x0"    # Z

    .prologue
    .line 391
    sput-boolean p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->_activityClosedDueToManualClose:Z

    return p0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 391
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->prepareAndSendResult(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    return-void
.end method

.method public static addNewAccountToAccountManager(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;)V
    .registers 4
    .param p0, "tokenDetails"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;

    .prologue
    .line 627
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->deviceToken:Ljava/lang/String;

    if-eqz v1, :cond_18

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;->adobeId:Ljava/lang/String;

    if-eqz v1, :cond_18

    .line 629
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 630
    .local v0, "context":Landroid/content/Context;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->getInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, p0, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper;->addNewAccountDirectlyToAccountManager(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/internal/auth/AdobeCSDKAdobeIdAuthenticatorHelper$TokenDetails;Z)V

    .line 636
    .end local v0    # "context":Landroid/content/Context;
    :cond_18
    return-void
.end method

.method private createResultHandler()Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
    .registers 3

    .prologue
    .line 551
    const/4 v0, 0x0

    .line 552
    .local v0, "resultHandler":Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->shouldTrySharedToken()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 553
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;

    .end local v0    # "resultHandler":Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForTryingSSO;-><init>()V

    .line 567
    .restart local v0    # "resultHandler":Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
    :goto_c
    return-object v0

    .line 555
    :cond_d
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForSingleClient;

    .end local v0    # "resultHandler":Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandlerForSingleClient;-><init>()V

    .restart local v0    # "resultHandler":Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
    goto :goto_c
.end method

.method public static isLastActivityClosedDuetoManualClose()Z
    .registers 1

    .prologue
    .line 408
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->_activityClosedDueToManualClose:Z

    return v0
.end method

.method private prepareAndSendResult(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 6
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    const/4 v3, 0x0

    .line 430
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 431
    .local v0, "data":Landroid/content/Intent;
    if-eqz p1, :cond_24

    .line 433
    const-string v1, "AdobeAuthErrorCode"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;->getErrorCode()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->getValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 434
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;->getErrorCode()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CANCELLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne v1, v2, :cond_29

    .line 436
    invoke-virtual {p0, v3, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->setResult(ILandroid/content/Intent;)V

    .line 437
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->sendResultBack(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 449
    :goto_23
    return-void

    .line 443
    :cond_24
    const-string v1, "AdobeAuthErrorCode"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 445
    :cond_29
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->setResult(ILandroid/content/Intent;)V

    .line 447
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->sendResultBack(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    goto :goto_23
.end method

.method static sendResultBack(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 5
    .param p0, "error"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 413
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedAuthManager()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getCurrentSignInClient()Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    move-result-object v1

    .line 414
    .local v1, "originalClient":Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;
    if-eqz v1, :cond_f

    .line 416
    if-eqz p0, :cond_10

    .line 418
    invoke-interface {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 426
    :cond_f
    :goto_f
    return-void

    .line 422
    :cond_10
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    .line 423
    .local v0, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAdobeID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onSuccess(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f
.end method

.method private shouldTrySharedToken()Z
    .registers 4

    .prologue
    .line 606
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "uxauth_trysharedtoken"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method


# virtual methods
.method handleResult(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 2
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 403
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->prepareAndSendResult(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 404
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->finish()V

    .line 405
    return-void
.end method

.method public noSharedAccountContinueNormalSignIn()V
    .registers 3

    .prologue
    .line 621
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->_signInFragment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->trySignInViaSharedAdobeIdAuthToken(Z)V

    .line 622
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->_signInFragment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->performWork()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;)V

    .line 623
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 14
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v11, 0x1020002

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 455
    sput-boolean v8, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->_activityClosedDueToManualClose:Z

    .line 456
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isInstanceCreated()Z

    move-result v9

    if-nez v9, :cond_10

    .line 458
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->finish()V

    .line 461
    :cond_10
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v9

    invoke-virtual {v9, p0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->setApplicationContext(Landroid/content/Context;)V

    .line 463
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 465
    sget v9, Lcom/adobe/creativesdk/foundation/auth/R$layout;->adobe_ux_auth_activity_container_view:I

    invoke-virtual {p0, v9}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->setContentView(I)V

    .line 467
    invoke-static {p0}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 468
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    .line 469
    .local v1, "cookieManager":Landroid/webkit/CookieManager;
    invoke-virtual {v1}, Landroid/webkit/CookieManager;->removeAllCookie()V

    .line 471
    sget v9, Lcom/adobe/creativesdk/foundation/auth/R$id;->actionbar_toolbar:I

    invoke-virtual {p0, v9}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/Toolbar;

    .line 478
    .local v6, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 479
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 480
    .local v0, "actionbar":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_40

    .line 481
    invoke-virtual {v0, v8}, Landroid/support/v7/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 482
    invoke-virtual {v0, v8}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 492
    :cond_40
    invoke-virtual {p0, v11}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    sget v10, Lcom/adobe/creativesdk/foundation/auth/R$string;->adobe_auth_sign_in_close:I

    invoke-virtual {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitle(Landroid/view/View;Ljava/lang/String;)V

    .line 493
    invoke-virtual {p0, v11}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    invoke-static {v9}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->getTextView(Landroid/view/View;)Landroid/view/View;

    move-result-object v9

    new-instance v10, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$1;

    invoke-direct {v10, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;)V

    invoke-virtual {v9, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 502
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    .line 504
    .local v3, "manager":Landroid/support/v4/app/FragmentManager;
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->signInFragmentTag:Ljava/lang/String;

    invoke-virtual {v3, v9}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    .line 506
    .local v2, "fragment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;
    if-nez v2, :cond_ae

    .line 507
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    .end local v2    # "fragment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;
    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;-><init>()V

    .line 508
    .restart local v2    # "fragment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->_signInFragment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    .line 509
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->createResultHandler()Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    move-result-object v4

    .line 510
    .local v4, "resultHandler":Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
    invoke-virtual {v4, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->setAuthSingInActivity(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;)V

    .line 511
    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->setSignInResultHandler(Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;)V

    .line 513
    invoke-virtual {v3}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v9

    sget v10, Lcom/adobe/creativesdk/foundation/auth/R$id;->creativesdk_foundation_auth_fragment_container:I

    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->signInFragmentTag:Ljava/lang/String;

    invoke-virtual {v9, v10, v2, v11}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v9

    .line 514
    invoke-virtual {v9}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 516
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->SIGN_IN_UI_TYPE:Ljava/lang/String;

    sget v11, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->AUTH_SESSION_TYPE_SIGN_IN:I

    invoke-virtual {v9, v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 517
    .local v5, "signType":I
    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->setUIType(I)V

    .line 518
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->shouldTrySharedToken()Z

    move-result v9

    if-eqz v9, :cond_ac

    sget v9, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->AUTH_SESSION_TYPE_SIGN_IN:I

    if-ne v5, v9, :cond_ac

    :goto_a8
    invoke-virtual {v2, v7}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->trySignInViaSharedAdobeIdAuthToken(Z)V

    .line 548
    .end local v5    # "signType":I
    :cond_ab
    :goto_ab
    return-void

    .restart local v5    # "signType":I
    :cond_ac
    move v7, v8

    .line 518
    goto :goto_a8

    .line 523
    .end local v4    # "resultHandler":Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
    .end local v5    # "signType":I
    :cond_ae
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->_signInFragment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    .line 524
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->getSignInResultHandler()Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    move-result-object v4

    .line 525
    .restart local v4    # "resultHandler":Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;
    if-nez v4, :cond_e3

    .line 530
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->createResultHandler()Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    move-result-object v4

    .line 531
    invoke-virtual {v4, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->setAuthSingInActivity(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;)V

    .line 532
    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->setSignInResultHandler(Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;)V

    .line 534
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->getIntent()Landroid/content/Intent;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    sget-object v10, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->SIGN_IN_UI_TYPE:Ljava/lang/String;

    sget v11, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->AUTH_SESSION_TYPE_SIGN_IN:I

    invoke-virtual {v9, v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 535
    .restart local v5    # "signType":I
    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->setUIType(I)V

    .line 536
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->shouldTrySharedToken()Z

    move-result v9

    if-eqz v9, :cond_e1

    sget v9, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->AUTH_SESSION_TYPE_SIGN_IN:I

    if-ne v5, v9, :cond_e1

    :goto_dd
    invoke-virtual {v2, v7}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->trySignInViaSharedAdobeIdAuthToken(Z)V

    goto :goto_ab

    :cond_e1
    move v7, v8

    goto :goto_dd

    .line 539
    .end local v5    # "signType":I
    :cond_e3
    invoke-virtual {v4, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->setAuthSingInActivity(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;)V

    .line 542
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->hasAnyQueuedResult()Z

    move-result v7

    if-eqz v7, :cond_ab

    .line 543
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->processQueuedResult()V

    goto :goto_ab
.end method

.method protected onDestroy()V
    .registers 3

    .prologue
    .line 612
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onDestroy()V

    .line 613
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->_signInFragment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    if-eqz v0, :cond_11

    .line 614
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->_signInFragment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->getSignInResultHandler()Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->setAuthSingInActivity(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;)V

    .line 618
    :cond_11
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 589
    const/4 v1, 0x4

    if-ne p1, v1, :cond_26

    .line 590
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->signInFragmentTag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;

    .line 592
    .local v0, "signInFragment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;
    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->shouldHandleBackPressed()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 594
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;->handleBackPressed()V

    .line 595
    const/4 v1, 0x1

    .line 602
    .end local v0    # "signInFragment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;
    :goto_1b
    return v1

    .line 599
    .restart local v0    # "signInFragment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;
    :cond_1c
    new-instance v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CANCELLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->prepareAndSendResult(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 602
    .end local v0    # "signInFragment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity$AdobeAuthSignInFragment;
    :cond_26
    invoke-super {p0, p1, p2}, Landroid/support/v7/app/ActionBarActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_1b
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 577
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 578
    .local v0, "id":I
    const v1, 0x102002c

    if-ne v0, v1, :cond_16

    .line 579
    new-instance v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CANCELLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->prepareAndSendResult(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 580
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;->onBackPressed()V

    .line 582
    :cond_16
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 572
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 573
    return-void
.end method
