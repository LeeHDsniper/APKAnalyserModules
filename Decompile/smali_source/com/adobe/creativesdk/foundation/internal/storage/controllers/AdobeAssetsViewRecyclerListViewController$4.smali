.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$4;
.super Ljava/lang/Object;
.source "AdobeAssetsViewRecyclerListViewController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->refreshLayoutDueToOrientationChange()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

.field final synthetic val$firstItemPos:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;I)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    .prologue
    .line 217
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$4;->val$firstItemPos:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 220
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$4;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$4;->val$firstItemPos:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollToPosition(I)V

    .line 221
    return-void
.end method
