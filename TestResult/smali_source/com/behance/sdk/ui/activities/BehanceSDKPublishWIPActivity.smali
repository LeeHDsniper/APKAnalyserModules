.class public Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;
.super Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;
.source "BehanceSDKPublishWIPActivity.java"

# interfaces
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;-><init>()V

    return-void
.end method

.method private closeThisActivity()V
    .registers 1

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->finish()V

    .line 152
    return-void
.end method

.method private displayNoInternetConnectivity()V
    .registers 3

    .prologue
    .line 155
    sget v0, Lcom/behance/sdk/R$string;->bsdk_add_wip_view_connection_error_msg:I

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 156
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->closeThisActivity()V

    .line 157
    return-void
.end method

.method private displayToastMessage(Ljava/lang/String;)V
    .registers 3
    .param p1, "msgToDisplay"    # Ljava/lang/String;

    .prologue
    .line 140
    if-eqz p1, :cond_a

    .line 141
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 143
    :cond_a
    return-void
.end method

.method private loadPublishWIPFragment()V
    .registers 7

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->validateParamsAndGetOptions()Lcom/behance/sdk/BehanceSDKPublishWIPOptions;

    move-result-object v4

    .line 91
    .local v4, "publishWIPOptions":Lcom/behance/sdk/BehanceSDKPublishWIPOptions;
    if-eqz v4, :cond_27

    .line 92
    invoke-static {p0, v4}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getInstance(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKPublishWIPOptions;)Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    move-result-object v3

    .line 93
    .local v3, "publishWIPFragment":Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 94
    .local v0, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 95
    .local v1, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    const-string v5, "BEHANCE_SDK_PUBLISH_WIP_ACTIVITY_FRAGMENT_TAG_PUBLISH_WIP"

    invoke-virtual {v0, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    .line 96
    .local v2, "previousInstance":Landroid/support/v4/app/Fragment;
    if-eqz v2, :cond_1d

    .line 97
    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 99
    :cond_1d
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 100
    const-string v5, "BEHANCE_SDK_PUBLISH_WIP_ACTIVITY_FRAGMENT_TAG_PUBLISH_WIP"

    invoke-virtual {v3, v1, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 104
    .end local v0    # "fragmentManager":Landroid/support/v4/app/FragmentManager;
    .end local v1    # "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    .end local v2    # "previousInstance":Landroid/support/v4/app/Fragment;
    .end local v3    # "publishWIPFragment":Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;
    :goto_26
    return-void

    .line 102
    :cond_27
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->closeThisActivity()V

    goto :goto_26
.end method

.method private validateParamsAndGetOptions()Lcom/behance/sdk/BehanceSDKPublishWIPOptions;
    .registers 11

    .prologue
    .line 107
    const/4 v0, 0x1

    .line 108
    .local v0, "allParamsValid":Z
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 109
    .local v2, "intent":Landroid/content/Intent;
    const-string v8, "INTENT_INT_EXTRA_EXISTING_WIP_ID"

    const/4 v9, 0x0

    invoke-virtual {v2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 110
    .local v1, "existingWIPId":I
    const-string v8, "INTENT_STRING_EXTRA_WIP_DESCRIPTION"

    invoke-virtual {v2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 111
    .local v4, "wipDescription":Ljava/lang/String;
    const-string v8, "INTENT_SERIALIZABLE_EXTRA_WIP_REVISION_IMAGE_MODULE"

    invoke-virtual {v2, v8}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v5

    check-cast v5, Lcom/behance/sdk/project/modules/ImageModule;

    .line 112
    .local v5, "wipRevisionImageModule":Lcom/behance/sdk/project/modules/ImageModule;
    const-string v8, "INTENT_STRING_EXTRA_WIP_TITLE"

    invoke-virtual {v2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 113
    .local v7, "wipTitle":Ljava/lang/String;
    const-string v8, "INTENT_STRING_EXTRA_WIP_TAGS"

    invoke-virtual {v2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 115
    .local v6, "wipTags":Ljava/lang/String;
    if-eqz v5, :cond_50

    .line 116
    sget-object v8, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->VALID:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    invoke-static {v5}, Lcom/behance/sdk/util/BehanceSDKUtils;->validateImageForWIP(Lcom/behance/sdk/project/modules/ImageModule;)Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    move-result-object v9

    if-ne v8, v9, :cond_45

    .line 117
    const/4 v0, 0x1

    .line 127
    :goto_31
    if-eqz v0, :cond_5b

    .line 128
    new-instance v3, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;

    invoke-direct {v3, v5}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;-><init>(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 129
    .local v3, "publishOptions":Lcom/behance/sdk/BehanceSDKPublishWIPOptions;
    invoke-virtual {v3, v7}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->setWipTitle(Ljava/lang/String;)V

    .line 130
    invoke-virtual {v3, v1}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->setExistingWIPId(I)V

    .line 131
    invoke-virtual {v3, v4}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->setWipDescription(Ljava/lang/String;)V

    .line 132
    invoke-virtual {v3, v6}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;->setWipTags(Ljava/lang/String;)V

    .line 135
    .end local v3    # "publishOptions":Lcom/behance/sdk/BehanceSDKPublishWIPOptions;
    :goto_44
    return-object v3

    .line 119
    :cond_45
    sget v8, Lcom/behance/sdk/R$string;->bsdk_publish_wip_image_required_error_msg:I

    invoke-virtual {p0, v8}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->displayToastMessage(Ljava/lang/String;)V

    .line 120
    const/4 v0, 0x0

    goto :goto_31

    .line 123
    :cond_50
    sget v8, Lcom/behance/sdk/R$string;->bsdk_publish_wip_image_required_error_msg:I

    invoke-virtual {p0, v8}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->displayToastMessage(Ljava/lang/String;)V

    .line 124
    const/4 v0, 0x0

    goto :goto_31

    .line 135
    :cond_5b
    const/4 v3, 0x0

    goto :goto_44
.end method


# virtual methods
.method public continueWithWorkflow()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->loadPublishWIPFragment()V

    .line 64
    return-void
.end method

.method protected getBehanceSDKUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;
    .registers 3

    .prologue
    .line 57
    invoke-static {}, Lcom/behance/sdk/managers/AddWIPManager;->getInstance()Lcom/behance/sdk/managers/AddWIPManager;

    move-result-object v0

    .line 58
    .local v0, "wipManager":Lcom/behance/sdk/managers/AddWIPManager;
    invoke-virtual {v0}, Lcom/behance/sdk/managers/AddWIPManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v1

    return-object v1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 68
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->onCreate(Landroid/os/Bundle;)V

    .line 69
    sget v3, Lcom/behance/sdk/R$layout;->bsdk_activity_publish_wip:I

    invoke-virtual {p0, v3}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->setContentView(I)V

    .line 70
    if-nez p1, :cond_2b

    .line 74
    const-string v3, "connectivity"

    invoke-virtual {p0, v3}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/ConnectivityManager;

    invoke-virtual {v3}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 75
    .local v1, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-nez v3, :cond_21

    .line 76
    :cond_1e
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->displayNoInternetConnectivity()V

    .line 78
    :cond_21
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->CanContinueWithWokflow()Z

    move-result v3

    if-nez v3, :cond_2a

    .line 79
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->loadPublishWIPFragment()V

    .line 87
    .end local v1    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_2a
    :goto_2a
    return-void

    .line 81
    :cond_2b
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 82
    .local v0, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    const-string v3, "BEHANCE_SDK_PUBLISH_WIP_ACTIVITY_FRAGMENT_TAG_PUBLISH_WIP"

    invoke-virtual {v0, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    .line 83
    .local v2, "publishWIPFragmentInstance":Landroid/support/v4/app/Fragment;
    instance-of v3, v2, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    if-eqz v3, :cond_2a

    .line 84
    check-cast v2, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    .end local v2    # "publishWIPFragmentInstance":Landroid/support/v4/app/Fragment;
    invoke-virtual {v2, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;)V

    goto :goto_2a
.end method

.method public onPublishWIPViewClose()V
    .registers 1

    .prologue
    .line 147
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishWIPActivity;->closeThisActivity()V

    .line 148
    return-void
.end method
