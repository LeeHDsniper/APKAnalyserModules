.class public Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "BehanceSDKUnlinkSocialAccountActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static INTENT_EXTRA_ACCOUNT_TYPE_NAME:Ljava/lang/String;

.field public static RESULT_CODE_ACCOUNT_UNLINK_CANCELLED:I

.field public static RESULT_CODE_ACCOUNT_UNLINK_FAILED:I

.field public static RESULT_CODE_ACCOUNT_UNLINK_SUCCESSFUL:I

.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private confirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

.field private socialAccountType:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const-string v0, "INTENT_PARAMS_ACCOUNT_TYPE_NAME"

    sput-object v0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->INTENT_EXTRA_ACCOUNT_TYPE_NAME:Ljava/lang/String;

    .line 43
    const/16 v0, 0x14

    sput v0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->RESULT_CODE_ACCOUNT_UNLINK_SUCCESSFUL:I

    .line 44
    const/16 v0, 0x15

    sput v0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->RESULT_CODE_ACCOUNT_UNLINK_CANCELLED:I

    .line 45
    const/16 v0, 0x16

    sput v0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->RESULT_CODE_ACCOUNT_UNLINK_FAILED:I

    .line 47
    const-class v0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;I)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;
    .param p1, "x1"    # I

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->closeThisActivity(I)V

    return-void
.end method

.method private closeConfirmationDialog(I)V
    .registers 3
    .param p1, "resultCode"    # I

    .prologue
    .line 103
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->confirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    if-eqz v0, :cond_9

    .line 104
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->confirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->dismiss()V

    .line 106
    :cond_9
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->closeThisActivity(I)V

    .line 107
    return-void
.end method

.method private closeThisActivity(I)V
    .registers 3
    .param p1, "resultCode"    # I

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->setResult(ILandroid/content/Intent;)V

    .line 73
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->finish()V

    .line 74
    return-void
.end method

.method private displayConfirmationDialog()V
    .registers 7

    .prologue
    .line 78
    sget v3, Lcom/behance/sdk/R$string;->bsdk_social_account_unlink_twitter_account_confirmation_title:I

    .line 79
    .local v3, "confirmationTitleResourceId":I
    sget v0, Lcom/behance/sdk/R$string;->bsdk_social_account_unlink_twitter_account_confirmation_body:I

    .line 80
    .local v0, "confirmationBodyResourceId":I
    sget v2, Lcom/behance/sdk/R$string;->bsdk_social_account_unlink_twitter_account_confirmation_ok_btn_label:I

    .line 81
    .local v2, "confirmationOkBtnLabelResourceId":I
    sget v1, Lcom/behance/sdk/R$string;->bsdk_social_account_unlink_twitter_account_confirmation_cancel_btn_label:I

    .line 82
    .local v1, "confirmationCancelBtnLabelResourceId":I
    iget-object v4, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->socialAccountType:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    sget-object v5, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->FACEBOOK:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    if-ne v4, v5, :cond_16

    .line 83
    sget v3, Lcom/behance/sdk/R$string;->bsdk_social_account_unlink_facebook_account_confirmation_title:I

    .line 84
    sget v0, Lcom/behance/sdk/R$string;->bsdk_social_account_unlink_facebook_account_confirmation_body:I

    .line 85
    sget v2, Lcom/behance/sdk/R$string;->bsdk_social_account_unlink_facebook_account_confirmation_ok_btn_label:I

    .line 86
    sget v1, Lcom/behance/sdk/R$string;->bsdk_social_account_unlink_facebook_account_confirmation_cancel_btn_label:I

    .line 88
    :cond_16
    invoke-static {p0, v3, v0, v2, v1}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->getInstance(Landroid/content/Context;IIII)Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    move-result-object v4

    iput-object v4, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->confirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    .line 90
    iget-object v4, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->confirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v4, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnNotOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    iget-object v4, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->confirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v4, p0}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnOKBtnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    iget-object v4, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->confirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    new-instance v5, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity$1;

    invoke-direct {v5, p0}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity$1;-><init>(Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;)V

    invoke-virtual {v4, v5}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 99
    iget-object v4, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->confirmationDialog:Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;

    invoke-virtual {v4}, Lcom/behance/sdk/ui/dialogs/BehanceSDKGenericAlertDialog;->show()V

    .line 100
    return-void
.end method

.method private unlinkSocialAccount()Z
    .registers 10

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 125
    :try_start_2
    invoke-static {p0}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getInstance(Landroid/content/Context;)Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-result-object v1

    .line 126
    .local v1, "socialAccountManager":Lcom/behance/sdk/BehanceSDKSocialAccountManager;
    iget-object v4, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->socialAccountType:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v1, v4}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->revokeAccountAccess(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Z

    .line 127
    sget-object v4, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Unlinked social account. [Account Type - %s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->socialAccountType:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v8}, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_1e} :catch_1f

    .line 131
    .end local v1    # "socialAccountManager":Lcom/behance/sdk/BehanceSDKSocialAccountManager;
    :goto_1e
    return v2

    .line 129
    :catch_1f
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/Throwable;
    sget-object v4, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v5, "Problem unlinking social account. [Account Type - %s]"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->socialAccountType:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v6}, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v3

    invoke-interface {v4, v0, v5, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    move v2, v3

    .line 131
    goto :goto_1e
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 111
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sget v2, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogOKBtn:I

    if-ne v1, v2, :cond_1a

    .line 112
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->unlinkSocialAccount()Z

    move-result v0

    .line 113
    .local v0, "removalSuccess":Z
    if-eqz v0, :cond_14

    .line 114
    sget v1, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->RESULT_CODE_ACCOUNT_UNLINK_SUCCESSFUL:I

    invoke-direct {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->closeConfirmationDialog(I)V

    .line 121
    .end local v0    # "removalSuccess":Z
    :cond_13
    :goto_13
    return-void

    .line 116
    .restart local v0    # "removalSuccess":Z
    :cond_14
    sget v1, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->RESULT_CODE_ACCOUNT_UNLINK_FAILED:I

    invoke-direct {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->closeConfirmationDialog(I)V

    goto :goto_13

    .line 118
    .end local v0    # "removalSuccess":Z
    :cond_1a
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sget v2, Lcom/behance/sdk/R$id;->bsdkGenericAlertDialogNotOKBtn:I

    if-ne v1, v2, :cond_13

    .line 119
    sget v1, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->RESULT_CODE_ACCOUNT_UNLINK_CANCELLED:I

    invoke-direct {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->closeConfirmationDialog(I)V

    goto :goto_13
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 54
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 55
    sget v2, Lcom/behance/sdk/R$layout;->bsdk_activity_unlink_social_account:I

    invoke-virtual {p0, v2}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->setContentView(I)V

    .line 56
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 57
    .local v1, "intent":Landroid/content/Intent;
    sget-object v2, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->INTENT_EXTRA_ACCOUNT_TYPE_NAME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "accountTypeName":Ljava/lang/String;
    invoke-static {v0}, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->fromName(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    move-result-object v2

    iput-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->socialAccountType:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .line 59
    iget-object v2, p0, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->socialAccountType:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    if-eqz v2, :cond_20

    .line 60
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->displayConfirmationDialog()V

    .line 64
    :goto_1f
    return-void

    .line 62
    :cond_20
    sget v2, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->RESULT_CODE_ACCOUNT_UNLINK_CANCELLED:I

    invoke-direct {p0, v2}, Lcom/behance/sdk/ui/activities/BehanceSDKUnlinkSocialAccountActivity;->closeThisActivity(I)V

    goto :goto_1f
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 68
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 69
    return-void
.end method
