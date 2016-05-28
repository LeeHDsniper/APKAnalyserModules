.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;
.super Ljava/lang/Object;
.source "AdobeAssetViewCommentsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;
    }
.end annotation


# instance fields
.field protected _absListView:Landroid/support/v7/widget/RecyclerView;

.field protected _assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;

.field private _deleteToken:I

.field protected _mainRootView:Landroid/view/View;

.field private _parentContainer:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;",
            ">;"
        }
    .end annotation
.end field

.field protected _swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

.field public cellSwiping:J

.field private commentsData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;",
            ">;"
        }
    .end annotation
.end field

.field private commentsURLjustPosted:Ljava/lang/String;

.field deleteManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

.field private deleteVisibiltyDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;

.field private isRegenerationInProgress:Z

.field private online:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsURLjustPosted:Ljava/lang/String;

    .line 32
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->cellSwiping:J

    .line 91
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_deleteToken:I

    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->online:Z

    .line 36
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)Ljava/lang/ref/WeakReference;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->controlDeleteVisibility(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->regenerateList()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;J)V
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;
    .param p1, "x1"    # J

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->setAnyCellSwiping(J)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)J
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->isAnyCellSwiping()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsData:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->handleDeleteComment(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->online:Z

    return v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    .prologue
    .line 28
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_deleteToken:I

    return v0
.end method

.method static synthetic access$702(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;
    .param p1, "x1"    # I

    .prologue
    .line 28
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_deleteToken:I

    return p1
.end method

.method private controlDeleteVisibility(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;)V
    .registers 3
    .param p1, "caller"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;

    .prologue
    .line 521
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->deleteVisibiltyDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->deleteVisibiltyDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 522
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->deleteVisibiltyDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;->hideDeleteButton()V

    .line 523
    :cond_11
    return-void
.end method

.method private handleDeleteComment(Ljava/lang/String;)V
    .registers 3
    .param p1, "commentURL"    # Ljava/lang/String;

    .prologue
    .line 425
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->deleteManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    if-nez v0, :cond_b

    .line 427
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->deleteManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    .line 429
    :cond_b
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->deleteManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->insertCommentForDeletion(Ljava/lang/String;)V

    .line 430
    return-void
.end method

.method private isAnyCellSwiping()J
    .registers 3

    .prologue
    .line 113
    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->cellSwiping:J

    return-wide v0
.end method

.method private regenerateList()V
    .registers 10

    .prologue
    const/4 v8, 0x1

    .line 476
    iget-boolean v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->isRegenerationInProgress:Z

    if-nez v7, :cond_a2

    .line 477
    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->isRegenerationInProgress:Z

    .line 478
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;

    invoke-interface {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;->hideDataViewAndShowProgress()V

    .line 479
    const/4 v2, 0x0

    .line 480
    .local v2, "error_count":I
    const/4 v6, 0x0

    .line 481
    .local v6, "success_count":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 482
    .local v4, "newList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1a
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsData:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v3, v7, :cond_74

    .line 485
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsData:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;->originalCommentData:Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->getCommentURL()Ljava/lang/String;

    move-result-object v0

    .line 486
    .local v0, "commentURL":Ljava/lang/String;
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->deleteManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->queue:Ljava/util/HashMap;
    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->access$1100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;)Ljava/util/HashMap;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6a

    .line 488
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->deleteManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->queue:Ljava/util/HashMap;
    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->access$1100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;)Ljava/util/HashMap;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    .line 489
    .local v5, "status":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    if-ne v5, v7, :cond_5a

    .line 491
    add-int/lit8 v6, v6, 0x1

    .line 500
    :goto_4e
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->deleteManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->queue:Ljava/util/HashMap;
    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->access$1100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;)Ljava/util/HashMap;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    .end local v5    # "status":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;
    :goto_57
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    .line 495
    .restart local v5    # "status":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;
    :cond_5a
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsData:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;

    .line 496
    .local v1, "commentsCellViewData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;
    iput-boolean v8, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;->isEnabled:Z

    .line 497
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 498
    add-int/lit8 v2, v2, 0x1

    goto :goto_4e

    .line 503
    .end local v1    # "commentsCellViewData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;
    .end local v5    # "status":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;
    :cond_6a
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsData:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_57

    .line 506
    .end local v0    # "commentURL":Ljava/lang/String;
    :cond_74
    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsData:Ljava/util/ArrayList;

    .line 507
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;

    invoke-interface {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;->hideProgressAndShowDataView()V

    .line 508
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsData:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-nez v7, :cond_a3

    .line 510
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;

    invoke-interface {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;->handleEmptyComments()V

    .line 515
    :goto_94
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;

    invoke-interface {v7, v6, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;->showCommentDeletionBanner(II)V

    .line 516
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->isRegenerationInProgress:Z

    .line 518
    .end local v2    # "error_count":I
    .end local v3    # "i":I
    .end local v4    # "newList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;>;"
    .end local v6    # "success_count":I
    :cond_a2
    return-void

    .line 513
    .restart local v2    # "error_count":I
    .restart local v3    # "i":I
    .restart local v4    # "newList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;>;"
    .restart local v6    # "success_count":I
    :cond_a3
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->refreshDueToDataChange()V

    goto :goto_94
.end method

.method private setAnyCellSwiping(J)V
    .registers 4
    .param p1, "cellSwiping"    # J

    .prologue
    .line 117
    iput-wide p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->cellSwiping:J

    .line 118
    return-void
.end method

.method private showAddCommentsIcon()V
    .registers 2

    .prologue
    .line 530
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;->showAddCommentsIcon()V

    .line 531
    return-void
.end method


# virtual methods
.method protected createAssetItemsAdapter(Landroid/content/Context;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 87
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;Landroid/content/Context;)V

    .line 88
    .local v0, "adapter":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;
    return-object v0
.end method

.method public getCommentsData(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 222
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsData:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;

    return-object v0
.end method

.method protected getConcreteAbsListView(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_absListView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method protected getMainRootView(Landroid/content/Context;)Landroid/view/View;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_mainRootView:Landroid/view/View;

    .line 69
    .local v0, "commentsRootView":Landroid/view/View;
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->swipe_comments_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 70
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_asset_browser_comments_list:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_absListView:Landroid/support/v7/widget/RecyclerView;

    .line 71
    return-object v0
.end method

.method protected handleBackPress()Z
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 183
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_deleteToken:I

    if-eq v0, v1, :cond_f

    .line 185
    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_deleteToken:I

    .line 186
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->showAddCommentsIcon()V

    .line 187
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->refreshDueToDataChange()V

    .line 188
    const/4 v0, 0x1

    .line 191
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method protected handleNetworkOffline()V
    .registers 2

    .prologue
    .line 167
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->online:Z

    .line 168
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->refreshDueToDataChange()V

    .line 169
    return-void
.end method

.method protected handleNetworkOnline()V
    .registers 2

    .prologue
    .line 162
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->online:Z

    .line 163
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->refreshDueToDataChange()V

    .line 164
    return-void
.end method

.method loadAndDisplayThumbnail(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;I)V
    .registers 7
    .param p1, "commentsCellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;
    .param p2, "commentsData"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;
    .param p3, "cellposition"    # I

    .prologue
    .line 123
    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;->originalCommentData:Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->getCommentURL()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsURLjustPosted:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_35

    .line 124
    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;->originalCommentData:Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->getAvatarURL()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_22

    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;->originalCommentData:Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->getAvatarURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_26

    .line 126
    :cond_22
    invoke-virtual {p1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;->setNoImage(I)V

    .line 159
    :goto_25
    return-void

    .line 129
    :cond_26
    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;->originalCommentData:Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->getAvatarURL()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$1;

    invoke-direct {v2, p0, p1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;I)V

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->getAvatarFromURL(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V

    goto :goto_25

    .line 145
    :cond_35
    invoke-static {}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getSharedAuthManager()Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    move-result-object v0

    .line 146
    .local v0, "manager":Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$2;

    invoke-direct {v2, p0, p1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellView;I)V

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->getAvatarFromUserID(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V

    goto :goto_25
.end method

.method public performInitialization(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 196
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->getMainRootView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_mainRootView:Landroid/view/View;

    .line 197
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->getConcreteAbsListView(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_absListView:Landroid/support/v7/widget/RecyclerView;

    .line 198
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 199
    .local v0, "llm":Landroid/support/v7/widget/LinearLayoutManager;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 200
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_absListView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 202
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$3;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)V

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 215
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->createAssetItemsAdapter(Landroid/content/Context;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;

    .line 216
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_absListView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;->getRealAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 219
    return-void
.end method

.method public refreshDueToDataChange()V
    .registers 2

    .prologue
    .line 229
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;->invalidateAssetsList()V

    .line 230
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$CommentsListViewBaseAdapter;->markDataSetChanged()V

    .line 231
    return-void
.end method

.method public setCommentsData(Ljava/util/ArrayList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p1, "commentsData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsData:Ljava/util/ArrayList;

    .line 51
    return-void
.end method

.method public setCommentsURLjustPosted(Ljava/lang/String;)V
    .registers 2
    .param p1, "commentsURLjustPosted"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->commentsURLjustPosted:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setDeleteVisibiltyDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;)V
    .registers 2
    .param p1, "deleteVisibiltyDelegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->deleteVisibiltyDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsViewDeleteVisibiltyDelegate;

    .line 55
    return-void
.end method

.method protected setMainRootView(Landroid/view/View;)V
    .registers 2
    .param p1, "rootView"    # Landroid/view/View;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_mainRootView:Landroid/view/View;

    .line 76
    return-void
.end method

.method public setParentContainer(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;)V
    .registers 3
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;

    .prologue
    .line 108
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    .line 109
    return-void
.end method

.method public startRefreshAnimation()V
    .registers 3

    .prologue
    .line 173
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 174
    return-void
.end method

.method public stopRefreshAnimation()V
    .registers 3

    .prologue
    .line 177
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 178
    return-void
.end method
