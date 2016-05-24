.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;
.super Ljava/lang/Object;
.source "AdobeAssetsViewCompositionsListViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
        "<[B",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;

.field final synthetic val$assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

.field final synthetic val$packageCellViewHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;

.field final synthetic val$page:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field final synthetic val$pages:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;Ljava/util/ArrayList;)V
    .registers 6
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;

    .prologue
    .line 259
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;->val$page:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;->val$packageCellViewHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$CompositionCellViewHolder;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;->val$assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;->val$pages:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancellation()V
    .registers 1

    .prologue
    .line 268
    return-void
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 259
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;->onCompletion([B)V

    return-void
.end method

.method public onCompletion([B)V
    .registers 5
    .param p1, "data"    # [B

    .prologue
    .line 272
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController;->_reusableImageWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;->val$page:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getGUID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;->val$page:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getMd5Hash()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;)V

    invoke-virtual {v0, v1, p1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->loadImageWithData(Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 281
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 2
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 286
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 259
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsListViewController$CompositionsListViewAdapter$1;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 264
    return-void
.end method
