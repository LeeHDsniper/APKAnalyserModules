.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;
.source "AdobeAssetsViewCCFilesSectionListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "LocalUploadAssetsCCFilesCombinedListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;
    }
.end annotation


# instance fields
.field private _sectionalAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;Landroid/content/Context;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 204
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    .line 205
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;Landroid/content/Context;)V

    .line 202
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;->_sectionalAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;

    .line 206
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;

    invoke-direct {v0, p0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;->_sectionalAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;

    .line 207
    return-void
.end method


# virtual methods
.method protected createUploadAssetCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 216
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;-><init>()V

    .line 217
    .local v0, "listCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetview_list_assetviewcell:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->initializeFromLayout(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)V

    .line 218
    return-object v0
.end method

.method public getRealAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter;->_sectionalAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$LocalUploadAssetsCCFilesCombinedListAdapter$LocalAssetListSectionalAdapter;

    return-object v0
.end method
