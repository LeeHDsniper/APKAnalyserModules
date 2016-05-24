.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;
.source "AdobeAssetViewNewCCFilesContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CCFilesActionBarController"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;
    }
.end annotation


# instance fields
.field private final EMPTY_STRING:Ljava/lang/String;

.field _currentFileListSelectionType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

.field _currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

.field _currentSortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

.field private _lastSearchString:Ljava/lang/String;

.field private _restoreActionBar:Z

.field _savedFragmentActionBarInstanceData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

.field private _searchView:Landroid/view/MenuItem;

.field private _sortTypeMenuItem:Landroid/view/MenuItem;

.field private _viewTypeMenuItem:Landroid/view/MenuItem;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    .prologue
    .line 449
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;)V

    .line 451
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->EMPTY_STRING:Ljava/lang/String;

    .line 453
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_lastSearchString:Ljava/lang/String;

    .line 841
    return-void
.end method

.method private toggleSortType()V
    .registers 4

    .prologue
    .line 769
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne v0, v1, :cond_26

    .line 771
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_TIME:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    .line 772
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->SORT_STATE_DESCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    .line 780
    :goto_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->setLastSortType(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;)V

    .line 781
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->setLastSortState(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;)V

    .line 782
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_storageDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortCollectionByType(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;)V

    .line 783
    return-void

    .line 776
    :cond_26
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    .line 777
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->SORT_STATE_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    goto :goto_e
.end method

.method private toggleViewType()V
    .registers 3

    .prologue
    .line 758
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentFileListSelectionType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    if-ne v0, v1, :cond_12

    .line 759
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_WATERFALL:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentFileListSelectionType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    .line 763
    :goto_a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentFileListSelectionType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->changeVisualDisplay(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;)V

    .line 765
    return-void

    .line 761
    :cond_12
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentFileListSelectionType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    goto :goto_a
.end method


