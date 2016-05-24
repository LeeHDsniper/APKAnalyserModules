.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetGridCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;
.source "AdobeUploadAssetCellViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdobeUploadAssetGridCellView"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;-><init>()V

    return-void
.end method


# virtual methods
.method protected addProgressBarChildRule(Landroid/widget/RelativeLayout$LayoutParams;)V
    .registers 4
    .param p1, "layoutParams"    # Landroid/widget/RelativeLayout$LayoutParams;

    .prologue
    .line 32
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-le v0, v1, :cond_a

    .line 33
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->addProgressBarChildRule(Landroid/widget/RelativeLayout$LayoutParams;)V

    .line 36
    :goto_9
    return-void

    .line 35
    :cond_a
    const/16 v0, 0x8

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_assetcell_selectbtn:I

    invoke-virtual {p1, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    goto :goto_9
.end method

.method protected getProgressBarContainer()Landroid/widget/RelativeLayout;
    .registers 3

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadAssetCellViews$AdobeUploadAssetGridCellView;->getRootView()Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->assetview_assetgrid_assetcell_imageContainer:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    return-object v0
.end method
