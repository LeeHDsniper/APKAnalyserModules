.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;
.source "AdobeAssetsViewDesignLibraryCollectionListViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;
    }
.end annotation


# instance fields
.field private _collectioAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

.field private _libraryDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

.field private _numColumnsInTwoWay:I

.field private _twowayRecyclerView:Lorg/lucasr/twowayview/widget/TwoWayView;

.field private _uniformItemSpacingItemDecoration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;

.field private rightMargin:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;-><init>(Landroid/content/Context;)V

    .line 53
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->rightMargin:I

    .line 65
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_libraryDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    return-object v0
.end method

.method private invalidateCollectionList()V
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_collectioAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->invalidateLibraryCollectionList()V

    .line 99
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_collectioAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->notifyDataSetChanged()V

    .line 100
    return-void
.end method


# virtual methods
.method protected createRecyclerViewAdapter(Landroid/content/Context;Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/support/v7/widget/RecyclerView;",
            ")",
            "Landroid/support/v7/widget/RecyclerView$Adapter",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 113
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_collectioAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    .line 114
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_collectioAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    return-object v0
.end method

.method protected getConcreteRecyclerView(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_twowayRecyclerView:Lorg/lucasr/twowayview/widget/TwoWayView;

    return-object v0
.end method

.method protected getDesignLibraryCollectionNavigationCommand(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;
    .registers 4
    .param p1, "targetCollection"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 133
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToDesignLibraryCollectionData;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToDesignLibraryCollectionData;-><init>()V

    .line 135
    .local v0, "navCommand":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToDesignLibraryCollectionData;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getGUID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToDesignLibraryCollectionData;->collectionGUID:Ljava/lang/String;

    .line 136
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToDesignLibraryCollectionData;->collectionName:Ljava/lang/String;

    .line 137
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getHref()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToDesignLibraryCollectionData;->collectionHref:Ljava/lang/String;

    .line 138
    iput-object p1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToDesignLibraryCollectionData;->library:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .line 139
    return-object v0
.end method

.method protected getItemDecoration(Landroid/support/v7/widget/RecyclerView;Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$ItemDecoration;
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$dimen;->adobe_library_items_spacing_size:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 84
    .local v0, "spacing":I
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;

    invoke-direct {v1, v0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;-><init>(II)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_uniformItemSpacingItemDecoration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;

    .line 85
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$integer;->adobe_library_collections_num_columns:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_numColumnsInTwoWay:I

    .line 87
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_uniformItemSpacingItemDecoration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_numColumnsInTwoWay:I

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->setFixedColumn(I)V

    .line 88
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_uniformItemSpacingItemDecoration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;

    return-object v1
.end method

.method protected getLayoutManager(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 119
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$integer;->adobe_library_collections_num_columns:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_numColumnsInTwoWay:I

    .line 120
    new-instance v0, Lorg/lucasr/twowayview/widget/GridLayoutManager;

    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_numColumnsInTwoWay:I

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lorg/lucasr/twowayview/widget/GridLayoutManager;-><init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;II)V

    return-object v0
.end method

.method protected getMainRootView(Landroid/content/Context;)Landroid/view/View;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 69
    const-string v2, "layout_inflater"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 70
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assets_library_items_view:I

    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 71
    .local v1, "mainRootView":Landroid/view/View;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_asset_libraryitemsview_swipe_refresh_layout:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 72
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_asset_library_design_items_twowayview:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lorg/lucasr/twowayview/widget/TwoWayView;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_twowayRecyclerView:Lorg/lucasr/twowayview/widget/TwoWayView;

    .line 73
    return-object v1
.end method

.method protected getSwipeRefreshLayout()Landroid/support/v4/widget/SwipeRefreshLayout;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    return-object v0
.end method

.method protected handleItemClick(Landroid/view/View;I)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 126
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_collectioAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    invoke-virtual {v1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->getLibraryAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-result-object v0

    .line 127
    .local v0, "designLibraryCollection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    if-eqz v0, :cond_17

    .line 128
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->getDesignLibraryCollectionNavigationCommand(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;->navigateToCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;)V

    .line 129
    :cond_17
    return-void
.end method

.method public refreshDueToDataChange()V
    .registers 1

    .prologue
    .line 103
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->invalidateCollectionList()V

    .line 104
    return-void
.end method

.method public refreshDueToNewItemsInsertion()V
    .registers 1

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->invalidateCollectionList()V

    .line 109
    return-void
.end method

.method public setDesignLibraryCollectionsDataSource(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;)V
    .registers 2
    .param p1, "dataSource"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_libraryDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    .line 61
    return-void
.end method
