.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;
.source "AdobeDesignLibraryItemsCellHolders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageCollectionCellHolder"
.end annotation


# instance fields
.field private _dynamicImageView:Lcom/etsy/android/grid/util/DynamicHeightImageView;

.field private _titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 6
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 117
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;-><init>(Landroid/view/View;)V

    .line 118
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_library_items_imagecolletion_title:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->_titleView:Landroid/widget/TextView;

    .line 119
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_library_items_imagecollection_image:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/etsy/android/grid/util/DynamicHeightImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->_dynamicImageView:Lcom/etsy/android/grid/util/DynamicHeightImageView;

    .line 120
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->_dynamicImageView:Lcom/etsy/android/grid/util/DynamicHeightImageView;

    const-wide/high16 v2, 0x3ff0000000000000L

    invoke-virtual {v0, v2, v3}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setHeightRatio(D)V

    .line 121
    return-void
.end method


# virtual methods
.method public displayThumbnail(Landroid/graphics/Bitmap;D)V
    .registers 5
    .param p1, "thumbnail"    # Landroid/graphics/Bitmap;
    .param p2, "alpha"    # D

    .prologue
    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->_dynamicImageView:Lcom/etsy/android/grid/util/DynamicHeightImageView;

    invoke-virtual {v0, p1}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 125
    return-void
.end method

.method public setDisabled(Z)V
    .registers 6
    .param p1, "disable"    # Z

    .prologue
    const/high16 v2, 0x3f800000

    const v1, 0x3e99999a

    .line 139
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->_dynamicImageView:Lcom/etsy/android/grid/util/DynamicHeightImageView;

    if-eqz p1, :cond_15

    move v0, v1

    :goto_a
    invoke-virtual {v3, v0}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setAlpha(F)V

    .line 140
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->_titleView:Landroid/widget/TextView;

    if-eqz p1, :cond_17

    :goto_11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 141
    return-void

    :cond_15
    move v0, v2

    .line 139
    goto :goto_a

    :cond_17
    move v1, v2

    .line 140
    goto :goto_11
.end method

.method public setImageHeightRatio(D)V
    .registers 4
    .param p1, "ratio"    # D

    .prologue
    .line 128
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->_dynamicImageView:Lcom/etsy/android/grid/util/DynamicHeightImageView;

    invoke-virtual {v0, p1, p2}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setHeightRatio(D)V

    .line 129
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->_titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    return-void
.end method
