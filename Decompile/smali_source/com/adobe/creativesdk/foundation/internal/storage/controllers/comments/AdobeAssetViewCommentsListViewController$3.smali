.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$3;
.super Ljava/lang/Object;
.source "AdobeAssetViewCommentsListViewController.java"

# interfaces
.implements Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->performInitialization(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefresh()V
    .registers 2

    .prologue
    .line 206
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_25

    .line 208
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->startRefreshAnimation()V

    .line 209
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeCommentsContainerListViewDelegate;->refreshListDueToSwipe()V

    .line 210
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->stopRefreshAnimation()V

    .line 212
    :cond_25
    return-void
.end method
