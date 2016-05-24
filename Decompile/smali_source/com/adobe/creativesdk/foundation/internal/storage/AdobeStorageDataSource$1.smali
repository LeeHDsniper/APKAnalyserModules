.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;
.super Ljava/lang/Object;
.source "AdobeStorageDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadNextPage()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

.field final synthetic val$totalPagesLimit:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;I)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    .prologue
    .line 418
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->val$totalPagesLimit:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Ljava/util/ArrayList;I)V
    .registers 23
    .param p2, "totalItemsInFolder"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 422
    .local p1, "inItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-boolean v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->abortLoadingMorePages:Z

    move/from16 v17, v0

    if-eqz v17, :cond_1d

    .line 424
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, v17

    iput-boolean v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->abortLoadingMorePages:Z

    .line 583
    :cond_1c
    :goto_1c
    return-void

    .line 427
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    if-nez v17, :cond_40

    .line 429
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    new-instance v18, Ljava/util/ArrayList;

    move-object/from16 v0, v18

    move/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    iput-object v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    .line 432
    :cond_40
    const/4 v15, 0x0

    .line 433
    .local v15, "sections":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;
    const/4 v11, 0x0

    .line 435
    .local v11, "rows":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;>;"
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-lez v17, :cond_56

    .line 437
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->RunInternalFilters(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p1

    .line 439
    :cond_56
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v18, v0

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_totalAssetsLoaded:I
    invoke-static/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)I

    move-result v18

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v19

    add-int v18, v18, v19

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_totalAssetsLoaded:I
    invoke-static/range {v17 .. v18}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$102(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;I)I

    .line 440
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-lez v17, :cond_1ee

    .line 442
    const/4 v7, 0x0

    .line 443
    .local v7, "lastSection":I
    const/4 v6, 0x0

    .line 445
    .local v6, "lastRow":I
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 447
    .local v16, "temporaryItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_loadingItemsFromScratch:Z
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Z

    move-result v17

    if-eqz v17, :cond_118

    .line 448
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->createFreshSortIndexCollator()V
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)V

    .line 458
    :cond_91
    :goto_91
    new-instance v2, Ljava/util/ArrayList;

    move-object/from16 v0, v16

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 459
    .local v2, "allItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 460
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortType:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    move-object/from16 v17, v0

    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_bf

    .line 461
    new-instance v17, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;)V

    move-object/from16 v0, v17

    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 471
    :cond_bf
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->createSectionDataFromMaster(Ljava/util/ArrayList;)Z

    .line 473
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-lez v17, :cond_1be

    .line 475
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->sectionDataArray:Ljava/util/ArrayList;

    .line 476
    .local v12, "sectionData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;>;"
    new-instance v15, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;

    .end local v15    # "sections":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;
    invoke-direct {v15}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;-><init>()V

    .line 477
    .restart local v15    # "sections":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;
    new-instance v11, Ljava/util/ArrayList;

    .end local v11    # "rows":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;>;"
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 479
    .restart local v11    # "rows":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;>;"
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    if-ne v0, v7, :cond_169

    .line 484
    add-int/lit8 v17, v7, -0x1

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/ArrayList;

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 485
    .local v8, "lastSectionArrayCount":I
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_107
    if-ge v5, v8, :cond_1be

    .line 487
    new-instance v10, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;

    add-int/lit8 v17, v7, -0x1

    move/from16 v0, v17

    invoke-direct {v10, v0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;-><init>(II)V

    .line 488
    .local v10, "row":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 485
    add-int/lit8 v5, v5, 0x1

    goto :goto_107

    .line 451
    .end local v2    # "allItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    .end local v5    # "j":I
    .end local v8    # "lastSectionArrayCount":I
    .end local v10    # "row":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;
    .end local v12    # "sectionData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;>;"
    :cond_118
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 452
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->numberOfSections()I

    move-result v17

    if-lez v17, :cond_91

    .line 454
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->numberOfSections()I

    move-result v7

    .line 455
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->sectionDataArray:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    add-int/lit8 v18, v7, -0x1

    invoke-virtual/range {v17 .. v18}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/ArrayList;

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v6

    goto/16 :goto_91

    .line 495
    .restart local v2    # "allItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    .restart local v12    # "sectionData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;>;"
    :cond_169
    const/4 v8, 0x0

    .line 498
    .restart local v8    # "lastSectionArrayCount":I
    if-nez v7, :cond_18a

    .line 499
    invoke-virtual {v12, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/ArrayList;

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 504
    :goto_176
    if-le v8, v6, :cond_199

    .line 506
    move v5, v6

    .restart local v5    # "j":I
    :goto_179
    if-ge v5, v8, :cond_199

    .line 508
    new-instance v10, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;

    add-int/lit8 v17, v7, -0x1

    move/from16 v0, v17

    invoke-direct {v10, v0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;-><init>(II)V

    .line 509
    .restart local v10    # "row":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 506
    add-int/lit8 v5, v5, 0x1

    goto :goto_179

    .line 501
    .end local v5    # "j":I
    .end local v10    # "row":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;
    :cond_18a
    add-int/lit8 v17, v7, -0x1

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/ArrayList;

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v8

    goto :goto_176

    .line 513
    :cond_199
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v13

    .line 515
    .local v13, "sectionDataCount":I
    move v4, v7

    .local v4, "i":I
    :goto_19e
    if-ge v4, v13, :cond_1be

    .line 517
    invoke-virtual {v15, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;->add(I)V

    .line 518
    invoke-virtual {v12, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/ArrayList;

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v14

    .line 519
    .local v14, "sectionItemCount":I
    const/4 v5, 0x0

    .restart local v5    # "j":I
    :goto_1ae
    if-ge v5, v14, :cond_1bb

    .line 521
    new-instance v10, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;

    invoke-direct {v10, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;-><init>(II)V

    .line 522
    .restart local v10    # "row":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 519
    add-int/lit8 v5, v5, 0x1

    goto :goto_1ae

    .line 515
    .end local v10    # "row":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListIndexPath;
    :cond_1bb
    add-int/lit8 v4, v4, 0x1

    goto :goto_19e

    .line 528
    .end local v4    # "i":I
    .end local v5    # "j":I
    .end local v8    # "lastSectionArrayCount":I
    .end local v12    # "sectionData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageItemSectionData;>;>;"
    .end local v13    # "sectionDataCount":I
    .end local v14    # "sectionItemCount":I
    :cond_1be
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    .line 530
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    iput-object v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    .line 533
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, v17

    iput-boolean v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->recreateFilteredAssets:Z

    .line 536
    .end local v2    # "allItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    .end local v6    # "lastRow":I
    .end local v7    # "lastSection":I
    .end local v16    # "temporaryItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_1ee
    new-instance v9, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v17, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->CCContainerViewControllerEndRefreshNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v9, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 537
    .local v9, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 541
    sget-boolean v17, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeActive:Z

    if-eqz v17, :cond_208

    .line 550
    :cond_208
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_totalAssetsLoaded:I
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)I

    move-result v17

    if-nez v17, :cond_22a

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-nez v17, :cond_22a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->hasNextPage()Z

    move-result v17

    if-nez v17, :cond_23f

    .line 551
    :cond_22a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v3

    .line 552
    .local v3, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v3, :cond_23f

    .line 553
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    invoke-interface {v3, v0, v15, v11}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->didLoadMoreDataWithCount(ILcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;Ljava/util/ArrayList;)V

    .line 559
    .end local v3    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    :cond_23f
    new-instance v9, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .end local v9    # "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    sget-object v17, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageDataSourceDidLoadNewPageNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v9, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 560
    .restart local v9    # "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 563
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, v17

    iput-boolean v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItems:Z

    .line 564
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_loadingItemsFromScratch:Z
    invoke-static/range {v17 .. v18}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$202(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;Z)Z

    .line 565
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_totalAssetsLoaded:I
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)I

    move-result v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->val$totalPagesLimit:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_2e3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_targetCollection:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->hasNextPage()Z

    move-result v17

    if-eqz v17, :cond_2e3

    .line 567
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadNextPage()Z

    .line 568
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v3

    .line 569
    .restart local v3    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v3, :cond_2ac

    .line 570
    invoke-interface {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->startedLoadingMoreFolders()V

    .line 580
    :cond_2ac
    :goto_2ac
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    move-object/from16 v17, v0

    if-eqz v17, :cond_1c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    if-lez v17, :cond_1c

    .line 581
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterWithSearchString(Ljava/lang/String;)V

    goto/16 :goto_1c

    .line 574
    .end local v3    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    :cond_2e3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->_totalAssetsLoaded:I
    invoke-static/range {v17 .. v18}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$102(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;I)I

    .line 575
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    move-object/from16 v17, v0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v3

    .line 576
    .restart local v3    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v3, :cond_2ac

    .line 577
    invoke-interface {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->stoppedLoadingMoreFolders()V

    goto :goto_2ac
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 6
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 588
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    .line 589
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v0, :cond_b

    .line 590
    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 592
    :cond_b
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->CCContainerViewControllerEndRefreshNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 593
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 597
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItems:Z

    .line 598
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 418
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method
