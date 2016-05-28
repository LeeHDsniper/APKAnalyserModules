.class public Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "BehanceSDKELWFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;
    }
.end annotation


# instance fields
.field private backButton:Landroid/widget/ImageView;

.field private callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;

.field private cancelButton:Landroid/view/View;

.field private continueButton:Landroid/view/View;

.field private rootView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 24
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;)Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;

    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 38
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 39
    const/4 v0, 0x2

    sget v1, Lcom/behance/sdk/R$style;->BsdkEnterpriseLoginWarningTheme:I

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->setStyle(II)V

    .line 40
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 45
    sget v2, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_enterprise_login_warning_for_publish:I

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->rootView:Landroid/view/View;

    .line 46
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->rootView:Landroid/view/View;

    sget v3, Lcom/behance/sdk/R$id;->bsdkEnterpriseLoginWarningContinueButton:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->continueButton:Landroid/view/View;

    .line 47
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->rootView:Landroid/view/View;

    sget v3, Lcom/behance/sdk/R$id;->bsdkEnterpriseLoginWarningCancelButton:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->cancelButton:Landroid/view/View;

    .line 48
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->rootView:Landroid/view/View;

    sget v3, Lcom/behance/sdk/R$id;->bsdkPublishProjectTitlebarBackBtnImageView:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->backButton:Landroid/widget/ImageView;

    .line 49
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->continueButton:Landroid/view/View;

    new-instance v3, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$1;

    invoke-direct {v3, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$1;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->cancelButton:Landroid/view/View;

    new-instance v3, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$2;

    invoke-direct {v3, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$2;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->backButton:Landroid/widget/ImageView;

    new-instance v3, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$3;

    invoke-direct {v3, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$3;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->rootView:Landroid/view/View;

    sget v3, Lcom/behance/sdk/R$id;->bsdkPublishProjectTitlebarTitleTxtView:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 75
    .local v1, "titleText":Landroid/widget/TextView;
    sget v2, Lcom/behance/sdk/R$string;->bsdk_enterprise_login_warning_actionbar_title:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 76
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->rootView:Landroid/view/View;

    sget v3, Lcom/behance/sdk/R$id;->bsdkPublishProjectTitlebarActionBtnTxtView:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 77
    .local v0, "actionText":Landroid/view/View;
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 78
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->rootView:Landroid/view/View;

    return-object v2
.end method

.method public setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;)V
    .registers 2
    .param p1, "callbacks"    # Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;

    .line 34
    return-void
.end method
