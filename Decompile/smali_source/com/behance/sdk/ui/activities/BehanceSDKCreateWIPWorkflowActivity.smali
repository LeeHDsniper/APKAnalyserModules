.class public Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;
.super Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;
.source "BehanceSDKCreateWIPWorkflowActivity.java"

# interfaces
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 61
    const-class v0, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;-><init>()V

    return-void
.end method

.method private closeThisActivity(Z)V
    .registers 4
    .param p1, "overrideTransition"    # Z

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->finish()V

    .line 119
    if-eqz p1, :cond_b

    .line 120
    const/4 v0, 0x0

    sget v1, Lcom/behance/sdk/R$anim;->bsdk_publish_wip_info_view_exit:I

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->overridePendingTransition(II)V

    .line 122
    :cond_b
    return-void
.end method

.method private displayNoInternetConnectivity()V
    .registers 3

    .prologue
    .line 64
    sget v0, Lcom/behance/sdk/R$string;->bsdk_add_wip_view_connection_error_msg:I

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->closeThisActivity(Z)V

    .line 66
    return-void
.end method

.method private launchAlbumsViewToPickPicture()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 125
    const/16 v6, 0x280

    const/16 v7, 0x140

    invoke-static {v6, v7}, Lcom/behance/sdk/BehanceSDKImageDimensions;->getInstance(II)Lcom/behance/sdk/BehanceSDKImageDimensions;

    move-result-object v3

    .line 127
    .local v3, "minRequiredWIPImageDimensions":Lcom/behance/sdk/BehanceSDKImageDimensions;
    invoke-static {v3, v8}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getSingleImageSelectionOptions(Lcom/behance/sdk/BehanceSDKImageDimensions;Lcom/behance/sdk/BehanceSDKImageDimensions;)Lcom/behance/sdk/BehanceSDKImageSelectorOptions;

    move-result-object v2

    .line 129
    .local v2, "imageSelectionOptions":Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    const-wide/32 v6, 0xc00000

    invoke-virtual {v2, v6, v7}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setMaxImageSizeInBytes(J)V

    .line 130
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKUtils;->getAllowedFileExtensionsForWIPImage()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setAllowedFileExtensions(Ljava/util/ArrayList;)V

    .line 131
    const-string v6, "PUBLISH_WIP_IMAGE_VALIDATOR"

    invoke-virtual {v2, v6}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setImageValidatorType(Ljava/lang/String;)V

    .line 133
    invoke-static {p0, v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getInstance(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKImageSelectorOptions;)Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    move-result-object v5

    .line 134
    .local v5, "selectImageDialog":Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 135
    .local v0, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 136
    .local v1, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    const-string v6, "FRAGMENT_TAG_CREATE_WIP_WORKFLOW_SELECT_IMAGE"

    invoke-virtual {v0, v6}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    .line 137
    .local v4, "previousInstance":Landroid/support/v4/app/Fragment;
    if-eqz v4, :cond_36

    .line 138
    invoke-virtual {v1, v4}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 140
    :cond_36
    invoke-virtual {v1, v8}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 141
    const-string v6, "FRAGMENT_TAG_CREATE_WIP_WORKFLOW_SELECT_IMAGE"

    invoke-virtual {v5, v1, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 142
    return-void
.end method

.method private launchPublishView(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 8
    .param p1, "selectedImageModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 145
    new-instance v3, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;

    invoke-direct {v3, p1}, Lcom/behance/sdk/BehanceSDKPublishWIPOptions;-><init>(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 146
    .local v3, "publishOptions":Lcom/behance/sdk/BehanceSDKPublishWIPOptions;
    invoke-static {p0, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->getInstance(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKPublishWIPOptions;)Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    move-result-object v4

    .line 147
    .local v4, "publishWIPDialog":Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 148
    .local v0, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 149
    .local v1, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    const-string v5, "FRAGMENT_TAG_CREATE_WIP_WORKFLOW_PUBLISH_WIP"

    invoke-virtual {v0, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    .line 150
    .local v2, "previousInstance":Landroid/support/v4/app/Fragment;
    if-eqz v2, :cond_1c

    .line 151
    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 153
    :cond_1c
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 154
    const-string v5, "FRAGMENT_TAG_CREATE_WIP_WORKFLOW_PUBLISH_WIP"

    invoke-virtual {v4, v1, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 155
    return-void
.end method


# virtual methods
.method public continueWithWorkflow()V
    .registers 1

    .prologue
    .line 104
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->launchAlbumsViewToPickPicture()V

    .line 105
    return-void
.end method

.method protected getBehanceSDKUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;
    .registers 3

    .prologue
    .line 108
    invoke-static {}, Lcom/behance/sdk/managers/AddWIPManager;->getInstance()Lcom/behance/sdk/managers/AddWIPManager;

    move-result-object v0

    .line 109
    .local v0, "wipManager":Lcom/behance/sdk/managers/AddWIPManager;
    invoke-virtual {v0}, Lcom/behance/sdk/managers/AddWIPManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v1

    return-object v1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 70
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->onCreate(Landroid/os/Bundle;)V

    .line 71
    sget v5, Lcom/behance/sdk/R$layout;->bsdk_activity_create_wip_workflow:I

    invoke-virtual {p0, v5}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->setContentView(I)V

    .line 73
    if-nez p1, :cond_2b

    .line 77
    const-string v5, "connectivity"

    invoke-virtual {p0, v5}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/ConnectivityManager;

    invoke-virtual {v5}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    .line 78
    .local v3, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v3, :cond_1e

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-nez v5, :cond_21

    .line 79
    :cond_1e
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->displayNoInternetConnectivity()V

    .line 81
    :cond_21
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->CanContinueWithWokflow()Z

    move-result v5

    if-nez v5, :cond_2a

    .line 82
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->launchAlbumsViewToPickPicture()V

    .line 100
    .end local v3    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_2a
    :goto_2a
    return-void

    .line 84
    :cond_2b
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 85
    .local v1, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    const-string v5, "FRAGMENT_TAG_ENTERPRISE_USER_WARNING_FRAGMENT"

    invoke-virtual {v1, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 86
    .local v0, "enterpriseWarningFragmentInstance":Landroid/support/v4/app/Fragment;
    instance-of v5, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    if-eqz v5, :cond_3e

    .line 87
    check-cast v0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    .end local v0    # "enterpriseWarningFragmentInstance":Landroid/support/v4/app/Fragment;
    invoke-virtual {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;)V

    .line 90
    :cond_3e
    const-string v5, "FRAGMENT_TAG_CREATE_WIP_WORKFLOW_SELECT_IMAGE"

    invoke-virtual {v1, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    .line 91
    .local v2, "imageChooserFragmentInstance":Landroid/support/v4/app/Fragment;
    instance-of v5, v2, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    if-eqz v5, :cond_4d

    .line 92
    check-cast v2, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    .end local v2    # "imageChooserFragmentInstance":Landroid/support/v4/app/Fragment;
    invoke-virtual {v2, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;)V

    .line 95
    :cond_4d
    const-string v5, "FRAGMENT_TAG_CREATE_WIP_WORKFLOW_PUBLISH_WIP"

    invoke-virtual {v1, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v4

    .line 96
    .local v4, "publishWIPFragmentInstance":Landroid/support/v4/app/Fragment;
    instance-of v5, v4, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    if-eqz v5, :cond_2a

    .line 97
    check-cast v4, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;

    .end local v4    # "publishWIPFragmentInstance":Landroid/support/v4/app/Fragment;
    invoke-virtual {v4, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishWIPDialogFragment$Callbacks;)V

    goto :goto_2a
.end method

.method public onImageSelectorOnError(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 183
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->closeThisActivity(Z)V

    .line 184
    return-void
.end method

.method public onImageSelectorSelectionBackPressed()V
    .registers 2

    .prologue
    .line 178
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->closeThisActivity(Z)V

    .line 179
    return-void
.end method

.method public onImageSelectorSelectionCanceled()V
    .registers 2

    .prologue
    .line 173
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->closeThisActivity(Z)V

    .line 174
    return-void
.end method

.method public onImageSelectorSelectionFinished(Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "imageModulesList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    const/4 v5, 0x0

    .line 159
    if-eqz p1, :cond_22

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_22

    .line 160
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    .line 161
    .local v0, "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    sget-object v1, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v2, "Image selected from album. [Name - %s]"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/behance/sdk/project/modules/ImageModule;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-interface {v1, v2, v3}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 162
    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->launchPublishView(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 164
    .end local v0    # "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_22
    return-void
.end method

.method public onPublishWIPViewClose()V
    .registers 2

    .prologue
    .line 168
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateWIPWorkflowActivity;->closeThisActivity(Z)V

    .line 169
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 114
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 115
    return-void
.end method
