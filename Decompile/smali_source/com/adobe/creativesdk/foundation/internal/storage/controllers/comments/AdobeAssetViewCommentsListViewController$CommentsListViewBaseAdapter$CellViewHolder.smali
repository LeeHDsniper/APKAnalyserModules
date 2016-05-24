.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter$CellViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AdobeAssetViewCommentsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CellViewHolder"
.end annotation


# instance fields
.field private mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;Landroid/view/View;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;I)V
    .registers 6
    .param p2, "v"    # Landroid/view/View;
    .param p3, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;
    .param p4, "type"    # I

    .prologue
    .line 408
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter$CellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;

    .line 409
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 410
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter$CellViewHolder;->mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;

    .line 411
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter$CellViewHolder;->mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;

    invoke-virtual {v0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->setDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsCellViewDelegate;)V

    .line 412
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter$CellViewHolder;->mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;

    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->initializeFromLayout(Landroid/view/View;)V

    .line 413
    return-void
.end method


# virtual methods
.method public getCellView()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;
    .registers 2

    .prologue
    .line 418
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter$CellViewHolder;->mainBaseListCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;

    return-object v0
.end method
