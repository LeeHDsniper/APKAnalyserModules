.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$1;
.super Ljava/lang/Object;
.source "AdobeCollaborationListViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->loadAndDisplayThumbnail(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

.field final synthetic val$cellposition:I

.field final synthetic val$collaborationCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;I)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$1;->val$collaborationCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;

    iput p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$1;->val$cellposition:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "image"    # Landroid/graphics/Bitmap;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$1;->val$collaborationCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->getPosition()I

    move-result v0

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$1;->val$cellposition:I

    if-ne v0, v1, :cond_f

    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$1;->val$collaborationCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->setProfilePicture(Landroid/graphics/Bitmap;)V

    .line 110
    :cond_f
    return-void
.end method

.method public onError()V
    .registers 1

    .prologue
    .line 116
    return-void
.end method
