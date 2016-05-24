.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
.source "AdobeAssetViewSectionalListViewAssetViewCell.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;-><init>()V

    return-void
.end method


# virtual methods
.method protected handleOnFinishInflate()V
    .registers 2

    .prologue
    .line 19
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_assetcell_title:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;->_titleView:Landroid/widget/TextView;

    .line 20
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_assetcell_imageView:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;->_imageViewAssetPicture:Landroid/widget/ImageView;

    .line 21
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_assetcell_selectbtn:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewSectionalListViewAssetViewCell;->_selectBtn:Landroid/view/View;

    .line 22
    return-void
.end method

.method protected providesSelection()Z
    .registers 2

    .prologue
    .line 26
    const/4 v0, 0x1

    return v0
.end method
