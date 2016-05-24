.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView$1;
.super Ljava/lang/Object;
.source "AdobeInvitationCellView.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationAcceptOrRejectInviteCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->deleteInvitation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete()V
    .registers 3

    .prologue
    .line 39
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->getPosition()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->removeView(I)V

    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->enableDataView()V

    .line 42
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V
    .registers 5
    .param p1, "exception"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    .prologue
    .line 47
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->getActivityContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->COLLABORATION_INVITATION_DELETE_ERROR:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "s":Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->getActivityContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 49
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->enableDataView()V

    .line 50
    return-void
.end method
