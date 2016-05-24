.class public Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
.super Ljava/lang/Object;
.source "AdobeAuthManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LogoutObserver;,
        Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;
    }
.end annotation


# static fields
.field private static sharedManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;


# instance fields
.field private _adobeApplication:Z

.field private _currentTopActivity:Landroid/app/Activity;

.field private _loginMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;",
            "Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;",
            ">;"
        }
    .end annotation
.end field

.field private _logoutMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;",
            "Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LogoutObserver;",
            ">;"
        }
    .end annotation
.end field

.field private _sessionLauncher:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

.field private mAuthOptions:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

.field private mSignInClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

.field private mUserProfile:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mAuthOptions:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    .line 53
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mUserProfile:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;

    .line 54
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mSignInClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    .line 57
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_loginMap:Ljava/util/Map;

    .line 58
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_logoutMap:Ljava/util/Map;

    .line 61
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_sessionLauncher:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    .line 63
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_currentTopActivity:Landroid/app/Activity;

    .line 105
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_loginMap:Ljava/util/Map;

    .line 106
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_logoutMap:Ljava/util/Map;

    .line 107
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->postLoginSuccess(Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;ZLcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->postLoginError(ZLcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->handleEmergencyLogOut()V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;I)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    .param p1, "x1"    # I

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->launchSignInActivity(I)V

    return-void
.end method

.method private getApplicationContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 694
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method private getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    .registers 2

    .prologue
    .line 689
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized handleEmergencyLogOut()V
    .registers 4

    .prologue
    .line 749
    monitor-enter p0

    :try_start_1
    new-instance v0, Landroid/os/Handler;

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 751
    .local v0, "mainHandler":Landroid/os/Handler;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$5;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$5;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;)V

    .line 760
    .local v1, "myRunnable":Ljava/lang/Runnable;
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_18

    .line 761
    monitor-exit p0

    return-void

    .line 749
    .end local v0    # "mainHandler":Landroid/os/Handler;
    .end local v1    # "myRunnable":Ljava/lang/Runnable;
    :catchall_18
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private isInitialized()Z
    .registers 2

    .prologue
    .line 743
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method static isInstanceCreated()Z
    .registers 1

    .prologue
    .line 80
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    if-eqz v0, :cond_6

    .line 82
    const/4 v0, 0x1

    .line 86
    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private launchSignInActivity(I)V
    .registers 11
    .param p1, "signInType"    # I

    .prologue
    const/4 v6, 0x1

    .line 699
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_sessionLauncher:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->getLauncherActivity()Landroid/content/Context;

    move-result-object v0

    .line 700
    .local v0, "context":Landroid/content/Context;
    const/4 v5, 0x1

    .line 701
    .local v5, "useActivity":Z
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_sessionLauncher:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->getIntentFlags()I

    move-result v1

    .line 702
    .local v1, "flags":I
    if-nez v0, :cond_1a

    .line 704
    const/4 v5, 0x0

    .line 705
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_sessionLauncher:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->getLauncherContext()Landroid/content/Context;

    move-result-object v0

    .line 706
    const/high16 v7, 0x10000000

    or-int/2addr v1, v7

    .line 709
    :cond_1a
    new-instance v3, Landroid/content/Intent;

    const-class v7, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;

    invoke-direct {v3, v0, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 711
    .local v3, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v2

    .line 714
    .local v2, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceID()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_5c

    move v4, v6

    .line 716
    .local v4, "shouldTrySharedAdobeIdAccountFromAccountManager":Z
    :goto_2c
    if-eqz v4, :cond_3f

    .line 717
    const/4 v4, 0x0

    .line 718
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getAccessGroupAccountType()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_3f

    .line 720
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getAccessGroupAccountType()Ljava/lang/String;

    move-result-object v7

    const-string v8, "com.adobe.creativesdk.foundation.auth.adobeID"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    .line 724
    :cond_3f
    if-eqz v4, :cond_46

    .line 725
    const-string v7, "uxauth_trysharedtoken"

    invoke-virtual {v3, v7, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 728
    :cond_46
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->SIGN_IN_UI_TYPE:Ljava/lang/String;

    invoke-virtual {v3, v6, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 729
    invoke-virtual {v3, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 731
    if-eqz v5, :cond_5e

    .line 733
    check-cast v0, Landroid/app/Activity;

    .end local v0    # "context":Landroid/content/Context;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_sessionLauncher:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->getRequestCode()I

    move-result v6

    invoke-virtual {v0, v3, v6}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 739
    :goto_5b
    return-void

    .line 714
    .end local v4    # "shouldTrySharedAdobeIdAccountFromAccountManager":Z
    .restart local v0    # "context":Landroid/content/Context;
    :cond_5c
    const/4 v4, 0x0

    goto :goto_2c

    .line 737
    .restart local v4    # "shouldTrySharedAdobeIdAccountFromAccountManager":Z
    :cond_5e
    invoke-virtual {v0, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_5b
.end method

.method private loginInternal(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;Z)V
    .registers 6
    .param p1, "interactionMode"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;
    .param p2, "sendExternal"    # Z

    .prologue
    .line 555
    const/4 v0, 0x0

    .line 556
    .local v0, "adobeID":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v2

    if-eqz v2, :cond_f

    .line 557
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    .line 558
    :cond_f
    const-string v2, "Login Attempt"

    invoke-static {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 560
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;

    invoke-direct {v1, p0, p2, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;ZLcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;)V

    .line 588
    .local v1, "imsClient":Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->setSignInClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    .line 589
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->signIn(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    .line 590
    return-void
.end method

.method private postLoginError(ZLcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 9
    .param p1, "sendExternal"    # Z
    .param p2, "authError"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 644
    const/4 v0, 0x0

    .line 645
    .local v0, "adobeID":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v4

    if-eqz v4, :cond_f

    .line 646
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    .line 647
    :cond_f
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;->getErrorCode()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CANCELLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    if-ne v4, v5, :cond_39

    .line 648
    const-string v4, "Login Cancel"

    invoke-static {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 652
    :goto_1c
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 653
    .local v3, "userInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "Error"

    invoke-interface {v3, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 655
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    .line 656
    .local v2, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;
    if-eqz p1, :cond_2c

    .line 658
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginExternalNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    .line 661
    :cond_2c
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 665
    .local v1, "loginLogoutNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 667
    return-void

    .line 650
    .end local v1    # "loginLogoutNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    .end local v2    # "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;
    .end local v3    # "userInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_39
    const-string v4, "Login Failure"

    invoke-static {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c
.end method

.method private postLoginSuccess(Z)V
    .registers 6
    .param p1, "sendExternal"    # Z

    .prologue
    .line 672
    const-string v3, "Login Success"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v2

    if-eqz v2, :cond_27

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v2

    :goto_10
    invoke-static {v3, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 673
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    .line 675
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;
    if-eqz p1, :cond_19

    .line 677
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginExternalNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    .line 680
    :cond_19
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 684
    .local v0, "loginLogoutNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 685
    return-void

    .line 672
    .end local v0    # "loginLogoutNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    .end local v1    # "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;
    :cond_27
    const-string v2, ""

    goto :goto_10
.end method

.method private setCurrentLauncherObject(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;)V
    .registers 2
    .param p1, "sessionLauncher"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_sessionLauncher:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    .line 102
    return-void
.end method

.method public static sharedAuthManager()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    .registers 1

    .prologue
    .line 72
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    if-nez v0, :cond_b

    .line 73
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .line 75
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    return-object v0
.end method


# virtual methods
.method public canRefreshAccessToken()Z
    .registers 15

    .prologue
    const-wide/16 v12, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 610
    const/4 v3, 0x0

    .line 611
    .local v3, "result":Z
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v1

    .line 612
    .local v1, "ims":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceToken()Ljava/lang/String;

    move-result-object v0

    .line 613
    .local v0, "deviceToken":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getRefreshToken()Ljava/lang/String;

    move-result-object v2

    .line 620
    .local v2, "refreshToken":Ljava/lang/String;
    if-eqz v2, :cond_36

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_36

    .line 621
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getRefreshTokenExpirationTime()Ljava/util/Date;

    move-result-object v4

    .line 622
    .local v4, "tokenExpiration":Ljava/util/Date;
    if-eqz v4, :cond_36

    .line 623
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    sub-long/2addr v8, v10

    cmp-long v7, v8, v12

    if-lez v7, :cond_5e

    move v3, v5

    .line 628
    .end local v4    # "tokenExpiration":Ljava/util/Date;
    :cond_36
    :goto_36
    if-nez v3, :cond_5d

    .line 629
    if-eqz v0, :cond_5d

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_5d

    .line 630
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDeviceTokenExpirationTime()Ljava/util/Date;

    move-result-object v4

    .line 631
    .restart local v4    # "tokenExpiration":Ljava/util/Date;
    if-eqz v4, :cond_5d

    .line 632
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    sub-long/2addr v8, v10

    cmp-long v7, v8, v12

    if-lez v7, :cond_60

    move v3, v5

    .line 637
    .end local v4    # "tokenExpiration":Ljava/util/Date;
    :cond_5d
    :goto_5d
    return v3

    .restart local v4    # "tokenExpiration":Ljava/util/Date;
    :cond_5e
    move v3, v6

    .line 623
    goto :goto_36

    :cond_60
    move v3, v6

    .line 632
    goto :goto_5d
.end method

.method public getAdobeID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 530
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentAuthSessionLauncher()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
    .registers 2

    .prologue
    .line 546
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_sessionLauncher:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    return-object v0
.end method

.method public getCurrentSignInClient()Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;
    .registers 2

    .prologue
    .line 541
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mSignInClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    return-object v0
.end method

.method public getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    .registers 5

    .prologue
    .line 291
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isInitialized()Z

    move-result v2

    if-eqz v2, :cond_c

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isAuthenticated()Z

    move-result v2

    if-nez v2, :cond_e

    :cond_c
    const/4 v2, 0x0

    .line 304
    :goto_d
    return-object v2

    .line 293
    :cond_e
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;

    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mUserProfile:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;

    .line 295
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    .line 297
    .local v0, "ims":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mUserProfile:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAdobeID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->setAdobeID(Ljava/lang/String;)V

    .line 298
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mUserProfile:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getDisplayName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->setDisplayName(Ljava/lang/String;)V

    .line 299
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mUserProfile:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getFirstName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->setFirstName(Ljava/lang/String;)V

    .line 300
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mUserProfile:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getLastName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->setLastName(Ljava/lang/String;)V

    .line 301
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mUserProfile:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEmailAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->setEmail(Ljava/lang/String;)V

    .line 302
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getIsEnterPrise()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_61

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getIsEnterPrise()Ljava/lang/String;

    move-result-object v2

    const-string v3, "true"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_61

    const/4 v1, 0x1

    .line 303
    .local v1, "isEnterprise":Z
    :goto_59
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mUserProfile:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;->setEnterprise(Z)V

    .line 304
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mUserProfile:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthUserProfileImpl;

    goto :goto_d

    .line 302
    .end local v1    # "isEnterprise":Z
    :cond_61
    const/4 v1, 0x0

    goto :goto_59
.end method

.method public hasValidAccessToken()Z
    .registers 9

    .prologue
    .line 593
    const/4 v2, 0x0

    .line 594
    .local v2, "result":Z
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 596
    .local v0, "accessToken":Ljava/lang/String;
    if-eqz v0, :cond_30

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_30

    .line 597
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessTokenExpirationTime()Ljava/util/Date;

    move-result-object v1

    .line 598
    .local v1, "expireTime":Ljava/util/Date;
    if-eqz v1, :cond_30

    .line 599
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_30

    .line 600
    const/4 v2, 0x1

    .line 604
    .end local v1    # "expireTime":Ljava/util/Date;
    :cond_30
    return v2
.end method

.method public isAdobeApplication()Z
    .registers 2

    .prologue
    .line 764
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_adobeApplication:Z

    return v0
.end method

.method public isAuthenticated()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 310
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_8

    .line 311
    :cond_7
    :goto_7
    return v0

    :cond_8
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->hasValidAccessToken()Z

    move-result v1

    if-nez v1, :cond_14

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->canRefreshAccessToken()Z

    move-result v1

    if-eqz v1, :cond_7

    :cond_14
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public login(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;)V
    .registers 6
    .param p1, "sessionLauncher"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 211
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->setCurrentLauncherObject(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;)V

    .line 213
    const-string v1, "Login Start"

    invoke-static {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->hasValidAccessToken()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 217
    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->postLoginSuccess(Z)V

    .line 232
    :goto_13
    return-void

    .line 220
    :cond_14
    const/4 v0, 0x0

    .line 221
    .local v0, "adobeID":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v1

    if-eqz v1, :cond_23

    .line 223
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    .line 225
    :cond_23
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_38

    .line 226
    const-string v1, "Expired Authentication Token"

    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    :goto_32
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;->AdobeAuthInteractionInteractive:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    invoke-direct {p0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->loginInternal(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;Z)V

    goto :goto_13

    .line 228
    :cond_38
    const-string v1, "Missing Authentication Token"

    invoke-static {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_32
.end method

.method public logout()V
    .registers 10

    .prologue
    .line 237
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v5

    .line 238
    .local v5, "usrprofile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    const/4 v3, 0x0

    .line 239
    .local v3, "tempAdobeID":Ljava/lang/String;
    if-eqz v5, :cond_14

    .line 241
    const-string v6, "Logout Attempt"

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v3

    .line 244
    :cond_14
    move-object v0, v3

    .line 245
    .local v0, "adobeID":Ljava/lang/String;
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    if-nez v6, :cond_3b

    .line 247
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 248
    .local v4, "userInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "Error"

    new-instance v7, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v8, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_AUTH_MODULE_NOT_INITIALIZED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v7, v8}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-direct {v1, v6, v4}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 253
    .local v1, "loginLogoutNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v6

    invoke-virtual {v6, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 286
    .end local v1    # "loginLogoutNotification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    .end local v4    # "userInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_3a
    return-void

    .line 258
    :cond_3b
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1;

    invoke-direct {v2, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;Ljava/lang/String;)V

    .line 284
    .local v2, "signoutClient":Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v6

    invoke-virtual {v6, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->signOut(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;)V

    goto :goto_3a
.end method

.method public promptForSignUp(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;)V
    .registers 6
    .param p1, "sessionLauncher"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 381
    const-string v1, "Signup Start"

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackRegStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 383
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->setCurrentLauncherObject(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;)V

    .line 385
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_20

    .line 387
    const-string v1, "Signup Failure"

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackRegStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    new-instance v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_AUTH_MODULE_NOT_INITIALIZED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->postLoginError(ZLcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 425
    :goto_1f
    return-void

    .line 392
    :cond_20
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v1

    if-eqz v1, :cond_48

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_48

    .line 393
    const-string v1, "Signup Failure"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackRegStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    new-instance v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->postLoginError(ZLcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    goto :goto_1f

    .line 398
    :cond_48
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;)V

    .line 422
    .local v0, "imsClient":Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;
    sget v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthConstants;->AUTH_SESSION_TYPE_SIGN_UP:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->launchSignInActivity(I)V

    .line 424
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->setSignInClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    goto :goto_1f
.end method

.method public reAuthenticate()Z
    .registers 11

    .prologue
    const/4 v6, 0x1

    const/4 v4, 0x0

    .line 454
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isInitialized()Z

    move-result v5

    if-nez v5, :cond_9

    .line 509
    :goto_8
    return v4

    .line 456
    :cond_9
    new-instance v3, Ljava/util/concurrent/Semaphore;

    invoke-direct {v3, v6, v6}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    .line 458
    .local v3, "sem":Ljava/util/concurrent/Semaphore;
    :try_start_e
    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_11
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_11} :catch_51

    .line 464
    :goto_11
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessTokenExpirationTime()Ljava/util/Date;

    move-result-object v1

    .line 465
    .local v1, "expirationDate":Ljava/util/Date;
    if-eqz v1, :cond_38

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-lez v5, :cond_38

    .line 466
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v6, "Authentication"

    const-string v7, "Access token required reauthentication sooner than expected."

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    :cond_38
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;

    invoke-direct {v2, p0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;Ljava/util/concurrent/Semaphore;)V

    .line 499
    .local v2, "loginClient":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v5

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v5, v6, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 501
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;->AdobeAuthInteractionHeadless:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;

    invoke-direct {p0, v5, v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->loginInternal(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthInteraction;Z)V

    .line 504
    :try_start_4b
    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_4e
    .catch Ljava/lang/InterruptedException; {:try_start_4b .. :try_end_4e} :catch_5c

    .line 509
    :goto_4e
    iget-boolean v4, v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;->_result:Z

    goto :goto_8

    .line 459
    .end local v1    # "expirationDate":Ljava/util/Date;
    .end local v2    # "loginClient":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;
    :catch_51
    move-exception v0

    .line 460
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v6, "Authentication"

    const-string v7, "Reauthenticate: Can not aquire permit."

    invoke-static {v5, v6, v7, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_11

    .line 505
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .restart local v1    # "expirationDate":Ljava/util/Date;
    .restart local v2    # "loginClient":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$1LoginObserver;
    :catch_5c
    move-exception v0

    .line 506
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v5, "Authentication"

    const-string v6, "Reauthenticate: Can not acquire permit."

    invoke-static {v4, v5, v6, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4e
.end method

.method public registerLoginClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V
    .registers 4
    .param p1, "loginClient"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    .prologue
    .line 315
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_loginMap:Ljava/util/Map;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_loginMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;->registerForLogin()V

    .line 317
    return-void
.end method

.method public registerLogoutClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;)V
    .registers 4
    .param p1, "logoutClient"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    .prologue
    .line 325
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_logoutMap:Ljava/util/Map;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LogoutObserver;

    invoke-direct {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LogoutObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_logoutMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LogoutObserver;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LogoutObserver;->registerForLogout()V

    .line 327
    return-void
.end method

.method public setAuthenticationParameters(Ljava/lang/String;Ljava/lang/String;[B)V
    .registers 11
    .param p1, "clientID"    # Ljava/lang/String;
    .param p2, "clientSecret"    # Ljava/lang/String;
    .param p3, "encryptionKey"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 186
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 188
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v0

    .line 189
    .local v0, "ims":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;->AdobeAuthOptionsHideSignUpOnSignIn:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    aput-object v2, v1, v6

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mAuthOptions:[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthOptions;

    .line 190
    invoke-virtual {v0, p3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setCipherKey([B)V

    move-object v1, p1

    move-object v2, p2

    move-object v4, v3

    move-object v5, v3

    .line 191
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setAuthenticationParameters(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;->AdobeAuthIMSGrantTypeAuthorization:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setGrantType(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSGrantType;)V

    .line 193
    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setAdditionalClientScopes([Ljava/lang/String;)V

    .line 194
    iput-boolean v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_adobeApplication:Z

    .line 197
    .end local v0    # "ims":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    :cond_29
    return-void
.end method

.method public setCurrentActivity(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_currentTopActivity:Landroid/app/Activity;

    .line 92
    return-void
.end method

.method setSignInClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V
    .registers 2
    .param p1, "imsClient"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    .prologue
    .line 537
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->mSignInClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    .line 538
    return-void
.end method

.method public unregisterLoginClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;)V
    .registers 4
    .param p1, "loginClient"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLoginObserver;

    .prologue
    .line 320
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_loginMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LoginObserver;->unregisterForLogin()V

    .line 321
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_loginMap:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    return-void
.end method

.method public unregisterLogoutClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;)V
    .registers 4
    .param p1, "logoutClient"    # Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    .prologue
    .line 330
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_logoutMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LogoutObserver;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager$LogoutObserver;->unregisterForLogout()V

    .line 331
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->_logoutMap:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    return-void
.end method

.method public willAccessTokenBeValidIn(J)Z
    .registers 14
    .param p1, "seconds"    # J

    .prologue
    .line 771
    const/4 v1, 0x0

    .line 773
    .local v1, "result":Z
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 775
    .local v0, "accessToken":Ljava/lang/String;
    if-eqz v0, :cond_31

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_31

    .line 777
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->getIMSService()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessTokenExpirationTime()Ljava/util/Date;

    move-result-object v2

    .line 779
    .local v2, "tokenExpiration":Ljava/util/Date;
    if-eqz v2, :cond_31

    .line 781
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    mul-long/2addr v8, p1

    add-long/2addr v6, v8

    cmp-long v3, v4, v6

    if-lez v3, :cond_32

    const/4 v1, 0x1

    .line 785
    .end local v2    # "tokenExpiration":Ljava/util/Date;
    :cond_31
    :goto_31
    return v1

    .line 781
    .restart local v2    # "tokenExpiration":Ljava/util/Date;
    :cond_32
    const/4 v1, 0x0

    goto :goto_31
.end method
