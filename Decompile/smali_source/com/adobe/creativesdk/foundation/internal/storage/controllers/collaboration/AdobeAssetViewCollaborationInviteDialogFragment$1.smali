.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;
.super Ljava/lang/Object;
.source "AdobeAssetViewCollaborationInviteDialogFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->createNewInvite()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    .prologue
    .line 167
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;)V
    .registers 5
    .param p1, "invite"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_dialogStopped:Z
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;)V

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_emailInviteSaveResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;

    .line 182
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->_emailInviteSaveResult:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;

    iput-object p1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$EmailInviteSaveResult;->newlyCreatedInvite:Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    .line 186
    :goto_19
    return-void

    .line 185
    :cond_1a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->handleNewInviteCreation(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;)V
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;)V

    goto :goto_19
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V
    .registers 5
    .param p1, "exception"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    .prologue
    .line 172
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;->getHttpStatusCode()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x194

    if-ne v0, v1, :cond_1e

    .line 173
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->collaboration_create_invite_error_network:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->handleErrorInviteCreation(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;Ljava/lang/String;)V

    .line 176
    :goto_1d
    return-void

    .line 175
    :cond_1e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->collaboration_create_invite_error:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->handleErrorInviteCreation(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;Ljava/lang/String;)V

    goto :goto_1d
.end method
