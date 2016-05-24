.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;
.super Ljava/lang/Object;
.source "AdobeAssetViewCommentsFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->refreshListDueToSwipe()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    .prologue
    .line 456
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 485
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->getSharedInstance()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 486
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->dataViewLoaded:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$802(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;Z)Z

    .line 487
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->wentOffline()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)V

    .line 488
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->hideProgress()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)V

    .line 495
    :goto_1a
    return-void

    .line 490
    :cond_1b
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->dataViewLoaded:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$802(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;Z)Z

    .line 491
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->hideProgress()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)V

    .line 492
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->showErrorScreen()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$1300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)V

    goto :goto_1a
.end method

.method public onSuccess(Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;)V
    .registers 10
    .param p1, "dataSource"    # Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 459
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->_addCommentsButton:Landroid/view/View;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    .line 460
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->dataViewLoaded:Z
    invoke-static {v4, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$802(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;Z)Z

    .line 461
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->hideProgress()V
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)V

    .line 462
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 463
    .local v2, "commentsData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;>;"
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;->getComments()Ljava/util/ArrayList;

    move-result-object v1

    .line 464
    .local v1, "commentData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;>;"
    if-eqz v1, :cond_82

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_82

    .line 465
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->_noCommentsScreen:Landroid/view/View;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$1000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 466
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->_commentScreen:Landroid/view/View;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$1100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    .line 467
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3b
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_56

    .line 468
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;-><init>()V

    .line 469
    .local v0, "cellViewData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;

    iput-object v4, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;->originalCommentData:Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;

    .line 470
    iput-boolean v6, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;->isEnabled:Z

    .line 471
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 467
    add-int/lit8 v3, v3, 0x1

    goto :goto_3b

    .line 473
    .end local v0    # "cellViewData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsCellViewData;
    :cond_56
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$1200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->setCommentsData(Ljava/util/ArrayList;)V

    .line 474
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$1200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController;->refreshDueToDataChange()V

    .line 476
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->_targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v4

    if-eqz v4, :cond_81

    .line 477
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->getNotificationManager()Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->_targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->markNotificationsForAssetsAsRead(Ljava/lang/String;Z)V

    .line 481
    .end local v3    # "i":I
    :cond_81
    :goto_81
    return-void

    .line 479
    :cond_82
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment$7;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->handleEmptyComments()V

    goto :goto_81
.end method
