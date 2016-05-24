.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$2;
.super Ljava/lang/Object;
.source "AdobeCollaborationListViewController.java"

# interfaces
.implements Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->performInitialization(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    .prologue
    .line 172
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefresh()V
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_25

    .line 178
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->startRefreshAnimation()V

    .line 179
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;->refreshListDueToSwipe()V

    .line 180
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->stopRefreshAnimation()V

    .line 182
    :cond_25
    return-void
.end method
