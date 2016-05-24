.class public Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;
.super Landroid/support/v4/app/Fragment;
.source "BehanceSDKLoginToTwitterFragment.java"

# interfaces
.implements Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;

.field private progressBar:Landroid/widget/ProgressBar;

.field private rootView:Landroid/view/View;

.field private shareProjectOnTwitterHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;

.field private toastMessage:Landroid/widget/Toast;

.field private twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

.field private webview:Landroid/webkit/WebView;

.field private webviewSettings:Landroid/webkit/WebSettings;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 57
    const-class v0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 78
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 60
    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webview:Landroid/webkit/WebView;

    .line 61
    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webviewSettings:Landroid/webkit/WebSettings;

    .line 82
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->retrieveTokenFromURLCallback(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->displayNoInternetConnectivity()V

    return-void
.end method

.method private displayNoInternetConnectivity()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 140
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_32

    .line 141
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string v1, "Please check internet connectivity"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->toastMessage:Landroid/widget/Toast;

    .line 142
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->toastMessage:Landroid/widget/Toast;

    const/16 v1, 0x11

    invoke-virtual {v0, v1, v3, v3}, Landroid/widget/Toast;->setGravity(III)V

    .line 143
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->toastMessage:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 144
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->setResult(I)V

    .line 145
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0xddd5

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->finishActivity(I)V

    .line 147
    :cond_32
    return-void
.end method

.method private getAuthURLFromTwitter()V
    .registers 5

    .prologue
    .line 129
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "consumerKey":Ljava/lang/String;
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v1

    .line 131
    .local v1, "consumerSecret":Ljava/lang/String;
    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2c

    if-eqz v1, :cond_2c

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2c

    .line 132
    new-instance v2, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;

    invoke-direct {v2}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;-><init>()V

    .line 133
    .local v2, "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;
    invoke-virtual {v2, v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;->setConsumerKey(Ljava/lang/String;)V

    .line 134
    invoke-virtual {v2, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;->setConsumerSecret(Ljava/lang/String;)V

    .line 135
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->shareProjectOnTwitterHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;

    invoke-virtual {v3, v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->getAuthURLFromTwitter(Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;)V

    .line 137
    .end local v2    # "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;
    :cond_2c
    return-void
.end method

.method private hideProgressBar()V
    .registers 3

    .prologue
    .line 204
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->progressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_a

    .line 205
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->progressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 207
    :cond_a
    return-void
.end method

.method private retrieveTokenFromURLCallback(Ljava/lang/String;)V
    .registers 6
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 192
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientId()Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, "consumerKey":Ljava/lang/String;
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->getAccountClientSecret()Ljava/lang/String;

    move-result-object v1

    .line 194
    .local v1, "consumerSecret":Ljava/lang/String;
    if-eqz v0, :cond_2f

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2f

    if-eqz v1, :cond_2f

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2f

    .line 195
    new-instance v2, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;

    invoke-direct {v2}, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;-><init>()V

    .line 196
    .local v2, "params":Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;
    invoke-virtual {v2, v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->setConsumerKey(Ljava/lang/String;)V

    .line 197
    invoke-virtual {v2, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->setConsumerSecret(Ljava/lang/String;)V

    .line 198
    invoke-virtual {v2, p1}, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->setAuthURL(Ljava/lang/String;)V

    .line 199
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->shareProjectOnTwitterHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;

    invoke-virtual {v3, v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->retrieveAccessTokenFromTwitter(Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;)V

    .line 201
    .end local v2    # "params":Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;
    :cond_2f
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .registers 2

    .prologue
    .line 186
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 187
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 189
    :cond_d
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 86
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 87
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 11
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 92
    sget v3, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_login_user_to_social_client:I

    const/4 v4, 0x0

    invoke-virtual {p1, v3, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->rootView:Landroid/view/View;

    .line 94
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->rootView:Landroid/view/View;

    sget v4, Lcom/behance/sdk/R$id;->bsdkLoginUserToSocialClientProgressBar:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ProgressBar;

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->progressBar:Landroid/widget/ProgressBar;

    .line 95
    const/4 v0, 0x1

    .line 96
    .local v0, "isNetworkAvailable":Z
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    const-string v4, "HEADLESS_FRAGMENT_SHARE_PROJECT_ON_TWITTER"

    .line 97
    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    check-cast v3, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->shareProjectOnTwitterHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;

    .line 99
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->shareProjectOnTwitterHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;

    if-nez v3, :cond_4b

    .line 100
    new-instance v3, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;

    invoke-direct {v3}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;-><init>()V

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->shareProjectOnTwitterHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;

    .line 101
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->shareProjectOnTwitterHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;

    const-string v5, "HEADLESS_FRAGMENT_SHARE_PROJECT_ON_TWITTER"

    .line 102
    invoke-virtual {v3, v4, v5}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 104
    :cond_4b
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->shareProjectOnTwitterHeadlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;

    invoke-virtual {v3, p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment;->setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKLoginToTwitterHeadlessFragment$Callbacks;)V

    .line 106
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const-string v4, "connectivity"

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/ConnectivityManager;

    invoke-virtual {v3}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 107
    .local v1, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_68

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-nez v3, :cond_6c

    .line 108
    :cond_68
    const/4 v0, 0x0

    .line 109
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->displayNoInternetConnectivity()V

    .line 112
    :cond_6c
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-static {v3}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getInstance(Landroid/content/Context;)Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-result-object v2

    .line 113
    .local v2, "socialAccountManager":Lcom/behance/sdk/BehanceSDKSocialAccountManager;
    sget-object v3, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v2, v3}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->twitterAccount:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .line 115
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->rootView:Landroid/view/View;

    sget v4, Lcom/behance/sdk/R$id;->bsdkLoginUserToSocialClientWebView:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/webkit/WebView;

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webview:Landroid/webkit/WebView;

    .line 116
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webview:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webviewSettings:Landroid/webkit/WebSettings;

    .line 117
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webviewSettings:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 118
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webviewSettings:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 119
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webviewSettings:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 120
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webviewSettings:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 121
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webviewSettings:Landroid/webkit/WebSettings;

    invoke-virtual {v3, v6}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 122
    if-eqz v0, :cond_ae

    .line 123
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getAuthURLFromTwitter()V

    .line 125
    :cond_ae
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->rootView:Landroid/view/View;

    return-object v3
.end method

.method public onGetAuthURLFromTwitterFailure(Ljava/lang/Exception;)V
    .registers 7
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 222
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_20

    .line 223
    sget-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v1, "Problem retrieving auth URL from Twitter. [Error - %s]"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, p1, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 224
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;

    if-eqz v0, :cond_20

    .line 225
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;->onTwitterAuthenticationFailure(Ljava/lang/Exception;)V

    .line 228
    :cond_20
    return-void
.end method

.method public onGetAuthURLFromTwitterSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;)V
    .registers 5
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;

    .prologue
    .line 211
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_1d

    .line 212
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->getAuthURL()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1e

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->getAuthURL()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1e

    .line 213
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->getAuthURL()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->setWebViewforAuthorization(Ljava/lang/String;)V

    .line 218
    :cond_1d
    :goto_1d
    return-void

    .line 215
    :cond_1e
    sget-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v1, "Problem retrieving auth URL. AUTH URL retrieved is null"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1d
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 176
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_12

    .line 181
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_b
    return v0

    .line 178
    :pswitch_c
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->onBackPressed()V

    .line 179
    const/4 v0, 0x1

    goto :goto_b

    .line 176
    nop

    :pswitch_data_12
    .packed-switch 0x102002c
        :pswitch_c
    .end packed-switch
.end method

.method public onRetrieveAccessTokenFromTwitterFailure(Ljava/lang/Exception;)V
    .registers 7
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 241
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_20

    .line 242
    sget-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v1, "Problem retrieving access token and secret from Twitter. [Error - %s]"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, p1, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 243
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;

    if-eqz v0, :cond_20

    .line 244
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;->onTwitterAuthenticationFailure(Ljava/lang/Exception;)V

    .line 247
    :cond_20
    return-void
.end method

.method public onRetrieveAccessTokenFromTwitterSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V
    .registers 3
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    .prologue
    .line 232
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 233
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;

    if-eqz v0, :cond_f

    .line 234
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;->onTwitterAuthenticationSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V

    .line 237
    :cond_f
    return-void
.end method

.method public setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$Callbacks;

    .line 76
    return-void
.end method

.method public setWebViewforAuthorization(Ljava/lang/String;)V
    .registers 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 150
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->hideProgressBar()V

    .line 152
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webview:Landroid/webkit/WebView;

    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$1;

    invoke-direct {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment$1;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 172
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKLoginToTwitterFragment;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 173
    return-void
.end method
