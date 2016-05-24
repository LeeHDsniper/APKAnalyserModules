.class public Lcom/behance/sdk/BehanceSDK;
.super Ljava/lang/Object;
.source "BehanceSDK.java"


# static fields
.field private static final INSTANCE:Lcom/behance/sdk/BehanceSDK;


# instance fields
.field private credentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 78
    new-instance v0, Lcom/behance/sdk/BehanceSDK;

    invoke-direct {v0}, Lcom/behance/sdk/BehanceSDK;-><init>()V

    sput-object v0, Lcom/behance/sdk/BehanceSDK;->INSTANCE:Lcom/behance/sdk/BehanceSDK;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    return-void
.end method

.method public static getInstance()Lcom/behance/sdk/BehanceSDK;
    .registers 1

    .prologue
    .line 90
    sget-object v0, Lcom/behance/sdk/BehanceSDK;->INSTANCE:Lcom/behance/sdk/BehanceSDK;

    return-object v0
.end method

.method private initializeForPublishWIPWorkflow(Landroid/content/Context;Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "options"    # Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;

    .prologue
    const/4 v8, 0x1

    .line 372
    invoke-static {}, Lcom/behance/sdk/managers/AddWIPManager;->getInstance()Lcom/behance/sdk/managers/AddWIPManager;

    move-result-object v6

    .line 373
    .local v6, "wipManager":Lcom/behance/sdk/managers/AddWIPManager;
    invoke-static {p1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getInstance(Landroid/content/Context;)Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-result-object v2

    .line 374
    .local v2, "socialAccountManager":Lcom/behance/sdk/BehanceSDKSocialAccountManager;
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->isFacebookShareEnabled()Z

    move-result v7

    if-eqz v7, :cond_cb

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getFacebookClientId()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_cb

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getFacebookClientId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_cb

    .line 375
    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v2, v7}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v0

    .line 376
    .local v0, "facebookAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    if-eqz v0, :cond_3b

    .line 377
    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v1

    .line 378
    .local v1, "fbClientId":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getFacebookClientId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3b

    .line 379
    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v2, v7}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->removeAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Z

    .line 380
    const/4 v0, 0x0

    .line 383
    .end local v1    # "fbClientId":Ljava/lang/String;
    :cond_3b
    if-nez v0, :cond_51

    .line 384
    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .end local v0    # "facebookAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    invoke-direct {v0}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;-><init>()V

    .line 385
    .restart local v0    # "facebookAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v0, v7}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAccountType(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)V

    .line 386
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getFacebookClientId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAccountClientId(Ljava/lang/String;)V

    .line 387
    invoke-virtual {v2, v0}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->addAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 393
    .end local v0    # "facebookAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    :cond_51
    :goto_51
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->isTwitterShareEnabled()Z

    move-result v7

    if-eqz v7, :cond_cf

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getTwitterConsumerKey()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_cf

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getTwitterConsumerKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_cf

    .line 394
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getTwitterConsumerSecretKey()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_cf

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getTwitterConsumerSecretKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_cf

    .line 396
    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v2, v7}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v3

    .line 397
    .local v3, "twitterAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    if-eqz v3, :cond_a1

    .line 398
    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v4

    .line 399
    .local v4, "twitterClientId":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v5

    .line 400
    .local v5, "twitterClientSecret":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getTwitterConsumerKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9b

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getTwitterConsumerSecretKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a1

    .line 401
    :cond_9b
    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v2, v7}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->removeAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Z

    .line 402
    const/4 v3, 0x0

    .line 405
    .end local v4    # "twitterClientId":Ljava/lang/String;
    .end local v5    # "twitterClientSecret":Ljava/lang/String;
    :cond_a1
    if-nez v3, :cond_be

    .line 406
    new-instance v3, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .end local v3    # "twitterAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    invoke-direct {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;-><init>()V

    .line 407
    .restart local v3    # "twitterAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v3, v7}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAccountType(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)V

    .line 408
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getTwitterConsumerKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAccountClientId(Ljava/lang/String;)V

    .line 409
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getTwitterConsumerSecretKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAccountClientSecret(Ljava/lang/String;)V

    .line 410
    invoke-virtual {v2, v3}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->addAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 416
    .end local v3    # "twitterAccount":Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
    :cond_be
    :goto_be
    iget-object v7, p0, Lcom/behance/sdk/BehanceSDK;->credentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;

    invoke-virtual {v6, v7}, Lcom/behance/sdk/managers/AddWIPManager;->setUserCredentials(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V

    .line 417
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->getNotificationHandlerActivityClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/behance/sdk/managers/AddWIPManager;->setNotificationHandlerActivityClass(Ljava/lang/Class;)V

    .line 418
    return-void

    .line 390
    :cond_cb
    invoke-virtual {v6, v8}, Lcom/behance/sdk/managers/AddWIPManager;->setHideFacebookSharing(Z)V

    goto :goto_51

    .line 414
    :cond_cf
    invoke-virtual {v6, v8}, Lcom/behance/sdk/managers/AddWIPManager;->setHideTwitterSharing(Z)V

    goto :goto_be
.end method

.method private validateIfUserIsEntitledForBehanceWorkflow()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/behance/sdk/exception/BehanceSDKUserNotEntitledException;,
            Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;
        }
    .end annotation

    .prologue
    .line 99
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v0

    .line 100
    .local v0, "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    invoke-virtual {v0}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->isUserAuthenticatedWithAdobe()Z

    move-result v1

    if-nez v1, :cond_12

    .line 101
    new-instance v1, Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;

    const-string v2, "No logged in user found."

    invoke-direct {v1, v2}, Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 104
    :cond_12
    invoke-virtual {v0}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->isUserEntitledToUseBehance()Z

    move-result v1

    if-nez v1, :cond_20

    .line 105
    new-instance v1, Lcom/behance/sdk/exception/BehanceSDKUserNotEntitledException;

    const-string v2, "User is not entitled to use Behance services"

    invoke-direct {v1, v2}, Lcom/behance/sdk/exception/BehanceSDKUserNotEntitledException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 106
    :cond_20
    return-void
