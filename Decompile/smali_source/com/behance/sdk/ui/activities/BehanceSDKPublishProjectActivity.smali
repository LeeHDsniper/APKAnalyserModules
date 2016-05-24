.class public Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;
.super Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;
.source "BehanceSDKPublishProjectActivity.java"

# interfaces
.implements Lcom/behance/sdk/listeners/IPublishProjectNavigationListener;
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;


# instance fields
.field private publishProjectScreens:Landroid/widget/ViewFlipper;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;-><init>()V

    return-void
.end method

.method private addProjectDetailsToWFManager()V
    .registers 6

    .prologue
    .line 180
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 181
    .local v2, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v1

    .line 182
    .local v1, "instance":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    invoke-virtual {v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->initializeProject()V

    .line 183
    const-string v3, "INTENT_SERIALIZABLE_EXTRA_PROJECT_TITLE"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setProjectTitle(Ljava/lang/String;)V

    .line 184
    const-string v3, "INTENT_SERIALIZABLE_EXTRA_PROJECT_DESC"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setProjectDescription(Ljava/lang/String;)V

    .line 185
    const-string v3, "INTENT_SERIALIZABLE_EXTRA_PROJECT_TAGS"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setProjectTags(Ljava/lang/String;)V

    .line 186
    const-string v3, "INTENT_SERIALIZABLE_EXTRA_PROJECT_COPYRIGHT_SETTINGS"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 187
    .local v0, "copyrightSettings":Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    if-eqz v0, :cond_33

    .line 188
    invoke-virtual {v1, v0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setCopyrightOption(Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V

    .line 189
    :cond_33
    const-string v3, "INTENT_SERIALIZABLE_EXTRA_PROJECT_CONTAINS_ADULT_CONTENT"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v1, v3}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setContainsAdultContent(Z)V

    .line 190
    return-void
.end method

.method private addShowNextAnimations()V
    .registers 3

    .prologue
    .line 95
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    sget v1, Lcom/behance/sdk/R$anim;->bsdk_publish_project_open_enter_anim:I

    invoke-virtual {v0, p0, v1}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 96
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    sget v1, Lcom/behance/sdk/R$anim;->bsdk_publish_project_open_exit_anim:I

    invoke-virtual {v0, p0, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 98
    return-void
.end method

.method private addShowPreviousAnimations()V
    .registers 3

    .prologue
    .line 101
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    sget v1, Lcom/behance/sdk/R$anim;->bsdk_publish_project_close_enter_anim:I

    invoke-virtual {v0, p0, v1}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 102
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    sget v1, Lcom/behance/sdk/R$anim;->bsdk_publish_project_close_exit_anim:I

    invoke-virtual {v0, p0, v1}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 104
    return-void
.end method

.method private addValidImageModulesToWFManager()V
    .registers 5

    .prologue
    .line 169
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 170
    .local v1, "intent":Landroid/content/Intent;
    const-string v3, "INTENT_SERIALIZABLE_EXTRA_PROJECT_IMAGE_MODULES"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 172
    .local v2, "projectImageModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    if-eqz v2, :cond_1b

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1b

    .line 173
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v0

    .line 174
    .local v0, "instance":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    invoke-virtual {v0, v2}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->addImagesSelectedForProject(Ljava/util/List;)V

    .line 176
    .end local v0    # "instance":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    :cond_1b
    return-void
.end method

.method private showNextScreen()V
    .registers 3

    .prologue
    .line 74
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-eq v0, v1, :cond_18

    .line 75
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->addShowNextAnimations()V

    .line 76
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    .line 79
    :cond_18
    return-void
.end method

.method private showPreviousScreen()V
    .registers 1

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->onBackPressed()V

    .line 92
    return-void
.end method


# virtual methods
.method public closeThisActivity(Z)V
    .registers 4
    .param p1, "overrideTransition"    # Z

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->finish()V

    .line 83
    if-eqz p1, :cond_b

    .line 84
    const/4 v0, 0x0

    sget v1, Lcom/behance/sdk/R$anim;->bsdk_publish_wip_info_view_exit:I

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->overridePendingTransition(II)V

    .line 86
    :cond_b
    return-void
.end method

.method public continueWithWorkflow()V
    .registers 3

    .prologue
    .line 42
    iget-object v0, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setVisibility(I)V

    .line 43
    return-void
.end method

.method protected getBehanceSDKUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;
    .registers 3

    .prologue
    .line 46
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v0

    .line 47
    .local v0, "workflowManager":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    invoke-virtual {v0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v1

    return-object v1
.end method

.method public launchImageSelectionDialogForEditScreen()V
    .registers 5

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 118
    .local v0, "fragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-static {}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getUnlimitedImageSelectionOptions()Lcom/behance/sdk/BehanceSDKImageSelectorOptions;

    move-result-object v1

    .line 119
    .local v1, "imageSelectionOptions":Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    const-wide/32 v2, 0x800000

    invoke-virtual {v1, v2, v3}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setMaxImageSizeInBytes(J)V

    .line 120
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKUtils;->getAllowedFileExtensionsForProjectImage()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->setAllowedFileExtensions(Ljava/util/ArrayList;)V

    .line 121
    const-string v2, "FRAGMENT_TAG_ADD_PROJECT_ALBUM_SELECTION_FRAGMENT"

    invoke-static {p0, v1, v0, v2}, Lcom/behance/sdk/util/BehanceSDKLaunchUtil;->launchAlbumsViewToPickPicture(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKImageSelectorOptions;Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 7
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 194
    invoke-super {p0, p1, p2, p3}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 195
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$id;->bsdkPublishProjectPreviewFragment:I

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 196
    .local v0, "fragment":Landroid/support/v4/app/Fragment;
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 198
    return-void
.end method

.method public onBackPressed()V
    .registers 4

    .prologue
    .line 154
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v1

    if-eqz v1, :cond_11

    .line 155
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->addShowPreviousAnimations()V

    .line 156
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->showPrevious()V

    .line 166
    :goto_10
    return-void

    .line 158
    :cond_11
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v0

    .line 159
    .local v0, "instance":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    invoke-virtual {v0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->cancelWorkflow()V

    .line 161
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTypePublishUXCancel:Ljava/lang/String;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->AdobeAnalyticsShareTargetBehanceProject:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackSharingAction(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->closeThisActivity(Z)V

    goto :goto_10
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 52
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->addValidImageModulesToWFManager()V

    .line 54
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->addProjectDetailsToWFManager()V

    .line 55
    sget v1, Lcom/behance/sdk/R$layout;->bsdk_activity_publish_project:I

    invoke-virtual {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->setContentView(I)V

    .line 56
    sget v1, Lcom/behance/sdk/R$anim;->bsdk_publish_wip_info_view_enter:I

    invoke-virtual {p0, v1, v2}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->overridePendingTransition(II)V

    .line 57
    sget v1, Lcom/behance/sdk/R$id;->bsdkPublishProjectViewFlipper:I

    invoke-virtual {p0, v1}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ViewFlipper;

    iput-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    .line 58
    if-eqz p1, :cond_2b

    .line 59
    const-string v1, "BUNDLE_KEY_CURRENT_PAGE_NUMBER"

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 60
    .local v0, "currentPage":I
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    invoke-virtual {v1, v0}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 62
    .end local v0    # "currentPage":I
    :cond_2b
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->CanContinueWithWokflow()Z

    move-result v1

    if-eqz v1, :cond_37

    .line 63
    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ViewFlipper;->setVisibility(I)V

    .line 65
    :cond_37
    return-void
.end method

.method public onImageSelectorOnError(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 144
    return-void
.end method

.method public onImageSelectorSelectionBackPressed()V
    .registers 1

    .prologue
    .line 139
    return-void
.end method

.method public onImageSelectorSelectionCanceled()V
    .registers 1

    .prologue
    .line 134
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
    .line 127
    .local p1, "selectedImageModulesList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v0

    .line 128
    .local v0, "instance":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    invoke-virtual {v0, p1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->addImagesSelectedForProject(Ljava/util/List;)V

    .line 129
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 148
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 149
    const-string v0, "BUNDLE_KEY_CURRENT_PAGE_NUMBER"

    iget-object v1, p0, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->publishProjectScreens:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 150
    return-void
.end method

.method protected onStart()V
    .registers 3

    .prologue
    .line 69
    invoke-super {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKBasePublishActivity;->onStart()V

    .line 70
    invoke-virtual {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$color;->bsdk_publish_project_view_bg_color:I

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 71
    return-void
.end method

.method public showNext()V
    .registers 1

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->showNextScreen()V

    .line 109
    return-void
.end method

.method public showPrevious()V
    .registers 1

    .prologue
    .line 113
    invoke-direct {p0}, Lcom/behance/sdk/ui/activities/BehanceSDKPublishProjectActivity;->showPreviousScreen()V

    .line 114
    return-void
.end method
