.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AdobeAssetsViewMobileCreationPackageItemsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PackageItemCellViewHolder"
.end annotation


# instance fields
.field _mainThumbnailImage:Landroid/widget/ImageView;

.field _page:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter;Landroid/view/View;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter;
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter;

    .line 145
    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 146
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->mobilecreation_item_mainImage:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    .line 147
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;Landroid/graphics/drawable/BitmapDrawable;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;
    .param p1, "x1"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 139
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->setImage(Landroid/graphics/drawable/BitmapDrawable;)V

    return-void
.end method

.method private setImage(Landroid/graphics/drawable/BitmapDrawable;)V
    .registers 4
    .param p1, "image"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 155
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 156
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->_mainThumbnailImage:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 157
    return-void
.end method


# virtual methods
.method public getPage()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->_page:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    return-object v0
.end method

.method public setPage(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 2
    .param p1, "page"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 166
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->_page:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 167
    return-void
.end method
