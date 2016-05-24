.class public Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;
.super Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;
.source "BehanceSDKPublishProjectDetailsFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;
.implements Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;


# instance fields
.field private adultContentCheckBox:Landroid/widget/CheckBox;

.field private coverImageView:Landroid/widget/ImageView;

.field private facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

.field private facebookLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

.field private headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

.field private loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

.field private loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

.field private projectCopyrightsButton:Landroid/widget/TextView;

.field private projectDescEditTxt:Landroid/widget/EditText;

.field private projectFilterFieldsButton:Landroid/widget/TextView;

.field private projectNameTxtView:Landroid/widget/TextView;

.field private projectTagsEditTxt:Landroid/widget/EditText;

.field private publishProjectProgressbar:Landroid/view/View;

.field private selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

.field private selectedField:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;"
        }
    .end annotation
.end field

.field private shareOnFacebook:Z

.field private shareOnFacebookBtnImageView:Landroid/widget/ImageView;

.field private shareOnTwitter:Z

.field private shareOnTwitterBtnImageView:Landroid/widget/ImageView;

.field private socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

.field private twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

.field private twitterLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

.field private workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 75
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;-><init>()V

    .line 84
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    .line 87
    iput-boolean v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    .line 88
    iput-boolean v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    .line 847
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$6;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$6;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    .line 860
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$7;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$7;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private LoginToFacebook()V
    .registers 5

    .prologue
    .line 408
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->hideSoftKeyBoardIfActive(Landroid/view/View;)V

    .line 409
    new-instance v2, Lcom/facebook/Session$Builder;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/facebook/Session$Builder;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/facebook/Session$Builder;->setApplicationId(Ljava/lang/String;)Lcom/facebook/Session$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/Session$Builder;->build()Lcom/facebook/Session;

    move-result-object v1

    .line 410
    .local v1, "session":Lcom/facebook/Session;
    invoke-static {v1}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 411
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->createFacebookSessionRequest()Lcom/facebook/Session$OpenRequest;

    move-result-object v0

    .line 412
    .local v0, "openRequest":Lcom/facebook/Session$OpenRequest;
    invoke-virtual {v1, v0}, Lcom/facebook/Session;->openForPublish(Lcom/facebook/Session$OpenRequest;)V

    .line 413
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedField:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    return-object v0
.end method

