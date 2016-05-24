.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;
.source "AdobeAssetsViewCompositionsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dataSourceType"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)V

    .line 47
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 48
    return-void
.end method


# virtual methods
.method protected createRecyclerViewAdapter(Landroid/content/Context;Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/support/v7/widget/RecyclerView;",
            ")",
            "Landroid/support/v7/widget/RecyclerView$Adapter",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 52
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_packageAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;

    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_packageAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;

    return-object v0
.end method

.method protected getAssetPackageCollectionNavigationCommand(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;
    .registers 4
    .param p1, "targetCollection"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .prologue
    .line 79
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;-><init>()V

    .line 81
    .local v0, "navCommand":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getGUID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;->collectionGUID:Ljava/lang/String;

    .line 82
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;->collectionName:Ljava/lang/String;

    .line 83
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getHref()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;->collectionHref:Ljava/lang/String;

    .line 84
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getParentHref()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;->parentHref:Ljava/lang/String;

    .line 85
    iput-object p1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;->assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 86
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    if-eqz v1, :cond_30

    .line 87
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceDraw:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 92
    :cond_2f
    :goto_2f
    return-object v0

    .line 88
    :cond_30
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    if-eqz v1, :cond_39

    .line 89
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLine:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    goto :goto_2f

    .line 90
    :cond_39
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    if-eqz v1, :cond_2f

    .line 91
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceSketches:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;->dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    goto :goto_2f
.end method

.method protected getLayoutManager(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$integer;->adobe_library_collections_num_columns:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_numColumnsInTwoWay:I

    .line 59
    new-instance v0, Lorg/lucasr/twowayview/widget/GridLayoutManager;

    sget-object v1, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_numColumnsInTwoWay:I

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lorg/lucasr/twowayview/widget/GridLayoutManager;-><init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;II)V

    return-object v0
.end method

.method protected handleItemClick(Landroid/view/View;I)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 64
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_packageAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;

    invoke-virtual {v2, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionListViewController$MobileCreationPackageListViewAdapter;->getPackageAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    move-result-object v1

    .line 66
    .local v1, "pages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    if-nez v1, :cond_9

    .line 75
    :goto_8
    return-void

    .line 68
    :cond_9
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;-><init>()V

    .line 69
    .local v0, "data":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;
    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;->_packagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 70
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v2

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    .line 71
    iput p2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;->startIndex:I

    .line 73
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;->handleAssetClickAction(Ljava/lang/Object;)V

    goto :goto_8
.end method
