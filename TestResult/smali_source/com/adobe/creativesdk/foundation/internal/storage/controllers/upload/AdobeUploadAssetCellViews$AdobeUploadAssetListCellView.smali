.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;
.source "AdobeUploadAssetCellViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdobeUploadAssetListCellView"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;-><init>()V

    return-void
.end method


# virtual methods
.method protected getProgressBarContainer()Landroid/widget/RelativeLayout;
    .registers 3

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->getRootView()Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_assetcell_root:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method protected handleOnFinishInflate()V
    .registers 8

    .prologue
    .line 54
    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_assetcell_title:I

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->_titleView:Landroid/widget/TextView;

    .line 55
    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_assetcell_imageView:I

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    .line 56
    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_assetcell_selectbtn:I

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageButton;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->_selectBtn:Landroid/view/View;

    .line 58
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->getRootView()Landroid/view/View;

    move-result-object v5

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetlist_assetcell_container:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 59
    .local v0, "assetCellContainer":Landroid/widget/LinearLayout;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    .line 60
    .local v1, "assetCellView":Landroid/widget/ImageView;
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 62
    new-instance v2, Lcom/etsy/android/grid/util/DynamicHeightImageView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->getRootView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/etsy/android/grid/util/DynamicHeightImageView;-><init>(Landroid/content/Context;)V

    .line 63
    .local v2, "dynamicHeightImageView":Lcom/etsy/android/grid/util/DynamicHeightImageView;
    sget-object v5, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v5}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 65
    const/16 v5, 0x2c

    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->convertDpToPx(I)I

    move-result v3

    .line 66
    .local v3, "imageSize":I
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 67
    .local v4, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v2, v4}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    const/4 v5, 0x1

    invoke-virtual {v0, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 70
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    .line 71
    const/high16 v5, 0x3f800000

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->forceAspectRatio(F)V

    .line 73
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetListCellView;->createAttachProgressBarToView()V

    .line 74
    return-void
.end method
