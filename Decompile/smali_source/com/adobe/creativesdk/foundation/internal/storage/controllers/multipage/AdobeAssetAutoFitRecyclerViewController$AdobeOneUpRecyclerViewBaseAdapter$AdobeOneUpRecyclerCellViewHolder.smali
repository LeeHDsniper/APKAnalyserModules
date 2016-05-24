.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AdobeAssetAutoFitRecyclerViewController.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AdobeOneUpRecyclerCellViewHolder"
.end annotation


# instance fields
.field imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;Landroid/view/View;)V
    .registers 5
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 412
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    .line 413
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 414
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

    .line 415
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->setMainRootView(Landroid/view/View;)V

    .line 416
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_oneUpViewContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->setDisplayMetrics(Landroid/util/DisplayMetrics;)V

    .line 417
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_oneUpViewContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->performInitialization(Landroid/content/Context;)V

    .line 422
    return-void
.end method


# virtual methods
.method public getCellView()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;
    .registers 2

    .prologue
    .line 425
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter$AdobeOneUpRecyclerCellViewHolder;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 432
    return-void
.end method
