.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AdobeAssetsViewMobileCreationsPackageCollectionListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PackageCollectionCellViewHolder"
.end annotation


# instance fields
.field _countView:Landroid/widget/TextView;

.field _fourthThumbnailImage:Landroid/widget/ImageView;

.field _mainThumbnailImage:Landroid/widget/ImageView;

.field _packagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

.field _secondThumbnailImage:Landroid/widget/ImageView;

.field _thirdThumbnailImage:Landroid/widget/ImageView;

.field _threeImagesLayout:Landroid/widget/LinearLayout;

.field _titleView:Landroid/widget/TextView;

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;Landroid/view/View;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 183
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;

    .line 184
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 185
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilecreation_package_mainImage:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    .line 186
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilecreation_package_secondImage:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_secondThumbnailImage:Landroid/widget/ImageView;

    .line 187
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilecreation_package_thirdImage:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_thirdThumbnailImage:Landroid/widget/ImageView;

    .line 189
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilecreation_package_FourthImage:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_fourthThumbnailImage:Landroid/widget/ImageView;

    .line 191
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilecreation_package_cell_main_title:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_titleView:Landroid/widget/TextView;

    .line 192
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilecreation_package_cell_count_text:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_countView:Landroid/widget/TextView;

    .line 193
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilecreation_package_threeImages:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_threeImagesLayout:Landroid/widget/LinearLayout;

    .line 195
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;JLandroid/graphics/drawable/BitmapDrawable;)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;
    .param p1, "x1"    # J
    .param p3, "x2"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 171
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->setImageAtIndex(JLandroid/graphics/drawable/BitmapDrawable;)V

    return-void
.end method

.method private setImageAtIndex(JLandroid/graphics/drawable/BitmapDrawable;)V
    .registers 7
    .param p1, "index"    # J
    .param p3, "image"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    const/4 v2, 0x0

    .line 198
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_12

    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 201
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 218
    :cond_11
    :goto_11
    return-void

    .line 203
    :cond_12
    const-wide/16 v0, 0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_23

    .line 205
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_secondThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 206
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_secondThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_11

    .line 208
    :cond_23
    const-wide/16 v0, 0x2

    cmp-long v0, p1, v0

    if-nez v0, :cond_34

    .line 210
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_thirdThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 211
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_thirdThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_11

    .line 213
    :cond_34
    const-wide/16 v0, 0x3

    cmp-long v0, p1, v0

    if-nez v0, :cond_11

    .line 215
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_fourthThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 216
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_fourthThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_11
.end method


# virtual methods
.method public getPages()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .registers 2

    .prologue
    .line 245
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_packagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    return-object v0
.end method

.method public setEmptyCell()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 254
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 255
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_secondThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 256
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_thirdThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 257
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_fourthThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 258
    return-void
.end method

.method public setItemsCount(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V
    .registers 10
    .param p1, "pages"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .prologue
    const/4 v5, 0x2

    const/4 v7, 0x1

    const/4 v3, 0x0

    .line 267
    const/4 v2, 0x0

    .line 268
    .local v2, "text":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v4

    if-nez v4, :cond_31

    move v1, v3

    .line 269
    .local v1, "count":I
    :goto_b
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;->getAssetDataSourceTypeFor(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    move-result-object v0

    .line 270
    .local v0, "_dataSourceType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    if-ne v1, v7, :cond_9a

    .line 272
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceDraw:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v0, v4, :cond_3a

    .line 273
    const-string v4, "%s %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_lineordrawcollection_singular:I

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 296
    :cond_2b
    :goto_2b
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_countView:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 297
    return-void

    .line 268
    .end local v0    # "_dataSourceType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .end local v1    # "count":I
    :cond_31
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    goto :goto_b

    .line 274
    .restart local v0    # "_dataSourceType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .restart local v1    # "count":I
    :cond_3a
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceSketches:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v0, v4, :cond_55

    .line 275
    const-string v4, "%s %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_sketchCollection_singular:I

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2b

    .line 276
    :cond_55
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLine:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v0, v4, :cond_70

    .line 277
    const-string v4, "%s %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_lineordrawcollection_singular:I

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2b

    .line 278
    :cond_70
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePSMix:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v0, v4, :cond_85

    .line 279
    const-string v4, "%s"

    new-array v5, v7, [Ljava/lang/Object;

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_psmix_collection_singular:I

    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2b

    .line 280
    :cond_85
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceCompositions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v0, v4, :cond_2b

    .line 281
    const-string v4, "%s"

    new-array v5, v7, [Ljava/lang/Object;

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_composition_collection_singular:I

    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2b

    .line 284
    :cond_9a
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceDraw:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v0, v4, :cond_b6

    .line 285
    const-string v4, "%s %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_lineordrawcollection_plural:I

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2b

    .line 286
    :cond_b6
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceSketches:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v0, v4, :cond_d2

    .line 287
    const-string v4, "%s %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_sketchCollection_plural:I

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2b

    .line 288
    :cond_d2
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLine:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v0, v4, :cond_ee

    .line 289
    const-string v4, "%s %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_lineordrawcollection_plural:I

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2b

    .line 290
    :cond_ee
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePSMix:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v0, v4, :cond_104

    .line 291
    const-string v4, "%s"

    new-array v5, v7, [Ljava/lang/Object;

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_psmix_collection_singular:I

    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2b

    .line 292
    :cond_104
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceCompositions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v0, v4, :cond_2b

    .line 293
    const-string v4, "%s"

    new-array v5, v7, [Ljava/lang/Object;

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_composition_collection_singular:I

    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2b
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 261
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    return-void
.end method

.method public setPages(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V
    .registers 2
    .param p1, "pages"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_packagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 251
    return-void
.end method
