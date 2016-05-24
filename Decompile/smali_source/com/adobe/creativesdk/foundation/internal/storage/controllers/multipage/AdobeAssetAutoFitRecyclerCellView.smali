.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;
.super Ljava/lang/Object;
.source "AdobeAssetAutoFitRecyclerCellView.java"


# instance fields
.field protected _cellPos:I

.field protected _displayMetrics:Landroid/util/DisplayMetrics;

.field protected _imageView:Landroid/view/View;

.field protected _mainRootView:Landroid/view/View;

.field protected _oneUpViewContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public displayThumbnail(Landroid/graphics/Bitmap;I)V
    .registers 9
    .param p1, "bmp"    # Landroid/graphics/Bitmap;
    .param p2, "pos"    # I

    .prologue
    const/16 v5, 0xd

    const/4 v4, -0x1

    const/4 v3, -0x2

    .line 107
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_cellPos:I

    if-ne v1, p2, :cond_37

    .line 108
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_displayMetrics:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    if-lt v1, v2, :cond_1c

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_displayMetrics:Landroid/util/DisplayMetrics;

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v1, v2, :cond_38

    .line 109
    :cond_1c
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 111
    .local v0, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 112
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 120
    :goto_29
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 121
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    const/high16 v2, 0x3f800000

    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 126
    .end local v0    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_37
    return-void

    .line 115
    :cond_38
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 117
    .restart local v0    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 118
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_29
.end method

.method public displayThumbnail(Landroid/graphics/drawable/BitmapDrawable;I)V
    .registers 9
    .param p1, "bmp"    # Landroid/graphics/drawable/BitmapDrawable;
    .param p2, "pos"    # I

    .prologue
    const/4 v5, -0x1

    const/4 v4, -0x2

    .line 84
    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_cellPos:I

    if-ne v3, p2, :cond_38

    .line 85
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicWidth()I

    move-result v2

    .line 86
    .local v2, "width":I
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getIntrinsicHeight()I

    move-result v0

    .line 87
    .local v0, "height":I
    const/4 v1, 0x0

    .line 88
    .local v1, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_displayMetrics:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    if-lt v2, v3, :cond_1b

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_displayMetrics:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v0, v3, :cond_39

    .line 89
    :cond_1b
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .end local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-direct {v1, v5, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 95
    .restart local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_20
    const/16 v3, 0xd

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 96
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    check-cast v3, Landroid/widget/ImageView;

    invoke-virtual {v3, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 99
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    const/high16 v4, 0x3f800000

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 102
    .end local v0    # "height":I
    .end local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v2    # "width":I
    :cond_38
    return-void

    .line 92
    .restart local v0    # "height":I
    .restart local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v2    # "width":I
    :cond_39
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .end local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-direct {v1, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    goto :goto_20
.end method

.method public findViewById(I)Landroid/view/View;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_mainRootView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getRootView()Landroid/view/View;
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_mainRootView:Landroid/view/View;

    return-object v0
.end method

.method public performInitialization(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_image_view:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    .line 60
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_1a

    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 70
    :goto_17
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_oneUpViewContext:Landroid/content/Context;

    .line 74
    return-void

    .line 66
    :cond_1a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_17
.end method

.method protected prepareForReuse()V
    .registers 3

    .prologue
    .line 78
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_imageView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 80
    return-void
.end method

.method public setCellPos(I)V
    .registers 2
    .param p1, "pos"    # I

    .prologue
    .line 26
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_cellPos:I

    .line 27
    return-void
.end method

.method public setDisplayMetrics(Landroid/util/DisplayMetrics;)V
    .registers 2
    .param p1, "displayMetrics"    # Landroid/util/DisplayMetrics;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_displayMetrics:Landroid/util/DisplayMetrics;

    .line 47
    return-void
.end method

.method public setMainRootView(Landroid/view/View;)V
    .registers 2
    .param p1, "rootView"    # Landroid/view/View;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetAutoFitRecyclerCellView;->_mainRootView:Landroid/view/View;

    .line 39
    return-void
.end method
