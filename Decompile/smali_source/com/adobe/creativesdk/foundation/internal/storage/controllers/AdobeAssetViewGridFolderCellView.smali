.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
.source "AdobeAssetViewGridFolderCellView.java"


# instance fields
.field _isSharedFolder:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->_isSharedFolder:Z

    return-void
.end method


# virtual methods
.method protected handleOnFinishInflate()V
    .registers 2

    .prologue
    .line 19
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_foldercell_title:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->_titleView:Landroid/widget/TextView;

    .line 20
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_foldercell_image:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    .line 21
    return-void
.end method

.method public prepareForReuse()V
    .registers 3

    .prologue
    .line 39
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->prepareForReuse()V

    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 41
    return-void
.end method

.method protected providesSelection()Z
    .registers 2

    .prologue
    .line 34
    const/4 v0, 0x0

    return v0
.end method

.method public setSharedFolder(Z)V
    .registers 4
    .param p1, "isSharedFolder"    # Z

    .prologue
    .line 25
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->_isSharedFolder:Z

    if-eq v0, p1, :cond_8

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    if-nez v0, :cond_9

    .line 30
    :cond_8
    :goto_8
    return-void

    .line 27
    :cond_9
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->_isSharedFolder:Z

    .line 28
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    if-eqz p1, :cond_15

    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->collection_folder_shared:I

    :goto_11
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_8

    :cond_15
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->collection_folder:I

    goto :goto_11
.end method
