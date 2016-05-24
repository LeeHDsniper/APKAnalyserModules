.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$1;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "AdobeAssetsViewRecyclerListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 35
    if-nez p2, :cond_7

    .line 37
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->handleScrollOffsetChange()V

    .line 39
    :cond_7
    return-void
.end method
