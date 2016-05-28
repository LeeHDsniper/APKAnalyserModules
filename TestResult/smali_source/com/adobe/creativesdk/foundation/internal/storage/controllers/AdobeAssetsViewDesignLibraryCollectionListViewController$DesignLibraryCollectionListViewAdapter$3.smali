.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;
.super Ljava/lang/Object;
.source "AdobeAssetsViewDesignLibraryCollectionListViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
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
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

.field final synthetic val$collectionCellViewHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;

.field final synthetic val$library:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    .prologue
    .line 404
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;->val$collectionCellViewHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;->val$library:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "requestResult"    # Landroid/graphics/Bitmap;

    .prologue
    .line 407
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;->val$collectionCellViewHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->getLibrary()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;->val$library:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    if-ne v0, v1, :cond_11

    .line 409
    if-eqz p1, :cond_12

    .line 410
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;->val$collectionCellViewHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setImage(Landroid/graphics/Bitmap;)V

    .line 416
    :cond_11
    :goto_11
    return-void

    .line 413
    :cond_12
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;->val$collectionCellViewHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$CollectionCellViewHolder;->setEmptyCell()V

    goto :goto_11
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 404
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$3;->onCompletion(Landroid/graphics/Bitmap;)V

    return-void
.end method
