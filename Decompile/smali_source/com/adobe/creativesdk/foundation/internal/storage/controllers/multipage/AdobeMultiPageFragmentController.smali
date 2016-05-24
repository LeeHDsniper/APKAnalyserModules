.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;
.super Ljava/lang/Object;
.source "AdobeMultiPageFragmentController.java"


# instance fields
.field protected _asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

.field protected _autofitRecyclerView:Landroid/view/View;

.field protected _autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

.field protected _fragmentView:Landroid/view/View;

.field protected _oneUpActivityContext:Landroid/content/Context;

.field protected _pagerRootView:Landroid/view/View;

.field protected _prevstate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

.field protected _recyclerView:Landroid/view/View;

.field protected _recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

.field private _reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;",
            ">;"
        }
    .end annotation
.end field

.field protected _state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

.field protected _viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public displayGridView()V
    .registers 3

    .prologue
    const/4 v1, 0x4

    .line 152
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_prevstate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .line 153
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageGridView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .line 155
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getCurrentAssetViewerActivity()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 156
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getCurrentAssetViewerActivity()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;->showActionsBar()V

    .line 159
    :cond_16
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_pagerRootView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 160
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 163
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->requestRelayout()V

    .line 166
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_fragmentView:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 168
    return-void
.end method

.method public displayListView()V
    .registers 3

    .prologue
    const/4 v1, 0x4

    .line 187
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_prevstate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .line 188
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageListView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .line 190
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getCurrentAssetViewerActivity()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 191
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getCurrentAssetViewerActivity()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;->showActionsBar()V

    .line 194
    :cond_16
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_pagerRootView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 195
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 196
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 198
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->requestRelayout()V

    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_fragmentView:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 202
    return-void
.end method

.method public displayViewPager(I)V
    .registers 4
    .param p1, "startPosition"    # I

    .prologue
    const/4 v1, 0x4

    .line 172
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_prevstate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .line 173
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageViewPager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 177
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_pagerRootView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 179
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_fragmentView:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_pagerRootView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;->startViewPager(I)V

    .line 183
    return-void
.end method

.method public getPreviousState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_prevstate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    return-object v0
.end method

.method public getState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    return-object v0
.end method

.method public handleOrientationChange()V
    .registers 2

    .prologue
    .line 219
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    if-eqz v0, :cond_9

    .line 220
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;->handleOrientationChange()V

    .line 221
    :cond_9
    return-void
.end method

.method public performInitiallization(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 111
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_oneUpActivityContext:Landroid/content/Context;

    .line 113
    const-string v1, "layout_inflater"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 116
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$layout;->fragment_multipage_asset_viewpager:I

    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_pagerRootView:Landroid/view/View;

    .line 117
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_multipage_autofit_recycler_view:I

    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerView:Landroid/view/View;

    .line 118
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_multipage_recycler_view:I

    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerView:Landroid/view/View;

    .line 121
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_fragmentView:Landroid/view/View;

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_pagerRootView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 122
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_fragmentView:Landroid/view/View;

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 123
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_fragmentView:Landroid/view/View;

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 126
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    .line 127
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    .line 128
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    .line 132
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_pagerRootView:Landroid/view/View;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;->setMainRootView(Landroid/view/View;)V

    .line 133
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;->setAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 134
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_oneUpActivityContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;->performInitiallization(Landroid/content/Context;)V

    .line 136
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerView:Landroid/view/View;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->setMainRootView(Landroid/view/View;)V

    .line 137
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->setAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 138
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_oneUpActivityContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->performInitialization(Landroid/content/Context;)V

    .line 140
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerView:Landroid/view/View;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->setMainRootView(Landroid/view/View;)V

    .line 141
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->setAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 142
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_oneUpActivityContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->performInitialization(Landroid/content/Context;)V

    .line 144
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;->setFragmentController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;)V

    .line 145
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->setFragmentController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;)V

    .line 146
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->setFragmentController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;)V

    .line 148
    return-void
.end method

.method public provideViewToActivity()Landroid/view/View;
    .registers 3

    .prologue
    .line 207
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageGridView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    if-ne v0, v1, :cond_c

    .line 208
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->displayGridView()V

    .line 214
    :goto_9
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_fragmentView:Landroid/view/View;

    return-object v0

    .line 209
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;->AdobeMultiPageListView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    if-ne v0, v1, :cond_16

    .line 210
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->displayListView()V

    goto :goto_9

    .line 212
    :cond_16
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->displayViewPager(I)V

    goto :goto_9
.end method

.method public setAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 2
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 68
    return-void
.end method

.method public setFragmentView(Landroid/view/View;)V
    .registers 2
    .param p1, "fragmentView"    # Landroid/view/View;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_fragmentView:Landroid/view/View;

    .line 60
    return-void
.end method

.method public setReuseableBitmapCacheWorker(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)V
    .registers 3
    .param p1, "bitmapCacheWorker"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .prologue
    .line 95
    if-nez p1, :cond_3

    .line 108
    :goto_2
    return-void

    .line 98
    :cond_3
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    if-eqz v0, :cond_c

    .line 99
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->setReuseableBitmapCacheWorker(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)V

    .line 101
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    if-eqz v0, :cond_15

    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->setReuseableBitmapCacheWorker(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)V

    .line 104
    :cond_15
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    if-eqz v0, :cond_1e

    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;->setReuseableBitmapCacheWorker(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)V

    .line 107
    :cond_1e
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    goto :goto_2
.end method

.method public setState(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;)V
    .registers 2
    .param p1, "state"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_state:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageViewState;

    .line 52
    return-void
.end method

.method public wentOffline()V
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    if-eqz v0, :cond_9

    .line 85
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->wentOffline()V

    .line 86
    :cond_9
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    if-eqz v0, :cond_12

    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->wentOffline()V

    .line 89
    :cond_12
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    if-eqz v0, :cond_16

    .line 92
    :cond_16
    return-void
.end method

.method public wentOnline()V
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    if-eqz v0, :cond_9

    .line 73
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_autofitRecyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerViewController;->wentOnline()V

    .line 74
    :cond_9
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    if-eqz v0, :cond_12

    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_recyclerViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->wentOnline()V

    .line 77
    :cond_12
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;->_viewPagerController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeOneUpMultiPageViewPagerController;

    if-eqz v0, :cond_16

    .line 80
    :cond_16
    return-void
.end method
