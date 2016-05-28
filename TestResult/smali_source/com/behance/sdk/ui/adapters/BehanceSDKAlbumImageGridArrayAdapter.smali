.class public Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;
.super Landroid/widget/ArrayAdapter;
.source "BehanceSDKAlbumImageGridArrayAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/behance/sdk/project/modules/ImageModule;",
        ">;"
    }
.end annotation


# instance fields
.field private imageHeight:I

.field private layoutInflater:Landroid/view/LayoutInflater;

.field private selectedImageModulesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;"
        }
    .end annotation
.end field

.field private selectionIndicatorHeight:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p2, "objects":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    sget v0, Lcom/behance/sdk/R$layout;->bsdk_adapter_album_image_view_grid_item:I

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 49
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    .line 50
    invoke-direct {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->computeImageHeight()I

    move-result v0

    iput v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->imageHeight:I

    .line 51
    invoke-direct {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->computeSelectionIndicatorHeight()I

    move-result v0

    iput v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->selectionIndicatorHeight:I

    .line 52
    return-void
.end method

.method private computeImageHeight()I
    .registers 11

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 114
    .local v7, "resources":Landroid/content/res/Resources;
    sget v8, Lcom/behance/sdk/R$dimen;->bsdk_image_selector_view_album_image_grid_left_right_padding:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 115
    .local v4, "gridLeftRightPadding":I
    sget v8, Lcom/behance/sdk/R$dimen;->bsdk_image_selector_view_album_image_grid_item_margin:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 116
    .local v6, "itemMargin":I
    sget v8, Lcom/behance/sdk/R$integer;->bsdk_image_selection_fragment_grid_col_count:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    .line 117
    .local v0, "columnCount":I
    sget v8, Lcom/behance/sdk/R$dimen;->bsdk_image_selector_view_adapter_bg_stroke_width:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 118
    .local v3, "gridItemStrokeWidth":I
    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 119
    .local v2, "displayMetrics":Landroid/util/DisplayMetrics;
    iget v1, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 120
    .local v1, "deviceWidth":I
    mul-int/lit8 v8, v4, 0x2

    sub-int v8, v1, v8

    add-int/lit8 v9, v0, -0x1

    mul-int/2addr v9, v6

    sub-int/2addr v8, v9

    div-int v5, v8, v0

    .line 122
    .local v5, "imageHeight":I
    mul-int/lit8 v8, v3, 0x2

    sub-int/2addr v5, v8

    .line 123
    return v5
.end method

.method private computeSelectionIndicatorHeight()I
    .registers 5

    .prologue
    .line 127
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 128
    .local v1, "resources":Landroid/content/res/Resources;
    sget v2, Lcom/behance/sdk/R$dimen;->bsdk_image_selector_view_adapter_bg_stroke_width:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 129
    .local v0, "gridItemStrokeWidth":I
    iget v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->imageHeight:I

    mul-int/lit8 v3, v0, 0x2

    add-int/2addr v2, v3

    return v2
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 15
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v10, 0x0

    const/4 v9, -0x1

    .line 56
    const/4 v6, 0x0

    .line 57
    .local v6, "viewReused":Z
    const/4 v4, 0x0

    .line 58
    .local v4, "rootView":Landroid/view/View;
    if-nez p2, :cond_60

    .line 59
    iget-object v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    sget v8, Lcom/behance/sdk/R$layout;->bsdk_adapter_album_image_view_grid_item:I

    invoke-virtual {v7, v8, p3, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 60
    const/4 v6, 0x0

    .line 66
    :goto_f
    sget v7, Lcom/behance/sdk/R$id;->bsdkAlbumImageAdapterThumbnailImageView:I

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 67
    .local v5, "thumbnailImageView":Landroid/widget/ImageView;
    sget v7, Lcom/behance/sdk/R$id;->bsdkAlbumImageAdapterSelectionIndicator:I

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 69
    .local v1, "imageSelectedIndicatorView":Landroid/view/View;
    if-eqz v6, :cond_23

    .line 70
    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 74
    :cond_23
    invoke-virtual {v5}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 75
    .local v3, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v3, :cond_63

    .line 76
    iget v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->imageHeight:I

    iput v7, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 81
    :goto_2d
    invoke-virtual {v5, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 85
    .local v2, "indicatorLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v2, :cond_6b

    .line 86
    iget v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->selectionIndicatorHeight:I

    iput v7, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 91
    :goto_3a
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    .line 94
    .local v0, "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    if-eqz v0, :cond_5f

    .line 95
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/behance/sdk/project/modules/ImageModule;->getThumbNail(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 97
    iget-object v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->selectedImageModulesList:Ljava/util/List;

    if-eqz v7, :cond_73

    iget-object v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->selectedImageModulesList:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_73

    .line 98
    invoke-virtual {v1, v10}, Landroid/view/View;->setVisibility(I)V

    .line 103
    :cond_5f
    :goto_5f
    return-object v4

    .line 62
    .end local v0    # "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    .end local v1    # "imageSelectedIndicatorView":Landroid/view/View;
    .end local v2    # "indicatorLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v3    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v5    # "thumbnailImageView":Landroid/widget/ImageView;
    :cond_60
    move-object v4, p2

    .line 63
    const/4 v6, 0x1

    goto :goto_f

    .line 79
    .restart local v1    # "imageSelectedIndicatorView":Landroid/view/View;
    .restart local v3    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .restart local v5    # "thumbnailImageView":Landroid/widget/ImageView;
    :cond_63
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    .end local v3    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    iget v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->imageHeight:I

    invoke-direct {v3, v9, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v3    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    goto :goto_2d

    .line 89
    .restart local v2    # "indicatorLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_6b
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    .end local v2    # "indicatorLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    iget v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->selectionIndicatorHeight:I

    invoke-direct {v2, v9, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v2    # "indicatorLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    goto :goto_3a

    .line 100
    .restart local v0    # "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_73
    const/4 v7, 0x4

    invoke-virtual {v1, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5f
.end method

.method public setSelectedImageModulesList(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 107
    .local p1, "values":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->selectedImageModulesList:Ljava/util/List;

    .line 108
    return-void
.end method
