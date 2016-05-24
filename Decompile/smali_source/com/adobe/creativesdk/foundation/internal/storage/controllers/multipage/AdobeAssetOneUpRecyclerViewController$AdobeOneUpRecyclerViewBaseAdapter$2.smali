.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;
.super Ljava/lang/Object;
.source "AdobeAssetOneUpRecyclerViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
        "<[B",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

.field final synthetic val$cellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;

.field final synthetic val$dimension:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V
    .registers 5
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    .prologue
    .line 328
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$cellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$dimension:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iput p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellation()V
    .registers 6

    .prologue
    .line 337
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$cellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$dimension:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$position:I

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->handleAssetImageData([BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V
    invoke-static {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;[BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V

    .line 338
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 328
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->onCompletion([B)V

    return-void
.end method

.method public onCompletion([B)V
    .registers 6
    .param p1, "data"    # [B

    .prologue
    .line 343
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$cellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$dimension:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$position:I

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->handleAssetImageData([BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V
    invoke-static {v0, p1, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;[BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V

    .line 345
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 7
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 349
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$cellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$dimension:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->val$position:I

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->handleAssetImageData([BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V
    invoke-static {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;[BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V

    .line 350
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 328
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$2;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 334
    return-void
.end method
