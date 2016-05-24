.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;
.source "AdobeAssetViewCCFilesWithUploadContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CCFilesActionBarControllerWithUploadControls"
.end annotation


# instance fields
.field private _createNewFolder:Landroid/view/MenuItem;

.field private _editAssets:Landroid/view/MenuItem;

.field private _takeCameraPhoto:Landroid/view/MenuItem;

.field private _uploadBtn:Landroid/view/MenuItem;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    .prologue
    .line 888
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V

    return-void
.end method

.method private refreshOptionsInternal()V
    .registers 7

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 921
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_uploadBtn:Landroid/view/MenuItem;

    if-nez v1, :cond_7

    .line 972
    :cond_6
    :goto_6
    return-void

    .line 923
    :cond_7
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->getUnreadCount()I

    move-result v4

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->setNotificationCount(I)V
    invoke-static {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;I)V

    .line 925
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->isAnyUploadInProgress()Z
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Z

    move-result v0

    .line 927
    .local v0, "isUploadInProgress":Z
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_uploadBtn:Landroid/view/MenuItem;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    if-eqz v0, :cond_f0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->CANCEL_UPLOAD_ASSET_BROWSER_BUTTON:I

    :goto_1e
    invoke-virtual {v5, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getAdobeFormattedString(I)Landroid/text/SpannableString;

    move-result-object v1

    invoke-interface {v4, v1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 929
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_uploadBtn:Landroid/view/MenuItem;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->isSearchBarOpened()Z

    move-result v1

    if-nez v1, :cond_f4

    move v1, v2

    :goto_30
    invoke-interface {v4, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 930
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_createNewFolder:Landroid/view/MenuItem;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$string;->CREATE_NEW_FOLDER_TITLE:I

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getAdobeFormattedString(I)Landroid/text/SpannableString;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 931
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_createNewFolder:Landroid/view/MenuItem;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->isSearchBarOpened()Z

    move-result v1

    if-nez v1, :cond_4c

    if-eqz v0, :cond_f7

    :cond_4c
    move v1, v3

    :goto_4d
    invoke-interface {v4, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 932
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_takeCameraPhoto:Landroid/view/MenuItem;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$string;->UPLOAD_ASSET_FROM_CAMERA_BUTTON:I

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getAdobeFormattedString(I)Landroid/text/SpannableString;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 933
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_takeCameraPhoto:Landroid/view/MenuItem;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->isSearchBarOpened()Z

    move-result v1

    if-nez v1, :cond_69

    if-eqz v0, :cond_fa

    :cond_69
    move v1, v3

    :goto_6a
    invoke-interface {v4, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 934
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_editAssets:Landroid/view/MenuItem;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_action_edit_asset:I

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getAdobeFormattedString(I)Landroid/text/SpannableString;

    move-result-object v4

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 935
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_editAssets:Landroid/view/MenuItem;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->isSearchBarOpened()Z

    move-result v4

    if-nez v4, :cond_86

    if-eqz v0, :cond_fd

    :cond_86
    move v2, v3

    :goto_87
    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 937
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_notificationView:Landroid/view/View;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_af

    .line 939
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_notificationMenuItem:Landroid/view/MenuItem;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_notificationView:Landroid/view/View;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Landroid/view/View;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    .line 940
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_notificationView:Landroid/view/View;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 959
    :cond_af
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->isNetworkOnline()Z

    move-result v1

    if-nez v1, :cond_dd

    .line 960
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_notificationMenuItem:Landroid/view/MenuItem;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 961
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_collaboratorMenuItem:Landroid/view/MenuItem;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 962
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_uploadBtn:Landroid/view/MenuItem;

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 963
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_takeCameraPhoto:Landroid/view/MenuItem;

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 964
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_createNewFolder:Landroid/view/MenuItem;

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 965
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_editAssets:Landroid/view/MenuItem;

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 969
    :cond_dd
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->deviceHasCameraFeature(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 970
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_takeCameraPhoto:Landroid/view/MenuItem;

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_6

    .line 927
    :cond_f0
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->UPLOAD_ASSET_BROWSER_BUTTON:I

    goto/16 :goto_1e

    :cond_f4
    move v1, v3

    .line 929
    goto/16 :goto_30

    :cond_f7
    move v1, v2

    .line 931
    goto/16 :goto_4d

    :cond_fa
    move v1, v2

    .line 933
    goto/16 :goto_6a

    .line 935
    :cond_fd
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditManager;->isEditInProgress()Z

    move-result v4

    if-nez v4, :cond_86

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->isAssetsMainFrameVisible()Z

    move-result v4

    if-eqz v4, :cond_86

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->isNetworkOnline()Z

    move-result v4

    if-eqz v4, :cond_86

    goto/16 :goto_87
.end method


# virtual methods
.method public handleOptionItemSelect(I)Z
    .registers 6
    .param p1, "itemId"    # I

    .prologue
    const/4 v0, 0x1

    .line 989
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_loki_upload_btn:I

    if-ne p1, v1, :cond_29

    .line 990
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->isAnyUploadInProgress()Z
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 991
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSETVIEW_CANCEL_UPLOAD:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getTargetCollection()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    .line 1019
    :goto_1a
    return v0

    .line 993
    :cond_1b
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSETVIEW_UPLOAD_FILES:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getTargetCollection()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    goto :goto_1a

    .line 996
    :cond_29
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_loki_createnewfolder:I

    if-ne p1, v1, :cond_3b

    .line 997
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_MENU_CREATE_NEWFOLDER:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getTargetCollection()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    goto :goto_1a

    .line 1000
    :cond_3b
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_assets_view_edit_asset:I

    if-ne p1, v1, :cond_55

    .line 1003
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSET_EDIT_OPEN_MULTI_SELECT_EDIT_WINDOW:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getTargetCollection()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getHref()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    goto :goto_1a

    .line 1006
    :cond_55
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_loki_upload_from_camera:I

    if-ne p1, v1, :cond_67

    .line 1007
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSETVIEW_UPLOAD_PHOTO_FROM_CAMERA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getTargetCollection()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    goto :goto_1a

    .line 1011
    :cond_67
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_browser_adobe_notification:I

    if-ne p1, v1, :cond_74

    .line 1012
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_MENU_NOTIFICATION:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    goto :goto_1a

    .line 1015
    :cond_74
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_browser_add_collaborator:I

    if-ne p1, v1, :cond_86

    .line 1016
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_MENU_COLLABORATION:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->getTargetCollection()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    goto :goto_1a

    .line 1019
    :cond_86
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->handleOptionItemSelect(I)Z

    move-result v0

    goto :goto_1a
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 5
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 897
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 898
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_assetBrowserMenu:Landroid/view/Menu;
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$902(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;Landroid/view/Menu;)Landroid/view/Menu;

    .line 899
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$menu;->adobe_assetview_loki_upload_menu:I

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 900
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_loki_upload_btn:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_uploadBtn:Landroid/view/MenuItem;

    .line 901
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_loki_createnewfolder:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_createNewFolder:Landroid/view/MenuItem;

    .line 902
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_loki_upload_from_camera:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_takeCameraPhoto:Landroid/view/MenuItem;

    .line 903
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_assets_view_edit_asset:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_editAssets:Landroid/view/MenuItem;

    .line 904
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_browser_adobe_notification:I

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_notificationMenuItem:Landroid/view/MenuItem;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1002(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;Landroid/view/MenuItem;)Landroid/view/MenuItem;

    .line 905
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_browser_add_collaborator:I

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_collaboratorMenuItem:Landroid/view/MenuItem;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1102(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;Landroid/view/MenuItem;)Landroid/view/MenuItem;

    .line 906
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_collaboratorMenuItem:Landroid/view/MenuItem;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Landroid/view/MenuItem;

    move-result-object v0

    if-eqz v0, :cond_6e

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isPrivateCloud()Z

    move-result v0

    if-eqz v0, :cond_6e

    .line 908
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_collaboratorMenuItem:Landroid/view/MenuItem;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 909
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_collaboratorMenuItem:Landroid/view/MenuItem;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;)Landroid/view/MenuItem;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->ic_people_black_24dp_disabled:I

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 911
    :cond_6e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->_ccFilesMenu:Landroid/view/Menu;
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->access$1202(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;Landroid/view/Menu;)Landroid/view/Menu;

    .line 913
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .registers 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 981
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 982
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->refreshOptionsInternal()V

    .line 983
    return-void
.end method

.method public refreshOptionItems()V
    .registers 1

    .prologue
    .line 975
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->refreshOptionItems()V

    .line 976
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->refreshOptionsInternal()V

    .line 977
    return-void
.end method

.method public setEditMenuVisibilty(Z)V
    .registers 3
    .param p1, "editMenuVisibilty"    # Z

    .prologue
    .line 916
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_editAssets:Landroid/view/MenuItem;

    if-eqz v0, :cond_9

    .line 917
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment$CCFilesActionBarControllerWithUploadControls;->_editAssets:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 918
    :cond_9
    return-void
.end method
