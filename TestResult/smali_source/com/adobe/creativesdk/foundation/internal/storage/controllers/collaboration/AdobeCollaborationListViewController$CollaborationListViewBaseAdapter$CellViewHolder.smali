.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AdobeCollaborationListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CellViewHolder"
.end annotation


# instance fields
.field private mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;

.field public viewTypeId:I


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;Landroid/view/View;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;I)V
    .registers 7
    .param p2, "v"    # Landroid/view/View;
    .param p3, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;
    .param p4, "type"    # I

    .prologue
    .line 382
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;

    .line 383
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 384
    iput p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->viewTypeId:I

    .line 385
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->viewTypeId:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1e

    .line 386
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    .line 389
    :goto_13
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    invoke-virtual {v0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;)V

    .line 390
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->initializeFromLayout(Landroid/view/View;)V

    .line 391
    return-void

    .line 388
    :cond_1e
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    goto :goto_13
.end method


# virtual methods
.method public getCellView()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;
    .registers 2

    .prologue
    .line 395
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    return-object v0
.end method
