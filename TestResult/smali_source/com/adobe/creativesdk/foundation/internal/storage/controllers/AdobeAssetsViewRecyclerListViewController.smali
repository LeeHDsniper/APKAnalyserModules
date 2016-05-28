.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;
.source "AdobeAssetsViewRecyclerListViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;
    }
.end annotation


# instance fields
.field private _itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

.field protected _itemsAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/widget/RecyclerView$Adapter",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field protected _layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

.field private _mainRootView:Landroid/view/View;

.field private _onScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field private _recyclerView:Landroid/support/v7/widget/RecyclerView;

.field protected _swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;-><init>(Landroid/content/Context;)V

    .line 32
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_onScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 78
    return-void
.end method


# virtual methods
.method protected attachScrollListenerToListView()V
    .registers 3

    .prologue
    .line 134
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_onScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 135
    return-void
.end method

.method protected abstract createRecyclerViewAdapter(Landroid/content/Context;Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;
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
.end method

.method protected abstract getConcreteRecyclerView(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView;
.end method

.method protected getFirstVisiblePosition()I
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 44
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 45
    .local v0, "count":I
    if-nez v0, :cond_a

    .line 48
    :goto_9
    return v1

    :cond_a
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_9
.end method

.method public getInstanceState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController$InstanceState;
    .registers 3

    .prologue
    .line 116
    const/4 v0, 0x0

    .line 117
    .local v0, "instanceState":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v1, :cond_12

    .line 118
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;

    .end local v0    # "instanceState":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;
    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;)V

    .line 119
    .restart local v0    # "instanceState":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;->_layoutManagerState:Landroid/os/Parcelable;

    .line 121
    :cond_12
    return-object v0
.end method

.method protected abstract getItemDecoration(Landroid/support/v7/widget/RecyclerView;Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.end method

.method protected getLastVisiblePosition()I
    .registers 5

    .prologue
    .line 52
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 53
    .local v0, "count":I
    if-nez v0, :cond_a

    .line 54
    const/4 v1, 0x0

    .line 56
    :goto_9
    return v1

    :cond_a
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    move-result v1

    goto :goto_9
.end method

.method protected abstract getLayoutManager(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$LayoutManager;
.end method

.method protected abstract getMainRootView(Landroid/content/Context;)Landroid/view/View;
.end method

.method public getMainView()Landroid/view/View;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_mainRootView:Landroid/view/View;

    return-object v0
.end method

.method protected abstract getSwipeRefreshLayout()Landroid/support/v4/widget/SwipeRefreshLayout;
.end method

.method protected abstract handleItemClick(Landroid/view/View;I)V
.end method

.method handleScrollOffsetChange()V
    .registers 11

    .prologue
    .line 62
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemsAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v4

    .line 63
    .local v4, "totalCount":I
    if-nez v4, :cond_9

    .line 74
    :cond_8
    :goto_8
    return-void

    .line 66
    :cond_9
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->getFirstVisiblePosition()I

    move-result v0

    .line 67
    .local v0, "firstVisiblePos":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->getLastVisiblePosition()I

    move-result v1

    .line 69
    .local v1, "lastVisiblePos":I
    int-to-double v6, v1

    sub-int v5, v1, v0

    sub-int v5, v4, v5

    int-to-double v8, v5

    div-double v2, v6, v8

    .line 71
    .local v2, "scrollRatio":D
    const-wide v6, 0x3fe999999999999aL

    cmpl-double v5, v2, v6

    if-lez v5, :cond_8

    .line 72
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;

    invoke-interface {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;->loadMoreItemsFromDataSource()V

    goto :goto_8
.end method

.method public performInitialization(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 148
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->getMainRootView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_mainRootView:Landroid/view/View;

    .line 149
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->getConcreteRecyclerView(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 150
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->recyclerViewHasFixedItemSize()Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 151
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0, v3, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->getItemDecoration(Landroid/support/v7/widget/RecyclerView;Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    .line 152
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 153
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->getLayoutManager(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .line 163
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 165
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->getSwipeRefreshLayout()Landroid/support/v4/widget/SwipeRefreshLayout;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 167
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$2;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;)V

    invoke-virtual {v3, v4}, Landroid/support/v4/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 183
    const-string v3, "#2098f5"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    .line 184
    .local v1, "color":I
    const-string v3, "#f5f9fa"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    .line 186
    .local v0, "backgrdcolor":I
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v4, 0x4

    new-array v4, v4, [I

    const/4 v5, 0x0

    aput v1, v4, v5

    const/4 v5, 0x1

    aput v0, v4, v5

    const/4 v5, 0x2

    aput v1, v4, v5

    const/4 v5, 0x3

    aput v0, v4, v5

    invoke-virtual {v3, v4}, Landroid/support/v4/widget/SwipeRefreshLayout;->setColorSchemeColors([I)V

    .line 187
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->attachScrollListenerToListView()V

    .line 189
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0, p1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->createRecyclerViewAdapter(Landroid/content/Context;Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemsAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    .line 190
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemsAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 192
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v3}, Lorg/lucasr/twowayview/ItemClickSupport;->addTo(Landroid/support/v7/widget/RecyclerView;)Lorg/lucasr/twowayview/ItemClickSupport;

    move-result-object v2

    .line 194
    .local v2, "itemClick":Lorg/lucasr/twowayview/ItemClickSupport;
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$3;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;)V

    invoke-virtual {v2, v3}, Lorg/lucasr/twowayview/ItemClickSupport;->setOnItemClickListener(Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;)V

    .line 201
    return-void
.end method

.method protected recyclerViewHasFixedItemSize()Z
    .registers 2

    .prologue
    .line 143
    const/4 v0, 0x1

    return v0
.end method

.method public refreshDueToDataChange()V
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemsAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 91
    return-void
.end method

.method public refreshDueToNewItemsInsertion()V
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemsAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 96
    return-void
.end method

.method public refreshLayoutDueToOrientationChange()V
    .registers 6

    .prologue
    const/4 v3, -0x1

    .line 205
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v2, :cond_4c

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    check-cast v2, Lorg/lucasr/twowayview/TwoWayLayoutManager;

    invoke-virtual {v2}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v0

    .line 206
    .local v0, "firstItemPos":I
    :goto_d
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    if-eqz v2, :cond_18

    .line 207
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/RecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 209
    :cond_18
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->getLayoutManager(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .line 210
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 211
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->getItemDecoration(Landroid/support/v7/widget/RecyclerView;Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    .line 212
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_itemDecoration:Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 214
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->refreshDueToDataChange()V

    .line 215
    if-eq v0, v3, :cond_4b

    .line 216
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 217
    .local v1, "handler":Landroid/os/Handler;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$4;

    invoke-direct {v2, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 224
    .end local v1    # "handler":Landroid/os/Handler;
    :cond_4b
    return-void

    .end local v0    # "firstItemPos":I
    :cond_4c
    move v0, v3

    .line 205
    goto :goto_d
.end method

.method public restoreFromState(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController$InstanceState;)V
    .registers 4
    .param p1, "state"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController$InstanceState;

    .prologue
    .line 126
    if-eqz p1, :cond_f

    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    if-eqz v0, :cond_f

    .line 128
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_layoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;

    .end local p1    # "state":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController$InstanceState;
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController$RecyclerViewInstanceState;->_layoutManagerState:Landroid/os/Parcelable;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 131
    :cond_f
    return-void
.end method

.method public showLoadingFooter()V
    .registers 1

    .prologue
    .line 112
    return-void
.end method

.method public stopRefreshAnimation()V
    .registers 3

    .prologue
    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 106
    return-void
.end method
