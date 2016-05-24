.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
.source "AdobeAssetViewSectionalListFolderViewCell.java"


# instance fields
.field private _isSharedFolder:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->_isSharedFolder:Z

    return-void
.end method


# virtual methods
.method protected handleOnFinishInflate()V
    .registers 2

    .prologue
    .line 22
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_foldercell_title:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->_titleView:Landroid/widget/TextView;

    .line 23
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_foldercell_image:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->_imageViewAssetPicture:Landroid/widget/ImageView;

    .line 24
    return-void
.end method

.method public prepareForReuse()V
    .registers 3

    .prologue
    .line 37
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->prepareForReuse()V

    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->_imageViewAssetPicture:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 39
    return-void
.end method

.method protected providesSelection()Z
    .registers 2

    .prologue
    .line 43
    const/4 v0, 0x0

    return v0
.end method

.method public setSharedFolder(Z)V
    .registers 4
    .param p1, "isSharedFolder"    # Z

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->_isSharedFolder:Z

    if-eq v0, p1, :cond_8

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->_imageViewAssetPicture:Landroid/widget/ImageView;

    if-nez v0, :cond_9

    .line 33
    :cond_8
    :goto_8
    return-void

    .line 30
    :cond_9
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->_isSharedFolder:Z

    .line 31
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListFolderViewCell;->_imageViewAssetPicture:Landroid/widget/ImageView;

    if-eqz p1, :cond_15

    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->collection_folder_shared:I

    :goto_11
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_8

    :cond_15
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->collection_folder:I

    goto :goto_11
.end method
