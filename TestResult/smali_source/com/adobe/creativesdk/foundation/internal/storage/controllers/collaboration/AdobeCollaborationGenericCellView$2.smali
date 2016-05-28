.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$2;
.super Ljava/lang/Object;
.source "AdobeCollaborationGenericCellView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 107
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->isEnabled()Z
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 111
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->handleDeleteClick()V

    .line 112
    :cond_d
    return-void
.end method
