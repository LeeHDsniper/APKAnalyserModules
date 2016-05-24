.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;
.super Ljava/lang/Object;
.source "AdobeAssetAutoFitRecyclerViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->handleAssetImageData([BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
        "<",
        "Landroid/graphics/drawable/BitmapDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

.field final synthetic val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

.field final synthetic val$pageNo:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;I)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    .prologue
    .line 229
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

    iput p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->val$pageNo:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/graphics/drawable/BitmapDrawable;)V
    .registers 5
    .param p1, "requestResult"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    const/4 v2, 0x1

    .line 232
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_mainRootView:Landroid/view/View;

    if-nez v0, :cond_8

    .line 248
    :cond_7
    :goto_7
    return-void

    .line 235
    :cond_8
    if-eqz p1, :cond_7

    .line 240
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->val$pageNo:I

    invoke-virtual {v0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->displayThumbnail(Landroid/graphics/drawable/BitmapDrawable;I)V

    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-boolean v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_areCellsVisible:Z

    if-nez v0, :cond_20

    .line 243
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iput-boolean v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_areCellsVisible:Z

    .line 244
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->handleImageCellVisibilty()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;)V

    .line 246
    :cond_20
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iput-boolean v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_areCellsVisible:Z

    .line 247
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->_spinner:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_7
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 229
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController$3;->onCompletion(Landroid/graphics/drawable/BitmapDrawable;)V

    return-void
.end method
