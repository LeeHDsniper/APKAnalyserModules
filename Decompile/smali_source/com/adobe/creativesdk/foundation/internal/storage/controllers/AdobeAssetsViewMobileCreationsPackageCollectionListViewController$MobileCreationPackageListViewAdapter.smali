.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AdobeAssetsViewMobileCreationsPackageCollectionListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "MobileCreationPackageListViewAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
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

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;Landroid/content/Context;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 166
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 167
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->mContext:Landroid/content/Context;

    .line 168
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    .line 169
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .registers 2

    .prologue
    .line 464
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->getPackagePagesCount()I

    move-result v0

    return v0
.end method

.method public getPackageAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 327
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->getPackagePagesList()Ljava/util/ArrayList;

    move-result-object v1

    .line 329
    .local v1, "assetPackagesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;>;"
    if-eqz v1, :cond_15

    if-ltz p1, :cond_15

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_15

    .line 330
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 333
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method protected getPackagePagesCount()I
    .registers 3

    .prologue
    .line 319
    const/4 v0, 0x0

    .line 320
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->getPackagePagesList()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_f

    .line 321
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->getPackagePagesList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 322
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
    .line 304
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    if-nez v2, :cond_3f

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;->_assetDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    if-eqz v2, :cond_3f

    .line 305
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    .line 306
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;->_assetDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->assetsToDisplay()Ljava/util/ArrayList;

    move-result-object v2

    if-eqz v2, :cond_3f

    .line 307
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;->_assetDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->assetsToDisplay()Ljava/util/ArrayList;

    move-result-object v1

    .line 308
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

    .line 309
    .local v0, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    instance-of v3, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    if-eqz v3, :cond_27

    .line 310
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .end local v0    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_27

    .line 315
    .end local v1    # "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_3f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    return-object v2
.end method

.method public invalidateMobilePackageDataSources()V
    .registers 2

    .prologue
    .line 301
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->_assetPackagePagesList:Ljava/util/ArrayList;

    .line 302
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 19
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 361
    move-object/from16 v5, p1

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;

    .line 362
    .local v5, "packageCellViewHolder":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->getPackageAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    move-result-object v6

    .line 364
    .local v6, "assetPackagePages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->setName(Ljava/lang/String;)V

    .line 365
    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->setItemsCount(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V

    .line 366
    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->setPages(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V

    .line 368
    instance-of v3, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    if-nez v3, :cond_21

    instance-of v3, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;

    if-eqz v3, :cond_3c

    .line 371
    :cond_21
    iget-object v3, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_threeImagesLayout:Landroid/widget/LinearLayout;

    const/16 v11, 0x8

    invoke-virtual {v3, v11}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 377
    :goto_28
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_38

    .line 378
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_43

    .line 380
    :cond_38
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->setEmptyCell()V

    .line 460
    :cond_3b
    :goto_3b
    return-void

    .line 375
    :cond_3c
    iget-object v3, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_threeImagesLayout:Landroid/widget/LinearLayout;

    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_28

    .line 385
    :cond_43
    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v7, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 388
    .local v7, "pages":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    new-instance v10, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;

    invoke-direct {v10}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;-><init>()V

    .line 389
    .local v10, "indexWrapper":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;
    const-wide/16 v12, 0x0

    iput-wide v12, v10, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    .line 391
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_59
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_ab

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 393
    .local v4, "page":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;->_reusableImageWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

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

    .line 394
    .local v9, "bmp":Landroid/graphics/drawable/BitmapDrawable;
    if-nez v9, :cond_ce

    .line 397
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;->THUMBNAIL_SIZED_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController;->adjustRenditionSizeBasedOnDeviceScale(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    move-result-object v8

    .line 398
    .local v8, "adjustedThumbnailSize":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$1;

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;Ljava/util/ArrayList;)V

    .line 429
    .local v2, "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-virtual {v4, v3, v8, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 437
    .end local v2    # "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    .end local v8    # "adjustedThumbnailSize":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    :goto_9c
    iget-wide v12, v10, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    const-wide/16 v14, 0x1

    add-long/2addr v12, v14

    iput-wide v12, v10, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    .line 438
    iget-wide v12, v10, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXIndexWrapper;->index:J

    const-wide/16 v14, 0x3

    cmp-long v3, v12, v14

    if-lez v3, :cond_59

    .line 442
    .end local v4    # "page":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v9    # "bmp":Landroid/graphics/drawable/BitmapDrawable;
    :cond_ab
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v11, 0x4

    if-ge v3, v11, :cond_3b

    .line 444
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v3

    packed-switch v3, :pswitch_data_ee

    goto :goto_3b

    .line 447
    :pswitch_ba
    iget-object v3, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_secondThumbnailImage:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 448
    iget-object v3, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_thirdThumbnailImage:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 449
    iget-object v3, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_fourthThumbnailImage:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3b

    .line 433
    .restart local v4    # "page":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .restart local v9    # "bmp":Landroid/graphics/drawable/BitmapDrawable;
    :cond_ce
    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    int-to-long v12, v3

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->setImageAtIndex(JLandroid/graphics/drawable/BitmapDrawable;)V
    invoke-static {v5, v12, v13, v9}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;JLandroid/graphics/drawable/BitmapDrawable;)V

    goto :goto_9c

    .line 452
    .end local v4    # "page":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v9    # "bmp":Landroid/graphics/drawable/BitmapDrawable;
    :pswitch_d7
    iget-object v3, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_thirdThumbnailImage:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 453
    iget-object v3, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_fourthThumbnailImage:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3b

    .line 456
    :pswitch_e5
    iget-object v3, v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;->_fourthThumbnailImage:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_3b

    .line 444
    nop

    :pswitch_data_ee
    .packed-switch 0x1
        :pswitch_ba
        :pswitch_d7
        :pswitch_e5
    .end packed-switch
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 354
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_mobilecreation_package_cell:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 355
    .local v0, "collectioncell":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter$PackageCollectionCellViewHolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;Landroid/view/View;)V

    return-object v1
.end method
