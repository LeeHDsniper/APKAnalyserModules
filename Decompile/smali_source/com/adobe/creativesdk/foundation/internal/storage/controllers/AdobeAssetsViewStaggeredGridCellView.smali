.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
.source "AdobeAssetsViewStaggeredGridCellView.java"


# instance fields
.field private _forcedAspectRatio:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_forcedAspectRatio:F

    return-void
.end method


# virtual methods
.method protected SetThumbnailOnAssetCell(Landroid/graphics/Bitmap;)V
    .registers 12
    .param p1, "thumbnail"    # Landroid/graphics/Bitmap;

    .prologue
    .line 44
    if-eqz p1, :cond_39

    iget v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_forcedAspectRatio:F

    const/4 v6, 0x0

    cmpl-float v5, v5, v6

    if-nez v5, :cond_39

    .line 45
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    .line 46
    .local v4, "width":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 47
    .local v1, "height":I
    int-to-float v5, v1

    int-to-float v6, v4

    div-float v0, v5, v6

    .line 48
    .local v0, "aspectRatio":F
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    check-cast v5, Lcom/etsy/android/grid/util/DynamicHeightImageView;

    invoke-virtual {v5}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->getHeightRatio()D

    move-result-wide v2

    .line 49
    .local v2, "existingratio":D
    float-to-double v6, v0

    sub-double v6, v2, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    const-wide v8, 0x3f847ae147ae147bL

    cmpl-double v5, v6, v8

    if-lez v5, :cond_35

    .line 51
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    check-cast v5, Lcom/etsy/android/grid/util/DynamicHeightImageView;

    float-to-double v6, v0

    invoke-virtual {v5, v6, v7}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setHeightRatio(D)V

    .line 57
    .end local v0    # "aspectRatio":F
    .end local v1    # "height":I
    .end local v2    # "existingratio":D
    .end local v4    # "width":I
    :cond_35
    :goto_35
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->SetThumbnailOnAssetCell(Landroid/graphics/Bitmap;)V

    .line 58
    return-void

    .line 55
    :cond_39
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    check-cast v5, Lcom/etsy/android/grid/util/DynamicHeightImageView;

    const-wide/high16 v6, 0x3ff0000000000000L

    invoke-virtual {v5, v6, v7}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setHeightRatio(D)V

    goto :goto_35
.end method

.method protected changeSelectionOverlay()V
    .registers 1

    .prologue
    .line 37
    return-void
.end method

.method public forceAspectRatio(F)V
    .registers 3
    .param p1, "aspectRatio"    # F

    .prologue
    .line 21
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_forcedAspectRatio:F

    .line 22
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_forcedAspectRatio:F

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->setAssetImageAspectRatioHint(F)V

    .line 23
    return-void
.end method

.method public forceHideBottomTitleBar()V
    .registers 3

    .prologue
    .line 26
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_assetcell_bottom_title_section:I

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 27
    .local v0, "bottomTitleSection":Landroid/view/View;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    return-void
.end method

.method protected handlePostInflate()V
    .registers 5

    .prologue
    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    if-eqz v0, :cond_e

    .line 76
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    check-cast v0, Lcom/etsy/android/grid/util/DynamicHeightImageView;

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_aspectRatioHint:F

    float-to-double v2, v1

    invoke-virtual {v0, v2, v3}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setHeightRatio(D)V

    .line 78
    :cond_e
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->handlePostInflate()V

    .line 79
    return-void
.end method

.method public setAssetImageAspectRatioHint(F)V
    .registers 6
    .param p1, "aspectRatio"    # F

    .prologue
    .line 62
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_aspectRatioHint:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_7

    .line 70
    :goto_6
    return-void

    .line 65
    :cond_7
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_forcedAspectRatio:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_10

    .line 66
    iget p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_forcedAspectRatio:F

    .line 68
    :cond_10
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->setAssetImageAspectRatioHint(F)V

    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    check-cast v0, Lcom/etsy/android/grid/util/DynamicHeightImageView;

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewStaggeredGridCellView;->_aspectRatioHint:F

    float-to-double v2, v1

    invoke-virtual {v0, v2, v3}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setHeightRatio(D)V

    goto :goto_6
.end method
