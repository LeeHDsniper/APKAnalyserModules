.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;
.source "AdobeAssetsViewCompositionsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CompositionsListViewAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;
    }
.end annotation


# instance fields
.field _assetPackagePagesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;Landroid/content/Context;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;

    .line 103
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;Landroid/content/Context;)V

    .line 104
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->mContext:Landroid/content/Context;

    .line 105
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    .line 106
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .registers 2

    .prologue
    .line 306
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->getPackagePagesCount()I

    move-result v0

    return v0
.end method

.method public getPackageAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 197
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->getPackagePagesList()Ljava/util/ArrayList;

    move-result-object v1

    .line 199
    .local v1, "assetPackagesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;>;"
    if-eqz v1, :cond_15

    if-ltz p1, :cond_15

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_15

    .line 200
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 203
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method protected getPackagePagesCount()I
    .registers 3

    .prologue
    .line 189
    const/4 v0, 0x0

    .line 190
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->getPackagePagesList()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_f

    .line 191
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->getPackagePagesList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 192
    :cond_f
    return v0
.end method

.method protected getPackagePagesList()Ljava/util/ArrayList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    if-nez v2, :cond_3f

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_assetDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    if-eqz v2, :cond_3f

    .line 175
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    .line 176
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_assetDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->assetsToDisplay()Ljava/util/ArrayList;

    move-result-object v2

    if-eqz v2, :cond_3f

    .line 177
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_assetDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->assetsToDisplay()Ljava/util/ArrayList;

    move-result-object v1

    .line 178
    .local v1, "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_27
    :goto_27
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 179
    .local v0, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    instance-of v3, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    if-eqz v3, :cond_27

    .line 180
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .end local v0    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_27

    .line 185
    .end local v1    # "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_3f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    return-object v2
.end method

.method public invalidateMobilePackageDataSources()V
    .registers 2

    .prologue
    .line 170
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    .line 171
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 19
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 231
    move-object/from16 v5, p1

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;

    .line 232
    .local v5, "packageCellViewHolder":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->getPackageAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    move-result-object v6

    .line 234
    .local v6, "assetPackagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->setName(Ljava/lang/String;)V

    .line 235
    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->setItemsCount(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V

    .line 236
    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->setPages(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V

    .line 238
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_29

    .line 239
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_2d

    .line 241
    :cond_29
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->setEmptyCell()V

    .line 302
    :cond_2c
    :goto_2c
    return-void

    .line 246
    :cond_2d
    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v7, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 249
    .local v7, "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    new-instance v10, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;

    invoke-direct {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;-><init>()V

    .line 250
    .local v10, "indexWrapper":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;
    const-wide/16 v12, 0x0

    iput-wide v12, v10, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    .line 252
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_43
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 254
    .local v4, "page":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_reusableImageWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getGUID()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getMd5Hash()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->loadImage(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v9

    .line 255
    .local v9, "bmp":Landroid/graphics/drawable/BitmapDrawable;
    if-nez v9, :cond_96

    .line 258
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;->THUMBNAIL_SIZED_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController;->adjustRenditionSizeBasedOnDeviceScale(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    move-result-object v8

    .line 259
    .local v8, "adjustedThumbnailSize":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;Ljava/util/ArrayList;)V

    .line 290
    .local v2, "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-virtual {v4, v3, v8, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 298
    .end local v2    # "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    .end local v8    # "adjustedThumbnailSize":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    :goto_86
    iget-wide v12, v10, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    const-wide/16 v14, 0x1

    add-long/2addr v12, v14

    iput-wide v12, v10, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    .line 299
    iget-wide v12, v10, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    const-wide/16 v14, 0x3

    cmp-long v3, v12, v14

    if-lez v3, :cond_43

    goto :goto_2c

    .line 294
    :cond_96
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    int-to-long v12, v3

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->setImageAtIndex(JLandroid/graphics/drawable/BitmapDrawable;)V
    invoke-static {v5, v12, v13, v9}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;JLandroid/graphics/drawable/BitmapDrawable;)V

    goto :goto_86
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 224
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_composition_cell:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 225
    .local v0, "collectioncell":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;Landroid/view/View;)V

    return-object v1
.end method
