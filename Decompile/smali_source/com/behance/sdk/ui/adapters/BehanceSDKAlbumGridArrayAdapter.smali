.class public Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;
.super Landroid/widget/ArrayAdapter;
.source "BehanceSDKAlbumGridArrayAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
        ">;"
    }
.end annotation


# instance fields
.field private albumCoverImageHeight:I

.field private albumNameContainerHeight:I

.field private layoutInflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p2, "objects":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;>;"
    sget v0, Lcom/behance/sdk/R$layout;->bsdk_adapter_album_grid_item:I

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 51
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    .line 52
    invoke-direct {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->computeAlbumCoverImageHeight()I

    move-result v0

    iput v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->albumCoverImageHeight:I

    .line 53
    iget v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->albumCoverImageHeight:I

    int-to-double v0, v0

    const-wide/high16 v2, 0x3fd0000000000000L

    mul-double/2addr v0, v2

    double-to-int v0, v0

    iput v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->albumNameContainerHeight:I

    .line 54
    return-void
.end method

.method private computeAlbumCoverImageHeight()I
    .registers 11

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 126
    .local v7, "resources":Landroid/content/res/Resources;
    sget v8, Lcom/behance/sdk/R$dimen;->bsdk_image_selector_view_album_grid_left_right_padding:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 127
    .local v5, "gridLeftRightPadding":I
    sget v8, Lcom/behance/sdk/R$dimen;->bsdk_image_selector_view_album_grid_item_margin:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 128
    .local v6, "itemMargin":I
    sget v8, Lcom/behance/sdk/R$integer;->bsdk_album_selector_fragment_grid_col_count:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    .line 129
    .local v1, "columnCount":I
    sget v8, Lcom/behance/sdk/R$dimen;->bsdk_image_selector_view_adapter_bg_stroke_width:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 130
    .local v4, "gridItemStrokeWidth":I
    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 131
    .local v3, "displayMetrics":Landroid/util/DisplayMetrics;
    iget v2, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 132
    .local v2, "deviceWidth":I
    mul-int/lit8 v8, v5, 0x2

    sub-int v8, v2, v8

    add-int/lit8 v9, v1, -0x1

    mul-int/2addr v9, v6

    sub-int/2addr v8, v9

    div-int v0, v8, v1

    .line 134
    .local v0, "albumCoverImageHeight":I
    mul-int/lit8 v8, v4, 0x2

    sub-int/2addr v0, v8

    .line 135
    return v0
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 18
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 59
    const/4 v9, 0x0

    .line 60
    .local v9, "rootView":Landroid/view/View;
    const/4 v10, 0x0

    .line 61
    .local v10, "viewReused":Z
    if-nez p2, :cond_6c

    .line 62
    iget-object v11, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    sget v12, Lcom/behance/sdk/R$layout;->bsdk_adapter_album_grid_item:I

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v11, v12, v0, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v9

    .line 63
    const/4 v10, 0x0

    .line 69
    :goto_10
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;

    .line 70
    .local v2, "albumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    sget v11, Lcom/behance/sdk/R$id;->bsdkAlbumGridAdapterCoverImageView:I

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 71
    .local v1, "albumCoverImageView":Landroid/widget/ImageView;
    sget v11, Lcom/behance/sdk/R$id;->bsdkAlbumGridAdapterAlbumNameTxtView:I

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 72
    .local v3, "albumNameTxtView":Landroid/widget/TextView;
    if-eqz v10, :cond_2c

    .line 74
    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 77
    :cond_2c
    iget v6, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->albumCoverImageHeight:I

    .line 78
    .local v6, "finalCoverImageHeight":I
    iget v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->albumNameContainerHeight:I

    .line 80
    .local v7, "finalNameContainerHeight":I
    if-eqz v2, :cond_55

    .line 81
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;->getContext()Landroid/content/Context;

    move-result-object v5

    .line 82
    .local v5, "context":Landroid/content/Context;
    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getAlbumType()Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    move-result-object v11

    sget-object v12, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->DEVICE_ALBUM:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    if-ne v11, v12, :cond_70

    .line 83
    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 84
    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getCoverBitmap(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v11

    invoke-virtual {v1, v11}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 85
    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 101
    .end local v5    # "context":Landroid/content/Context;
    :cond_55
    :goto_55
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    .line 102
    .local v8, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v8, :cond_a2

    .line 103
    iput v6, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 108
    :goto_5d
    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 111
    invoke-virtual {v3}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .line 112
    .local v4, "albumNameTxtViewLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v4, :cond_a9

    .line 113
    iput v7, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 118
    :goto_68
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    return-object v9

    .line 65
    .end local v1    # "albumCoverImageView":Landroid/widget/ImageView;
    .end local v2    # "albumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    .end local v3    # "albumNameTxtView":Landroid/widget/TextView;
    .end local v4    # "albumNameTxtViewLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v6    # "finalCoverImageHeight":I
    .end local v7    # "finalNameContainerHeight":I
    .end local v8    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_6c
    move-object/from16 v9, p2

    .line 66
    const/4 v10, 0x1

    goto :goto_10

    .line 87
    .restart local v1    # "albumCoverImageView":Landroid/widget/ImageView;
    .restart local v2    # "albumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    .restart local v3    # "albumNameTxtView":Landroid/widget/TextView;
    .restart local v5    # "context":Landroid/content/Context;
    .restart local v6    # "finalCoverImageHeight":I
    .restart local v7    # "finalNameContainerHeight":I
    :cond_70
    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getAlbumType()Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    move-result-object v11

    sget-object v12, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->CAMERA:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    if-ne v11, v12, :cond_89

    .line 88
    add-int/2addr v6, v7

    .line 89
    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 90
    sget v11, Lcom/behance/sdk/R$drawable;->bsdk_icon_adapter_album_camera_type_indicator:I

    invoke-virtual {v1, v11}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 91
    const/16 v11, 0x8

    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_55

    .line 92
    :cond_89
    invoke-virtual {v2}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getAlbumType()Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    move-result-object v11

    sget-object v12, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->CREATIVE_CLOUD:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    if-ne v11, v12, :cond_55

    .line 93
    add-int/2addr v6, v7

    .line 94
    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 95
    sget v11, Lcom/behance/sdk/R$drawable;->bsdk_icon_adapter_album_cloud_type_indicator:I

    invoke-virtual {v1, v11}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 96
    const/16 v11, 0x8

    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_55

    .line 106
    .end local v5    # "context":Landroid/content/Context;
    .restart local v8    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_a2
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    .end local v8    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    const/4 v11, -0x1

    invoke-direct {v8, v11, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v8    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    goto :goto_5d

    .line 116
    .restart local v4    # "albumNameTxtViewLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_a9
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    .end local v4    # "albumNameTxtViewLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    const/4 v11, -0x1

    invoke-direct {v4, v11, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .restart local v4    # "albumNameTxtViewLayoutParams":Landroid/view/ViewGroup$LayoutParams;
    goto :goto_68
.end method
