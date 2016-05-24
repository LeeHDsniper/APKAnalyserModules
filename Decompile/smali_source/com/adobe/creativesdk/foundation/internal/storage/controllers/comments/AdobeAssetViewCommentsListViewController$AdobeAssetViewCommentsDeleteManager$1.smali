.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager$1;
.super Ljava/lang/Object;
.source "AdobeAssetViewCommentsListViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeDeleteCommentCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->insertCommentForDeletion(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

.field final synthetic val$commentURL:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;Ljava/lang/String;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    .prologue
    .line 443
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager$1;->val$commentURL:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 4

    .prologue
    .line 451
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager$1;->val$commentURL:Ljava/lang/String;

    const/4 v2, 0x0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->handleCommentOperationCompletion(Ljava/lang/String;Z)V
    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;Ljava/lang/String;Z)V

    .line 452
    return-void
.end method

.method public onSuccess()V
    .registers 4

    .prologue
    .line 446
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager$1;->val$commentURL:Ljava/lang/String;

    const/4 v2, 0x1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->handleCommentOperationCompletion(Ljava/lang/String;Z)V
    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsListViewController$AdobeAssetViewCommentsDeleteManager;Ljava/lang/String;Z)V

    .line 447
    return-void
.end method
