.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AdobeAssetsViewDesignLibraryCollectionListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CollectionCellViewHolder"
.end annotation


# instance fields
.field _colorView:Landroid/widget/RelativeLayout;

.field _colortThemeContainer:Landroid/widget/LinearLayout;

.field _countView:Landroid/widget/TextView;

.field _imageView:Landroid/widget/ImageView;

.field _libraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

.field _titleView:Landroid/widget/TextView;

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;Landroid/view/View;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 162
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    .line 163
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 164
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_collection_cell_colortheme:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colortThemeContainer:Landroid/widget/LinearLayout;

    .line 165
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_collection_cell_color:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colorView:Landroid/widget/RelativeLayout;

    .line 166
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_collection_cell_image:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_imageView:Landroid/widget/ImageView;

    .line 167
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_collection_cell_main_title:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_titleView:Landroid/widget/TextView;

    .line 168
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_collection_cell_count_text:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_countView:Landroid/widget/TextView;

    .line 169
    return-void
.end method

.method private setViewVisible(Landroid/view/View;)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 172
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colortThemeContainer:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colortThemeContainer:Landroid/widget/LinearLayout;

    if-ne p1, v1, :cond_24

    move v1, v2

    :goto_a
    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 173
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colorView:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colorView:Landroid/widget/RelativeLayout;

    if-ne p1, v1, :cond_26

    move v1, v2

    :goto_14
    invoke-virtual {v4, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 174
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_imageView:Landroid/widget/ImageView;

    if-ne p1, v1, :cond_28

    const/4 v0, 0x1

    .line 175
    .local v0, "visible":Z
    :goto_1c
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_imageView:Landroid/widget/ImageView;

    if-eqz v0, :cond_2a

    :goto_20
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 177
    return-void

    .end local v0    # "visible":Z
    :cond_24
    move v1, v3

    .line 172
    goto :goto_a

    :cond_26
    move v1, v3

    .line 173
    goto :goto_14

    :cond_28
    move v0, v2

    .line 174
    goto :goto_1c

    .restart local v0    # "visible":Z
    :cond_2a
    move v2, v3

    .line 175
    goto :goto_20
.end method


# virtual methods
.method public getLibrary()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_libraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    return-object v0
.end method

.method public setColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 179
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colorView:Landroid/widget/RelativeLayout;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setViewVisible(Landroid/view/View;)V

    .line 180
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colorView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 182
    return-void
.end method

.method public setColorTheme(Ljava/util/ArrayList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "colorTheme":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colortThemeContainer:Landroid/widget/LinearLayout;

    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setViewVisible(Landroid/view/View;)V

    .line 185
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colortThemeContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 186
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    if-ge v2, v1, :cond_2c

    .line 187
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_colortThemeContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 188
    .local v0, "childview":Landroid/view/View;
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 186
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 190
    .end local v0    # "childview":Landroid/view/View;
    :cond_2c
    return-void
.end method

.method public setEmptyCell()V
    .registers 3

    .prologue
    .line 197
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_imageView:Landroid/widget/ImageView;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setViewVisible(Landroid/view/View;)V

    .line 198
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_imageView:Landroid/widget/ImageView;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 199
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_imageView:Landroid/widget/ImageView;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->asset_browser_empty_state_files:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 200
    return-void
.end method

.method public setImage(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 192
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_imageView:Landroid/widget/ImageView;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setViewVisible(Landroid/view/View;)V

    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_imageView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 194
    return-void
.end method

.method public setItemsCount(I)V
    .registers 7
    .param p1, "count"    # I

    .prologue
    const/4 v3, 0x1

    .line 207
    const/4 v0, 0x0

    .line 208
    .local v0, "text":Ljava/lang/String;
    if-eq p1, v3, :cond_23

    .line 209
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;)Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_design_library_collection_count:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 213
    :goto_1d
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_countView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    return-void

    .line 211
    :cond_23
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;)Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_design_library_collection_count_single:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1d
.end method

.method public setLibrary(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 2
    .param p1, "libraryItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 217
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_libraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .line 218
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 203
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->_titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    return-void
.end method
