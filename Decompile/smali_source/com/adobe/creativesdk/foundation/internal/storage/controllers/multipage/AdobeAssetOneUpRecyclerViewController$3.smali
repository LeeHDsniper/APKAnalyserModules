.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;
.super Ljava/lang/Object;
.source "AdobeAssetOneUpRecyclerViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->handleAssetImageData([BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V
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
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

.field final synthetic val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;

.field final synthetic val$pageNo:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;I)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;->val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;

    iput p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;->val$pageNo:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/graphics/drawable/BitmapDrawable;)V
    .registers 4
    .param p1, "requestResult"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 224
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mainRootView:Landroid/view/View;

    if-nez v0, :cond_7

    .line 234
    :goto_6
    return-void

    .line 227
    :cond_7
    if-nez p1, :cond_f

    .line 228
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;->val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->handleNoPreview()V

    goto :goto_6

    .line 232
    :cond_f
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;->val$imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;->val$pageNo:I

    invoke-virtual {v0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->displayThumbnail(Landroid/graphics/drawable/BitmapDrawable;I)V

    goto :goto_6
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 221
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;->onCompletion(Landroid/graphics/drawable/BitmapDrawable;)V

    return-void
.end method
