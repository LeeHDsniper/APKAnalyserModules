.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView$1;
.super Ljava/lang/Object;
.source "AdobeAssetViewEditStaggeredGridAssetCellView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->performOnFinishInflate()V
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
    .line 49
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->handleAssetSelectionToggle()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridAssetCellView;)V

    .line 53
    return-void
.end method
