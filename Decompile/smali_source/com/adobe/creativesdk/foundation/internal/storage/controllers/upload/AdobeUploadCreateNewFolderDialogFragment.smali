.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;
.super Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;
.source "AdobeUploadCreateNewFolderDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;
    }
.end annotation


# instance fields
.field _currentFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

.field private _dialogStopped:Z

.field private _savedFolderCreationResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;-><init>()V

    .line 38
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;

    .prologue
    .line 27
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_dialogStopped:Z

    return v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_savedFolderCreationResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;

    return-object v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_savedFolderCreationResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;

    return-object p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->handleNewFolderCreation(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->handleErrorFolderCreation(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method

.method private finishDialog()V
    .registers 1

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->dismissKeyBoard()V

    .line 203
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->dismiss()V

    .line 204
    return-void
.end method

.method private handleErrorFolderCreation(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 2
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->enableNegativeButton()V

    .line 148
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->showError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    .line 149
    return-void
.end method

.method private handleNewFolderCreation(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V
    .registers 4
    .param p1, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 138
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->hideErrorDialog()V

    .line 139
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_currentFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->setFolderAsChanged(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V

    .line 140
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSETVIEW_NEWFOLDER_CREATED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->postCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    .line 141
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->finishDialog()V

    .line 142
    return-void
.end method

.method private showError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 6
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 105
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_common_error_while_creating_folder:I

    .line 107
    .local v1, "errorID":I
    const/4 v0, 0x0

    .line 108
    .local v0, "error1":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    instance-of v2, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    if-eqz v2, :cond_2f

    move-object v0, p1

    .line 109
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .line 111
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;->getErrorCode()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorFileReadFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    if-ne v2, v3, :cond_20

    .line 112
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_common_error_folder_invalid_chars:I

    .line 125
    :cond_14
    :goto_14
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->showErrorDialog(Ljava/lang/String;)V

    .line 126
    return-void

    .line 113
    :cond_20
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;->getHttpStatusCode()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x199

    if-ne v2, v3, :cond_14

    .line 114
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->storage_create_folder_already_exists_error:I

    goto :goto_14

    .line 119
    :cond_2f
    instance-of v2, p1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    if-eqz v2, :cond_14

    .line 121
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->storage_create_folder_authention_requires_error:I

    goto :goto_14
.end method


# virtual methods
.method public cancelNewFolder()V
    .registers 1

    .prologue
    .line 207
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->dismissKeyBoard()V

    .line 208
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->dismiss()V

    .line 209
    return-void
.end method

.method public createNewFolder()V
    .registers 5

    .prologue
    .line 152
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v2

    .line 154
    .local v2, "folderName":Ljava/lang/String;
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_dialogStopped:Z

    .line 155
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 156
    if-eqz v2, :cond_29

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_29

    .line 158
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->disableNegativeButton()V

    .line 159
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->disablePositiveButton()V

    .line 161
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;)V

    .line 174
    .local v0, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;>;"
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;)V

    .line 186
    .local v1, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_currentFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-static {v2, v3, v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->create(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 192
    .end local v0    # "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;>;"
    .end local v1    # "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    :goto_28
    return-void

    .line 190
    :cond_29
    const-string v2, ""

    goto :goto_28
.end method

.method public handleNegativeClick()V
    .registers 1

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->cancelNewFolder()V

    .line 42
    return-void
.end method

.method public handlePositiveClick()V
    .registers 1

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->createNewFolder()V

    .line 47
    return-void
.end method

.method public handleTextChanged()V
    .registers 2

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->hideErrorDialog()V

    .line 53
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1b

    .line 55
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->enablePositiveButton()V

    .line 61
    :goto_1a
    return-void

    .line 59
    :cond_1b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->disablePositiveButton()V

    goto :goto_1a
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 66
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 67
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 68
    .local v0, "args":Landroid/os/Bundle;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderMgr;->PARENT_COLLECTION_KEY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->getAssetFolderFromHref(Ljava/lang/String;Z)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_currentFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 70
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->CREATE_NEW_FOLDER_DIALOG_TITLE:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->setDialogTitle(Ljava/lang/String;)V

    .line 75
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->CREATE_NEW_FOLDER_BUTTON_CREATE:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->setPositiveButtonTitle(Ljava/lang/String;)V

    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->CREATE_NEW_FOLDER_BUTTON_CANCEL:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->setNegativeButtonTitle(Ljava/lang/String;)V

    .line 77
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->CREATE_NEW_FOLDER_EDIT_TEXT_HINT:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->setEditTextHint(Ljava/lang/String;)V

    .line 78
    invoke-super {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onStart()V
    .registers 2

    .prologue
    .line 84
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onStart()V

    .line 85
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_dialogStopped:Z

    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_savedFolderCreationResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;

    if-eqz v0, :cond_17

    .line 90
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_savedFolderCreationResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;->newlyCreatedFolderObj:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    if-eqz v0, :cond_18

    .line 92
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_savedFolderCreationResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;->newlyCreatedFolderObj:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->handleNewFolderCreation(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V

    .line 101
    :cond_17
    :goto_17
    return-void

    .line 95
    :cond_18
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_savedFolderCreationResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;->errorObj:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    if-eqz v0, :cond_25

    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_savedFolderCreationResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;->errorObj:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->handleErrorFolderCreation(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    .line 99
    :cond_25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_savedFolderCreationResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment$FolderCreationSavedResult;

    goto :goto_17
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 196
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onStop()V

    .line 197
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderDialogFragment;->_dialogStopped:Z

    .line 199
    return-void
.end method
