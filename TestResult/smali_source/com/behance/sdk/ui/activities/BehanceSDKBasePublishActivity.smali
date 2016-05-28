.class public abstract Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "BehanceSDKBasePublishActivity.java"

# interfaces
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;


# instance fields
.field private volatile isCloudPickerLaunched:Z

.field private volatile isWarningScreenVisible:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 36
    iput-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isWarningScreenVisible:Z

    .line 38
    iput-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isCloudPickerLaunched:Z

    return-void
.end method

.method private getSharedPreference()Landroid/content/SharedPreferences;
    .registers 6

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 131
    .local v1, "application":Landroid/content/pm/ApplicationInfo;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "BEHANCE_SDK_PUBLISH_ENTERPRISE_WARNING_SHARED_PREFERENES_KEY_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Landroid/content/pm/ApplicationInfo;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 132
    .local v0, "accountFileName":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 133
    .local v2, "sharedPreferences":Landroid/content/SharedPreferences;
    return-object v2
.end method

.method private initializeImageLoader()V
    .registers 3

    .prologue
    .line 160
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->isInited()Z

    move-result v1

    if-nez v1, :cond_15

    .line 161
    invoke-static {p0}, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;->createDefault(Landroid/content/Context;)Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;

    move-result-object v0

    .line 162
    .local v0, "loaderConfiguration":Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->init(Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;)V

    .line 164
    .end local v0    # "loaderConfiguration":Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    :cond_15
    return-void
.end method

.method private isDefaultCloudSet()Z
    .registers 4

    .prologue
    .line 99
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v1

    .line 100
    .local v1, "sharedCloudManager":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    .line 101
    .local v0, "defaultCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    if-nez v0, :cond_c

    .line 102
    const/4 v2, 0x0

    .line 103
    :goto_b
    return v2

    :cond_c
    const/4 v2, 0x1

    goto :goto_b
.end method

.method private launchCloudPicker()V
    .registers 3

    .prologue
    .line 93
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isCloudPickerLaunched:Z

    .line 94
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/behance/sdk/ui/activities/BehanceSDKAdobeCloudSelectionActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 95
    .local v0, "cloudSelectionActivityIntent":Landroid/content/Intent;
    const/16 v1, 0x1a7a

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 96
    return-void
.end method

.method private showEnterpriseUserWarningScreen(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 10
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "preferenceKey"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    .line 111
    iput-boolean v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isWarningScreenVisible:Z

    .line 112
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 113
    .local v2, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    .line 114
    .local v3, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    const-string v5, "FRAGMENT_TAG_ENTERPRISE_USER_WARNING_FRAGMENT"

    invoke-virtual {v2, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    .line 115
    .local v4, "previousInstance":Landroid/support/v4/app/Fragment;
    if-eqz v4, :cond_16

    .line 116
    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 118
    :cond_16
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 119
    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    invoke-direct {v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;-><init>()V

    .line 120
    .local v1, "elwfragment":Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;
    invoke-virtual {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;)V

    .line 121
    const-string v5, "FRAGMENT_TAG_ENTERPRISE_USER_WARNING_FRAGMENT"

    invoke-virtual {v1, v3, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 122
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 123
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p2, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 124
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 125
    return-void
.end method


# virtual methods
.method public CanContinueWithWokflow()Z
    .registers 2

    .prologue
    .line 146
    iget-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isWarningScreenVisible:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isCloudPickerLaunched:Z

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public continueWithWorkflow()V
    .registers 1

    .prologue
    .line 108
    return-void
.end method

.method protected abstract getBehanceSDKUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;
.end method

.method protected getUserBehanceAccountId()Ljava/lang/String;
    .registers 3

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->getBehanceSDKUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v0

    .line 45
    .local v0, "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    invoke-interface {v0}, Lcom/behance/sdk/IBehanceSDKUserCredentials;->getUserBehanceAccountId()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 85
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 86
    const/16 v0, 0x1a7a

    if-ne p1, v0, :cond_d

    .line 87
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isCloudPickerLaunched:Z

    .line 88
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->continueWithWorkflow()V

    .line 90
    :cond_d
    return-void
.end method

.method public onBackButtonPressed()V
    .registers 1

    .prologue
    .line 155
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->finish()V

    .line 156
    return-void
.end method

.method public onCancelButtonPressed()V
    .registers 1

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->finish()V

    .line 151
    return-void
.end method

.method public onContinueButtonPressed()V
    .registers 2

    .prologue
    .line 138
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isWarningScreenVisible:Z

    .line 139
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isDefaultCloudSet()Z

    move-result v0

    if-nez v0, :cond_d

    .line 140
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->launchCloudPicker()V

    .line 143
    :goto_c
    return-void

    .line 142
    :cond_d
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->continueWithWorkflow()V

    goto :goto_c
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 11
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    .line 57
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 58
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->initializeImageLoader()V

    .line 59
    if-eqz p1, :cond_25

    .line 60
    const-string v6, "KEY_ENTERPRISE_USER_WARNING_VIEW_VISIBLE"

    invoke-virtual {p1, v6, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isWarningScreenVisible:Z

    .line 61
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 62
    .local v2, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    const-string v6, "FRAGMENT_TAG_ENTERPRISE_USER_WARNING_FRAGMENT"

    invoke-virtual {v2, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 63
    .local v1, "elwfragment":Landroid/support/v4/app/Fragment;
    instance-of v6, v1, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    if-eqz v6, :cond_24

    .line 64
    check-cast v1, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    .end local v1    # "elwfragment":Landroid/support/v4/app/Fragment;
    invoke-virtual {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;)V

    .line 81
    .end local v2    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    :cond_24
    :goto_24
    return-void

    .line 67
    :cond_25
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v5

    .line 68
    .local v5, "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    invoke-virtual {v5}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->isUserAnEnterpriseUser()Z

    move-result v6

    if-eqz v6, :cond_24

    .line 69
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->getSharedPreference()Landroid/content/SharedPreferences;

    move-result-object v4

    .line 70
    .local v4, "preferences":Landroid/content/SharedPreferences;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SP_KEY_ENTERPRISE_USER_WARNING_SHOWN"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->getUserBehanceAccountId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 71
    .local v3, "preferenceKey":Ljava/lang/String;
    invoke-interface {v4, v3, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 72
    .local v0, "alreadyShown":Z
    if-nez v0, :cond_53

    .line 73
    invoke-direct {p0, v4, v3}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->showEnterpriseUserWarningScreen(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 76
    :cond_53
    iget-boolean v6, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isWarningScreenVisible:Z

    if-nez v6, :cond_24

    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isDefaultCloudSet()Z

    move-result v6

    if-nez v6, :cond_24

    .line 77
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->launchCloudPicker()V

    goto :goto_24
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 50
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 51
    const-string v0, "KEY_ENTERPRISE_USER_WARNING_VIEW_VISIBLE"

    iget-boolean v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isWarningScreenVisible:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 52
    const-string v0, "KEY_ENTERPRISE_USER_WARNING_VIEW_VISIBLE"

    iget-boolean v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->isCloudPickerLaunched:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 53
    return-void
.end method
