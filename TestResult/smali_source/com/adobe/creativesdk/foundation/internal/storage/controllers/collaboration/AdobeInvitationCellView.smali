.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;
.source "AdobeInvitationCellView.java"


# instance fields
.field private inviteId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;-><init>()V

    .line 19
    return-void
.end method

.method private deleteInvitation()V
    .registers 4

    .prologue
    .line 35
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    move-result-object v0

    .line 36
    .local v0, "sharedSession":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->inviteId:Ljava/lang/String;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->rejectInvite(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationAcceptOrRejectInviteCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 52
    return-void
.end method

.method private performOnFinishInflate()V
    .registers 3

    .prologue
    .line 80
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_collaborator_name:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mNameView:Landroid/widget/TextView;

    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_collaborator_profile_pic:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mProfilePicture:Landroid/widget/ImageView;

    .line 85
    return-void
.end method


# virtual methods
.method protected handleDeleteClick()V
    .registers 2

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->disableDataViewAndShowProgress()V

    .line 25
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->deleteInvitation()V

    .line 26
    return-void
.end method

.method protected initializeFromLayout(Landroid/view/View;)V
    .registers 2
    .param p1, "newView"    # Landroid/view/View;

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->setMainRootView(Landroid/view/View;)V

    .line 76
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->performOnFinishInflate()V

    .line 77
    return-void
.end method

.method protected prepareForReuseUtil()V
    .registers 2

    .prologue
    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->inviteId:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setInviteId(Ljava/lang/String;)V
    .registers 2
    .param p1, "inviteId"    # Ljava/lang/String;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->inviteId:Ljava/lang/String;

    .line 100
    return-void
.end method

.method public setInviteProfilePicture()V
    .registers 3

    .prologue
    .line 67
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mProfilePicture:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 68
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mProfilePicture:Landroid/widget/ImageView;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->no_image:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 69
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 89
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->COLLABORATION_INVITEE:I

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    .line 90
    .local v0, "invited":Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mNameView:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->getBoldString(Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mDeleteName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->getActivityContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->collaboration_delete_prompt:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    return-void
.end method

.method protected shouldShowDelete()Z
    .registers 2

    .prologue
    .line 30
    const/4 v0, 0x1

    return v0
.end method
