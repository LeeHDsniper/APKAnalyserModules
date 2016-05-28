.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$1;
.super Ljava/lang/Object;
.source "AdobeCollaborationGenericCellView.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->performOnFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->getToken()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2d

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->shouldShowDelete()Z

    move-result v0

    if-eqz v0, :cond_2d

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isEnabled()Z
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 90
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->showDeleteView()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;)V

    .line 91
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->mPosition:I
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;->setToken(I)V

    .line 93
    :cond_2d
    const/4 v0, 0x1

    return v0
.end method
