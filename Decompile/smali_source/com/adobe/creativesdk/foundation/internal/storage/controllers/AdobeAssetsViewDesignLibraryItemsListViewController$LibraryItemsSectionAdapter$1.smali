.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$1;
.super Ljava/lang/Object;
.source "AdobeAssetsViewDesignLibraryItemsListViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->bindImageCollectionLibraryItem(ILandroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;

.field final synthetic val$imageCollectionCellHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;

.field final synthetic val$libraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;

    .prologue
    .line 758
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$1;->val$imageCollectionCellHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$1;->val$libraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "requestResult"    # Landroid/graphics/Bitmap;

    .prologue
    .line 761
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$1;->val$imageCollectionCellHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->getLibraryItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$1;->val$libraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    if-ne v0, v1, :cond_14

    .line 762
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$1;->val$imageCollectionCellHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;

    const-wide v2, 0x3fd3333333333333L

    invoke-virtual {v0, p1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->displayThumbnail(Landroid/graphics/Bitmap;D)V

    .line 763
    :cond_14
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 758
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$1;->onCompletion(Landroid/graphics/Bitmap;)V

    return-void
.end method
