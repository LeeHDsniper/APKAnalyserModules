.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;
.source "AdobeAssetsViewPhotosBaseListViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$PhotoListViewBaseAdapter;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;-><init>(Landroid/content/Context;)V

    .line 38
    return-void
.end method


# virtual methods
.method cancelThumbnailRenditionRequestOfAsset(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)V
    .registers 3
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 159
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    instance-of v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    if-eqz v0, :cond_d

    .line 161
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->cancelDownloadRequest()V

    .line 163
    :cond_d
    return-void
.end method

.method protected getConcreteRecyclerView(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method protected getItemDecoration(Landroid/support/v7/widget/RecyclerView;Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$ItemDecoration;
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 63
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/GridSpacesItemDecoration;

    const/4 v1, 0x5

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/GridSpacesItemDecoration;-><init>(ILandroid/content/Context;)V

    return-object v0
.end method

.method protected getLayoutManager(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 68
    const/4 v1, 0x0

    .line 69
    .local v1, "sglm":Landroid/support/v7/widget/StaggeredGridLayoutManager;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v0, v2, Landroid/content/res/Configuration;->orientation:I

    .line 70
    .local v0, "orientation":I
    packed-switch v0, :pswitch_data_20

    .line 76
    new-instance v1, Landroid/support/v7/widget/StaggeredGridLayoutManager;

    .end local v1    # "sglm":Landroid/support/v7/widget/StaggeredGridLayoutManager;
    invoke-direct {v1, v4, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;-><init>(II)V

    .line 80
    .restart local v1    # "sglm":Landroid/support/v7/widget/StaggeredGridLayoutManager;
    :goto_15
    invoke-virtual {v1, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setGapStrategy(I)V

    .line 81
    return-object v1

    .line 72
    :pswitch_19
    new-instance v1, Landroid/support/v7/widget/StaggeredGridLayoutManager;

    .end local v1    # "sglm":Landroid/support/v7/widget/StaggeredGridLayoutManager;
    const/4 v2, 0x3

    invoke-direct {v1, v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;-><init>(II)V

    .line 73
    .restart local v1    # "sglm":Landroid/support/v7/widget/StaggeredGridLayoutManager;
    goto :goto_15

    .line 70
    :pswitch_data_20
    .packed-switch 0x2
        :pswitch_19
    .end packed-switch
.end method

.method protected getMainRootView(Landroid/content/Context;)Landroid/view/View;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    const-string v2, "layout_inflater"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 49
    .local v1, "inflater":Landroid/view/LayoutInflater;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_storage_assets_gridview:I

    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 50
    .local v0, "gridRootView":Landroid/view/View;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->gridview_swipe_refresh_layout:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 51
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->storage_assetbrowser_StaggeredGridView:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;->_recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 53
    return-object v0
.end method

.method public getSelectionOverallVisibility()Z
    .registers 2

    .prologue
    .line 42
    const/4 v0, 0x0

    return v0
.end method

.method public handleAssetCellSelectionToggle(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;)V
    .registers 7
    .param p1, "assetCellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    .prologue
    .line 86
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->getPosition()I

    move-result v2

    .line 87
    .local v2, "cellPosition":I
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;->_assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;

    invoke-virtual {v4, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;->getItem(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    move-result-object v1

    .line 88
    .local v1, "assetCellData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    iget-object v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;

    .line 89
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
    if-eqz v0, :cond_2a

    instance-of v4, v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    if-eqz v4, :cond_2a

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->isMultiSelectModeActive()Z

    move-result v4

    if-eqz v4, :cond_2a

    move-object v3, v0

    .line 91
    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .line 92
    .local v3, "photoAsset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->isMarkedSelected()Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 94
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->markSelected(Z)V

    .line 95
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->removeSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V

    .line 103
    .end local v3    # "photoAsset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    :cond_2a
    :goto_2a
    return-void

    .line 99
    .restart local v3    # "photoAsset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    :cond_2b
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->markSelected(Z)V

    .line 100
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->addSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V

    goto :goto_2a
.end method

.method protected isAssetSelected(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z
    .registers 3
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 152
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    instance-of v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    if-eqz v0, :cond_f

    .line 153
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->containsAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Z

    move-result v0

    .line 154
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method protected loadAssetRendition(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)Z
    .registers 13
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .param p2, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .param p3, "dimensions"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
            "<[B",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 110
    .local p4, "renditionRequestCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$1;

    invoke-direct {v4, p0, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 129
    .local v4, "photoRenditonCallBack":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobePhotoException;>;"
    iget-object v2, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    .line 130
    .local v2, "originalAsset":Ljava/lang/Object;
    instance-of v6, v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    if-eqz v6, :cond_19

    move-object v1, v2

    .line 132
    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    .line 133
    .local v1, "collection":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;->THUMBNAIL_SIZED_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotosBaseListViewController;->adjustRenditionSizeBasedOnDeviceScale(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    move-result-object v0

    .line 134
    .local v0, "adjustedThumbnailSize":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    invoke-static {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoCollectionsDataSource;->getRenditionForCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 147
    .end local v0    # "adjustedThumbnailSize":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .end local v1    # "collection":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    :cond_17
    :goto_17
    const/4 v6, 0x1

    return v6

    .line 137
    :cond_19
    instance-of v6, v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    if-eqz v6, :cond_17

    move-object v3, v2

    .line 139
    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .line 140
    .local v3, "photoAsset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getRenditions()Ljava/util/Map;

    move-result-object v6

    const-string v7, "thumbnail2x"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    .line 141
    .local v5, "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    if-eqz v5, :cond_32

    .line 142
    invoke-virtual {v3, v5, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    goto :goto_17

    .line 145
    :cond_32
    const/4 v6, 0x0

    invoke-interface {p4, v6}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_17
.end method
