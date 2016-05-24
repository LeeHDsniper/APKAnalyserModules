.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AdobeAssetsViewDesignLibraryCollectionListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "DesignLibraryCollectionListViewAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;
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
.field _libraryCollectionsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 149
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->mContext:Landroid/content/Context;

    .line 150
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    .prologue
    .line 143
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method protected getAssetsCount()I
    .registers 3

    .prologue
    .line 244
    const/4 v0, 0x0

    .line 245
    .local v0, "count":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->getLibraryList()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_f

    .line 246
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->getLibraryList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 247
    :cond_f
    return v0
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 429
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->getAssetsCount()I

    move-result v0

    return v0
.end method

.method public getLibraryAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 252
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->getLibraryList()Ljava/util/ArrayList;

    move-result-object v1

    .line 254
    .local v1, "libraryCollectionsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;>;"
    if-eqz v1, :cond_15

    if-ltz p1, :cond_15

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_15

    .line 255
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .line 258
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method protected getLibraryList()Ljava/util/ArrayList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;",
            ">;"
        }
    .end annotation

    .prologue
    .line 228
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->_libraryCollectionsList:Ljava/util/ArrayList;

    if-nez v2, :cond_49

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_libraryDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    move-result-object v2

    if-eqz v2, :cond_49

    .line 229
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_libraryDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->assetsToDisplay()Ljava/util/ArrayList;

    move-result-object v2

    if-eqz v2, :cond_49

    .line 230
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->_libraryDataSource:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->assetsToDisplay()Ljava/util/ArrayList;

    move-result-object v1

    .line 231
    .local v1, "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->_libraryCollectionsList:Ljava/util/ArrayList;

    .line 232
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_31
    :goto_31
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_49

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 233
    .local v0, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    instance-of v3, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    if-eqz v3, :cond_31

    .line 234
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->_libraryCollectionsList:Ljava/util/ArrayList;

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .end local v0    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_31

    .line 240
    .end local v1    # "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    :cond_49
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->_libraryCollectionsList:Ljava/util/ArrayList;

    return-object v2
.end method

.method public invalidateLibraryCollectionList()V
    .registers 2

    .prologue
    .line 225
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->_libraryCollectionsList:Ljava/util/ArrayList;

    .line 226
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 24
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 287
    move-object/from16 v4, p1

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;

    .line 288
    .local v4, "collectionCellViewHolder":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->getLibraryAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-result-object v16

    .line 290
    .local v16, "library":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;
    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getName()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setName(Ljava/lang/String;)V

    .line 291
    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->count()I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setItemsCount(I)V

    .line 292
    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setLibrary(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 294
    const/4 v14, 0x0

    .line 295
    .local v14, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    const/4 v11, 0x0

    .line 300
    .local v11, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    new-instance v18, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$1;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;)V

    .line 311
    .local v18, "nameOrIdComparator":Ljava/util/Comparator;
    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$2;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;)V

    .line 324
    .local v7, "colorComparator":Ljava/util/Comparator;
    new-instance v13, Ljava/util/ArrayList;

    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getImages()Ljava/util/HashMap;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v13, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 326
    .local v13, "imageItemsArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;>;"
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_90

    .line 327
    move-object/from16 v0, v18

    invoke-static {v13, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 328
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    check-cast v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .line 329
    .restart local v14    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    instance-of v0, v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    move/from16 v19, v0

    if-eqz v19, :cond_72

    move-object v12, v14

    .line 330
    check-cast v12, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    .line 331
    .local v12, "imageItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getPrimaryComponentType()Ljava/lang/String;

    move-result-object v19

    const-string v20, "image/vnd.adobe.shape+svg"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_8b

    .line 332
    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v11

    .line 402
    .end local v12    # "imageItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    :cond_72
    :goto_72
    if-eqz v11, :cond_1a4

    if-eqz v14, :cond_1a4

    .line 404
    new-instance v10, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v10, v0, v4, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 419
    .local v10, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
    sget-object v19, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    sget-object v20, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;->THUMBNAIL_SIZED_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v11, v0, v1, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeLibraryItemUtils;->getImageRendition(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 425
    .end local v10    # "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
    :goto_8a
    return-void

    .line 335
    .restart local v12    # "imageItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    :cond_8b
    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getImage()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v11

    goto :goto_72

    .line 341
    .end local v12    # "imageItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    :cond_90
    new-instance v9, Ljava/util/ArrayList;

    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getColorThemes()Ljava/util/HashMap;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v9, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 343
    .local v9, "colorThemeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;>;"
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_be

    .line 344
    move-object/from16 v0, v18

    invoke-static {v9, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 345
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;

    .line 346
    .local v8, "colorTheme":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;
    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->getRGBColors()Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setColorTheme(Ljava/util/ArrayList;)V

    goto :goto_8a

    .line 352
    .end local v8    # "colorTheme":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;
    :cond_be
    new-instance v6, Ljava/util/ArrayList;

    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getColors()Ljava/util/HashMap;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 354
    .local v6, "colorArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_ea

    .line 355
    invoke-static {v6, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 356
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;

    .line 357
    .local v5, "color":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->color()I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setColor(I)V

    goto :goto_8a

    .line 362
    .end local v5    # "color":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;
    :cond_ea
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getBrushes()Ljava/util/HashMap;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 364
    .local v2, "brushArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_118

    .line 365
    move-object/from16 v0, v18

    invoke-static {v2, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 366
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    check-cast v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .restart local v14    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    move-object/from16 v19, v14

    .line 367
    check-cast v19, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;

    invoke-virtual/range {v19 .. v19}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v11

    goto/16 :goto_72

    .line 371
    :cond_118
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getCharacterStyles()Ljava/util/HashMap;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 373
    .local v3, "charStylesArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_146

    .line 374
    move-object/from16 v0, v18

    invoke-static {v3, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 375
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    check-cast v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .restart local v14    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    move-object/from16 v19, v14

    .line 376
    check-cast v19, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;

    invoke-virtual/range {v19 .. v19}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v11

    goto/16 :goto_72

    .line 380
    :cond_146
    new-instance v15, Ljava/util/ArrayList;

    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getLayoutStyles()Ljava/util/HashMap;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 382
    .local v15, "layoutStylesArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;>;"
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_174

    .line 383
    move-object/from16 v0, v18

    invoke-static {v15, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 384
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    check-cast v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .restart local v14    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    move-object/from16 v19, v14

    .line 385
    check-cast v19, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;

    invoke-virtual/range {v19 .. v19}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v11

    goto/16 :goto_72

    .line 389
    :cond_174
    new-instance v17, Ljava/util/ArrayList;

    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getLooks()Ljava/util/HashMap;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 391
    .local v17, "looksArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;>;"
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_72

    .line 392
    invoke-static/range {v17 .. v18}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 393
    const/16 v19, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    check-cast v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .restart local v14    # "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    move-object/from16 v19, v14

    .line 394
    check-cast v19, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;

    invoke-virtual/range {v19 .. v19}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v11

    goto/16 :goto_72

    .line 423
    .end local v2    # "brushArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;>;"
    .end local v3    # "charStylesArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;>;"
    .end local v6    # "colorArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;>;"
    .end local v9    # "colorThemeArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;>;"
    .end local v15    # "layoutStylesArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;>;"
    .end local v17    # "looksArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;>;"
    :cond_1a4
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setEmptyCell()V

    goto/16 :goto_8a
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 280
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_library_collection_cell:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 281
    .local v0, "collectioncell":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;Landroid/view/View;)V

    return-object v1
.end method