# virtual methods
.method public closeSearchViewIfOpen()V
    .registers 2

    .prologue
    .line 672
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    invoke-static {v0}, Landroid/support/v4/view/MenuItemCompat;->isActionViewExpanded(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 675
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    invoke-static {v0}, Landroid/support/v4/view/MenuItemCompat;->collapseActionView(Landroid/view/MenuItem;)Z

    .line 677
    :cond_11
    return-void
.end method

.method public handleCurrentNetworkStatus(Z)V
    .registers 6
    .param p1, "isOnline"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 699
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 700
    :cond_b
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_viewTypeMenuItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_1f

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_viewTypeMenuItem:Landroid/view/MenuItem;

    if-eqz p1, :cond_38

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->isSearchBarOpened()Z

    move-result v0

    if-nez v0, :cond_38

    move v0, v1

    :goto_1c
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 701
    :cond_1f
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_sortTypeMenuItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_32

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_sortTypeMenuItem:Landroid/view/MenuItem;

    if-eqz p1, :cond_3a

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->isSearchBarOpened()Z

    move-result v3

    if-nez v3, :cond_3a

    :goto_2f
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 702
    :cond_32
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->handleCurrentNetworkStatusWithUpload(Z)V

    .line 703
    return-void

    :cond_38
    move v0, v2

    .line 700
    goto :goto_1c

    :cond_3a
    move v1, v2

    .line 701
    goto :goto_2f
.end method

.method public handleOnStart()V
    .registers 1

    .prologue
    .line 706
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->resetButtonState()V

    .line 707
    return-void
.end method

.method public handleOptionItemSelect(I)Z
    .registers 7
    .param p1, "itemId"    # I

    .prologue
    const/4 v2, 0x1

    .line 787
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_assets_viewtype:I

    if-ne p1, v1, :cond_1b

    .line 789
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->toggleViewType()V

    .line 792
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentFileListSelectionType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    if-ne v1, v3, :cond_15

    .line 793
    const-string v1, "View As List"

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAssetBrowserAction(Ljava/lang/String;)V

    :goto_13
    move v1, v2

    .line 838
    :goto_14
    return v1

    .line 795
    :cond_15
    const-string v1, "View As Grid"

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAssetBrowserAction(Ljava/lang/String;)V

    goto :goto_13

    .line 799
    :cond_1b
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_assets_view_sorttype:I

    if-ne p1, v1, :cond_41

    .line 801
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->toggleSortType()V

    .line 804
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne v1, v3, :cond_3b

    .line 805
    const-string v1, "Sort Alphabetically"

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAssetBrowserAction(Ljava/lang/String;)V

    .line 809
    :goto_2d
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_currentAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    move v1, v2

    .line 811
    goto :goto_14

    .line 807
    :cond_3b
    const-string v1, "Sort By Date"

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAssetBrowserAction(Ljava/lang/String;)V

    goto :goto_2d

    .line 813
    :cond_41
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->search:I

    if-ne p1, v1, :cond_5f

    .line 815
    const-string v1, "Search Button Tapped"

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAssetBrowserAction(Ljava/lang/String;)V

    .line 816
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    .line 817
    invoke-static {v1}, Landroid/support/v4/view/MenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/SearchView;

    .line 819
    .local v0, "searchView":Landroid/support/v7/widget/SearchView;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$4;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    .line 838
    .end local v0    # "searchView":Landroid/support/v7/widget/SearchView;
    :cond_5a
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->handleOptionItemSelect(I)Z

    move-result v1

    goto :goto_14

    .line 833
    :cond_5f
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_sdk_photos_myaccount:I

    if-ne p1, v1, :cond_5a

    .line 834
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_MENU_SHOW_MY_ACCOUNT:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    move v1, v2

    .line 835
    goto :goto_14
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 20
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 458
    sget v13, Lcom/adobe/creativesdk/foundation/assets/R$menu;->adobe_asset_browser_menu:I

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v13, v1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 459
    sget v13, Lcom/adobe/creativesdk/foundation/assets/R$id;->search:I

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    .line 462
    .local v7, "menuItem":Landroid/view/MenuItem;
    invoke-static {v7}, Landroid/support/v4/view/MenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/support/v7/widget/SearchView;

    .line 464
    .local v10, "searchView":Landroid/support/v7/widget/SearchView;
    sget v13, Lcom/adobe/creativesdk/foundation/assets/R$id;->search_plate:I

    invoke-virtual {v10, v13}, Landroid/support/v7/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object v9

    .line 465
    .local v9, "searchPlate":Landroid/view/View;
    if-eqz v9, :cond_24

    .line 466
    sget v13, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->search_box_appearance:I

    invoke-virtual {v9, v13}, Landroid/view/View;->setBackgroundResource(I)V

    .line 484
    :cond_24
    move-object/from16 v5, p1

    .line 485
    .local v5, "cmenu":Landroid/view/Menu;
    sget v13, Lcom/adobe/creativesdk/foundation/assets/R$id;->search_src_text:I

    invoke-virtual {v10, v13}, Landroid/support/v7/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 486
    .local v3, "autoComplete":Landroid/widget/EditText;
    new-instance v13, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$1;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v3, v5, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;Landroid/widget/EditText;Landroid/view/Menu;Landroid/support/v7/widget/SearchView;)V

    invoke-static {v7, v13}, Landroid/support/v4/view/MenuItemCompat;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;)Landroid/view/MenuItem;

    .line 535
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    .line 536
    .local v2, "activity":Landroid/app/Activity;
    new-instance v8, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$2;

    move-object/from16 v0, p0

    invoke-direct {v8, v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;Landroid/app/Activity;)V

    .line 562
    .local v8, "queryTextListener":Landroid/support/v7/widget/SearchView$OnQueryTextListener;
    if-eqz v3, :cond_78

    .line 563
    :try_start_49
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v13

    invoke-static {v13}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v13

    invoke-virtual {v3, v13}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 564
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v13}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    sget v14, Lcom/adobe/creativesdk/foundation/assets/R$color;->asset_browser_dark_text:I

    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getColor(I)I

    move-result v13

    invoke-virtual {v3, v13}, Landroid/widget/EditText;->setTextColor(I)V

    .line 565
    const/high16 v13, 0x41a80000

    invoke-virtual {v3, v13}, Landroid/widget/EditText;->setTextSize(F)V

    .line 566
    new-instance v13, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$3;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v9}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;Landroid/view/View;)V

    invoke-virtual {v3, v13}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 584
    :cond_78
    const-string v13, "android.widget.SearchView$SearchAutoComplete"

    invoke-static {v13}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 586
    .local v4, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v12, Landroid/text/SpannableStringBuilder;

    const-string v13, ""

    invoke-direct {v12, v13}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 587
    .local v12, "stopHint":Landroid/text/SpannableStringBuilder;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    sget v15, Lcom/adobe/creativesdk/foundation/assets/R$string;->search_query_hint:I

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getAdobeFormattedString(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 588
    new-instance v13, Landroid/text/style/ForegroundColorSpan;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    sget v15, Lcom/adobe/creativesdk/foundation/assets/R$color;->asset_browser_light_text:I

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getColor(I)I

    move-result v14

    invoke-direct {v13, v14}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/4 v14, 0x0

    .line 589
    invoke-virtual {v12}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v15

    const/16 v16, 0x21

    .line 588
    invoke-virtual/range {v12 .. v16}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 597
    const-string v13, "setHint"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Class;

    const/4 v15, 0x0

    const-class v16, Ljava/lang/CharSequence;

    aput-object v16, v14, v15

    invoke-virtual {v4, v13, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    .line 598
    .local v11, "setHintMethod":Ljava/lang/reflect/Method;
    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object v12, v13, v14

    invoke-virtual {v11, v3, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d2
    .catch Ljava/lang/IllegalAccessException; {:try_start_49 .. :try_end_d2} :catch_d9
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_49 .. :try_end_d2} :catch_de
    .catch Ljava/lang/ClassNotFoundException; {:try_start_49 .. :try_end_d2} :catch_e3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_49 .. :try_end_d2} :catch_e8

    .line 609
    .end local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "setHintMethod":Ljava/lang/reflect/Method;
    .end local v12    # "stopHint":Landroid/text/SpannableStringBuilder;
    :goto_d2
    invoke-virtual {v10, v8}, Landroid/support/v7/widget/SearchView;->setOnQueryTextListener(Landroid/support/v7/widget/SearchView$OnQueryTextListener;)V

    .line 611
    invoke-super/range {p0 .. p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 612
    return-void

    .line 599
    :catch_d9
    move-exception v6

    .line 600
    .local v6, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v6}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_d2

    .line 601
    .end local v6    # "e":Ljava/lang/IllegalAccessException;
    :catch_de
    move-exception v6

    .line 602
    .local v6, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v6}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_d2

    .line 603
    .end local v6    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_e3
    move-exception v6

    .line 604
    .local v6, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v6}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_d2

    .line 605
    .end local v6    # "e":Ljava/lang/ClassNotFoundException;
    :catch_e8
    move-exception v6

    .line 606
    .local v6, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v6}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto :goto_d2
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .registers 6
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v2, 0x0

    .line 636
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 637
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v3

    if-eqz v3, :cond_4c

    .line 639
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_assets_viewtype:I

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_viewTypeMenuItem:Landroid/view/MenuItem;

    .line 640
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_assets_view_sorttype:I

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_sortTypeMenuItem:Landroid/view/MenuItem;

    .line 641
    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->search:I

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    .line 643
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    iget-boolean v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_isRestoredFragment:Z

    if-nez v3, :cond_2e

    iget-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_restoreActionBar:Z

    if-eqz v3, :cond_4d

    :cond_2e
    const/4 v1, 0x1

    .line 644
    .local v1, "shouldRestoreActionBar":Z
    :goto_2f
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    invoke-static {v3}, Landroid/support/v4/view/MenuItemCompat;->isActionViewExpanded(Landroid/view/MenuItem;)Z

    move-result v0

    .line 646
    .local v0, "isSearchViewExpanded":Z
    if-nez v0, :cond_42

    if-eqz v1, :cond_42

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_savedFragmentActionBarInstanceData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

    if-nez v3, :cond_42

    .line 650
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->_searchBarOpened:Z
    invoke-static {v3, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->access$102(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;Z)Z

    .line 653
    :cond_42
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->refreshOptionItems()V

    .line 656
    if-eqz v1, :cond_4f

    .line 658
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->restoreFragmentActionBarFromSavedData()V

    .line 659
    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_restoreActionBar:Z

    .line 668
    .end local v0    # "isSearchViewExpanded":Z
    .end local v1    # "shouldRestoreActionBar":Z
    :cond_4c
    :goto_4c
    return-void

    :cond_4d
    move v1, v2

    .line 643
    goto :goto_2f

    .line 663
    .restart local v0    # "isSearchViewExpanded":Z
    .restart local v1    # "shouldRestoreActionBar":Z
    :cond_4f
    if-eqz v0, :cond_4c

    .line 664
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    invoke-static {v2}, Landroid/support/v4/view/MenuItemCompat;->collapseActionView(Landroid/view/MenuItem;)Z

    goto :goto_4c
.end method

.method public refreshOptionItems()V
    .registers 10

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 713
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_viewTypeMenuItem:Landroid/view/MenuItem;

    if-nez v3, :cond_7

    .line 746
    :goto_6
    return-void

    .line 716
    :cond_7
    const/4 v2, 0x0

    .line 717
    .local v2, "newViewTitle":Ljava/lang/String;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentFileListSelectionType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    if-ne v3, v6, :cond_a8

    .line 718
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_action_asgrid:I

    invoke-virtual {v3, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getLocalizedStringUtil(I)Ljava/lang/String;

    move-result-object v2

    .line 722
    :goto_16
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_viewTypeMenuItem:Landroid/view/MenuItem;

    invoke-interface {v3, v2}, Landroid/view/MenuItem;->setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 724
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_viewTypeMenuItem:Landroid/view/MenuItem;

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v6, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getAdobeFormattedString(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v6

    invoke-interface {v3, v6}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 727
    const/4 v1, 0x0

    .line 728
    .local v1, "newSortTitle":Ljava/lang/String;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne v3, v6, :cond_b2

    .line 729
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_action_sort_date:I

    invoke-virtual {v3, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getLocalizedStringUtil(I)Ljava/lang/String;

    move-result-object v1

    .line 733
    :goto_35
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_sortTypeMenuItem:Landroid/view/MenuItem;

    invoke-interface {v3, v1}, Landroid/view/MenuItem;->setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 735
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_sortTypeMenuItem:Landroid/view/MenuItem;

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v6, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getAdobeFormattedString(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v6

    invoke-interface {v3, v6}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 737
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_myAccountMenuItem:Landroid/view/MenuItem;

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_sdk_myaccount:I

    invoke-virtual {v7, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getLocalizedStringUtil(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getAdobeFormattedString(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v6

    invoke-interface {v3, v6}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 738
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_myAccountMenuItem:Landroid/view/MenuItem;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->isSearchBarOpened()Z

    move-result v3

    if-nez v3, :cond_bc

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->shouldEnableMyAccountMenu()Z

    move-result v3

    if-eqz v3, :cond_bc

    move v3, v4

    :goto_69
    invoke-interface {v6, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 740
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->isAssetsMainFrameVisible()Z

    move-result v0

    .line 741
    .local v0, "isMainAssetFrameVisible":Z
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_viewTypeMenuItem:Landroid/view/MenuItem;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->isSearchBarOpened()Z

    move-result v3

    if-nez v3, :cond_be

    if-eqz v0, :cond_be

    move v3, v4

    :goto_7f
    invoke-interface {v6, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 742
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_sortTypeMenuItem:Landroid/view/MenuItem;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->isSearchBarOpened()Z

    move-result v3

    if-nez v3, :cond_c0

    if-eqz v0, :cond_c0

    move v3, v4

    :goto_8f
    invoke-interface {v6, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 743
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 744
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->isSearchBarOpened()Z

    move-result v6

    if-nez v6, :cond_c2

    if-eqz v0, :cond_c2

    :goto_a3
    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->handleCollaborationVisibilty(Z)V

    goto/16 :goto_6

    .line 720
    .end local v0    # "isMainAssetFrameVisible":Z
    .end local v1    # "newSortTitle":Ljava/lang/String;
    :cond_a8
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_action_aslist:I

    invoke-virtual {v3, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getLocalizedStringUtil(I)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_16

    .line 731
    .restart local v1    # "newSortTitle":Ljava/lang/String;
    :cond_b2
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_action_sort_alpha:I

    invoke-virtual {v3, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;->getLocalizedStringUtil(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_35

    :cond_bc
    move v3, v5

    .line 738
    goto :goto_69

    .restart local v0    # "isMainAssetFrameVisible":Z
    :cond_be
    move v3, v5

    .line 741
    goto :goto_7f

    :cond_c0
    move v3, v5

    .line 742
    goto :goto_8f

    :cond_c2
    move v4, v5

    .line 744
    goto :goto_a3
.end method

.method public resetButtonState()V
    .registers 2

    .prologue
    .line 750
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastVisualLayout()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentFileListSelectionType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    .line 751
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    .line 752
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortType()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_currentSortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    .line 753
    return-void
.end method

.method protected restoreFragmentActionBarFromSavedData()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 681
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_savedFragmentActionBarInstanceData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

    if-nez v1, :cond_6

    .line 695
    :goto_5
    return-void

    .line 685
    :cond_6
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    invoke-static {v1}, Landroid/support/v4/view/MenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/SearchView;

    .line 686
    .local v0, "searchView":Landroid/support/v7/widget/SearchView;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_savedFragmentActionBarInstanceData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

    iget-boolean v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;->isLastFilteredBySearch:Z

    if-nez v1, :cond_2e

    const/4 v1, 0x1

    :goto_15
    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView;->setIconified(Z)V

    .line 688
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_savedFragmentActionBarInstanceData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

    iget-boolean v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;->isLastFilteredBySearch:Z

    if-eqz v1, :cond_2a

    .line 690
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_searchView:Landroid/view/MenuItem;

    invoke-static {v1}, Landroid/support/v4/view/MenuItemCompat;->expandActionView(Landroid/view/MenuItem;)Z

    .line 691
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_savedFragmentActionBarInstanceData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;->lastSearchedText:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 694
    :cond_2a
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_savedFragmentActionBarInstanceData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

    goto :goto_5

    :cond_2e
    move v1, v2

    .line 686
    goto :goto_15
.end method

.method public saveActionBarInstanceState()V
    .registers 4

    .prologue
    .line 628
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_savedFragmentActionBarInstanceData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

    .line 629
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_savedFragmentActionBarInstanceData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_lastSearchString:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    const/4 v0, 0x1

    :goto_14
    iput-boolean v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;->isLastFilteredBySearch:Z

    .line 630
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_savedFragmentActionBarInstanceData:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController;->_lastSearchString:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment$CCFilesActionBarController$FragmentActionBarInstanceData;->lastSearchedText:Ljava/lang/String;

    .line 631
    return-void

    .line 629
    :cond_1d
    const/4 v0, 0x0

    goto :goto_14
.end method
