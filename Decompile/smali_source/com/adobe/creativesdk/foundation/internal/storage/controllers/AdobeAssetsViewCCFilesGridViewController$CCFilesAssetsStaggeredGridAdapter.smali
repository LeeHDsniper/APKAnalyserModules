.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController$CCFilesAssetsStaggeredGridAdapter;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;
.source "AdobeAssetsViewCCFilesGridViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CCFilesAssetsStaggeredGridAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController$CCFilesAssetsStaggeredGridAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    .line 87
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$CCFilesAssetsListViewBaseAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController;Landroid/content/Context;)V

    .line 88
    return-void
.end method


# virtual methods
.method protected createAssetFileCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 111
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;-><init>()V

    .line 113
    .local v0, "staggeredCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController$CCFilesAssetsStaggeredGridAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_generic_staggered_assetviewcell:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->initializeFromLayout(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)V

    .line 115
    return-object v0
.end method

.method protected createAssetFolderCellView(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 94
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;-><init>()V

    .line 96
    .local v0, "folderCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController$CCFilesAssetsStaggeredGridAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetview_assetsgrid_folderviewcell:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->initializeFromLayout(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)V

    .line 99
    return-object v0
.end method

.method protected setCCFolderViewAsShared(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Z)V
    .registers 5
    .param p1, "cellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
    .param p2, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .param p3, "isShared"    # Z

    .prologue
    .line 105
    move-object v0, p1

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;

    .line 106
    .local v0, "folderCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;
    invoke-virtual {v0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewGridFolderCellView;->setSharedFolder(Z)V

    .line 107
    return-void
.end method
