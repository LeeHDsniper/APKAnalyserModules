.class public Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;
.super Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;
.source "BehanceSDKCreateProjectWFActivity.java"

# interfaces
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;-><init>()V

    return-void
.end method

.method private displayNoInternetConnectivity()V
    .registers 3

    .prologue
    .line 31
    sget v0, Lcom/behance/sdk/R$string;->bsdk_connection_error_msg:I

    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 32
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->finish()V

    .line 33
    return-void
.end method

.method private startPublishProjectWorkflow()V
    .registers 3

    .prologue
    .line 93
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 94
    .local v0, "detailsIntent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->startActivity(Landroid/content/Intent;)V

    .line 95
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->finish()V

    .line 96
    return-void
.end method


# virtual methods
.method public continueWithWorkflow()V
    .registers 1

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->launchImageSelectionDialog()V

    .line 38
    return-void
.end method

.method protected getBehanceSDKUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;
    .registers 3

    .prologue
    .line 41
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v0

    .line 42
    .local v0, "workflowManager":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    invoke-virtual {v0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v1

    return-object v1
.end method

.method public launchImageSelectionDialog()V
    .registers 5

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 77
    .local v0, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-static {}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getUnlimitedImageSelectionOptions()Lcom/behance/sdk/BehanceSDKImageSelectorOptions;

    move-result-object v1

    .line 78
    .local v1, "imageSelectionOptions":Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    const-wide/32 v2, 0x800000

    invoke-virtual {v1, v2, v3}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setMaxImageSizeInBytes(J)V

    .line 79
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKUtils;->getAllowedFileExtensionsForProjectImage()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setAllowedFileExtensions(Ljava/util/ArrayList;)V

    .line 80
    const-string v2, "PUBLISH_PROJECT_IMAGE_VALIDATOR"

    invoke-virtual {v1, v2}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setImageValidatorType(Ljava/lang/String;)V

    .line 81
    const-string v2, "FRAGMENT_TAG_ADD_PROJECT_ALBUM_SELECTION_FRAGMENT"

    invoke-static {p0, v1, v0, v2}, Lcom/behance/sdk/util/BehanceSDKLaunchUtil;->launchAlbumsViewToPickPicture(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKImageSelectorOptions;Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 47
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->onCreate(Landroid/os/Bundle;)V

    .line 48
    sget v4, Lcom/behance/sdk/R$layout;->bsdk_activity_publish_project_with_image_selection:I

    invoke-virtual {p0, v4}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->setContentView(I)V

    .line 50
    if-nez p1, :cond_2b

    .line 54
    const-string v4, "connectivity"

    invoke-virtual {p0, v4}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/ConnectivityManager;

    invoke-virtual {v4}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    .line 55
    .local v3, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v3, :cond_1e

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v4

    if-nez v4, :cond_21

    .line 56
    :cond_1e
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->displayNoInternetConnectivity()V

    .line 58
    :cond_21
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->CanContinueWithWokflow()Z

    move-result v4

    if-nez v4, :cond_2a

    .line 59
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->launchImageSelectionDialog()V

    .line 73
    .end local v3    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_2a
    :goto_2a
    return-void

    .line 62
    :cond_2b
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 63
    .local v1, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    const-string v4, "FRAGMENT_TAG_ENTERPRISE_USER_WARNING_FRAGMENT"

    invoke-virtual {v1, v4}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 64
    .local v0, "enterpriseWarningFragmentInstance":Landroid/support/v4/app/Fragment;
    instance-of v4, v0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    if-eqz v4, :cond_3e

    .line 65
    check-cast v0, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;

    .end local v0    # "enterpriseWarningFragmentInstance":Landroid/support/v4/app/Fragment;
    invoke-virtual {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKELWFragment$EnterpriseUserWarningDialogCallbacks;)V

    .line 68
    :cond_3e
    const-string v4, "FRAGMENT_TAG_ADD_PROJECT_ALBUM_SELECTION_FRAGMENT"

    invoke-virtual {v1, v4}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    .line 69
    .local v2, "imageChooserFragmentInstance":Landroid/support/v4/app/Fragment;
    instance-of v4, v2, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    if-eqz v4, :cond_2a

    .line 70
    check-cast v2, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    .end local v2    # "imageChooserFragmentInstance":Landroid/support/v4/app/Fragment;
    invoke-virtual {v2, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;)V

    goto :goto_2a
.end method

.method public onImageSelectorOnError(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->finish()V

    .line 113
    return-void
.end method

.method public onImageSelectorSelectionBackPressed()V
    .registers 3

    .prologue
    .line 105
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTypePublishUXCancel:Ljava/lang/String;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTargetBehanceProject:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackSharingAction(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->finish()V

    .line 108
    return-void
.end method

.method public onImageSelectorSelectionCanceled()V
    .registers 1

    .prologue
    .line 100
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->startPublishProjectWorkflow()V

    .line 101
    return-void
.end method

.method public onImageSelectorSelectionFinished(Ljava/util/List;)V
    .registers 3
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
    .line 87
    .local p1, "selectedImageModulesList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v0

    .line 88
    .local v0, "instance":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    invoke-virtual {v0, p1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->addImagesSelectedForProject(Ljava/util/List;)V

    .line 89
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKCreateProjectWFActivity;->startPublishProjectWorkflow()V

    .line 90
    return-void
.end method
