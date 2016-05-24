.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;
.super Ljava/lang/Object;
.source "AdobeAssetViewCommentsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AdobeAssetViewCommentsDeleteManager"
.end annotation


# instance fields
.field private in_progress_count:I

.field private queue:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    .prologue
    .line 432
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 434
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->queue:Ljava/util/HashMap;

    return-void
.end method

.method static synthetic access$1100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    .prologue
    .line 432
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->queue:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;Ljava/lang/String;Z)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z

    .prologue
    .line 432
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->handleCommentOperationCompletion(Ljava/lang/String;Z)V

    return-void
.end method

.method private handleCommentOperationCompletion(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "commentURL"    # Ljava/lang/String;
    .param p2, "success"    # Z

    .prologue
    .line 459
    if-eqz p2, :cond_19

    .line 461
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->queue:Ljava/util/HashMap;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_COMPLETED:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    :goto_9
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->in_progress_count:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->in_progress_count:I

    .line 468
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->in_progress_count:I

    if-nez v0, :cond_18

    .line 470
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->regenerateList()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->access$1000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)V

    .line 472
    :cond_18
    return-void

    .line 465
    :cond_19
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->queue:Ljava/util/HashMap;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_ERROR:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9
.end method


# virtual methods
.method public insertCommentForDeletion(Ljava/lang/String;)V
    .registers 5
    .param p1, "commentURL"    # Ljava/lang/String;

    .prologue
    .line 440
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->in_progress_count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->in_progress_count:I

    .line 441
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->queue:Ljava/util/HashMap;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;->ADOBE_ASSET_VIEW_COMMENT_DELETION_STATUS_IN_PROGRESS:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentDeletionStatus;

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;->getCommentsManager()Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;

    move-result-object v0

    .line 443
    .local v0, "manager":Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager$1;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;->deleteComment(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeDeleteCommentCallback;)V

    .line 455
    return-void
.end method
