.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AdobeAssetsViewCCFilesSectionListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LocalAssetListSectionalAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$CellViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final _baseCCAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;
    .param p2, "baseCCAdapter"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

    .prologue
    .line 224
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 225
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;->_baseCCAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

    .line 226
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;->_baseCCAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;->getItemCount()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 245
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;->_baseCCAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;->getItemViewType(I)I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 3

    .prologue
    .line 221
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$CellViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;->onBindViewHolder(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$CellViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$CellViewHolder;I)V
    .registers 4
    .param p1, "holder"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$CellViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 235
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;->_baseCCAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;->onBindViewHolder(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$CellViewHolder;I)V

    .line 236
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4

    .prologue
    .line 221
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$CellViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$CellViewHolder;
    .registers 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 230
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;->_baseCCAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$CellViewHolder;

    move-result-object v0

    return-object v0
.end method
