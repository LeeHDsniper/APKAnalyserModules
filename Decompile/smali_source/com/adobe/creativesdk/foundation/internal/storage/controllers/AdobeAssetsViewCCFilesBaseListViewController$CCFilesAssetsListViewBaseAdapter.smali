.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;
.source "AdobeAssetsViewCCFilesBaseListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "CCFilesAssetsListViewBaseAdapter"
.end annotation


# instance fields
.field protected _flattenedAssetsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 292
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;

    .line 293
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;Landroid/content/Context;)V

    .line 294
    return-void
.end method


# virtual methods
.method protected abstract createAssetFileCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
.end method

.method protected abstract createAssetFolderCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
.end method

.method protected createNewAssetCellView(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .registers 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 410
    if-nez p2, :cond_7

    .line 411
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->createAssetFileCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    move-result-object v0

    .line 416
    :goto_6
    return-object v0

    .line 413
    :cond_7
    const/4 v0, 0x1

    if-ne p2, v0, :cond_f

    .line 414
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->createAssetFolderCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    move-result-object v0

    goto :goto_6

    .line 416
    :cond_f
    const/4 v0, 0x0

    goto :goto_6
.end method

.method protected getAdobeAssetAtPosition(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 400
    const/4 v0, 0x0

    .line 401
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->getItem(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    move-result-object v1

    .line 402
    .local v1, "assetData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    if-eqz v1, :cond_b

    .line 403
    iget-object v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 405
    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :cond_b
    return-object v0
.end method

.method protected getAssetItemData(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 376
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->getAssetsList()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 377
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->getAssetsList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .line 387
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method protected getAssetsCount()I
    .registers 3

    .prologue
    .line 344
    const/4 v0, 0x0

    .line 345
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->getAssetsList()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_f

    .line 346
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->getAssetsList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 347
    :cond_f
    return v0
.end method

.method protected getAssetsList()Ljava/util/ArrayList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 326
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;->_ccfilesDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    if-nez v2, :cond_8

    .line 327
    const/4 v2, 0x0

    .line 339
    :goto_7
    return-object v2

    .line 329
    :cond_8
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->_flattenedAssetsList:Ljava/util/ArrayList;

    if-nez v2, :cond_3e

    .line 330
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;->_ccfilesDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getAdobeStorageSortIndexCollation()Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->getFlattenedAssetsItemsList()Ljava/util/ArrayList;

    move-result-object v0

    .line 331
    .local v0, "assetList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    if-eqz v0, :cond_3e

    .line 332
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->_flattenedAssetsList:Ljava/util/ArrayList;

    .line 333
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_26
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_3e

    .line 334
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->_flattenedAssetsList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->getCellDataFromAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 333
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 339
    .end local v0    # "assetList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    .end local v1    # "i":I
    :cond_3e
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->_flattenedAssetsList:Ljava/util/ArrayList;

    goto :goto_7
.end method

.method protected getCellDataFromAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .registers 6
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    const/4 v3, 0x0

    .line 351
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;-><init>()V

    .line 352
    .local v0, "celldata":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->guid:Ljava/lang/String;

    .line 353
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->title:Ljava/lang/String;

    .line 354
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getModificationDate()Ljava/util/Date;

    move-result-object v2

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->modificationDate:Ljava/util/Date;

    .line 355
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getCreationDate()Ljava/util/Date;

    move-result-object v2

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->creationDate:Ljava/util/Date;

    .line 356
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 357
    .local v1, "isAssetFile":Z
    if-eqz v1, :cond_39

    move-object v2, p1

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v2

    :goto_29
    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->optionalMetadata:Lorg/json/JSONObject;

    .line 358
    if-eqz v1, :cond_34

    move-object v2, p1

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getMd5Hash()Ljava/lang/String;

    move-result-object v3

    :cond_34
    iput-object v3, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->imageMD5Hash:Ljava/lang/String;

    .line 359
    iput-object p1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    .line 360
    return-object v0

    :cond_39
    move-object v2, v3

    .line 357
    goto :goto_29
.end method

.method public getItemViewType(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 313
    if-ltz p1, :cond_11

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->getItemCount()I

    move-result v1

    if-ge p1, v1, :cond_11

    .line 315
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->getAdobeAssetAtPosition(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 316
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->getTypeFromAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I

    move-result v1

    .line 318
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :goto_10
    return v1

    :cond_11
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->IGNORE_ITEM_VIEW_TYPE:I

    goto :goto_10
.end method

.method getTypeFromAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I
    .registers 3
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 308
    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 322
    const/4 v0, 0x2

    return v0
.end method

.method protected handlePostCellViewBinding(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;I)V
    .registers 6
    .param p1, "cellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .param p2, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .param p3, "position"    # I

    .prologue
    .line 435
    invoke-super {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$AssetsListViewBaseAdapter;->handlePostCellViewBinding(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;I)V

    .line 437
    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    instance-of v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    if-eqz v1, :cond_16

    .line 439
    iget-object v0, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 440
    .local v0, "folder":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    if-eqz v0, :cond_16

    .line 441
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->isShared()Z

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->setCCFolderViewAsShared(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Z)V

    .line 450
    .end local v0    # "folder":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    :cond_16
    return-void
.end method

.method protected invalidateAssetsList()V
    .registers 2

    .prologue
    .line 421
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->_flattenedAssetsList:Ljava/util/ArrayList;

    .line 422
    return-void
.end method

.method protected isAssetCellViewAlreadyRepresentAsset(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z
    .registers 15
    .param p1, "assetCellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .param p2, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 459
    const/4 v9, 0x0

    .line 461
    .local v9, "isCellSame":Z
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->getGuid()Ljava/lang/String;

    move-result-object v4

    .line 462
    .local v4, "cellViewGuid":Ljava/lang/String;
    iget-object v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->guid:Ljava/lang/String;

    .line 463
    .local v1, "assetGuid":Ljava/lang/String;
    if-eqz v4, :cond_57

    if-eqz v1, :cond_57

    invoke-virtual {v4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_57

    .line 465
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->getTitle()Ljava/lang/String;

    move-result-object v6

    .line 466
    .local v6, "cellViewTitle":Ljava/lang/String;
    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->title:Ljava/lang/String;

    .line 468
    .local v3, "assetName":Ljava/lang/String;
    if-eqz v6, :cond_58

    if-eqz v3, :cond_58

    invoke-virtual {v6, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_58

    const/4 v9, 0x1

    .line 470
    :goto_22
    if-eqz v9, :cond_57

    .line 472
    iget-object v11, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    instance-of v7, v11, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 473
    .local v7, "isAssetFile":Z
    if-eqz v7, :cond_57

    .line 474
    const/4 v9, 0x0

    .line 475
    iget-object v0, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 476
    .local v0, "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->getImageMD5()Ljava/lang/String;

    move-result-object v5

    .line 477
    .local v5, "cellViewMD5":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getMd5Hash()Ljava/lang/String;

    move-result-object v2

    .line 478
    .local v2, "assetMD5":Ljava/lang/String;
    if-eqz v5, :cond_57

    if-eqz v2, :cond_57

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_57

    .line 480
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeActive()Z

    move-result v11

    if-eqz v11, :cond_56

    .line 482
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->isMarkedSelected()Z

    move-result v10

    .line 483
    .local v10, "isCellViewSelected":Z
    iget-object v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;

    invoke-virtual {v11, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;->isAssetSelected(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z

    move-result v8

    .line 484
    .local v8, "isAssetSelected":Z
    if-eq v10, v8, :cond_56

    .line 485
    invoke-virtual {p1, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->markSelected(Z)V

    .line 487
    .end local v8    # "isAssetSelected":Z
    .end local v10    # "isCellViewSelected":Z
    :cond_56
    const/4 v9, 0x1

    .line 492
    .end local v0    # "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v2    # "assetMD5":Ljava/lang/String;
    .end local v3    # "assetName":Ljava/lang/String;
    .end local v5    # "cellViewMD5":Ljava/lang/String;
    .end local v6    # "cellViewTitle":Ljava/lang/String;
    .end local v7    # "isAssetFile":Z
    :cond_57
    return v9

    .line 468
    .restart local v3    # "assetName":Ljava/lang/String;
    .restart local v6    # "cellViewTitle":Ljava/lang/String;
    :cond_58
    const/4 v9, 0x0

    goto :goto_22
.end method

.method protected isAssetHasThumbnail(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z
    .registers 4
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 426
    const/4 v0, 0x1

    .line 427
    .local v0, "hasThumbnail":Z
    if-eqz p1, :cond_e

    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    if-eqz v1, :cond_e

    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    instance-of v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    if-eqz v1, :cond_e

    .line 428
    const/4 v0, 0x0

    .line 430
    :cond_e
    return v0
.end method

.method protected isAssetSelectable(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)Z
    .registers 4
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 392
    const/4 v0, 0x0

    .line 393
    .local v0, "isSelectable":Z
    if-eqz p1, :cond_b

    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    if-eqz v1, :cond_b

    .line 394
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    instance-of v0, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 396
    :cond_b
    return v0
.end method

.method protected setCCFolderViewAsShared(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Z)V
    .registers 4
    .param p1, "cellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .param p2, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .param p3, "isShared"    # Z

    .prologue
    .line 455
    return-void
.end method
