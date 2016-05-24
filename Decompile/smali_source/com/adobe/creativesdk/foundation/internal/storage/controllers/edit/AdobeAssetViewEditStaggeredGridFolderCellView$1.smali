.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView$1;
.super Ljava/lang/Object;
.source "AdobeAssetViewEditStaggeredGridFolderCellView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->performOnFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->handleAssetSelectionToggle()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditStaggeredGridFolderCellView;)V

    .line 46
    return-void
.end method
