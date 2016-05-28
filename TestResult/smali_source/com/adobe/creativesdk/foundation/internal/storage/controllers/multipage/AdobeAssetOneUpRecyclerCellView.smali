.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;
.source "AdobeAssetOneUpRecyclerCellView.java"


# instance fields
.field protected _cellPos:I

.field private handler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;

.field private height:I

.field private width:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 19
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;-><init>()V

    .line 23
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->height:I

    .line 24
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->width:I

    return-void
.end method

.method private setNoPreviewSize(II)V
    .registers 7
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/16 v3, 0xd

    const/4 v2, -0x1

    .line 45
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_displayMetrics:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    if-lt p1, v1, :cond_f

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_displayMetrics:Landroid/util/DisplayMetrics;

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge p2, v1, :cond_1d

    .line 47
    :cond_f
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 48
    .local v0, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 49
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_noPreviewView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    :goto_1c
    return-void

    .line 54
    .end local v0    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_1d
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 56
    .restart local v0    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 57
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_noPreviewView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1c
.end method


# virtual methods
.method public displayThumbnail(Landroid/graphics/Bitmap;I)V
    .registers 5
    .param p1, "bmp"    # Landroid/graphics/Bitmap;
    .param p2, "position"    # I

    .prologue
    .line 63
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_cellPos:I

    if-ne v0, p2, :cond_e

    .line 65
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;->displayThumbnail(Landroid/graphics/Bitmap;)V

    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_imageView:Landroid/view/View;

    const/high16 v1, 0x3f800000

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 70
    :cond_e
    return-void
.end method

.method public displayThumbnail(Landroid/graphics/drawable/BitmapDrawable;I)V
    .registers 7
    .param p1, "bmp"    # Landroid/graphics/drawable/BitmapDrawable;
    .param p2, "position"    # I

    .prologue
    const/4 v3, -0x1

    .line 102
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->width:I

    if-eq v2, v3, :cond_9

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->height:I

    if-ne v2, v3, :cond_29

    .line 103
    :cond_9
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    move-result v1

    .line 104
    .local v1, "width":I
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    move-result v0

    .line 105
    .local v0, "height":I
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->handler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;->getWidth()I

    move-result v2

    if-eq v2, v3, :cond_21

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->handler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;

    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;->getHeight()I

    move-result v2

    if-ne v2, v3, :cond_26

    .line 106
    :cond_21
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->handler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;

    invoke-interface {v2, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;->setMeasurements(II)V

    .line 107
    :cond_26
    invoke-direct {p0, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->setNoPreviewSize(II)V

    .line 109
    .end local v0    # "height":I
    .end local v1    # "width":I
    :cond_29
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_cellPos:I

    if-ne v2, p2, :cond_37

    .line 110
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;->displayThumbnail(Landroid/graphics/drawable/BitmapDrawable;)V

    .line 111
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_imageView:Landroid/view/View;

    const/high16 v3, 0x3f800000

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 115
    :cond_37
    return-void
.end method

.method protected handleNetworkOnline()V
    .registers 1

    .prologue
    .line 74
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;->handleNetworkOnline()V

    .line 75
    return-void
.end method

.method protected handleOffline(Z)V
    .registers 5
    .param p1, "offline"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v1, -0x1

    .line 86
    if-nez p1, :cond_34

    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_imageView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 88
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->width:I

    if-eq v0, v1, :cond_12

    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->height:I

    if-ne v0, v1, :cond_29

    .line 90
    :cond_12
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->handler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->width:I

    .line 91
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->handler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->height:I

    .line 92
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->width:I

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->height:I

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->setNoPreviewSize(II)V

    .line 94
    :cond_29
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_noPreviewView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_spinner:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 98
    :cond_34
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;->handleOffline(Z)V

    .line 99
    return-void
.end method

.method public performInitialization(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v1, 0x8

    .line 79
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;->performInitialization(Landroid/content/Context;)V

    .line 80
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_noInternetConnView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_noPreviewView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 82
    return-void
.end method

.method protected prepareForReuse()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 33
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_imageView:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 34
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_noPreviewView:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 35
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 37
    .local v0, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 38
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_imageView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_imageView:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 40
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_spinner:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 42
    return-void
.end method

.method public setCellPos(I)V
    .registers 2
    .param p1, "pos"    # I

    .prologue
    .line 28
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->_cellPos:I

    .line 29
    return-void
.end method

.method public setNoPreviewHandler(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;)V
    .registers 2
    .param p1, "handler"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->handler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/IAdobeNoPreviewSizeHandler;

    .line 120
    return-void
.end method
