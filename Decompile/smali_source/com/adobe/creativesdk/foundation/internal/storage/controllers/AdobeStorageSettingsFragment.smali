.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;
.super Landroid/support/v4/app/Fragment;
.source "AdobeStorageSettingsFragment.java"


# instance fields
.field private _editCCSettings:Landroid/widget/LinearLayout;

.field private _fragmentStopped:Z

.field private _switchAccounts:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method private OpenURLinBrowser(Landroid/view/View;Ljava/lang/String;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 230
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 231
    .local v0, "myIntent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_e
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_e} :catch_f

    .line 238
    .end local v0    # "myIntent":Landroid/content/Intent;
    :goto_e
    return-void

    .line 232
    :catch_f
    move-exception v1

    goto :goto_e
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;Landroid/view/View;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->OpenURLinBrowser(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->_fragmentStopped:Z

    return v0
.end method

.method private getUserAccountInfo(Landroid/view/View;)V
    .registers 12
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 161
    invoke-static {}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getSharedAuthManager()Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    move-result-object v4

    .line 162
    .local v4, "sharedAuthManager":Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v8

    .line 165
    .local v8, "userProfile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    .line 167
    .local v2, "displayName":Ljava/lang/String;
    sget v9, Lcom/adobe/creativesdk/foundation/assets/R$id;->storage_settings_userName:I

    invoke-virtual {p1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 176
    .local v7, "userName":Landroid/widget/TextView;
    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    sget v9, Lcom/adobe/creativesdk/foundation/assets/R$id;->storage_settings_userEmailId:I

    invoke-virtual {p1, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 179
    .local v6, "userEmailID":Landroid/widget/TextView;
    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getEmail()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 182
    .local v0, "bundle":Landroid/os/Bundle;
    sget-object v9, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {v0, v9}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 184
    .local v1, "defaultCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isQuotaEnabled()Z

    move-result v9

    if-eqz v9, :cond_4d

    .line 186
    sget-object v9, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {v1, v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .line 187
    .local v5, "storageSession":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment$3;

    invoke-direct {v3, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;Landroid/view/View;)V

    .line 221
    .local v3, "quotaDelegate":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;
    new-instance v9, Landroid/os/Handler;

    invoke-direct {v9}, Landroid/os/Handler;-><init>()V

    invoke-virtual {v5, v3, v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getQuotaInformationOnCompletion(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;Landroid/os/Handler;)V

    .line 224
    .end local v3    # "quotaDelegate":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionQuotaCallback;
    .end local v5    # "storageSession":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    :cond_4d
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 51
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 52
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->setHasOptionsMenu(Z)V

    .line 53
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 94
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 95
    invoke-interface {p1}, Landroid/view/Menu;->clear()V

    .line 96
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 60
    .local v0, "bundle":Landroid/os/Bundle;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 61
    .local v1, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_myacount:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeAssetBrowserActionBarController;->setTitle(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 63
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_storage_settings_fragment:I

    const/4 v4, 0x0

    invoke-virtual {p1, v3, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 65
    .local v2, "rootView":Landroid/view/View;
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->setHasOptionsMenu(Z)V

    .line 67
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->storage_settings_switchAccounts:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->_switchAccounts:Landroid/widget/LinearLayout;

    .line 68
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->_switchAccounts:Landroid/widget/LinearLayout;

    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment$1;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->storage_settings_editCCSettings:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->_editCCSettings:Landroid/widget/LinearLayout;

    .line 80
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->_editCCSettings:Landroid/widget/LinearLayout;

    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment$2;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->getUserAccountInfo(Landroid/view/View;)V

    .line 89
    return-object v2
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 100
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 101
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_sdk_myaccount:I

    .line 102
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 101
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitle(Landroid/view/View;Ljava/lang/String;)V

    .line 103
    return-void
.end method

.method public onStart()V
    .registers 2

    .prologue
    .line 107
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 109
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->_fragmentStopped:Z

    .line 110
    return-void
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 113
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 114
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->_fragmentStopped:Z

    .line 115
    return-void
.end method
