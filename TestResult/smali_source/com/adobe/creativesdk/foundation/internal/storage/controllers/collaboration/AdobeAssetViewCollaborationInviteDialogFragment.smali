.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;
.super Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;
.source "AdobeAssetViewCollaborationInviteDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;
    }
.end annotation


# instance fields
.field private _clientObserver:Ljava/util/Observer;

.field private _collaboratorsInviteesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;",
            ">;"
        }
    .end annotation
.end field

.field private _currentFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

.field private _dialogStopped:Z

.field _emailInviteSaveResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_dialogStopped:Z

    .line 47
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_currentFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 48
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_clientObserver:Ljava/util/Observer;

    .line 49
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->handleErrorInviteCreation(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_dialogStopped:Z

    return v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->handleNewInviteCreation(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;)V

    return-void
.end method

.method private finishDialog()V
    .registers 1

    .prologue
    .line 199
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->dismissKeyBoard()V

    .line 200
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->dismiss()V

    .line 201
    return-void
.end method

.method private handleErrorInviteCreation(Ljava/lang/String;)V
    .registers 2
    .param p1, "errorData"    # Ljava/lang/String;

    .prologue
    .line 219
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->showError(Ljava/lang/String;)V

    .line 220
    return-void
.end method

.method private handleNewInviteCreation(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;)V
    .registers 5
    .param p1, "invite"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    .prologue
    .line 204
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->hideErrorDialog()V

    .line 205
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 206
    .local v0, "info":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "Invite"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_clientObserver:Ljava/util/Observer;

    if-eqz v1, :cond_17

    .line 208
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_clientObserver:Ljava/util/Observer;

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Ljava/util/Observer;->update(Ljava/util/Observable;Ljava/lang/Object;)V

    .line 210
    :cond_17
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->finishDialog()V

    .line 211
    return-void
.end method

.method private isEmail(Ljava/lang/String;)Z
    .registers 9
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 81
    if-eqz p1, :cond_d

    const-string v5, ""

    if-eq p1, v5, :cond_d

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x3

    if-ge v5, v6, :cond_f

    .line 82
    :cond_d
    const/4 v3, 0x0

    .line 91
    :goto_e
    return v3

    .line 83
    :cond_f
    move-object v0, p1

    .line 84
    .local v0, "email":Ljava/lang/String;
    if-eqz v0, :cond_16

    .line 85
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 87
    :cond_16
    const-string v4, "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

    .line 88
    .local v4, "pattern":Ljava/lang/String;
    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 89
    .local v2, "emailPattern":Ljava/util/regex/Pattern;
    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 90
    .local v1, "emailMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    .line 91
    .local v3, "emailValid":Z
    goto :goto_e
.end method

.method private showError(Ljava/lang/String;)V
    .registers 2
    .param p1, "errorData"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->enableNegativeButton()V

    .line 215
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->showErrorDialog(Ljava/lang/String;)V

    .line 216
    return-void
.end method


# virtual methods
.method public createNewInvite()V
    .registers 9

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_4d

    .line 131
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "email":Ljava/lang/String;
    const/4 v1, 0x0

    .line 142
    .local v1, "emailAlreadyInvited":Z
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_collaboratorsInviteesList:Ljava/util/ArrayList;

    if-eqz v6, :cond_51

    .line 143
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_10
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_collaboratorsInviteesList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_2b

    .line 145
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_collaboratorsInviteesList:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;->getEmail()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4e

    .line 147
    const/4 v1, 0x1

    .line 155
    .end local v3    # "i":I
    :cond_2b
    :goto_2b
    const/4 v6, 0x1

    if-eq v1, v6, :cond_40

    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getEmail()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_55

    .line 157
    :cond_40
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/adobe/creativesdk/foundation/assets/R$string;->COLLABORATION_ALREADY_USED:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 158
    .local v2, "errorData":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->showError(Ljava/lang/String;)V

    .line 196
    .end local v0    # "email":Ljava/lang/String;
    .end local v1    # "emailAlreadyInvited":Z
    .end local v2    # "errorData":Ljava/lang/String;
    :cond_4d
    :goto_4d
    return-void

    .line 143
    .restart local v0    # "email":Ljava/lang/String;
    .restart local v1    # "emailAlreadyInvited":Z
    .restart local v3    # "i":I
    :cond_4e
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    .line 153
    .end local v3    # "i":I
    :cond_51
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->finishDialog()V

    goto :goto_2b

    .line 161
    :cond_55
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->hideErrorDialog()V

    .line 162
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_dialogStopped:Z

    .line 163
    move-object v5, p0

    .line 164
    .local v5, "t":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->disableNegativeButton()V

    .line 165
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->disablePositiveButton()V

    .line 166
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    move-result-object v4

    .line 167
    .local v4, "sharedSession":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_currentFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;

    invoke-direct {v7, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;)V

    invoke-virtual {v4, v6, v0, v7}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->createInvite(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    goto :goto_4d
.end method

.method public handleNegativeClick()V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->finishDialog()V

    .line 54
    return-void
.end method

.method public handlePositiveClick()V
    .registers 1

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->createNewInvite()V

    .line 59
    return-void
.end method

.method public handleTextChanged()V
    .registers 2

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getEnteredText()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->isEmail(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 70
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->enablePositiveButton()V

    .line 74
    :goto_13
    return-void

    .line 72
    :cond_14
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->disablePositiveButton()V

    goto :goto_13
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 119
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->CREATE_NEW_INVITE_TITLE:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->setDialogTitle(Ljava/lang/String;)V

    .line 120
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->COLLABORATION_INVITE:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->setPositiveButtonTitle(Ljava/lang/String;)V

    .line 121
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->COLLABORATION_INVITE_CANCEL:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->setNegativeButtonTitle(Ljava/lang/String;)V

    .line 122
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->COLLABORATE_INVITE_EDIT_TEXT_HINT:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->setEditTextHint(Ljava/lang/String;)V

    .line 123
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->setEditTextSingleLine()V

    .line 124
    invoke-super {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onStart()V
    .registers 2

    .prologue
    .line 96
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_dialogStopped:Z

    .line 97
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onStart()V

    .line 99
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_emailInviteSaveResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;

    if-eqz v0, :cond_17

    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_emailInviteSaveResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;->newlyCreatedInvite:Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    if-eqz v0, :cond_18

    .line 104
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_emailInviteSaveResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;->newlyCreatedInvite:Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->handleNewInviteCreation(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;)V

    .line 109
    :cond_17
    :goto_17
    return-void

    .line 107
    :cond_18
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_emailInviteSaveResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;

    goto :goto_17
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 113
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeDialogFragment;->onStop()V

    .line 114
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_dialogStopped:Z

    .line 115
    return-void
.end method

.method public setCollaboratorsList(Ljava/util/ArrayList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p1, "collaboratorsInvitees":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_collaboratorsInviteesList:Ljava/util/ArrayList;

    .line 78
    return-void
.end method

.method public setFolderAndObserver(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Ljava/util/Observer;)V
    .registers 3
    .param p1, "currentFolder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .param p2, "clientObserver"    # Ljava/util/Observer;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_currentFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 64
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_clientObserver:Ljava/util/Observer;

    .line 65
    return-void
.end method
