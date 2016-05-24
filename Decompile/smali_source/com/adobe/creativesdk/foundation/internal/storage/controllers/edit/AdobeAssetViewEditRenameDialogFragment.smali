.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;
.super Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;
.source "AdobeAssetViewEditRenameDialogFragment.java"


# instance fields
.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field private _isAttached:Z

.field private _observer:Ljava/util/Observer;

.field private _targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

.field private controller:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesRenameDialogDismissController;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;-><init>()V

    .line 37
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->handleAssetRename()V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->handleRenameError()V

    return-void
.end method

.method private finishDialog()V
    .registers 1

    .prologue
    .line 100
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->dismissKeyBoard()V

    .line 102
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->dismissAllowingStateLoss()V

    .line 103
    return-void
.end method

.method private getResourceString(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private handleAssetRename()V
    .registers 4

    .prologue
    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->_observer:Ljava/util/Observer;

    const/4 v1, 0x0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditRenameOperationStatus;->ADOBE_CC_FILES_EDIT_RENAME_OPERATION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditRenameOperationStatus;

    invoke-interface {v0, v1, v2}, Ljava/util/Observer;->update(Ljava/util/Observable;Ljava/lang/Object;)V

    .line 138
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->finishDialog()V

    .line 139
    return-void
.end method

.method private handleCancelOperation()V
    .registers 1

    .prologue
    .line 150
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->finishDialog()V

    .line 151
    return-void
.end method

.method private handleRenameError()V
    .registers 4

    .prologue
    .line 142
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->enableNegativeButton()V

    .line 143
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->_isAttached:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_11

    .line 144
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_rename_dialog_error_message:I

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->showErrorDialog(Ljava/lang/String;)V

    .line 145
    :cond_11
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->_observer:Ljava/util/Observer;

    const/4 v1, 0x0

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditRenameOperationStatus;->ADOBE_CC_FILES_EDIT_RENAME_OPERATION_STATUS_FAILED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditRenameOperationStatus;

    invoke-interface {v0, v1, v2}, Ljava/util/Observer;->update(Ljava/util/Observable;Ljava/lang/Object;)V

    .line 146
    return-void
.end method

.method private notifiyEditStarted()V
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 130
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditManager;->setEditInProgress(Z)V

    .line 131
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditManager;->setEditStarted(Z)V

    .line 132
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSETVIEW_EDIT_STARTED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->postCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;)V

    .line 133
    return-void
.end method

.method private renameAsset()V
    .registers 5

    .prologue
    .line 107
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "newAssetName":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    sget-object v3, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .line 109
    .local v1, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->disablePositiveButton()V

    .line 110
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->disableNegativeButton()V

    .line 111
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->notifiyEditStarted()V

    .line 112
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->_targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment$1;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;)V

    invoke-virtual {v1, v2, v0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->renameAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageSessionEditCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 127
    return-void
.end method


# virtual methods
.method public handleNegativeClick()V
    .registers 1

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->handleCancelOperation()V

    .line 97
    return-void
.end method

.method public handlePositiveClick()V
    .registers 1

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->renameAsset()V

    .line 93
    return-void
.end method

.method public handleTextChanged()V
    .registers 2

    .prologue
    .line 84
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_14

    .line 85
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->enablePositiveButton()V

    .line 88
    :goto_13
    return-void

    .line 87
    :cond_14
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->disablePositiveButton()V

    goto :goto_13
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 67
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->_isAttached:Z

    .line 68
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 60
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 62
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_rename_dialog_title:I

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->setDialogTitle(Ljava/lang/String;)V

    .line 42
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_rename_dialog_hint_text:I

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->setEditTextHint(Ljava/lang/String;)V

    .line 43
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_rename_dialog_negative_button:I

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->setNegativeButtonTitle(Ljava/lang/String;)V

    .line 44
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_rename_dialog_positive_button:I

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->setPositiveButtonTitle(Ljava/lang/String;)V

    .line 45
    invoke-super {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDetach()V
    .registers 2

    .prologue
    .line 72
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onDetach()V

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->_isAttached:Z

    .line 74
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 78
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->controller:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesRenameDialogDismissController;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesRenameDialogDismissController;->dialogClosed()V

    .line 80
    return-void
.end method

.method public setDismissController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesRenameDialogDismissController;)V
    .registers 2
    .param p1, "controller"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesRenameDialogDismissController;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->controller:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesRenameDialogDismissController;

    .line 51
    return-void
.end method

.method public setParameters(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Ljava/util/Observer;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 4
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p2, "completionObserver"    # Ljava/util/Observer;
    .param p3, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 155
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->_targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 156
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->_observer:Ljava/util/Observer;

    .line 157
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditRenameDialogFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 158
    return-void
.end method
