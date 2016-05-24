.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView$2;
.super Ljava/lang/Object;
.source "AdobeAssetViewEditStaggeredGridAssetCellView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->adjustSelectionFrame()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 104
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->getRootView()Landroid/view/View;

    move-result-object v4

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_assetcell_imageView:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 105
    .local v0, "container":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 106
    .local v1, "height":I
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    .line 107
    .local v3, "width":I
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, v3, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 108
    .local v2, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->_newSelectionFrame:Landroid/view/View;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    return-void
.end method
