.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;
.source "AdobeAssetGenericStaggeredCellView.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;-><init>()V

    return-void
.end method


# virtual methods
.method protected handleOnFinishInflate()V
    .registers 5

    .prologue
    .line 25
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_assetcell_title:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->_titleView:Landroid/widget/TextView;

    .line 26
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_assetcell_imageView:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    .line 27
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_assetcell_video_duration:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->_videoDuration:Landroid/widget/TextView;

    .line 28
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_assetcell_video_indicator:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->_videoIndicator:Landroid/widget/ImageView;

    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    check-cast v0, Lcom/etsy/android/grid/util/DynamicHeightImageView;

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->_aspectRatioHint:F

    float-to-double v2, v1

    invoke-virtual {v0, v2, v3}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setHeightRatio(D)V

    .line 30
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_assetcell_selectbtn:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->_selectBtn:Landroid/view/View;

    .line 33
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->_titleView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->hasTitleView()Z

    move-result v0

    if-eqz v0, :cond_49

    const/4 v0, 0x0

    :goto_45
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 37
    return-void

    .line 33
    :cond_49
    const/16 v0, 0x8

    goto :goto_45
.end method

.method protected hasTitleView()Z
    .registers 2

    .prologue
    .line 20
    const/4 v0, 0x1

    return v0
.end method

.method protected providesSelection()Z
    .registers 2

    .prologue
    .line 42
    const/4 v0, 0x1

    return v0
.end method
