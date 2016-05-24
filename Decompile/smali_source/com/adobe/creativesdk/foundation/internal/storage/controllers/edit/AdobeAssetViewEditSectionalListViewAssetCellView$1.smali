.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView$1;
.super Ljava/lang/Object;
.source "AdobeAssetViewEditSectionalListViewAssetCellView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->performOnFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->handleAssetSelectionToggle()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewAssetCellView;)V

    .line 41
    return-void
.end method
