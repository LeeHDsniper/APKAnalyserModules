.class public Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "BehanceSDKPublishWIPDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;
.implements Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field adultContentCheckBox:Landroid/widget/CheckBox;

.field private allTextFieldsTextWatcher:Landroid/text/TextWatcher;

.field private callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;

.field private closeThisViewOnResume:Z

.field private facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

.field private facebookLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

.field private headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

.field private loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

.field private loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

.field private newWIPTitleDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;

.field private pickWIPRootContainer:Landroid/view/View;

.field private publishWIPBtnTxtView:Landroid/widget/TextView;

.field private publishWIPInfoRootContainer:Landroid/view/View;

.field private publishWipProgressbar:Landroid/view/View;

.field private rootView:Landroid/view/View;

.field private selectedWIPId:I

.field private selectedWIPImageModule:Lcom/behance/sdk/project/modules/ImageModule;

.field private selectedWIPTitle:Ljava/lang/String;

.field private selectedWIPTitleTxtView:Landroid/widget/TextView;

.field private shareOnFacebookBtnImageView:Landroid/widget/ImageView;

.field private shareOnTwitterBtnImageView:Landroid/widget/ImageView;

.field private shareOptionsView:Landroid/view/View;

.field private shareWIPOnFacebook:Z

.field private shareWIPOnTwitter:Z

.field private showNewWIPDialogBtnTxtView:Landroid/widget/TextView;

.field private showPickWIPsViewBtn:Landroid/view/View;

.field private socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

.field private titleBarTitleTextView:Landroid/widget/TextView;

.field private twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

.field private twitterLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

.field private userEnteredNewWIPTitle:Z

.field private userWIPsListView:Landroid/widget/ListView;

.field private viewFlipper:Landroid/widget/ViewFlipper;

.field private viewPaused:Z

.field private wipDescEditTxt:Landroid/widget/EditText;

.field private wipManager:Lcom/behance/sdk/managers/AddWIPManager;

.field private wipTagsEditTxt:Landroid/widget/EditText;

.field private wipThumbnailImageView:Landroid/widget/ImageView;

.field private wipTitleEditTxt:Landroid/widget/EditText;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 83
    const-class v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 80
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 132
    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewPaused:Z

    .line 133
    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeThisViewOnResume:Z

    .line 983
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$4;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$4;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->allTextFieldsTextWatcher:Landroid/text/TextWatcher;

    .line 1068
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$5;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$5;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    .line 1094
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$6;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$6;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private LoginToFacebook()V
    .registers 5

    .prologue
    .line 466
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->hideKeyboard()V

    .line 467
    new-instance v2, Lcom/facebook/Session$Builder;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/facebook/Session$Builder;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/facebook/Session$Builder;->setApplicationId(Ljava/lang/String;)Lcom/facebook/Session$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/Session$Builder;->build()Lcom/facebook/Session;

    move-result-object v1

    .line 468
    .local v1, "session":Lcom/facebook/Session;
    invoke-static {v1}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 469
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->createFacebookSessionRequest()Lcom/facebook/Session$OpenRequest;

    move-result-object v0

    .line 470
    .local v0, "openRequest":Lcom/facebook/Session$OpenRequest;
    invoke-virtual {v1, v0}, Lcom/facebook/Session;->openForPublish(Lcom/facebook/Session$OpenRequest;)V

    .line 471
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;
    .param p1, "x1"    # Landroid/widget/AdapterView;
    .param p2, "x2"    # Landroid/view/View;
    .param p3, "x3"    # I
    .param p4, "x4"    # J

    .prologue
    .line 80
    invoke-direct/range {p0 .. p5}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->onUserWIPsItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method static synthetic access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;

    return-object v0
.end method