.end method


# virtual methods
.method public initialize(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V
    .registers 2
    .param p1, "credentials"    # Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/behance/sdk/BehanceSDK;->credentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .line 95
    return-void
.end method

.method public launchPublishWIPView(Landroid/content/Context;Lcom/behance/sdk/BehanceSDKPublishWIPOptions;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "options"    # Lcom/behance/sdk/BehanceSDKPublishWIPOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/behance/sdk/exception/BehanceSDKInvalidImageException;,
            Lcom/behance/sdk/exception/BehanceSDKInvalidImageException;,
            Lcom/behance/sdk/exception/BehanceSDKInvalidArgumentException;,
            Lcom/behance/sdk/exception/BehanceSDKUserNotEntitledException;,
            Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;
        }
    .end annotation

    .prologue
    .line 331
    invoke-direct {p0}, Lcom/behance/sdk/BehanceSDK;->validateIfUserIsEntitledForBehanceWorkflow()V

    .line 332
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/BehanceSDK;->initializeForPublishWIPWorkflow(Landroid/content/Context;Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;)V

    .line 333
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getWipRevisionImageModule()Lcom/behance/sdk/project/modules/ImageModule;

    move-result-object v1

    .line 334
    .local v1, "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    sget-object v3, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->VALID:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    invoke-virtual {p0, v1}, Lcom/behance/sdk/BehanceSDK;->validateImageForWIP(Lcom/behance/sdk/project/modules/ImageModule;)Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    move-result-object v4

    if-eq v3, v4, :cond_1c

    .line 335
    new-instance v3, Lcom/behance/sdk/exception/BehanceSDKInvalidImageException;

    invoke-virtual {v1}, Lcom/behance/sdk/project/modules/ImageModule;->getFile()Ljava/io/File;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/behance/sdk/exception/BehanceSDKInvalidImageException;-><init>(Ljava/io/File;)V

    throw v3

    .line 337
    :cond_1c
    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getWipTitle()Ljava/lang/String;

    move-result-object v2

    .line 338
    .local v2, "title":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_36

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x37

    if-le v3, v4, :cond_36

    .line 339
    new-instance v3, Lcom/behance/sdk/exception/BehanceSDKInvalidArgumentException;

    const-string v4, "Behance WIP title cannot be more than 55 characters in length"

    invoke-direct {v3, v4}, Lcom/behance/sdk/exception/BehanceSDKInvalidArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 341
    :cond_36
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;

    invoke-direct {v0, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 342
    .local v0, "detailsIntent":Landroid/content/Intent;
    const/high16 v3, 0x10000000

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 343
    const-string v3, "INTENT_INT_EXTRA_EXISTING_WIP_ID"

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getExistingWIPId()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 344
    const-string v3, "INTENT_STRING_EXTRA_WIP_DESCRIPTION"

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getWipDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 345
    const-string v3, "INTENT_STRING_EXTRA_WIP_TAGS"

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getWipTags()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 346
    const-string v3, "INTENT_STRING_EXTRA_WIP_TITLE"

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getWipTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 347
    const-string v3, "INTENT_SERIALIZABLE_EXTRA_WIP_REVISION_IMAGE_MODULE"

    invoke-virtual {p2}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getWipRevisionImageModule()Lcom/behance/sdk/project/modules/ImageModule;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 349
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTypePublishUXStart:Ljava/lang/String;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTargetBehanceWIP:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackSharingAction(Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 353
    return-void
.end method

.method public validateImageForWIP(Lcom/behance/sdk/project/modules/ImageModule;)Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;
    .registers 3
    .param p1, "imageModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 492
    invoke-static {p1}, Lcom/behance/sdk/util/BehanceSDKUtils;->validateImageForWIP(Lcom/behance/sdk/project/modules/ImageModule;)Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    move-result-object v0

    return-object v0
.end method
