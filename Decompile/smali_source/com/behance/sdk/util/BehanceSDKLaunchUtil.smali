.class public Lcom/behance/sdk/util/BehanceSDKLaunchUtil;
.super Ljava/lang/Object;
.source "BehanceSDKLaunchUtil.java"


# direct methods
.method public static launchAlbumsViewToPickPicture(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKImageSelectorOptions;Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V
    .registers 7
    .param p0, "callbacks"    # Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;
    .param p1, "options"    # Lcom/behance/sdk/BehanceSDKImageSelectorOptions;
    .param p2, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p3, "fragmentTag"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-static {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getInstance(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKImageSelectorOptions;)Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    move-result-object v2

    .line 36
    .local v2, "selectImageDialog":Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;
    invoke-virtual {p2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 37
    .local v0, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    invoke-virtual {p2, p3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 38
    .local v1, "previousInstance":Landroid/support/v4/app/Fragment;
    if-eqz v1, :cond_11

    .line 39
    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 41
    :cond_11
    invoke-virtual {v2, v0, p3}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 42
    return-void
.end method