.method static synthetic access$200(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updatePublishBtnState()V

    return-void
.end method

.method static synthetic access$300(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeLoginToTwitterConfirmationDialog()V

    return-void
.end method

.method static synthetic access$400(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->launchTwitterLoginActivity()V

    return-void
.end method

.method static synthetic access$500(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeLoginToFacebookConfirmationDialog()V

    return-void
.end method

.method static synthetic access$600(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->LoginToFacebook()V

    return-void
.end method

.method private allRequiredValuesForPublishAvaiable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "wipDescStr"    # Ljava/lang/String;
    .param p2, "wipTitleStr"    # Ljava/lang/String;
    .param p3, "wipTagsStr"    # Ljava/lang/String;

    .prologue
    .line 819
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    if-eqz v0, :cond_16

    iget v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    if-gtz v0, :cond_e

    invoke-direct {p0, p2}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->isStringEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 820
    :cond_e
    invoke-direct {p0, p3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->isStringEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 821
    const/4 v0, 0x1

    .line 823
    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private checkFacebookAuthAndEnableSharing()V
    .registers 2

    .prologue
    .line 446
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->isFacebookAccountAuthenticatedToPublish()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 447
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    .line 448
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnFacebookBtnImage()V

    .line 449
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateFacebookAccountAuthStatus()V

    .line 453
    :goto_f
    return-void

    .line 451
    :cond_10
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->displayFacebookLoginConfirmationDialog()V

    goto :goto_f
.end method

.method private checkIfUserHasLoggedIntoTwitter()V
    .registers 4

    .prologue
    .line 556
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v0

    .line 557
    .local v0, "accessToken":Ljava/lang/String;
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v1

    .line 558
    .local v1, "accessTokenSecret":Ljava/lang/String;
    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1c

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 559
    :cond_1c
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->displayTwitterLoginConfirmationDialog()V

    .line 564
    :goto_1f
    return-void

    .line 561
    :cond_20
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    .line 562
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnTwitterBtnImage()V

    goto :goto_1f
.end method

.method private closeLoginToFacebookConfirmationDialog()V
    .registers 2

    .prologue
    .line 429
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    if-eqz v0, :cond_9

    .line 430
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->dismiss()V

    .line 432
    :cond_9
    return-void
.end method

.method private closeLoginToTwitterConfirmationDialog()V
    .registers 2

    .prologue
    .line 423
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    if-eqz v0, :cond_9

    .line 424
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->dismiss()V

    .line 426
    :cond_9
    return-void
.end method

.method private closeThisView()V
    .registers 2

    .prologue
    .line 651
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeThisView(Z)V

    .line 652
    return-void
.end method

.method private closeThisView(Z)V
    .registers 4
    .param p1, "notifyCallbacks"    # Z

    .prologue
    .line 655
    iget-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewPaused:Z

    if-eqz v0, :cond_8

    .line 656
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeThisViewOnResume:Z

    .line 671
    :goto_7
    return-void

    .line 658
    :cond_8
    if-eqz p1, :cond_18

    .line 659
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;

    if-eqz v0, :cond_18

    .line 660
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$3;

    invoke-direct {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$3;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 669
    :cond_18
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->dismissAllowingStateLoss()V

    goto :goto_7
.end method

.method private createFacebookSessionRequest()Lcom/facebook/Session$OpenRequest;
    .registers 6

    .prologue
    .line 499
    new-instance v0, Lcom/facebook/Session$OpenRequest;

    invoke-direct {v0, p0}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/support/v4/app/Fragment;)V

    .line 500
    .local v0, "openRequest":Lcom/facebook/Session$OpenRequest;
    sget-object v2, Lcom/facebook/SessionDefaultAudience;->EVERYONE:Lcom/facebook/SessionDefaultAudience;

    invoke-virtual {v0, v2}, Lcom/facebook/Session$OpenRequest;->setDefaultAudience(Lcom/facebook/SessionDefaultAudience;)Lcom/facebook/Session$OpenRequest;

    .line 501
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "publish_actions"

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 502
    .local v1, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v0, v1}, Lcom/facebook/Session$OpenRequest;->setPermissions(Ljava/util/List;)Lcom/facebook/Session$OpenRequest;

    .line 503
    sget-object v2, Lcom/facebook/SessionLoginBehavior;->SSO_WITH_FALLBACK:Lcom/facebook/SessionLoginBehavior;

    invoke-virtual {v0, v2}, Lcom/facebook/Session$OpenRequest;->setLoginBehavior(Lcom/facebook/SessionLoginBehavior;)Lcom/facebook/Session$OpenRequest;

    .line 504
    return-object v0
.end method

.method private displayFacebookLoginConfirmationDialog()V
    .registers 6

    .prologue
    .line 456
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$string;->bsdk_social_account_facebook_login_confirmation_title:I

    sget v2, Lcom/behance/sdk/R$string;->bsdk_social_account_facebook_login_confirmation_body:I

    sget v3, Lcom/behance/sdk/R$string;->bsdk_social_account_facebook_login_confirmation_ok_btn_label:I

    sget v4, Lcom/behance/sdk/R$string;->bsdk_social_account_facebook_login_confirmation_cancel_btn_label:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->getInstance(Landroid/content/Context;IIII)Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    .line 460
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnNotOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 461
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 462
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToFacebookConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->show()V

    .line 463
    return-void
.end method

.method private displayNewWIPTitleDialog()V
    .registers 2

    .prologue
    .line 646
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->getInstance(Landroid/content/Context;Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog$Callbacks;)Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->newWIPTitleDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;

    .line 647
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->newWIPTitleDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKNewWIPTitleDialog;->show()V

    .line 648
    return-void
.end method

.method private displayPickWIPView(Z)V
    .registers 5
    .param p1, "animateViewDisplay"    # Z

    .prologue
    const/4 v1, 0x0

    .line 921
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->hideKeyboard()V

    .line 922
    if-eqz p1, :cond_3a

    .line 923
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_enter:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 924
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_exit:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 930
    :goto_1c
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWIPBtnTxtView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 931
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showNewWIPDialogBtnTxtView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 933
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->titleBarTitleTextView:Landroid/widget/TextView;

    sget v1, Lcom/behance/sdk/R$string;->bsdk_add_wip_pick_wip_view_titlebar_title_select_wip_label:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 934
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 936
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->setUserWIPsListAdapter()V

    .line 937
    return-void

    .line 926
    :cond_3a
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 927
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1c
.end method

.method private displayPublishView(Z)V
    .registers 6
    .param p1, "animateViewDisplay"    # Z

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 859
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    if-eqz v0, :cond_66

    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipThumbnailImageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_66

    .line 860
    if-eqz p1, :cond_67

    .line 861
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_enter:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 862
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_exit:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 868
    :goto_22
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipThumbnailImageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/behance/sdk/project/modules/ImageModule;->getThumbNail(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 870
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWIPBtnTxtView:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 871
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showNewWIPDialogBtnTxtView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 872
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updatePublishBtnState()V

    .line 874
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->titleBarTitleTextView:Landroid/widget/TextView;

    sget v1, Lcom/behance/sdk/R$string;->bsdk_wip_publish_view_titlebar_title_publish_label:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 876
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->isGetUserWIPsTaskInProgress()Z

    move-result v0

    if-eqz v0, :cond_72

    .line 877
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showPickWIPsViewBtn:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 878
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPTitleTxtView:Landroid/widget/TextView;

    sget v1, Lcom/behance/sdk/R$string;->bsdk_wip_publish_view_wips_loading_label:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 879
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 883
    :goto_61
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v3}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 885
    :cond_66
    return-void

    .line 864
    :cond_67
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 865
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    goto :goto_22

    .line 881
    :cond_72
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->populateSelectedWIPInPublishView()V

    goto :goto_61
.end method

.method private displayTwitterLoginConfirmationDialog()V
    .registers 6

    .prologue
    .line 567
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$string;->bsdk_social_account_twitter_login_confirmation_title:I

    sget v2, Lcom/behance/sdk/R$string;->bsdk_social_account_twitter_login_confirmation_body:I

    sget v3, Lcom/behance/sdk/R$string;->bsdk_social_account_twitter_login_confirmation_ok_btn_label:I

    sget v4, Lcom/behance/sdk/R$string;->bsdk_social_account_twitter_login_confirmation_cancel_btn_label:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->getInstance(Landroid/content/Context;IIII)Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    .line 571
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnNotOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 572
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterLoginConfirmDialogClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 573
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loginToTwitterConfirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->show()V

    .line 574
    return-void
.end method

.method private getFocusChangeListerForLayout(Landroid/view/View;)Landroid/view/View$OnFocusChangeListener;
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 343
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$2;

    invoke-direct {v0, p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$2;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;Landroid/view/View;)V

    return-object v0
.end method

.method public static getInstance(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKPublishWIPOptions;)Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;
    .registers 6
    .param p0, "callbacks"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;
    .param p1, "options"    # Lcom/behance/sdk/BehanceSDKPublishWIPOptions;

    .prologue
    .line 150
    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    invoke-direct {v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;-><init>()V

    .line 151
    .local v1, "instance":Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 152
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "ARGS_KEY_WIP_IMAGE_MODULE"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getWipRevisionImageModule()Lcom/behance/sdk/project/modules/ImageModule;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 153
    const-string v2, "ARGS_KEY_WIP_ID"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getExistingWIPId()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 154
    const-string v2, "ARGS_KEY_WIP_DESCRIPTION"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getWipDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    const-string v2, "ARGS_KEY_WIP_TAGS"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getWipTags()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const-string v2, "ARGS_KEY_WIP_TITLE"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->getWipTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    invoke-virtual {v1, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 159
    invoke-virtual {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;)V

    .line 160
    return-object v1
.end method

.method private handleBackBtnClick()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 612
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->hideKeyboard()V

    .line 613
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    .line 614
    .local v0, "displayedChild":I
    if-ne v0, v2, :cond_10

    .line 615
    invoke-direct {p0, v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->displayPublishView(Z)V

    .line 624
    :goto_f
    return-void

    .line 617
    :cond_10
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTypePublishUXCancel:Ljava/lang/String;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTargetBehanceWIP:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackSharingAction(Ljava/lang/String;Ljava/lang/String;)V

    .line 619
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    if-eqz v1, :cond_2a

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-virtual {v1}, Lcom/behance/sdk/project/modules/ImageModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v1

    sget-object v2, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    if-ne v1, v2, :cond_2a

    .line 620
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-virtual {v1}, Lcom/behance/sdk/project/modules/ImageModule;->deleteFromFileSystem()V

    .line 622
    :cond_2a
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeThisView()V

    goto :goto_f
.end method

.method private handleEnableShareOnFacebookBtnClick()V
    .registers 2

    .prologue
    .line 435
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v0, :cond_e

    .line 436
    iget-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    if-eqz v0, :cond_f

    .line 437
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    .line 438
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnFacebookBtnImage()V

    .line 443
    :cond_e
    :goto_e
    return-void

    .line 440
    :cond_f
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->checkFacebookAuthAndEnableSharing()V

    goto :goto_e
.end method

.method private handleEnableShareOnTwitterBtnClick()V
    .registers 2

    .prologue
    .line 545
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v0, :cond_e

    .line 546
    iget-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    if-eqz v0, :cond_f

    .line 547
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    .line 551
    :goto_b
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnTwitterBtnImage()V

    .line 553
    :cond_e
    return-void

    .line 549
    :cond_f
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->checkIfUserHasLoggedIntoTwitter()V

    goto :goto_b
.end method

.method private handleFacebookAuthActivityResult()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1043
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_28

    .line 1044
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 1045
    .local v0, "activeSession":Lcom/facebook/Session;
    if-eqz v0, :cond_3f

    invoke-virtual {v0}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/SessionState;->isOpened()Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 1046
    const-string v1, "publish_actions"

    invoke-virtual {v0, v1}, Lcom/facebook/Session;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 1047
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showMainProgressSpinner()V

    .line 1048
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-virtual {v1, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->loadFacebookUserId(Lcom/facebook/Session;)V

    .line 1066
    .end local v0    # "activeSession":Lcom/facebook/Session;
    :cond_28
    :goto_28
    return-void

    .line 1051
    .restart local v0    # "activeSession":Lcom/facebook/Session;
    :cond_29
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_social_account_fb_auth_permissions_failure:I

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1052
    iput-boolean v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    .line 1053
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnFacebookBtnImage()V

    .line 1054
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateFacebookAccountAuthStatus()V

    goto :goto_28

    .line 1058
    :cond_3f
    if-eqz v0, :cond_59

    invoke-virtual {v0}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v1

    sget-object v2, Lcom/facebook/SessionState;->CLOSED_LOGIN_FAILED:Lcom/facebook/SessionState;

    if-ne v1, v2, :cond_59

    .line 1059
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$string;->bsdk_social_account_fb_auth_failure:I

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1060
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateFacebookAccountAuthStatus()V

    .line 1062
    :cond_59
    iput-boolean v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    .line 1063
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnFacebookBtnImage()V

    goto :goto_28
.end method

.method private handleShowPickWIPsViewClick()V
    .registers 4

    .prologue
    .line 600
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-virtual {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->isGetUserWIPsTaskInProgress()Z

    move-result v1

    if-nez v1, :cond_1a

    .line 601
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-virtual {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsList()Ljava/util/List;

    move-result-object v0

    .line 602
    .local v0, "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    if-eqz v0, :cond_1b

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 603
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->displayPickWIPView(Z)V

    .line 609
    .end local v0    # "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    :cond_1a
    :goto_1a
    return-void

    .line 605
    .restart local v0    # "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    :cond_1b
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showPickWIPsViewBtn:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 606
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setVisibility(I)V

    goto :goto_1a
.end method

.method private hideKeyboard()V
    .registers 4

    .prologue
    .line 977
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    if-eqz v1, :cond_1a

    .line 978
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 979
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 981
    .end local v0    # "imm":Landroid/view/inputmethod/InputMethodManager;
    :cond_1a
    return-void
.end method

.method private hideMainProgressSpinner()V
    .registers 3

    .prologue
    .line 842
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWipProgressbar:Landroid/view/View;

    if-eqz v0, :cond_b

    .line 843
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWipProgressbar:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 845
    :cond_b
    return-void
.end method

.method private invokePublishWIPService()V
    .registers 25

    .prologue
    .line 674
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipDescEditTxt:Landroid/widget/EditText;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    .line 675
    .local v18, "wipDescStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v20

    .line 676
    .local v20, "wipTitleStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTagsEditTxt:Landroid/widget/EditText;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    .line 678
    .local v19, "wipTagsStr":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v20

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->allRequiredValuesForPublishAvaiable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_2db

    .line 681
    const/4 v5, 0x1

    .line 682
    .local v5, "allTagsValid":Z
    invoke-static/range {v19 .. v19}, Lcom/behance/sdk/util/BehanceSDKUtils;->cleanUpTagsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 683
    const-string v21, ","

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    .line 684
    .local v13, "tagsArray":[Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 685
    .local v7, "finalTagStringForServer":Ljava/lang/StringBuilder;
    array-length v0, v13

    move/from16 v22, v0

    const/16 v21, 0x0

    :goto_51
    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_77

    aget-object v12, v13, v21

    .line 686
    .local v12, "tagStr":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    .line 687
    .local v11, "tag":Ljava/lang/String;
    invoke-static {v11}, Lcom/behance/sdk/util/BehanceSDKUtils;->isTagValidForProjectAndWIP(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_76

    .line 688
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v23

    if-lez v23, :cond_70

    .line 689
    const-string v23, "|"

    move-object/from16 v0, v23

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 691
    :cond_70
    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 685
    add-int/lit8 v21, v21, 0x1

    goto :goto_51

    .line 693
    :cond_76
    const/4 v5, 0x0

    .line 698
    .end local v11    # "tag":Ljava/lang/String;
    .end local v12    # "tagStr":Ljava/lang/String;
    :cond_77
    if-eqz v5, :cond_2b2

    .line 699
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->hideKeyboard()V

    .line 700
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showMainProgressSpinner()V

    .line 702
    new-instance v10, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;

    invoke-direct {v10}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;-><init>()V

    .line 703
    .local v10, "serviceParams":Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipManager:Lcom/behance/sdk/managers/AddWIPManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/AddWIPManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v17

    .line 704
    .local v17, "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    invoke-interface/range {v17 .. v17}, Lcom/behance/sdk/IBehanceSDKUserCredentials;->getClientId()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setAppClientId(Ljava/lang/String;)V

    .line 706
    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setWipDescription(Ljava/lang/String;)V

    .line 708
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    move/from16 v21, v0

    if-lez v21, :cond_23e

    .line 709
    move-object/from16 v0, p0

    iget v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setWipId(I)V

    .line 710
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPTitle:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setWipTitle(Ljava/lang/String;)V

    .line 716
    :goto_ba
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setWipTags(Ljava/lang/String;)V

    .line 717
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->adultContentCheckBox:Landroid/widget/CheckBox;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setContainsAdultContent(Z)V

    .line 719
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setWipImageFile(Lcom/behance/sdk/project/modules/ProjectModule;)V

    .line 720
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipManager:Lcom/behance/sdk/managers/AddWIPManager;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/AddWIPManager;->getNotificationHandlerActivityClass()Ljava/lang/Class;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setNotificationHandlerActivity(Ljava/lang/Class;)V

    .line 722
    const/4 v15, 0x0

    .line 724
    .local v15, "updateFacebookAccount":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    move/from16 v21, v0

    if-eqz v21, :cond_103

    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->isFacebookAccountAuthenticatedToPublish()Z

    move-result v21

    if-nez v21, :cond_103

    .line 725
    const/16 v21, 0x0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    .line 727
    :cond_103
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    move/from16 v21, v0

    if-eqz v21, :cond_24c

    .line 728
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v21

    if-nez v21, :cond_123

    .line 729
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setSharingEnabledLastTime(Z)V

    .line 730
    const/4 v15, 0x1

    .line 739
    :cond_123
    :goto_123
    if-eqz v15, :cond_134

    .line 740
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->updateAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 743
    :cond_134
    const/16 v16, 0x0

    .line 745
    .local v16, "updateTwitterAccount":Z
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->isTwitterAccountAuthenticated()Z

    move-result v4

    .line 746
    .local v4, "TwitterAccountAuthenticated":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    if-eqz v21, :cond_15d

    .line 747
    if-eqz v4, :cond_26e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v21

    if-nez v21, :cond_26e

    .line 748
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 749
    const/16 v16, 0x1

    .line 756
    :cond_15d
    :goto_15d
    if-nez v4, :cond_16f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    move/from16 v21, v0

    if-eqz v21, :cond_16f

    .line 757
    const/16 v21, 0x0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    .line 760
    :cond_16f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    move/from16 v21, v0

    if-eqz v21, :cond_28b

    .line 761
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    if-eqz v21, :cond_198

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v21

    if-nez v21, :cond_198

    .line 762
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setSharingEnabledLastTime(Z)V

    .line 763
    const/16 v16, 0x1

    .line 772
    :cond_198
    :goto_198
    if-eqz v16, :cond_1a9

    .line 773
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->updateAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 776
    :cond_1a9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setShareOnFacebook(Z)V

    .line 777
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setShareOnTwitter(Z)V

    .line 778
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    move/from16 v21, v0

    if-eqz v21, :cond_203

    .line 779
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setTwitterUserAccessToken(Ljava/lang/String;)V

    .line 780
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setTwitterUserAccessTokenSecret(Ljava/lang/String;)V

    .line 781
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setTwitterConsumerKey(Ljava/lang/String;)V

    .line 782
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setTwitterConsumerSecret(Ljava/lang/String;)V

    .line 785
    :cond_203
    new-instance v8, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v21

    const-class v22, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v8, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 786
    .local v8, "intent":Landroid/content/Intent;
    const-string v21, "INTENT_EXTRA_PARAMS"

    move-object/from16 v0, v21

    invoke-virtual {v8, v0, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 787
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v9

    .line 788
    .local v9, "publishWIPComponent":Landroid/content/ComponentName;
    sget v6, Lcom/behance/sdk/R$string;->bsdk_wip_publish_view_publish_service_initialize_error_msg:I

    .line 789
    .local v6, "displayMsgResourceId":I
    if-eqz v9, :cond_2ae

    .line 790
    sget v6, Lcom/behance/sdk/R$string;->bsdk_wip_publish_view_publish_initiated_msg:I

    .line 794
    :goto_229
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v21

    const/16 v22, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-static {v0, v6, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/widget/Toast;->show()V

    .line 795
    invoke-direct/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeThisView()V

    .line 805
    .end local v4    # "TwitterAccountAuthenticated":Z
    .end local v5    # "allTagsValid":Z
    .end local v6    # "displayMsgResourceId":I
    .end local v7    # "finalTagStringForServer":Ljava/lang/StringBuilder;
    .end local v8    # "intent":Landroid/content/Intent;
    .end local v9    # "publishWIPComponent":Landroid/content/ComponentName;
    .end local v10    # "serviceParams":Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;
    .end local v13    # "tagsArray":[Ljava/lang/String;
    .end local v15    # "updateFacebookAccount":Z
    .end local v16    # "updateTwitterAccount":Z
    .end local v17    # "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    :goto_23d
    return-void

    .line 712
    .restart local v5    # "allTagsValid":Z
    .restart local v7    # "finalTagStringForServer":Ljava/lang/StringBuilder;
    .restart local v10    # "serviceParams":Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;
    .restart local v13    # "tagsArray":[Ljava/lang/String;
    .restart local v17    # "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    :cond_23e
    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setWipTitle(Ljava/lang/String;)V

    .line 713
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->setWipId(I)V

    goto/16 :goto_ba

    .line 733
    .restart local v15    # "updateFacebookAccount":Z
    :cond_24c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    if-eqz v21, :cond_123

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v21

    if-eqz v21, :cond_123

    .line 734
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setSharingEnabledLastTime(Z)V

    .line 735
    const/4 v15, 0x1

    goto/16 :goto_123

    .line 750
    .restart local v4    # "TwitterAccountAuthenticated":Z
    .restart local v16    # "updateTwitterAccount":Z
    :cond_26e
    if-nez v4, :cond_15d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v21

    if-eqz v21, :cond_15d

    .line 751
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 752
    const/16 v16, 0x1

    goto/16 :goto_15d

    .line 766
    :cond_28b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    if-eqz v21, :cond_198

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v21

    if-eqz v21, :cond_198

    .line 767
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setSharingEnabledLastTime(Z)V

    .line 768
    const/16 v16, 0x1

    goto/16 :goto_198

    .line 792
    .restart local v6    # "displayMsgResourceId":I
    .restart local v8    # "intent":Landroid/content/Intent;
    .restart local v9    # "publishWIPComponent":Landroid/content/ComponentName;
    :cond_2ae
    sget v6, Lcom/behance/sdk/R$string;->bsdk_wip_publish_view_publish_service_initialize_error_msg:I

    goto/16 :goto_229

    .line 797
    .end local v4    # "TwitterAccountAuthenticated":Z
    .end local v6    # "displayMsgResourceId":I
    .end local v8    # "intent":Landroid/content/Intent;
    .end local v9    # "publishWIPComponent":Landroid/content/ComponentName;
    .end local v10    # "serviceParams":Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;
    .end local v15    # "updateFacebookAccount":Z
    .end local v16    # "updateTwitterAccount":Z
    .end local v17    # "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    :cond_2b2
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v21

    sget v22, Lcom/behance/sdk/R$string;->bsdk_wip_publish_view_publish_invalid_tag_msg:I

    const/16 v23, 0x1

    invoke-static/range {v21 .. v23}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v14

    .line 798
    .local v14, "toast":Landroid/widget/Toast;
    const/16 v21, 0x11

    const/16 v22, 0x0

    const/16 v23, 0x0

    move/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v14, v0, v1, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 799
    invoke-virtual {v14}, Landroid/widget/Toast;->show()V

    .line 800
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTagsEditTxt:Landroid/widget/EditText;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/EditText;->requestFocus()Z

    goto/16 :goto_23d

    .line 803
    .end local v5    # "allTagsValid":Z
    .end local v7    # "finalTagStringForServer":Ljava/lang/StringBuilder;
    .end local v13    # "tagsArray":[Ljava/lang/String;
    .end local v14    # "toast":Landroid/widget/Toast;
    :cond_2db
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v21

    sget v22, Lcom/behance/sdk/R$string;->bsdk_wip_publish_view_publish_required_fields_missing_msg:I

    const/16 v23, 0x1

    invoke-static/range {v21 .. v23}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/widget/Toast;->show()V

    goto/16 :goto_23d
.end method

.method private isFacebookAccountAuthenticatedToPublish()Z
    .registers 7

    .prologue
    const/4 v3, 0x1

    .line 474
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 475
    .local v0, "activeSession":Lcom/facebook/Session;
    if-eqz v0, :cond_16

    invoke-virtual {v0}, Lcom/facebook/Session;->isOpened()Z

    move-result v4

    if-eqz v4, :cond_16

    .line 476
    const-string v4, "publish_actions"

    invoke-virtual {v0, v4}, Lcom/facebook/Session;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3e

    .line 495
    :cond_15
    :goto_15
    return v3

    .line 480
    :cond_16
    new-instance v4, Lcom/facebook/Session$Builder;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/facebook/Session$Builder;-><init>(Landroid/content/Context;)V

    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v5}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/facebook/Session$Builder;->setApplicationId(Ljava/lang/String;)Lcom/facebook/Session$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/facebook/Session$Builder;->build()Lcom/facebook/Session;

    move-result-object v2

    .line 481
    .local v2, "session":Lcom/facebook/Session;
    invoke-static {v2}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 482
    invoke-virtual {v2}, Lcom/facebook/Session;->isOpened()Z

    move-result v4

    if-eqz v4, :cond_40

    .line 483
    const-string v4, "publish_actions"

    invoke-virtual {v2, v4}, Lcom/facebook/Session;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_15

    .line 495
    .end local v2    # "session":Lcom/facebook/Session;
    :cond_3e
    const/4 v3, 0x0

    goto :goto_15

    .line 486
    .restart local v2    # "session":Lcom/facebook/Session;
    :cond_40
    invoke-virtual {v2}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v4

    sget-object v5, Lcom/facebook/SessionState;->CREATED_TOKEN_LOADED:Lcom/facebook/SessionState;

    if-ne v4, v5, :cond_3e

    .line 488
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->createFacebookSessionRequest()Lcom/facebook/Session$OpenRequest;

    move-result-object v1

    .line 489
    .local v1, "openRequest":Lcom/facebook/Session$OpenRequest;
    invoke-virtual {v2, v1}, Lcom/facebook/Session;->openForPublish(Lcom/facebook/Session$OpenRequest;)V

    .line 490
    const-string v4, "publish_actions"

    invoke-virtual {v2, v4}, Lcom/facebook/Session;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3e

    goto :goto_15
.end method

.method private isStringEmpty(Ljava/lang/String;)Z
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 828
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_e

    .line 829
    const/4 v0, 0x0

    .line 831
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x1

    goto :goto_d
.end method

.method private isTwitterAccountAuthenticated()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 531
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v3, :cond_21

    .line 532
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getUserAuthToken()Ljava/lang/String;

    move-result-object v0

    .line 533
    .local v0, "accessToken":Ljava/lang/String;
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAdditionalData()Ljava/lang/String;

    move-result-object v1

    .line 534
    .local v1, "accessTokenSecret":Ljava/lang/String;
    if-eqz v0, :cond_21

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_21

    if-eqz v1, :cond_21

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_22

    .line 540
    .end local v0    # "accessToken":Ljava/lang/String;
    .end local v1    # "accessTokenSecret":Ljava/lang/String;
    :cond_21
    :goto_21
    return v2

    .line 537
    .restart local v0    # "accessToken":Ljava/lang/String;
    .restart local v1    # "accessTokenSecret":Ljava/lang/String;
    :cond_22
    const/4 v2, 0x1

    goto :goto_21
.end method

.method private launchTwitterLoginActivity()V
    .registers 4

    .prologue
    .line 417
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/behance/sdk/ui/activities/BehanceSDKLoginToTwitterActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 418
    .local v0, "detailIntent":Landroid/content/Intent;
    const v1, 0xddd5

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 419
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeLoginToTwitterConfirmationDialog()V

    .line 420
    return-void
.end method

.method private loadUserWIPs()V
    .registers 2

    .prologue
    .line 594
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->isGetUserWIPsTaskInProgress()Z

    move-result v0

    if-nez v0, :cond_15

    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsList()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_15

    .line 595
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->loadUserWIPsFromServer()V

    .line 597
    :cond_15
    return-void
.end method

.method private onUserWIPsItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 9
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 848
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    .line 849
    .local v0, "selectedItemObject":Ljava/lang/Object;
    instance-of v2, v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;

    if-eqz v2, :cond_1e

    move-object v1, v0

    .line 850
    check-cast v1, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;

    .line 851
    .local v1, "selectedWIP":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    invoke-virtual {v1}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->getId()I

    move-result v2

    iput v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    .line 852
    invoke-virtual {v1}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->getTitle()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPTitle:Ljava/lang/String;

    .line 853
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userEnteredNewWIPTitle:Z

    .line 854
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->displayPublishView(Z)V

    .line 856
    .end local v1    # "selectedWIP":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    :cond_1e
    return-void
.end method

.method private populateSelectedWIPInPublishView()V
    .registers 8

    .prologue
    const/16 v4, 0x8

    const/4 v6, 0x0

    .line 888
    iget-boolean v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userEnteredNewWIPTitle:Z

    if-nez v3, :cond_69

    .line 889
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-virtual {v3}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsList()Ljava/util/List;

    move-result-object v2

    .line 890
    .local v2, "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    if-eqz v2, :cond_15

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_22

    .line 891
    :cond_15
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showPickWIPsViewBtn:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 892
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setVisibility(I)V

    .line 893
    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    .line 918
    .end local v2    # "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    :goto_21
    return-void

    .line 895
    .restart local v2    # "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    :cond_22
    const/4 v1, 0x0

    .line 896
    .local v1, "selectedUserWIP":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    iget v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    if-lez v3, :cond_40

    .line 897
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_40

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;

    .line 898
    .local v0, "behanceSDKWIPDTO":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    iget v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->getId()I

    move-result v5

    if-ne v4, v5, :cond_2b

    .line 899
    move-object v1, v0

    .line 904
    .end local v0    # "behanceSDKWIPDTO":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    :cond_40
    if-nez v1, :cond_48

    .line 905
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "selectedUserWIP":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    check-cast v1, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;

    .line 907
    .restart local v1    # "selectedUserWIP":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    :cond_48
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPTitleTxtView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 908
    invoke-virtual {v1}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->getId()I

    move-result v3

    iput v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    .line 909
    invoke-virtual {v1}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->getTitle()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPTitle:Ljava/lang/String;

    .line 910
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showPickWIPsViewBtn:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 911
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setVisibility(I)V

    goto :goto_21

    .line 914
    .end local v1    # "selectedUserWIP":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    .end local v2    # "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    :cond_69
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showPickWIPsViewBtn:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 915
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setVisibility(I)V

    .line 916
    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    goto :goto_21
.end method

.method private setContentViewDimensions(Landroid/view/View;)V
    .registers 10
    .param p1, "contentView"    # Landroid/view/View;

    .prologue
    .line 324
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/behance/sdk/R$bool;->bsdk_show_view_full_screen:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    .line 325
    .local v3, "displayContentViewInFullScreen":Z
    if-nez v3, :cond_30

    .line 326
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 327
    .local v4, "displayMetrics":Landroid/util/DisplayMetrics;
    iget v2, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 328
    .local v2, "deviceWidth":I
    iget v1, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 330
    .local v1, "deviceHeight":I
    if-lez v2, :cond_30

    if-lez v1, :cond_30

    .line 331
    int-to-float v6, v2

    const v7, 0x3f4ccccd

    mul-float/2addr v6, v7

    float-to-int v0, v6

    .line 332
    .local v0, "contentContainerWidth":I
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 333
    .local v5, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v5, :cond_30

    .line 334
    iput v0, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 335
    const/4 v6, -0x2

    iput v6, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 336
    invoke-virtual {p1, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 340
    .end local v0    # "contentContainerWidth":I
    .end local v1    # "deviceHeight":I
    .end local v2    # "deviceWidth":I
    .end local v4    # "displayMetrics":Landroid/util/DisplayMetrics;
    .end local v5    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_30
    return-void
.end method

.method private setUserWIPsListAdapter()V
    .registers 6

    .prologue
    .line 627
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    if-eqz v3, :cond_31

    .line 628
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v3}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v1

    .line 629
    .local v1, "displayedChildIndex":I
    const/4 v3, 0x1

    if-ne v1, v3, :cond_31

    .line 630
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-virtual {v3}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->getUserWIPsList()Ljava/util/List;

    move-result-object v2

    .line 631
    .local v2, "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    if-eqz v2, :cond_31

    .line 632
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userWIPsListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;

    .line 633
    .local v0, "adapter":Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;
    if-nez v0, :cond_32

    .line 634
    new-instance v0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;

    .end local v0    # "adapter":Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    iget v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    invoke-direct {v0, v3, v2, v4}, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I)V

    .line 635
    .restart local v0    # "adapter":Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userWIPsListView:Landroid/widget/ListView;

    invoke-virtual {v3, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 643
    .end local v0    # "adapter":Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;
    .end local v1    # "displayedChildIndex":I
    .end local v2    # "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    :cond_31
    :goto_31
    return-void

    .line 637
    .restart local v0    # "adapter":Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;
    .restart local v1    # "displayedChildIndex":I
    .restart local v2    # "userWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    :cond_32
    iget v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    invoke-virtual {v0, v3}, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->setSelectedWIPId(I)V

    .line 638
    invoke-virtual {v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->notifyDataSetChanged()V

    goto :goto_31
.end method

.method private showMainProgressSpinner()V
    .registers 3

    .prologue
    .line 836
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWipProgressbar:Landroid/view/View;

    if-eqz v0, :cond_a

    .line 837
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWipProgressbar:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 839
    :cond_a
    return-void
.end method

.method private updateFacebookAccountAuthStatus()V
    .registers 5

    .prologue
    .line 508
    const/4 v1, 0x0

    .line 509
    .local v1, "updateFacebookAccount":Z
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->isFacebookAccountAuthenticatedToPublish()Z

    move-result v0

    .line 510
    .local v0, "facebookAccountAuthenticated":Z
    if-eqz v0, :cond_20

    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v2

    if-nez v2, :cond_20

    .line 511
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 512
    const/4 v1, 0x1

    .line 517
    :cond_16
    :goto_16
    if-eqz v1, :cond_1f

    .line 518
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v2, v3}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->updateAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 520
    :cond_1f
    return-void

    .line 513
    :cond_20
    if-nez v0, :cond_16

    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isUserAuthenticated()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 514
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 515
    const/4 v1, 0x1

    goto :goto_16
.end method

.method private updatePublishBtnState()V
    .registers 6

    .prologue
    .line 808
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipDescEditTxt:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 809
    .local v0, "wipDescStr":Ljava/lang/String;
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 810
    .local v2, "wipTitleStr":Ljava/lang/String;
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTagsEditTxt:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 811
    .local v1, "wipTagsStr":Ljava/lang/String;
    invoke-direct {p0, v0, v2, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->allRequiredValuesForPublishAvaiable(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 812
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWIPBtnTxtView:Landroid/widget/TextView;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 816
    :goto_2a
    return-void

    .line 814
    :cond_2b
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWIPBtnTxtView:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    goto :goto_2a
.end method

.method private updateShareOnFacebookBtnImage()V
    .registers 3

    .prologue
    .line 523
    iget-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    if-eqz v0, :cond_c

    .line 524
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    sget v1, Lcom/behance/sdk/R$drawable;->bsdk_icon_addcontent_publish_shareon_facebook_on:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 528
    :goto_b
    return-void

    .line 526
    :cond_c
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    sget v1, Lcom/behance/sdk/R$drawable;->bsdk_icon_addcontent_publish_shareon_facebook_off:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_b
.end method

.method private updateShareOnTwitterBtnImage()V
    .registers 3

    .prologue
    .line 577
    iget-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    if-eqz v0, :cond_c

    .line 578
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    sget v1, Lcom/behance/sdk/R$drawable;->bsdk_icon_addcontent_publish_shareon_twitter_on:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 582
    :goto_b
    return-void

    .line 580
    :cond_c
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    sget v1, Lcom/behance/sdk/R$drawable;->bsdk_icon_addcontent_publish_shareon_twitter_off:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_b
.end method


# virtual methods
.method public handleTwitterAuthenticationFailure()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1011
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 1012
    iput-boolean v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    .line 1013
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnTwitterBtnImage()V

    .line 1014
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$string;->bsdk_social_account_twitter_login_authentication_failure:I

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1016
    :cond_19
    return-void
.end method

.method public handleTwitterAuthenticationSuccess()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 1000
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 1001
    iput-boolean v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    .line 1002
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnTwitterBtnImage()V

    .line 1004
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .line 1005
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v0, v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthenticated(Z)V

    .line 1006
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->updateAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 1008
    :cond_22
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 1020
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/DialogFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 1021
    const v1, 0xddd5

    if-ne p1, v1, :cond_14

    .line 1022
    packed-switch p2, :pswitch_data_26

    .line 1040
    :goto_b
    return-void

    .line 1025
    :pswitch_c
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->handleTwitterAuthenticationFailure()V

    goto :goto_b

    .line 1028
    :pswitch_10
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->handleTwitterAuthenticationSuccess()V

    goto :goto_b

    .line 1034
    :cond_14
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 1035
    .local v0, "activeSession":Lcom/facebook/Session;
    if-eqz v0, :cond_21

    .line 1036
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/facebook/Session;->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    .line 1038
    :cond_21
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->handleFacebookAuthActivityResult()V

    goto :goto_b

    .line 1022
    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_c
        :pswitch_10
        :pswitch_c
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .registers 8
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 394
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/behance/sdk/R$id;->bsdkPublishWipTitlebarBackBtnImageView:I

    if-ne v2, v3, :cond_d

    .line 395
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->handleBackBtnClick()V

    .line 414
    :cond_c
    :goto_c
    return-void

    .line 396
    :cond_d
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/behance/sdk/R$id;->bsdkPublishWipTitlebarPublishBtnTxtView:I

    if-ne v2, v3, :cond_49

    .line 397
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 398
    .local v0, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_31

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_31

    .line 399
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->invokePublishWIPService()V

    goto :goto_c

    .line 401
    :cond_31
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$string;->bsdk_add_wip_view_connection_error_msg:I

    invoke-virtual {p0, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 402
    .local v1, "toast":Landroid/widget/Toast;
    const/16 v2, 0x11

    invoke-virtual {v1, v2, v5, v5}, Landroid/widget/Toast;->setGravity(III)V

    .line 403
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_c

    .line 405
    .end local v0    # "networkInfo":Landroid/net/NetworkInfo;
    .end local v1    # "toast":Landroid/widget/Toast;
    :cond_49
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/behance/sdk/R$id;->bsdkPublishWipTitlebarNewWIPBtnTxtView:I

    if-ne v2, v3, :cond_55

    .line 406
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->displayNewWIPTitleDialog()V

    goto :goto_c

    .line 407
    :cond_55
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewShowPickWIPsViewBtn:I

    if-ne v2, v3, :cond_61

    .line 408
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->handleShowPickWIPsViewClick()V

    goto :goto_c

    .line 409
    :cond_61
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewTwitterShareImageView:I

    if-ne v2, v3, :cond_6d

    .line 410
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->handleEnableShareOnTwitterBtnClick()V

    goto :goto_c

    .line 411
    :cond_6d
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    sget v3, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewFacebookShareImageView:I

    if-ne v2, v3, :cond_c

    .line 412
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->handleEnableShareOnFacebookBtnClick()V

    goto :goto_c
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 165
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 166
    const/4 v0, 0x2

    sget v1, Lcom/behance/sdk/R$style;->BsdkPublishWIPToBehanceViewTheme:I

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->setStyle(II)V

    .line 167
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 16
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v11, 0x0

    const/16 v10, 0x8

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 171
    invoke-super {p0, p3}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 172
    sget v5, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_publish_wip_to_behance:I

    invoke-virtual {p1, v5, p2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    .line 174
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 175
    .local v0, "arguments":Landroid/os/Bundle;
    if-eqz v0, :cond_20

    .line 176
    const-string v5, "ARGS_KEY_WIP_IMAGE_MODULE"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v5

    check-cast v5, Lcom/behance/sdk/project/modules/ImageModule;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    .line 179
    :cond_20
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-static {v5}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getInstance(Landroid/content/Context;)Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    .line 180
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    sget-object v6, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v5, v6}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .line 181
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    sget-object v6, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v5, v6}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .line 183
    const/4 v2, 0x0

    .line 184
    .local v2, "childIndexToDisplay":I
    iput-boolean v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userEnteredNewWIPTitle:Z

    .line 185
    iput-boolean v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    .line 186
    iput-boolean v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    .line 187
    if-eqz p3, :cond_281

    .line 188
    const-string v5, "BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX"

    invoke-virtual {p3, v5, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 189
    const-string v5, "BUNDLE_KEY_SELECTED_WIP_ID"

    invoke-virtual {p3, v5, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    .line 190
    const-string v5, "BUNDLE_KEY_SELECTED_WIP_TITLE"

    invoke-virtual {p3, v5, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPTitle:Ljava/lang/String;

    .line 191
    const-string v5, "BUNDLE_KEY_NEW_WIP_TITLE_ENTERED_BY_USER"

    invoke-virtual {p3, v5, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userEnteredNewWIPTitle:Z

    .line 192
    const-string v5, "BUNDLE_KEY_SHARE_ON_TWITTER_SELECTED"

    invoke-virtual {p3, v5, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    .line 193
    const-string v5, "BUNDLE_KEY_SHARE_ON_FACEBOOK_SELECTED"

    invoke-virtual {p3, v5, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    .line 208
    :goto_75
    iget-boolean v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    if-eqz v5, :cond_81

    .line 209
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->isFacebookAccountAuthenticatedToPublish()Z

    move-result v5

    if-nez v5, :cond_81

    .line 210
    iput-boolean v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    .line 214
    :cond_81
    iget-boolean v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    if-eqz v5, :cond_8d

    .line 215
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->isTwitterAccountAuthenticated()Z

    move-result v5

    if-nez v5, :cond_8d

    .line 216
    iput-boolean v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    .line 220
    :cond_8d
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    const-string v6, "PUBLISH_WIP_TO_BEHANCE_FRAGMENT_HEADLESS_FRAGMENT_TAG_ADD_WIP"

    invoke-virtual {v5, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v5

    check-cast v5, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    .line 222
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    if-nez v5, :cond_c1

    .line 223
    new-instance v5, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-direct {v5}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;-><init>()V

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    .line 224
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v5

    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    const-string v7, "PUBLISH_WIP_TO_BEHANCE_FRAGMENT_HEADLESS_FRAGMENT_TAG_ADD_WIP"

    invoke-virtual {v5, v6, v7}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 226
    :cond_c1
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-virtual {v5, p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;)V

    .line 228
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->loadUserWIPs()V

    .line 230
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipTitlebarBackBtnImageView:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 231
    .local v1, "backBtn":Landroid/view/View;
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipTitlebarTitleTxtView:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->titleBarTitleTextView:Landroid/widget/TextView;

    .line 234
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipTitlebarPublishBtnTxtView:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWIPBtnTxtView:Landroid/widget/TextView;

    .line 235
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWIPBtnTxtView:Landroid/widget/TextView;

    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 236
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipTitlebarNewWIPBtnTxtView:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showNewWIPDialogBtnTxtView:Landroid/widget/TextView;

    .line 237
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showNewWIPDialogBtnTxtView:Landroid/widget/TextView;

    invoke-virtual {v5, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 239
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipViewFlipper:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ViewFlipper;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    .line 240
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewRootContainer:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWIPInfoRootContainer:Landroid/view/View;

    .line 241
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPickWIPRootContainer:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->pickWIPRootContainer:Landroid/view/View;

    .line 243
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewWIPThumbnailImageView:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipThumbnailImageView:Landroid/widget/ImageView;

    .line 244
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewProgressBar:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWipProgressbar:Landroid/view/View;

    .line 245
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewWIPNameEditTxt:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    .line 246
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->allTextFieldsTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 247
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewWIPDescriptionEditTxt:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipDescEditTxt:Landroid/widget/EditText;

    .line 248
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipDescEditTxt:Landroid/widget/EditText;

    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->allTextFieldsTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 249
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewWIPTagsEditTxt:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTagsEditTxt:Landroid/widget/EditText;

    .line 250
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTagsEditTxt:Landroid/widget/EditText;

    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->allTextFieldsTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 251
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewSelectedWIPNameTxtView:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPTitleTxtView:Landroid/widget/TextView;

    .line 252
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewShowPickWIPsViewBtn:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showPickWIPsViewBtn:Landroid/view/View;

    .line 253
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showPickWIPsViewBtn:Landroid/view/View;

    invoke-virtual {v5, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 254
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWIPPublishViewAdultContentCheckbox:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/CheckBox;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->adultContentCheckBox:Landroid/widget/CheckBox;

    .line 257
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewWIPNameContainer:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 258
    .local v4, "wipTitleContainer":Landroid/view/View;
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    invoke-direct {p0, v4}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getFocusChangeListerForLayout(Landroid/view/View;)Landroid/view/View$OnFocusChangeListener;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 260
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPickWIPListView:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ListView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userWIPsListView:Landroid/widget/ListView;

    .line 261
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userWIPsListView:Landroid/widget/ListView;

    new-instance v6, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$1;

    invoke-direct {v6, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$1;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;)V

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 269
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewTwitterShareImageView:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    .line 270
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v5, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewFacebookShareImageView:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    .line 273
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v5, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 275
    invoke-static {}, Lcom/behance/sdk/managers/AddWIPManager;->getInstance()Lcom/behance/sdk/managers/AddWIPManager;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipManager:Lcom/behance/sdk/managers/AddWIPManager;

    .line 276
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishWipPublishViewShareOptionsContainer:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOptionsView:Landroid/view/View;

    .line 278
    if-eqz v0, :cond_22e

    if-nez p3, :cond_22e

    .line 280
    const-string v5, "ARGS_KEY_WIP_ID"

    invoke-virtual {v0, v5, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    .line 281
    iget v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    if-gtz v5, :cond_2a2

    .line 282
    const-string v5, "ARGS_KEY_WIP_TITLE"

    invoke-virtual {v0, v5, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 283
    .local v3, "newWipTitle":Ljava/lang/String;
    invoke-direct {p0, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->isStringEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_214

    .line 284
    iput-boolean v9, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userEnteredNewWIPTitle:Z

    .line 285
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    invoke-virtual {v5, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 291
    .end local v3    # "newWipTitle":Ljava/lang/String;
    :cond_214
    :goto_214
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipDescEditTxt:Landroid/widget/EditText;

    const-string v6, "ARGS_KEY_WIP_DESCRIPTION"

    const-string v7, ""

    invoke-virtual {v0, v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 292
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTagsEditTxt:Landroid/widget/EditText;

    const-string v6, "ARGS_KEY_WIP_TAGS"

    const-string v7, ""

    invoke-virtual {v0, v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 295
    :cond_22e
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipManager:Lcom/behance/sdk/managers/AddWIPManager;

    invoke-virtual {v5}, Lcom/behance/sdk/managers/AddWIPManager;->isHideTwitterSharing()Z

    move-result v5

    if-eqz v5, :cond_23b

    .line 296
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOnTwitterBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v5, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 298
    :cond_23b
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipManager:Lcom/behance/sdk/managers/AddWIPManager;

    invoke-virtual {v5}, Lcom/behance/sdk/managers/AddWIPManager;->isHideFacebookSharing()Z

    move-result v5

    if-eqz v5, :cond_248

    .line 299
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOnFacebookBtnImageView:Landroid/widget/ImageView;

    invoke-virtual {v5, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 302
    :cond_248
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipManager:Lcom/behance/sdk/managers/AddWIPManager;

    invoke-virtual {v5}, Lcom/behance/sdk/managers/AddWIPManager;->isHideTwitterSharing()Z

    move-result v5

    if-eqz v5, :cond_25e

    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipManager:Lcom/behance/sdk/managers/AddWIPManager;

    invoke-virtual {v5}, Lcom/behance/sdk/managers/AddWIPManager;->isHideFacebookSharing()Z

    move-result v5

    if-eqz v5, :cond_25e

    .line 303
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareOptionsView:Landroid/view/View;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 306
    :cond_25e
    if-nez v2, :cond_2a6

    .line 307
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPImageModule:Lcom/behance/sdk/project/modules/ImageModule;

    if-eqz v5, :cond_267

    .line 308
    invoke-direct {p0, v8}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->displayPublishView(Z)V

    .line 314
    :cond_267
    :goto_267
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->publishWIPInfoRootContainer:Landroid/view/View;

    invoke-direct {p0, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->setContentViewDimensions(Landroid/view/View;)V

    .line 315
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->pickWIPRootContainer:Landroid/view/View;

    invoke-direct {p0, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->setContentViewDimensions(Landroid/view/View;)V

    .line 316
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnFacebookBtnImage()V

    .line 317
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnTwitterBtnImage()V

    .line 319
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 320
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->rootView:Landroid/view/View;

    return-object v5

    .line 195
    .end local v1    # "backBtn":Landroid/view/View;
    .end local v4    # "wipTitleContainer":Landroid/view/View;
    :cond_281
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v5, :cond_29b

    .line 196
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v5}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v5

    iput-boolean v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    .line 201
    :goto_28d
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v5, :cond_29e

    .line 202
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v5}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->isSharingEnabledLastTime()Z

    move-result v5

    iput-boolean v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    goto/16 :goto_75

    .line 198
    :cond_29b
    iput-boolean v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    goto :goto_28d

    .line 204
    :cond_29e
    iput-boolean v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    goto/16 :goto_75

    .line 288
    .restart local v1    # "backBtn":Landroid/view/View;
    .restart local v4    # "wipTitleContainer":Landroid/view/View;
    :cond_2a2
    iput-boolean v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userEnteredNewWIPTitle:Z

    goto/16 :goto_214

    .line 310
    :cond_2a6
    if-ne v2, v9, :cond_267

    .line 311
    invoke-direct {p0, v8}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->displayPickWIPView(Z)V

    goto :goto_267
.end method

.method public onDetach()V
    .registers 3

    .prologue
    .line 384
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDetach()V

    .line 385
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    if-eqz v0, :cond_d

    .line 386
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;)V

    .line 388
    :cond_d
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeLoginToFacebookConfirmationDialog()V

    .line 389
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeLoginToTwitterConfirmationDialog()V

    .line 390
    return-void
.end method

.method public onGetFacebookUserIdComplete(Ljava/lang/String;)V
    .registers 3
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 1083
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 1084
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    .line 1085
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateShareOnFacebookBtnImage()V

    .line 1086
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v0, :cond_18

    .line 1087
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->facebookAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v0, p1}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserId(Ljava/lang/String;)V

    .line 1088
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->updateFacebookAccountAuthStatus()V

    .line 1090
    :cond_18
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->hideMainProgressSpinner()V

    .line 1092
    :cond_1b
    return-void
.end method

.method public onGetUserWIPsFailure(Ljava/lang/Exception;)V
    .registers 6
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    const/4 v3, 0x0

    .line 954
    sget-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v1, "Problem getting user WIPs"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-interface {v0, p1, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 955
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 956
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showPickWIPsViewBtn:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 957
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setVisibility(I)V

    .line 959
    :cond_1c
    return-void
.end method

.method public onGetUserWIPsSuccess()V
    .registers 5

    .prologue
    .line 941
    sget-object v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v2, "Retrieved WIPs from server"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v1, v2, v3}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 942
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_1b

    .line 943
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    .line 944
    .local v0, "displayedChildIndex":I
    if-nez v0, :cond_1c

    .line 945
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->populateSelectedWIPInPublishView()V

    .line 950
    .end local v0    # "displayedChildIndex":I
    :cond_1b
    :goto_1b
    return-void

    .line 947
    .restart local v0    # "displayedChildIndex":I
    :cond_1c
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->setUserWIPsListAdapter()V

    goto :goto_1b
.end method

.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 586
    const/4 v0, 0x4

    if-ne p2, v0, :cond_e

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_e

    .line 587
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->handleBackBtnClick()V

    .line 588
    const/4 v0, 0x1

    .line 590
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public onNewWIPTitleDialogOKBtnClicked(Ljava/lang/String;)V
    .registers 5
    .param p1, "newWIPTitle"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 963
    iput-boolean v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userEnteredNewWIPTitle:Z

    .line 964
    iput v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    .line 965
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPTitle:Ljava/lang/String;

    .line 966
    invoke-direct {p0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->displayPublishView(Z)V

    .line 967
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->showPickWIPsViewBtn:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 968
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 969
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->wipTitleEditTxt:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 970
    return-void
.end method

.method public onPause()V
    .registers 2

    .prologue
    .line 368
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onPause()V

    .line 369
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewPaused:Z

    .line 370
    return-void
.end method

.method public onResume()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 374
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 375
    iput-boolean v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewPaused:Z

    .line 376
    iget-boolean v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeThisViewOnResume:Z

    if-eqz v0, :cond_f

    .line 377
    iput-boolean v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeThisViewOnResume:Z

    .line 378
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->closeThisView()V

    .line 380
    :cond_f
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 357
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 358
    const-string v0, "BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 359
    const-string v0, "BUNDLE_KEY_SELECTED_WIP_ID"

    iget v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPId:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 360
    const-string v0, "BUNDLE_KEY_SELECTED_WIP_TITLE"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->selectedWIPTitle:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    const-string v0, "BUNDLE_KEY_NEW_WIP_TITLE_ENTERED_BY_USER"

    iget-boolean v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->userEnteredNewWIPTitle:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 362
    const-string v0, "BUNDLE_KEY_SHARE_ON_TWITTER_SELECTED"

    iget-boolean v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnTwitter:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 363
    const-string v0, "BUNDLE_KEY_SHARE_ON_FACEBOOK_SELECTED"

    iget-boolean v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->shareWIPOnFacebook:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 364
    return-void
.end method

.method public setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;)V
    .registers 2
    .param p1, "callbacks"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;

    .prologue
    .line 973
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;

    .line 974
    return-void
.end method
