.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AdobeAssetsViewCompositionsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CompositionCellViewHolder"
.end annotation


# instance fields
.field _countView:Landroid/widget/TextView;

.field _mainThumbnailImage:Landroid/widget/ImageView;

.field _packagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

.field _titleView:Landroid/widget/TextView;

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;Landroid/view/View;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;

    .line 118
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 119
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->composition_cell_mainImage:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    .line 120
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->compositio_cell_main_title:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->_titleView:Landroid/widget/TextView;

    .line 121
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->composition_cell_count_text:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->_countView:Landroid/widget/TextView;

    .line 122
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;JLandroid/graphics/drawable/BitmapDrawable;)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;
    .param p1, "x1"    # J
    .param p3, "x2"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 108
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->setImageAtIndex(JLandroid/graphics/drawable/BitmapDrawable;)V

    return-void
.end method

.method private setImageAtIndex(JLandroid/graphics/drawable/BitmapDrawable;)V
    .registers 7
    .param p1, "index"    # J
    .param p3, "image"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 125
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_11

    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 128
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 130
    :cond_11
    return-void
.end method


# virtual methods
.method public getPages()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->_packagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    return-object v0
.end method

.method public setEmptyCell()V
    .registers 3

    .prologue
    .line 141
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 142
    return-void
.end method

.method public setItemsCount(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V
    .registers 7
    .param p1, "pages"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 160
    const/4 v0, 0x0

    .line 161
    .local v0, "text":Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePSMix:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v1, v2, :cond_23

    .line 162
    const-string v1, "%s"

    new-array v2, v3, [Ljava/lang/Object;

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_psmix_collection_singular:I

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 165
    :cond_1d
    :goto_1d
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->_countView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    return-void

    .line 163
    :cond_23
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceCompositions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne v1, v2, :cond_1d

    .line 164
    const-string v1, "%s"

    new-array v2, v3, [Ljava/lang/Object;

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_composition_collection_singular:I

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1d
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->_titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    return-void
.end method

.method public setPages(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V
    .registers 2
    .param p1, "pages"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .prologue
    .line 155
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->_packagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 156
    return-void
.end method
