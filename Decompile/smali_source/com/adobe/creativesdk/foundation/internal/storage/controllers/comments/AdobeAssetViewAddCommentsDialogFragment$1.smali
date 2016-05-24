.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment$1;
.super Ljava/lang/Object;
.source "AdobeAssetViewAddCommentsDialogFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeAddCommentCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->addComment()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->handleCommentsError()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;)V

    .line 111
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .registers 3
    .param p1, "commentUrl"    # Ljava/lang/String;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->handleAddComments(Ljava/lang/String;)V
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewAddCommentsDialogFragment;Ljava/lang/String;)V

    .line 106
    return-void
.end method
