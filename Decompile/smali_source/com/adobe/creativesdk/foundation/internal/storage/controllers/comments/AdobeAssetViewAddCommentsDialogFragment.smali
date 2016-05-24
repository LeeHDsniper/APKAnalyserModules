.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;
.super Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;
.source "AdobeAssetViewAddCommentsDialogFragment.java"


# instance fields
.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field _commentsManager:Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;

.field private _isAttached:Z

.field private _observer:Ljava/util/Observer;

.field private _targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->handleAddComments(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->handleCommentsError()V

    return-void
.end method

.method private addComment()V
    .registers 5

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "comment":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    sget-object v3, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .line 98
    .local v1, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->disablePositiveButton()V

    .line 99
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->disableNegativeButton()V

    .line 100
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_commentsManager:Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;

    if-eqz v2, :cond_22

    .line 102
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_commentsManager:Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment$1;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;)V

    invoke-virtual {v2, v0, v3}, Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;->addComments(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeAddCommentCallback;)V

    .line 115
    :cond_22
    return-void
.end method

.method private finishDialog()V
    .registers 1

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->dismissKeyBoard()V

    .line 90
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->dismissAllowingStateLoss()V

    .line 91
    return-void
.end method

.method private getResourceString(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private handleAddComments(Ljava/lang/String;)V
    .registers 5
    .param p1, "commentURL"    # Ljava/lang/String;

    .prologue
    .line 121
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 122
    .local v0, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsKeys;->ADOBE_ASSET_VIEW_ADD_COMMENTS_STATUS_KEY:Ljava/lang/String;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;->ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsKeys;->ADOBE_ASSET_VIEW_ADD_COMMENTS_URL_KEY:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_observer:Ljava/util/Observer;

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Ljava/util/Observer;->update(Ljava/util/Observable;Ljava/lang/Object;)V

    .line 125
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->finishDialog()V

    .line 126
    return-void
.end method

.method private handleCancelOperation()V
    .registers 1

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->finishDialog()V

    .line 146
    return-void
.end method

.method private handleCommentsError()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 129
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->enableNegativeButton()V

    .line 131
    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_isAttached:Z

    const/4 v2, 0x1

    if-ne v1, v2, :cond_16

    .line 132
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_add_comments_dialog_error_message:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->showErrorDialog(Ljava/lang/String;)V

    .line 133
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->enablePositiveButton()V

    .line 142
    :goto_15
    return-void

    .line 137
    :cond_16
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 138
    .local v0, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsKeys;->ADOBE_ASSET_VIEW_ADD_COMMENTS_STATUS_KEY:Ljava/lang/String;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;->ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_ERROR:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentOperationStatus;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsKeys;->ADOBE_ASSET_VIEW_ADD_COMMENTS_URL_KEY:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_observer:Ljava/util/Observer;

    invoke-interface {v1, v3, v0}, Ljava/util/Observer;->update(Ljava/util/Observable;Ljava/lang/Object;)V

    goto :goto_15
.end method


# virtual methods
.method public handleNegativeClick()V
    .registers 1

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->handleCancelOperation()V

    .line 86
    return-void
.end method

.method public handlePositiveClick()V
    .registers 1

    .prologue
    .line 81
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->addComment()V

    .line 82
    return-void
.end method

.method public handleTextChanged()V
    .registers 2

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_18

    .line 74
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->enablePositiveButton()V

    .line 77
    :goto_17
    return-void

    .line 76
    :cond_18
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->disablePositiveButton()V

    goto :goto_17
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 55
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_isAttached:Z

    .line 57
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 49
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 51
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 36
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_add_comments_dialog_title:I

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->setDialogTitle(Ljava/lang/String;)V

    .line 37
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_add_comments_dialog_hint_text:I

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->setEditTextHint(Ljava/lang/String;)V

    .line 38
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_add_comments_dialog_negative_button:I

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->setNegativeButtonTitle(Ljava/lang/String;)V

    .line 39
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_add_comments_dialog_positive_button:I

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->setPositiveButtonTitle(Ljava/lang/String;)V

    .line 40
    invoke-super {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDetach()V
    .registers 2

    .prologue
    .line 61
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onDetach()V

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_isAttached:Z

    .line 63
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 67
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 68
    return-void
.end method

.method public setParameters(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Ljava/util/Observer;)V
    .registers 6
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p2, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .param p3, "completionObserver"    # Ljava/util/Observer;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 151
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    if-eqz v0, :cond_f

    .line 152
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_commentsManager:Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;

    .line 153
    :cond_f
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_observer:Ljava/util/Observer;

    .line 154
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 155
    return-void
.end method
