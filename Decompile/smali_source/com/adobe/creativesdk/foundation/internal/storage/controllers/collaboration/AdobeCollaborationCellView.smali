.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;
.source "AdobeCollaborationCellView.java"


# instance fields
.field private adobeID:Ljava/lang/String;

.field private owner:Z

.field private self:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;-><init>()V

    .line 20
    return-void
.end method

.method private deleteCollaborator()V
    .registers 5

    .prologue
    .line 51
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    move-result-object v0

    .line 52
    .local v0, "sharedSession":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->getCollaboratedFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->adobeID:Ljava/lang/String;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView$1;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->removeCollaborator(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 69
    return-void
.end method

.method private leaveFolder()V
    .registers 5

    .prologue
    .line 72
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    move-result-object v0

    .line 73
    .local v0, "sharedSession":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->getCollaboratedFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->adobeID:Ljava/lang/String;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView$2;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->removeCollaborator(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 87
    return-void
.end method


# virtual methods
.method protected handleDeleteClick()V
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->disableDataViewAndShowProgress()V

    .line 32
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->self:Z

    if-eqz v0, :cond_d

    .line 35
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->leaveFolder()V

    .line 42
    :goto_c
    return-void

    .line 40
    :cond_d
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->deleteCollaborator()V

    goto :goto_c
.end method

.method protected initializeFromLayout(Landroid/view/View;)V
    .registers 2
    .param p1, "newView"    # Landroid/view/View;

    .prologue
    .line 110
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->setMainRootView(Landroid/view/View;)V

    .line 111
    return-void
.end method

.method public isSelf()Z
    .registers 2

    .prologue
    .line 131
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->self:Z

    return v0
.end method

.method protected prepareForReuseUtil()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 96
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->self:Z

    .line 97
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->adobeID:Ljava/lang/String;

    .line 98
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->owner:Z

    .line 99
    return-void
.end method

.method protected setID(Ljava/lang/String;)V
    .registers 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->adobeID:Ljava/lang/String;

    .line 104
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 117
    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->owner:Z

    if-ne v1, v4, :cond_5e

    .line 119
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->COLLABORATION_OWNER:I

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->getResourceString(I)Ljava/lang/String;

    move-result-object v0

    .line 120
    .local v0, "owner":Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mNameView:Landroid/widget/TextView;

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

    invoke-virtual {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->getBoldString(Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .end local v0    # "owner":Ljava/lang/String;
    :goto_30
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->isSelf()Z

    move-result v1

    if-eqz v1, :cond_6c

    .line 125
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mDeleteName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->getActivityContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->collaboration_leave_prompt:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->getCollaboratedFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    :goto_5d
    return-void

    .line 123
    :cond_5e
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mNameView:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, p1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->getBoldString(Ljava/lang/String;I)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_30

    .line 127
    :cond_6c
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mDeleteName:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->getActivityContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->collaboration_delete_prompt:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    aput-object p1, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5d
.end method

.method public setOwner(Z)V
    .registers 2
    .param p1, "owner"    # Z

    .prologue
    .line 139
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->owner:Z

    .line 140
    return-void
.end method

.method public setProfilePicture(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->mProfilePicture:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 91
    return-void
.end method

.method public setSelf(Z)V
    .registers 2
    .param p1, "self"    # Z

    .prologue
    .line 135
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->self:Z

    .line 136
    return-void
.end method

.method protected shouldShowDelete()Z
    .registers 2

    .prologue
    .line 24
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->owner:Z

    if-eqz v0, :cond_6

    .line 25
    const/4 v0, 0x0

    .line 26
    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x1

    goto :goto_5
.end method
