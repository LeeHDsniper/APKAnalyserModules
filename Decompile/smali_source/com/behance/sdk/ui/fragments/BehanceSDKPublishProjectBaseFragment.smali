.class public abstract Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;
.super Landroid/support/v4/app/Fragment;
.source "BehanceSDKPublishProjectBaseFragment.java"


# instance fields
.field private actionBarBackButton:Landroid/view/View;

.field protected actionBarForwardButton:Landroid/widget/TextView;

.field private actionBarTitle:Landroid/widget/TextView;

.field private navigationListener:Lcom/behance/sdk/listeners/IPublishProjectNavigationListener;

.field protected rootView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method private getLeftNavigationHandler()Landroid/view/View$OnClickListener;
    .registers 2

    .prologue
    .line 118
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment$2;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment$2;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;)V

    return-object v0
.end method

.method private getRightNavigationHandler()Landroid/view/View$OnClickListener;
    .registers 2

    .prologue
    .line 108
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment$1;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment$1;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;)V

    return-object v0
.end method


# virtual methods
.method protected backButtonPressed()V
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->navigationListener:Lcom/behance/sdk/listeners/IPublishProjectNavigationListener;

    invoke-interface {v0}, Lcom/behance/sdk/listeners/IPublishProjectNavigationListener;->showPrevious()V

    .line 89
    return-void
.end method

.method protected createActionBar()V
    .registers 1

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->updateNavigationControls()V

    .line 74
    return-void
.end method

.method protected disableActionBarRightNav()V
    .registers 3

    .prologue
    .line 159
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarForwardButton:Landroid/widget/TextView;

    if-eqz v0, :cond_a

    .line 160
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarForwardButton:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 161
    :cond_a
    return-void
.end method

.method protected enableActionBarRightNav()V
    .registers 3

    .prologue
    .line 164
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarForwardButton:Landroid/widget/TextView;

    if-eqz v0, :cond_a

    .line 165
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarForwardButton:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 167
    :cond_a
    return-void
.end method

.method protected getBackButtonID()I
    .registers 2

    .prologue
    .line 137
    sget v0, Lcom/behance/sdk/R$id;->bsdkPublishProjectTitlebarBackBtnLayout:I

    return v0
.end method

.method protected getForwardButtonID()I
    .registers 2

    .prologue
    .line 141
    sget v0, Lcom/behance/sdk/R$id;->bsdkPublishProjectTitlebarActionBtnTxtView:I

    return v0
.end method

.method protected getForwardButtonText()I
    .registers 2

    .prologue
    .line 133
    sget v0, Lcom/behance/sdk/R$string;->bsdk_addproject_custom_actionbar_forward_nav_default_txt:I

    return v0
.end method

.method protected abstract getLayout()I
.end method

.method protected abstract getTitle()I
.end method

.method protected getTitleViewID()I
    .registers 2

    .prologue
    .line 145
    sget v0, Lcom/behance/sdk/R$id;->bsdkPublishProjectTitlebarTitleTxtView:I

    return v0
.end method

.method protected hideSoftKeyBoardIfActive(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 68
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 69
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 70
    return-void
.end method

.method protected nextButtonPressed()V
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->navigationListener:Lcom/behance/sdk/listeners/IPublishProjectNavigationListener;

    invoke-interface {v0}, Lcom/behance/sdk/listeners/IPublishProjectNavigationListener;->showNext()V

    .line 93
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 97
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 98
    check-cast p1, Lcom/behance/sdk/listeners/IPublishProjectNavigationListener;

    .end local p1    # "activity":Landroid/app/Activity;
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->navigationListener:Lcom/behance/sdk/listeners/IPublishProjectNavigationListener;

    .line 99
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 56
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 57
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 61
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->setHasOptionsMenu(Z)V

    .line 62
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getLayout()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->rootView:Landroid/view/View;

    .line 63
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->createActionBar()V

    .line 64
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->rootView:Landroid/view/View;

    return-object v0
.end method

.method public onDetach()V
    .registers 2

    .prologue
    .line 103
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDetach()V

    .line 104
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->navigationListener:Lcom/behance/sdk/listeners/IPublishProjectNavigationListener;

    .line 105
    return-void
.end method

.method protected updateNavigationControls()V
    .registers 3

    .prologue
    .line 77
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->rootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getTitleViewID()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarTitle:Landroid/widget/TextView;

    .line 78
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarTitle:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getTitle()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 79
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->rootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getBackButtonID()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarBackButton:Landroid/view/View;

    .line 80
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarBackButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 81
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarBackButton:Landroid/view/View;

    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getLeftNavigationHandler()Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->rootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getForwardButtonID()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarForwardButton:Landroid/widget/TextView;

    .line 83
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarForwardButton:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getForwardButtonText()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 84
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->actionBarForwardButton:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->getRightNavigationHandler()Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 85
    return-void
.end method
