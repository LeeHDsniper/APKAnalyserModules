.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView$1PhotoTapListener;
.super Ljava/lang/Object;
.source "AdobeAssetOneUpBaseCellView.java"

# interfaces
.implements Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;->createPhotoTapListenenr()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PhotoTapListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView$1PhotoTapListener;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewTap(Landroid/view/View;FF)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .prologue
    .line 80
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getCurrentAssetViewerActivity()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 81
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getCurrentAssetViewerActivity()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;->hideOrShowActionsBar()V

    .line 83
    :cond_d
    return-void
.end method
