.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter$1;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "AdobeAssetsViewCCFilesSectionListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->getRealAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->headersDecor:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;

    invoke-virtual {v0}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->invalidateHeaders()V

    .line 121
    return-void
.end method