.method static synthetic access$200(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    return-object v0
.end method

.method static synthetic access$300(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->handleEnableShareOnTwitterBtnClick()V

    return-void
.end method

.method static synthetic access$400(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->handleEnableShareOnFacebookBtnClick()V

    return-void
.end method

.method static synthetic access$500(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->closeLoginToTwitterConfirmationDialog()V

    return-void
.end method

.method static synthetic access$600(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->launchTwitterLoginActivity()V

    return-void
.end method

.method static synthetic access$700(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->closeLoginToFacebookConfirmationDialog()V

    return-void
.end method

.method static synthetic access$800(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->LoginToFacebook()V

    return-void
.end method

.method private checkFacebookAuthAndEnableSharing()V
    .registers 2

    .prologue
    .line 388
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->isFacebookAccountAuthenticatedToPublish()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 389
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    .line 390
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnFacebookBtnImage()V

    .line 391
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateFacebookAccountAuthStatus()V

    .line 395
    :goto_f
    return-void

    .line 393
    :cond_10
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->displayFacebookLoginConfirmationDialog()V

    goto :goto_f
.end method

.method private checkIfUserHasLoggedIntoTwitter()V
    .registers 4

    .prologue
    .line 490
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v0

    .line 491
    .local v0, "accessToken":Ljava/lang/String;
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v1

    .line 492
    .local v1, "accessTokenSecret":Ljava/lang/String;
    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1c

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 493
    :cond_1c
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->displayTwitterLoginConfirmationDialog()V

    .line 498
    :goto_1f
    return-void

    .line 495
    :cond_20
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    .line 496
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnTwitterBtnImage()V

    goto :goto_1f
.end method

.method private closeLoginToFacebookConfirmationDialog()V
    .registers 2

    .prologue
    .line 536
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    if-eqz v0, :cond_9

    .line 537
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->dismiss()V

    .line 539
    :cond_9
    return-void
.end method

.method private closeLoginToTwitterConfirmationDialog()V
    .registers 2

    .prologue
    .line 530
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    if-eqz v0, :cond_9

    .line 531
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->dismiss()V

    .line 533
    :cond_9
    return-void
.end method

.method private createFacebookSessionRequest()Lcom/facebook/Session$OpenRequest;
    .registers 6

    .prologue
    .line 441
    new-instance v0, Lcom/facebook/Session$OpenRequest;

    invoke-direct {v0, p0}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/support/v4/app/Fragment;)V

    .line 442
    .local v0, "openRequest":Lcom/facebook/Session$OpenRequest;
    sget-object v2, Lcom/facebook/SessionDefaultAudience;->EVERYONE:Lcom/facebook/SessionDefaultAudience;

    invoke-virtual {v0, v2}, Lcom/facebook/Session$OpenRequest;->setDefaultAudience(Lcom/facebook/SessionDefaultAudience;)Lcom/facebook/Session$OpenRequest;

    .line 443
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "publish_actions"

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 444
    .local v1, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v0, v1}, Lcom/facebook/Session$OpenRequest;->setPermissions(Ljava/util/List;)Lcom/facebook/Session$OpenRequest;

    .line 445
    sget-object v2, Lcom/facebook/SessionLoginBehavior;->SSO_WITH_FALLBACK:Lcom/facebook/SessionLoginBehavior;

    invoke-virtual {v0, v2}, Lcom/facebook/Session$OpenRequest;->setLoginBehavior(Lcom/facebook/SessionLoginBehavior;)Lcom/facebook/Session$OpenRequest;

    .line 446
    return-object v0
.end method

.method private displayFacebookLoginConfirmationDialog()V
    .registers 6

    .prologue
    .line 398
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$string;->bsdk_social_account_facebook_login_confirmation_title:I

    sget v2, Lcom/behance/sdk/R$string;->bsdk_social_account_facebook_login_confirmation_body:I

    sget v3, Lcom/behance/sdk/R$string;->bsdk_social_account_facebook_login_confirmation_ok_btn_label:I

    sget v4, Lcom/behance/sdk/R$string;->bsdk_social_account_facebook_login_confirmation_cancel_btn_label:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->getInstance(Landroid/content/Context;IIII)Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    .line 402
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnNotOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 403
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 404
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->show()V

    .line 405
    return-void
.end method

.method private displayTwitterLoginConfirmationDialog()V
    .registers 6

    .prologue
    .line 501
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$string;->bsdk_social_account_twitter_login_confirmation_title:I

    sget v2, Lcom/behance/sdk/R$string;->bsdk_social_account_twitter_login_confirmation_body:I

    sget v3, Lcom/behance/sdk/R$string;->bsdk_social_account_twitter_login_confirmation_ok_btn_label:I

    sget v4, Lcom/behance/sdk/R$string;->bsdk_social_account_twitter_login_confirmation_cancel_btn_label:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->getInstance(Landroid/content/Context;IIII)Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    .line 505
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnNotOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 506
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 507
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->show()V

    .line 508
    return-void
.end method

.method private enableOrDisablePublishButton()V
    .registers 6

    .prologue
    .line 815
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getProjectTitle()Ljava/lang/String;

    move-result-object v3

    .line 816
    .local v3, "projectTitle":Ljava/lang/String;
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getProjectDesc()Ljava/lang/String;

    move-result-object v0

    .line 817
    .local v0, "projectDesc":Ljava/lang/String;
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getProjectFields()Ljava/util/List;

    move-result-object v1

    .line 818
    .local v1, "projectFields":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getProjectTagString()Ljava/lang/String;

    move-result-object v2

    .line 819
    .local v2, "projectTags":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2a

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2a

    if-eqz v1, :cond_2a

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2a

    .line 820
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 821
    :cond_2a
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->disableActionBarRightNav()V

    .line 825
    :goto_2d
    return-void

    .line 823
    :cond_2e
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->enableActionBarRightNav()V

    goto :goto_2d
.end method

.method private getFocusChangeListerForLayout(Landroid/view/View;)Landroid/view/View$OnFocusChangeListener;
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 336
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$5;

    invoke-direct {v0, p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$5;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;Landroid/view/View;)V

    return-object v0
.end method

.method private getProjectDesc()Ljava/lang/String;
    .registers 2

    .prologue
    .line 802
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectDescEditTxt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getProjectFields()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;"
        }
    .end annotation

    .prologue
    .line 806
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedField:Ljava/util/List;

    return-object v0
.end method

.method private getProjectTagString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 811
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectTagsEditTxt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getProjectTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 798
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectNameTxtView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private handleEnableShareOnFacebookBtnClick()V
    .registers 2

    .prologue
    .line 369
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v0, :cond_e

    .line 370
    iget-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    if-eqz v0, :cond_f

    .line 371
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    .line 372
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnFacebookBtnImage()V

    .line 377
    :cond_e
    :goto_e
    return-void

    .line 374
    :cond_f
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->checkFacebookAuthAndEnableSharing()V

    goto :goto_e
.end method

.method private handleEnableShareOnTwitterBtnClick()V
    .registers 2

    .prologue
    .line 479
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v0, :cond_e

    .line 480
    iget-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    if-eqz v0, :cond_f

    .line 481
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    .line 485
    :goto_b
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnTwitterBtnImage()V

    .line 487
    :cond_e
    return-void

    .line 483
    :cond_f
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->checkIfUserHasLoggedIntoTwitter()V

    goto :goto_b
.end method

.method private handleFacebookAuthActivityResult()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 566
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_28

    .line 567
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 568
    .local v0, "activeSession":Lcom/facebook/Session;
    if-eqz v0, :cond_3f

    invoke-virtual {v0}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/SessionState;->isOpened()Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 569
    const-string v1, "publish_actions"

    invoke-virtual {v0, v1}, Lcom/facebook/Session;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 570
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->showProgressBar()V

    .line 571
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    invoke-virtual {v1, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->loadFacebookUserId(Lcom/facebook/Session;)V

    .line 589
    .end local v0    # "activeSession":Lcom/facebook/Session;
    :cond_28
    :goto_28
    return-void

    .line 574
    .restart local v0    # "activeSession":Lcom/facebook/Session;
    :cond_29
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_social_account_fb_auth_permissions_failure:I

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 575
    iput-boolean v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    .line 576
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnFacebookBtnImage()V

    .line 577
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateFacebookAccountAuthStatus()V

    goto :goto_28

    .line 581
    :cond_3f
    if-eqz v0, :cond_59

    invoke-virtual {v0}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v1

    sget-object v2, Lcom/facebook/SessionState;->CLOSED_LOGIN_FAILED:Lcom/facebook/SessionState;

    if-ne v1, v2, :cond_59

    .line 582
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_social_account_fb_auth_failure:I

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 583
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateFacebookAccountAuthStatus()V

    .line 585
    :cond_59
    iput-boolean v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    .line 586
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnFacebookBtnImage()V

    goto :goto_28
.end method

.method private hideProgressBar()V
    .registers 3

    .prologue
    .line 655
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->publishProjectProgressbar:Landroid/view/View;

    if-eqz v0, :cond_b

    .line 656
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->publishProjectProgressbar:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 658
    :cond_b
    return-void
.end method

.method private invokePublishProjectService()V
    .registers 25

    .prologue
    .line 661
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->populateProjectDetails()V

    .line 663
    const/4 v5, 0x1

    .line 664
    .local v5, "allTagsValid":Z
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getProjectTagString()Ljava/lang/String;

    move-result-object v10

    .line 665
    .local v10, "projectTagsStr":Ljava/lang/String;
    invoke-static {v10}, Lcom/behance/sdk/util/BehanceSDKUtils;->cleanUpTagsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 666
    const-string v21, ","

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v16

    .line 667
    .local v16, "tagsArray":[Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 668
    .local v7, "finalTagStringForServer":Ljava/lang/StringBuilder;
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v22, v0

    const/16 v21, 0x0

    :goto_20
    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_46

    aget-object v15, v16, v21

    .line 669
    .local v15, "tagStr":Ljava/lang/String;
    invoke-virtual {v15}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    .line 670
    .local v14, "tag":Ljava/lang/String;
    invoke-static {v14}, Lcom/behance/sdk/util/BehanceSDKUtils;->isTagValidForProjectAndWIP(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_45

    .line 671
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v23

    if-lez v23, :cond_3f

    .line 672
    const-string v23, "|"

    move-object/from16 v0, v23

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 674
    :cond_3f
    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 668
    add-int/lit8 v21, v21, 0x1

    goto :goto_20

    .line 676
    :cond_45
    const/4 v5, 0x0

    .line 681
    .end local v14    # "tag":Ljava/lang/String;
    .end local v15    # "tagStr":Ljava/lang/String;
    :cond_46
    if-eqz v5, :cond_2d3

    .line 682
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->hideSoftKeyBoardIfActive(Landroid/view/View;)V

    .line 683
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->showProgressBar()V

    .line 684
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->setEnabledInfoScreen(Z)V

    .line 686
    new-instance v13, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;

    invoke-direct {v13}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;-><init>()V

    .line 687
    .local v13, "serviceParams":Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v20

    .line 688
    .local v20, "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    invoke-interface/range {v20 .. v20}, Lcom/behance/sdk/IBehanceSDKUserCredentials;->getClientId()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setAppClientId(Ljava/lang/String;)V

    .line 689
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getNotificationHandlerActivityClass()Ljava/lang/Class;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setNotificationHandlerActivity(Ljava/lang/Class;)V

    .line 691
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->isProjectContainsAdultContent()Z

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setProjectContainsAdultContent(Z)V

    .line 692
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getCopyrightOption()Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->getValue()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setProjectCopyright(Ljava/lang/String;)V

    .line 693
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getSelectedCoverImage()Lcom/behance/sdk/project/modules/CoverImage;

    move-result-object v12

    .line 694
    .local v12, "selectedCoverImage":Lcom/behance/sdk/project/modules/CoverImage;
    invoke-virtual {v12}, Lcom/behance/sdk/project/modules/CoverImage;->getByteArray()[B

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setProjectCoverImageByteArray([B)V

    .line 695
    invoke-virtual {v12}, Lcom/behance/sdk/project/modules/CoverImage;->getName()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setProjectCoverImageFileName(Ljava/lang/String;)V

    .line 696
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectFields()Ljava/util/List;

    move-result-object v21

    const-string v22, "|"

    invoke-static/range {v21 .. v22}, Lcom/behance/sdk/util/BehanceSDKUtils;->getCreativeFieldsString(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 697
    .local v9, "projectCreativeFields":Ljava/lang/String;
    invoke-virtual {v13, v9}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setProjectCreativeFields(Ljava/lang/String;)V

    .line 698
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectDescription()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setProjectDescription(Ljava/lang/String;)V

    .line 699
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectModules()Ljava/util/List;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setProjectModules(Ljava/util/List;)V

    .line 700
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setProjectTags(Ljava/lang/String;)V

    .line 701
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectTitle()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setProjectTitle(Ljava/lang/String;)V

    .line 703
    const/16 v18, 0x0

    .line 704
    .local v18, "updateFacebookAccount":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    move/from16 v21, v0

    if-eqz v21, :cond_127

    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->isFacebookAccountAuthenticatedToPublish()Z

    move-result v21

    if-nez v21, :cond_127

    .line 705
    const/16 v21, 0x0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    .line 708
    :cond_127
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    move/from16 v21, v0

    if-eqz v21, :cond_26c

    .line 709
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v21

    if-nez v21, :cond_148

    .line 710
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setSharingEnabledLastTime(Z)V

    .line 711
    const/16 v18, 0x1

    .line 720
    :cond_148
    :goto_148
    if-eqz v18, :cond_159

    .line 721
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->updateAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 724
    :cond_159
    const/16 v19, 0x0

    .line 726
    .local v19, "updateTwitterAccount":Z
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->isTwitterAccountAuthenticated()Z

    move-result v4

    .line 727
    .local v4, "TwitterAccountAuthenticated":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    if-eqz v21, :cond_182

    .line 728
    if-eqz v4, :cond_28f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v21

    if-nez v21, :cond_28f

    .line 729
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 730
    const/16 v19, 0x1

    .line 736
    :cond_182
    :goto_182
    if-nez v4, :cond_194

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    move/from16 v21, v0

    if-eqz v21, :cond_194

    .line 737
    const/16 v21, 0x0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    .line 740
    :cond_194
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    move/from16 v21, v0

    if-eqz v21, :cond_2ac

    .line 741
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v21

    if-nez v21, :cond_1b5

    .line 742
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setSharingEnabledLastTime(Z)V

    .line 743
    const/16 v19, 0x1

    .line 752
    :cond_1b5
    :goto_1b5
    if-eqz v19, :cond_1c6

    .line 753
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->updateAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 756
    :cond_1c6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setShareOnFacebook(Z)V

    .line 757
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setShareOnTwitter(Z)V

    .line 758
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    move/from16 v21, v0

    if-eqz v21, :cond_220

    .line 759
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setTwitterUserAccessToken(Ljava/lang/String;)V

    .line 760
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setTwitterUserAccessTokenSecret(Ljava/lang/String;)V

    .line 761
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setTwitterConsumerKey(Ljava/lang/String;)V

    .line 762
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->setTwitterConsumerSecret(Ljava/lang/String;)V

    .line 765
    :cond_220
    new-instance v8, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v21

    const-class v22, Lcom/behance/sdk/services/BehanceSDKPublishProjectService;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v8, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 766
    .local v8, "intent":Landroid/content/Intent;
    const-string v21, "INTENT_EXTRA_PARAMS"

    move-object/from16 v0, v21

    invoke-virtual {v8, v0, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 767
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v11

    .line 768
    .local v11, "publishProjectComponent":Landroid/content/ComponentName;
    sget v6, Lcom/behance/sdk/R$string;->bsdk_add_content_project_publish_service_initialize_error_msg:I

    .line 769
    .local v6, "displayMsgResourceId":I
    if-eqz v11, :cond_2cf

    .line 770
    sget v6, Lcom/behance/sdk/R$string;->bsdk_add_content_project_publish_initiated_msg:I

    .line 774
    :goto_246
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v21

    const/16 v22, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-static {v0, v6, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/widget/Toast;->show()V

    .line 776
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->finishWorkflow()V

    .line 777
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v21

    check-cast v21, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->closeThisActivity(Z)V

    .line 784
    .end local v4    # "TwitterAccountAuthenticated":Z
    .end local v6    # "displayMsgResourceId":I
    .end local v8    # "intent":Landroid/content/Intent;
    .end local v9    # "projectCreativeFields":Ljava/lang/String;
    .end local v11    # "publishProjectComponent":Landroid/content/ComponentName;
    .end local v12    # "selectedCoverImage":Lcom/behance/sdk/project/modules/CoverImage;
    .end local v13    # "serviceParams":Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .end local v18    # "updateFacebookAccount":Z
    .end local v19    # "updateTwitterAccount":Z
    .end local v20    # "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    :goto_26b
    return-void

    .line 714
    .restart local v9    # "projectCreativeFields":Ljava/lang/String;
    .restart local v12    # "selectedCoverImage":Lcom/behance/sdk/project/modules/CoverImage;
    .restart local v13    # "serviceParams":Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .restart local v18    # "updateFacebookAccount":Z
    .restart local v20    # "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    :cond_26c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    if-eqz v21, :cond_148

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v21

    if-eqz v21, :cond_148

    .line 715
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setSharingEnabledLastTime(Z)V

    .line 716
    const/16 v18, 0x1

    goto/16 :goto_148

    .line 731
    .restart local v4    # "TwitterAccountAuthenticated":Z
    .restart local v19    # "updateTwitterAccount":Z
    :cond_28f
    if-nez v4, :cond_182

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v21

    if-eqz v21, :cond_182

    .line 732
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 733
    const/16 v19, 0x1

    goto/16 :goto_182

    .line 746
    :cond_2ac
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    if-eqz v21, :cond_1b5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v21

    if-eqz v21, :cond_1b5

    .line 747
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setSharingEnabledLastTime(Z)V

    .line 748
    const/16 v19, 0x1

    goto/16 :goto_1b5

    .line 772
    .restart local v6    # "displayMsgResourceId":I
    .restart local v8    # "intent":Landroid/content/Intent;
    .restart local v11    # "publishProjectComponent":Landroid/content/ComponentName;
    :cond_2cf
    sget v6, Lcom/behance/sdk/R$string;->bsdk_add_content_project_publish_service_initialize_error_msg:I

    goto/16 :goto_246

    .line 779
    .end local v4    # "TwitterAccountAuthenticated":Z
    .end local v6    # "displayMsgResourceId":I
    .end local v8    # "intent":Landroid/content/Intent;
    .end local v9    # "projectCreativeFields":Ljava/lang/String;
    .end local v11    # "publishProjectComponent":Landroid/content/ComponentName;
    .end local v12    # "selectedCoverImage":Lcom/behance/sdk/project/modules/CoverImage;
    .end local v13    # "serviceParams":Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
    .end local v18    # "updateFacebookAccount":Z
    .end local v19    # "updateTwitterAccount":Z
    .end local v20    # "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    :cond_2d3
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v21

    sget v22, Lcom/behance/sdk/R$string;->bsdk_add_content_project_publish_invalid_tag_msg:I

    const/16 v23, 0x1

    invoke-static/range {v21 .. v23}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v17

    .line 780
    .local v17, "toast":Landroid/widget/Toast;
    const/16 v21, 0x11

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/Toast;->setGravity(III)V

    .line 781
    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    .line 782
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectTagsEditTxt:Landroid/widget/EditText;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/EditText;->requestFocus()Z

    goto/16 :goto_26b
.end method

.method private isFacebookAccountAuthenticatedToPublish()Z
    .registers 7

    .prologue
    const/4 v3, 0x1

    .line 416
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 417
    .local v0, "activeSession":Lcom/facebook/Session;
    if-eqz v0, :cond_16

    invoke-virtual {v0}, Lcom/facebook/Session;->isOpened()Z

    move-result v4

    if-eqz v4, :cond_16

    .line 418
    const-string v4, "publish_actions"

    invoke-virtual {v0, v4}, Lcom/facebook/Session;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3e

    .line 437
    :cond_15
    :goto_15
    return v3

    .line 422
    :cond_16
    new-instance v4, Lcom/facebook/Session$Builder;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/facebook/Session$Builder;-><init>(Landroid/content/Context;)V

    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v5}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/facebook/Session$Builder;->setApplicationId(Ljava/lang/String;)Lcom/facebook/Session$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/facebook/Session$Builder;->build()Lcom/facebook/Session;

    move-result-object v2

    .line 423
    .local v2, "session":Lcom/facebook/Session;
    invoke-static {v2}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 424
    invoke-virtual {v2}, Lcom/facebook/Session;->isOpened()Z

    move-result v4

    if-eqz v4, :cond_40

    .line 425
    const-string v4, "publish_actions"

    invoke-virtual {v2, v4}, Lcom/facebook/Session;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_15

    .line 437
    .end local v2    # "session":Lcom/facebook/Session;
    :cond_3e
    const/4 v3, 0x0

    goto :goto_15

    .line 428
    .restart local v2    # "session":Lcom/facebook/Session;
    :cond_40
    invoke-virtual {v2}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v4

    sget-object v5, Lcom/facebook/SessionState;->CREATED_TOKEN_LOADED:Lcom/facebook/SessionState;

    if-ne v4, v5, :cond_3e

    .line 430
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->createFacebookSessionRequest()Lcom/facebook/Session$OpenRequest;

    move-result-object v1

    .line 431
    .local v1, "openRequest":Lcom/facebook/Session$OpenRequest;
    invoke-virtual {v2, v1}, Lcom/facebook/Session;->openForPublish(Lcom/facebook/Session$OpenRequest;)V

    .line 432
    const-string v4, "publish_actions"

    invoke-virtual {v2, v4}, Lcom/facebook/Session;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3e

    goto :goto_15
.end method

.method private isTwitterAccountAuthenticated()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 465
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v3, :cond_21

    .line 466
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v0

    .line 467
    .local v0, "accessToken":Ljava/lang/String;
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v1

    .line 468
    .local v1, "accessTokenSecret":Ljava/lang/String;
    if-eqz v0, :cond_21

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_21

    if-eqz v1, :cond_21

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_22

    .line 474
    .end local v0    # "accessToken":Ljava/lang/String;
    .end local v1    # "accessTokenSecret":Ljava/lang/String;
    :cond_21
    :goto_21
    return v2

    .line 471
    .restart local v0    # "accessToken":Ljava/lang/String;
    .restart local v1    # "accessTokenSecret":Ljava/lang/String;
    :cond_22
    const/4 v2, 0x1

    goto :goto_21
.end method

.method private launchTwitterLoginActivity()V
    .registers 4

    .prologue
    .line 524
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/behance/sdk/ui/activities/BehanceSDKLoginToTwitterActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 525
    .local v0, "detailIntent":Landroid/content/Intent;
    const v1, 0xddd6

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 526
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->closeLoginToTwitterConfirmationDialog()V

    .line 527
    return-void
.end method

.method private loadCoverImage(Lcom/behance/sdk/project/modules/CoverImage;)V
    .registers 4
    .param p1, "cover"    # Lcom/behance/sdk/project/modules/CoverImage;

    .prologue
    .line 644
    if-eqz p1, :cond_b

    .line 645
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->coverImageView:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/behance/sdk/project/modules/CoverImage;->getBitMap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 646
    :cond_b
    return-void
.end method

.method private populateProjectDetails()V
    .registers 3

    .prologue
    .line 787
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getProjectTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setProjectTitle(Ljava/lang/String;)V

    .line 788
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getProjectTagString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setProjectTags(Ljava/lang/String;)V

    .line 789
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getProjectFields()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setProjectFields(Ljava/util/List;)V

    .line 790
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getProjectDesc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setProjectDescription(Ljava/lang/String;)V

    .line 791
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setCopyrightOption(Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V

    .line 792
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    iget-boolean v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    invoke-virtual {v0, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setShareOnFaceBook(Z)V

    .line 793
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    iget-boolean v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    invoke-virtual {v0, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setShareOnTwitter(Z)V

    .line 794
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->adultContentCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setContainsAdultContent(Z)V

    .line 795
    return-void
.end method

.method private setEnabledInfoScreen(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 110
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectNameTxtView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 111
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectDescEditTxt:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 112
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectFilterFieldsButton:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 113
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectTagsEditTxt:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 114
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectCopyrightsButton:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 115
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->adultContentCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 116
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 117
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 118
    if-eqz p1, :cond_2e

    .line 119
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->enableActionBarRightNav()V

    .line 122
    :goto_2d
    return-void

    .line 121
    :cond_2e
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->disableActionBarRightNav()V

    goto :goto_2d
.end method

.method private setSelectedCreativeFieldsText()V
    .registers 4

    .prologue
    .line 638
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedField:Ljava/util/List;

    const-string v2, ","

    invoke-static {v1, v2}, Lcom/behance/sdk/util/BehanceSDKUtils;->getCreativeFieldsString(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 639
    .local v0, "creativeFieldsString":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 640
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectFilterFieldsButton:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 641
    :cond_13
    return-void
.end method

.method private showProgressBar()V
    .registers 3

    .prologue
    .line 649
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->publishProjectProgressbar:Landroid/view/View;

    if-eqz v0, :cond_a

    .line 650
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->publishProjectProgressbar:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 652
    :cond_a
    return-void
.end method

.method private updateFacebookAccountAuthStatus()V
    .registers 5

    .prologue
    .line 450
    const/4 v1, 0x0

    .line 451
    .local v1, "updateFacebookAccount":Z
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->isFacebookAccountAuthenticatedToPublish()Z

    move-result v0

    .line 452
    .local v0, "facebookAccountAuthenticated":Z
    if-eqz v0, :cond_20

    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v2

    if-nez v2, :cond_20

    .line 453
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 454
    const/4 v1, 0x1

    .line 459
    :cond_16
    :goto_16
    if-eqz v1, :cond_1f

    .line 460
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v2, v3}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->updateAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 462
    :cond_1f
    return-void

    .line 455
    :cond_20
    if-nez v0, :cond_16

    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 456
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 457
    const/4 v1, 0x1

    goto :goto_16
.end method

.method private updateProjectDetailsInUI()V
    .registers 7

    .prologue
    .line 278
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v3}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectTitle()Ljava/lang/String;

    move-result-object v1

    .line 279
    .local v1, "projectName":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_11

    .line 280
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectNameTxtView:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    :cond_11
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v3}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectDescription()Ljava/lang/String;

    move-result-object v0

    .line 283
    .local v0, "projectDescStr":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_22

    .line 284
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectDescEditTxt:Landroid/widget/EditText;

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 286
    :cond_22
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v3}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectFields()Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedField:Ljava/util/List;

    .line 287
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedField:Ljava/util/List;

    if-eqz v3, :cond_39

    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedField:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_39

    .line 288
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->setSelectedCreativeFieldsText()V

    .line 289
    :cond_39
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v3}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getProjectTags()Ljava/lang/String;

    move-result-object v2

    .line 290
    .local v2, "tagsString":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4a

    .line 291
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectTagsEditTxt:Landroid/widget/EditText;

    invoke-virtual {v3, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 293
    :cond_4a
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v3}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getCopyrightOption()Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 294
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectCopyrightsButton:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 295
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->adultContentCheckBox:Landroid/widget/CheckBox;

    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v4}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->isProjectContainsAdultContent()Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 296
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnFacebookBtnImage()V

    .line 297
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnTwitterBtnImage()V

    .line 298
    return-void
.end method

.method private updateShareOnFacebookBtnImage()V
    .registers 3

    .prologue
    .line 380
    iget-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    if-eqz v0, :cond_c

    .line 381
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    sget v1, Lcom/behance/sdk/R$drawable;->bsdk_icon_addcontent_publish_shareon_facebook_on:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 385
    :goto_b
    return-void

    .line 383
    :cond_c
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    sget v1, Lcom/behance/sdk/R$drawable;->bsdk_icon_addcontent_publish_shareon_facebook_off:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_b
.end method

.method private updateShareOnTwitterBtnImage()V
    .registers 3

    .prologue
    .line 511
    iget-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    if-eqz v0, :cond_c

    .line 512
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    sget v1, Lcom/behance/sdk/R$drawable;->bsdk_icon_addcontent_publish_shareon_twitter_on:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 516
    :goto_b
    return-void

    .line 514
    :cond_c
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    sget v1, Lcom/behance/sdk/R$drawable;->bsdk_icon_addcontent_publish_shareon_twitter_off:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_b
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 634
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->enableOrDisablePublishButton()V

    .line 635
    return-void
.end method

.method protected backButtonPressed()V
    .registers 2

    .prologue
    .line 302
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->populateProjectDetails()V

    .line 303
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->hideSoftKeyBoardIfActive(Landroid/view/View;)V

    .line 304
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->backButtonPressed()V

    .line 305
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 626
    return-void
.end method

.method public coverImageChanges(Lcom/behance/sdk/project/modules/CoverImage;)V
    .registers 2
    .param p1, "coverImage"    # Lcom/behance/sdk/project/modules/CoverImage;

    .prologue
    .line 520
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loadCoverImage(Lcom/behance/sdk/project/modules/CoverImage;)V

    .line 521
    return-void
.end method

.method protected getBackButtonID()I
    .registers 2

    .prologue
    .line 350
    sget v0, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentTitlebarBackBtnLayout:I

    return v0
.end method

.method protected getForwardButtonID()I
    .registers 2

    .prologue
    .line 360
    sget v0, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentTitlebarActionBtnTxtView:I

    return v0
.end method

.method protected getForwardButtonText()I
    .registers 2

    .prologue
    .line 365
    sget v0, Lcom/behance/sdk/R$string;->bsdk_add_content_project_publish_right_navigation:I

    return v0
.end method

.method protected getLayout()I
    .registers 2

    .prologue
    .line 126
    sget v0, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_publish_project_details:I

    return v0
.end method

.method protected getTitle()I
    .registers 2

    .prologue
    .line 829
    sget v0, Lcom/behance/sdk/R$string;->bsdk_add_content_project_publish_title:I

    return v0
.end method

.method protected getTitleViewID()I
    .registers 2

    .prologue
    .line 355
    sget v0, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentTitlebarTitleTxtView:I

    return v0
.end method

.method public handleTwitterAuthenticationFailure()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 616
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 617
    iput-boolean v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    .line 618
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnTwitterBtnImage()V

    .line 619
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$string;->bsdk_social_account_twitter_login_authentication_failure:I

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 621
    :cond_19
    return-void
.end method

.method public handleTwitterAuthenticationSuccess()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 605
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 606
    iput-boolean v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    .line 607
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnTwitterBtnImage()V

    .line 609
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .line 610
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v0, v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 611
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->updateAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 613
    :cond_22
    return-void
.end method

.method protected nextButtonPressed()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 309
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 310
    .local v0, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_1d

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 311
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->invokePublishProjectService()V

    .line 317
    :goto_1c
    return-void

    .line 313
    :cond_1d
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$string;->bsdk_connection_error_msg:I

    invoke-virtual {p0, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 314
    .local v1, "toast":Landroid/widget/Toast;
    const/16 v2, 0x11

    invoke-virtual {v1, v2, v5, v5}, Landroid/widget/Toast;->setGravity(III)V

    .line 315
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_1c
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 543
    invoke-super {p0, p1, p2, p3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 544
    const v1, 0xddd6

    if-ne p1, v1, :cond_14

    .line 545
    packed-switch p2, :pswitch_data_26

    .line 563
    :goto_b
    return-void

    .line 548
    :pswitch_c
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->handleTwitterAuthenticationFailure()V

    goto :goto_b

    .line 551
    :pswitch_10
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->handleTwitterAuthenticationSuccess()V

    goto :goto_b

    .line 557
    :cond_14
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 558
    .local v0, "activeSession":Lcom/facebook/Session;
    if-eqz v0, :cond_21

    .line 559
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/facebook/Session;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    .line 561
    :cond_21
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->handleFacebookAuthActivityResult()V

    goto :goto_b

    .line 545
    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_c
        :pswitch_10
        :pswitch_c
    .end packed-switch
.end method

.method public onCopyrightSettingSelected(Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V
    .registers 5
    .param p1, "copyRightSetting"    # Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .prologue
    .line 841
    if-eqz p1, :cond_4

    .line 842
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 843
    :cond_4
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectCopyrightsButton:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 844
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->enableOrDisablePublishButton()V

    .line 845
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 15
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v10, 0x8

    const/4 v9, 0x0

    .line 143
    invoke-super {p0, p1, p2, p3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 145
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->disableActionBarRightNav()V

    .line 147
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-static {v6}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getInstance(Landroid/content/Context;)Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    .line 148
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v6, v7}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .line 149
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v6, v7}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .line 151
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    .line 152
    .local v3, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    const-string v6, "HEADLESS_FRAGMENT_TAG_PUBLISH_PROJECT"

    invoke-virtual {v3, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v6

    check-cast v6, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    .line 153
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    if-nez v6, :cond_5b

    .line 154
    new-instance v6, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    invoke-direct {v6}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;-><init>()V

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    .line 155
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v6

    iget-object v7, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    const-string v8, "HEADLESS_FRAGMENT_TAG_PUBLISH_PROJECT"

    invoke-virtual {v6, v7, v8}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 157
    :cond_5b
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    invoke-virtual {v6, p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;)V

    .line 159
    const-string v6, "FRAGMENT_TAG_CREATIVE_FIELDS_FILTER_DIALOG"

    invoke-virtual {v3, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    .line 160
    .local v2, "creativeFieldsDialog":Landroid/support/v4/app/Fragment;
    instance-of v6, v2, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;

    if-eqz v6, :cond_71

    .line 161
    check-cast v2, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;

    .end local v2    # "creativeFieldsDialog":Landroid/support/v4/app/Fragment;
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    invoke-virtual {v2, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;)V

    .line 164
    :cond_71
    const-string v6, "FRAGMENT_TAG_COPYRIGHT_SETTINGS_DIALOG"

    invoke-virtual {v3, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 165
    .local v0, "copyrightSettingsDialog":Landroid/support/v4/app/Fragment;
    instance-of v6, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;

    if-eqz v6, :cond_82

    .line 166
    check-cast v0, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;

    .end local v0    # "copyrightSettingsDialog":Landroid/support/v4/app/Fragment;
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    invoke-virtual {v0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog$Callbacks;)V

    .line 168
    :cond_82
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentCoverImage:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->coverImageView:Landroid/widget/ImageView;

    .line 169
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v6}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getSelectedCoverImage()Lcom/behance/sdk/project/modules/CoverImage;

    move-result-object v1

    .line 170
    .local v1, "cover":Lcom/behance/sdk/project/modules/CoverImage;
    invoke-direct {p0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->loadCoverImage(Lcom/behance/sdk/project/modules/CoverImage;)V

    .line 171
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentProjectNameLayout:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 172
    .local v4, "projectNameLayout":Landroid/view/View;
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentProjectName:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectNameTxtView:Landroid/widget/TextView;

    .line 173
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectNameTxtView:Landroid/widget/TextView;

    invoke-virtual {v6, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 174
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectNameTxtView:Landroid/widget/TextView;

    invoke-direct {p0, v4}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getFocusChangeListerForLayout(Landroid/view/View;)Landroid/view/View$OnFocusChangeListener;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 175
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentProjectDescription:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectDescEditTxt:Landroid/widget/EditText;

    .line 176
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectDescEditTxt:Landroid/widget/EditText;

    invoke-virtual {v6, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 177
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentCreativeFields:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectFilterFieldsButton:Landroid/widget/TextView;

    .line 178
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectFilterFieldsButton:Landroid/widget/TextView;

    new-instance v7, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$1;

    invoke-direct {v7, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$1;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentTags:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectTagsEditTxt:Landroid/widget/EditText;

    .line 194
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectTagsEditTxt:Landroid/widget/EditText;

    invoke-virtual {v6, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 195
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentCopyrightSettings:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectCopyrightsButton:Landroid/widget/TextView;

    .line 197
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->projectCopyrightsButton:Landroid/widget/TextView;

    new-instance v7, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$2;

    invoke-direct {v7, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$2;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentAdultContentCheckbox:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/CheckBox;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->adultContentCheckBox:Landroid/widget/CheckBox;

    .line 212
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->projectPublishProgressBar:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->publishProjectProgressbar:Landroid/view/View;

    .line 214
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentTwitterIcon:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    .line 215
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v6}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->isHideTwitterSharing()Z

    move-result v6

    if-eqz v6, :cond_136

    .line 216
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 218
    :cond_136
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    new-instance v7, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$3;

    invoke-direct {v7, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$3;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 226
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentFacebookIcon:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    .line 227
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v6}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->isHideFacebookSharing()Z

    move-result v6

    if-eqz v6, :cond_159

    .line 228
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 230
    :cond_159
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    new-instance v7, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$4;

    invoke-direct {v7, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment$4;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 237
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v6}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->isHideFacebookSharing()Z

    move-result v6

    if-eqz v6, :cond_17e

    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v6}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->isHideTwitterSharing()Z

    move-result v6

    if-eqz v6, :cond_17e

    .line 238
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v7, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentShareOnLayout:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 239
    .local v5, "shareLayout":Landroid/view/View;
    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    .line 242
    .end local v5    # "shareLayout":Landroid/view/View;
    :cond_17e
    if-nez p3, :cond_1cb

    .line 244
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v6, :cond_1c5

    .line 245
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v6}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v6

    iput-boolean v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    .line 250
    :goto_18c
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v6, :cond_1c8

    .line 251
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v6}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v6

    iput-boolean v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    .line 260
    :goto_198
    iget-boolean v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    if-eqz v6, :cond_1a4

    .line 261
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->isFacebookAccountAuthenticatedToPublish()Z

    move-result v6

    if-nez v6, :cond_1a4

    .line 262
    iput-boolean v9, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    .line 266
    :cond_1a4
    iget-boolean v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    if-eqz v6, :cond_1b0

    .line 267
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->isTwitterAccountAuthenticated()Z

    move-result v6

    if-nez v6, :cond_1b0

    .line 268
    iput-boolean v9, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    .line 272
    :cond_1b0
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateProjectDetailsInUI()V

    .line 273
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    iget-object v7, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    sget v8, Lcom/behance/sdk/R$id;->bsdkPublishProjectPublishFragmentLayout:I

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/behance/sdk/util/BehanceSDKUtils;->setContentViewDimensions(Landroid/content/Context;Landroid/view/View;)V

    .line 274
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->rootView:Landroid/view/View;

    return-object v6

    .line 247
    :cond_1c5
    iput-boolean v9, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    goto :goto_18c

    .line 253
    :cond_1c8
    iput-boolean v9, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    goto :goto_198

    .line 256
    :cond_1cb
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v6}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getShareOnFaceBook()Z

    move-result v6

    iput-boolean v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    .line 257
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v6}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getShareOnTwitter()Z

    move-result v6

    iput-boolean v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnTwitter:Z

    goto :goto_198
.end method

.method public onCreativeFieldsSelected(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 834
    .local p1, "selectedField":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->selectedField:Ljava/util/List;

    .line 835
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->setSelectedCreativeFieldsText()V

    .line 836
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->enableOrDisablePublishButton()V

    .line 837
    return-void
.end method

.method public onDetach()V
    .registers 3

    .prologue
    .line 327
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onDetach()V

    .line 328
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    if-eqz v0, :cond_d

    .line 329
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;)V

    .line 331
    :cond_d
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->closeLoginToTwitterConfirmationDialog()V

    .line 332
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->closeLoginToFacebookConfirmationDialog()V

    .line 333
    return-void
.end method

.method public onGetFacebookUserIdComplete(Ljava/lang/String;)V
    .registers 3
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 593
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 594
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->shareOnFacebook:Z

    .line 595
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateShareOnFacebookBtnImage()V

    .line 596
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v0, :cond_18

    .line 597
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserId(Ljava/lang/String;)V

    .line 598
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->updateFacebookAccountAuthStatus()V

    .line 600
    :cond_18
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->hideProgressBar()V

    .line 602
    :cond_1b
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "out"    # Landroid/os/Bundle;

    .prologue
    .line 321
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 322
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->populateProjectDetails()V

    .line 323
    return-void
.end method

.method public onStart()V
    .registers 2

    .prologue
    .line 131
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onStart()V

    .line 132
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->addCoverImageChangeListener(Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;)V

    .line 133
    return-void
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 137
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onStop()V

    .line 138
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectDetailsFragment;->workflowManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->removeCoverImageChangeListener(Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$CoverImageChangeListener;)V

    .line 139
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 630
    return-void
.end method
