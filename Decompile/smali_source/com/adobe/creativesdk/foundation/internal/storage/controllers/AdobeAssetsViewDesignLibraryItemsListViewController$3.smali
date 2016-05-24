.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$3;
.super Ljava/lang/Object;
.source "AdobeAssetsViewDesignLibraryItemsListViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->getLayoutManager(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$LayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

.field final synthetic val$spans_GCM:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;I)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .prologue
    .line 176
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$3;->val$spans_GCM:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getGCMOfSpans()I
    .registers 2

    .prologue
    .line 184
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$3;->val$spans_GCM:I

    return v0
.end method

.method public getNumColumnsInSection(I)I
    .registers 3
    .param p1, "section"    # I

    .prologue
    .line 179
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_itemsAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->getNumColumnsInSection(I)I

    move-result v0

    return v0
.end method
