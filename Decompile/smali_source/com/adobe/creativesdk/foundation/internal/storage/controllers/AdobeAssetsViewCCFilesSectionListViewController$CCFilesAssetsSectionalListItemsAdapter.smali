.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;
.source "AdobeAssetsViewCCFilesSectionListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CCFilesAssetsSectionalListItemsAdapter"
.end annotation


# instance fields
.field _sectionalAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$AssetListSectionalAdapter;

.field headersDecor:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;Landroid/content/Context;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 77
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    .line 78
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;Landroid/content/Context;)V

    .line 73
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->_sectionalAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$AssetListSectionalAdapter;

    .line 74
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->headersDecor:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;

    .line 79
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$AssetListSectionalAdapter;

    invoke-direct {v0, p1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$AssetListSectionalAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->_sectionalAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$AssetListSectionalAdapter;

    .line 80
    return-void
.end method


# virtual methods
.method protected createAssetFileCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 101
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;-><init>()V

    .line 103
    .local v0, "listAssetCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetview_list_assetviewcell:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->initializeFromLayout(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)V

    .line 106
    return-object v0
.end method

.method protected createAssetFolderCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 90
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;-><init>()V

    .line 92
    .local v0, "folderCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetview_list_folderviewcell:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->initializeFromLayout(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)V

    .line 95
    return-object v0
.end method

.method public getRealAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .registers 3

    .prologue
    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->headersDecor:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;

    if-nez v0, :cond_22

    .line 114
    new-instance v0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->_sectionalAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$AssetListSectionalAdapter;

    invoke-direct {v0, v1}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;-><init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->headersDecor:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;

    .line 115
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->headersDecor:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 117
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->_sectionalAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$AssetListSectionalAdapter;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$AssetListSectionalAdapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    .line 125
    :cond_22
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->_sectionalAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$AssetListSectionalAdapter;

    return-object v0
.end method

.method public getSectionForPosition(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 134
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->_ccfilesDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getAdobeStorageSortIndexCollation()Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->getSectionForPosition(I)I

    move-result v0

    return v0
.end method

.method public getSections()[Ljava/lang/String;
    .registers 4

    .prologue
    .line 138
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->_ccfilesDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getAdobeStorageSortIndexCollation()Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->sectionTitles()Ljava/util/ArrayList;

    move-result-object v0

    .line 139
    .local v0, "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v1, v2, [Ljava/lang/String;

    .line 140
    .local v1, "sectionsArr":[Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "sectionsArr":[Ljava/lang/String;
    check-cast v1, [Ljava/lang/String;

    .line 141
    .restart local v1    # "sectionsArr":[Ljava/lang/String;
    return-object v1
.end method

.method public removeHeaders()V
    .registers 3

    .prologue
    .line 129
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->headersDecor:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 130
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController$CCFilesAssetsSectionalListItemsAdapter;->headersDecor:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;

    .line 131
    return-void
.end method

.method protected setCCFolderViewAsShared(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Z)V
    .registers 4
    .param p1, "cellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .param p2, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .param p3, "isShared"    # Z

    .prologue
    .line 84
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;

    .end local p1    # "cellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    invoke-virtual {p1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->setSharedFolder(Z)V

    .line 85
    return-void
.end method
