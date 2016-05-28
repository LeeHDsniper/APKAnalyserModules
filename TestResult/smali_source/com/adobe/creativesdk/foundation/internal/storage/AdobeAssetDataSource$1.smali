.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;
.super Ljava/lang/Object;
.source "AdobeAssetDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadNextPage()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final newData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation
.end field

.field final numberProcessed:[I

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

.field final synthetic val$weakThis:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;Ljava/lang/ref/WeakReference;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    .prologue
    const/4 v1, 0x0

    .line 225
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    const/4 v0, 0x1

    new-array v0, v0, [I

    aput v1, v0, v1

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->numberProcessed:[I

    .line 228
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->newData:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    .prologue
    .line 225
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->allItemsLoaded()V

    return-void
.end method

.method private allItemsLoaded()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 233
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->newData:Ljava/util/ArrayList;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;)V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 243
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iget-boolean v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadingItemsFromScratch:Z

    if-eqz v1, :cond_2e

    .line 244
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->data:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 246
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iput-boolean v3, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadingItemsFromScratch:Z

    .line 249
    :cond_2e
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->data:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->newData:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 251
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    move-result-object v0

    .line 252
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    if-eqz v0, :cond_56

    .line 253
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->data:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->didLoadMoreDataWithCount(I)V

    .line 256
    :cond_56
    if-eqz v0, :cond_5b

    .line 257
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->didFinishLoading()V

    .line 259
    :cond_5b
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iput-boolean v3, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadingItems:Z

    .line 260
    return-void
.end method


# virtual methods
.method public onCompletion(Ljava/util/ArrayList;I)V
    .registers 10
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
    .line 265
    .local p1, "itemArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iget-object v5, v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->data:Ljava/util/ArrayList;

    if-nez v5, :cond_1b

    .line 266
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v6, v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->data:Ljava/util/ArrayList;

    .line 269
    :cond_1b
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_44

    .line 270
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    move-result-object v0

    .line 271
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    if-eqz v0, :cond_2c

    .line 272
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->didFinishLoading()V

    .line 274
    :cond_2c
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iget-object v5, v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->data:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 275
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    const/4 v6, 0x0

    iput-boolean v6, v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadingItems:Z

    .line 278
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    :cond_44
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_48
    :goto_48
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_69

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 279
    .local v2, "obj":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    instance-of v6, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    if-eqz v6, :cond_48

    move-object v3, v2

    .line 280
    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    .line 282
    .local v3, "packageObj":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;

    invoke-direct {v4, p0, v3, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;Ljava/util/ArrayList;)V

    .line 294
    .local v4, "successCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;Ljava/util/ArrayList;)V

    .line 322
    .local v1, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    invoke-virtual {v3, v4, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    goto :goto_48

    .line 326
    .end local v1    # "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    .end local v2    # "obj":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v3    # "packageObj":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;
    .end local v4    # "successCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;
    :cond_69
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 9
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    const/4 v6, 0x0

    .line 330
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    move-result-object v0

    .line 331
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    if-eqz v0, :cond_f

    .line 332
    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 333
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->didFinishLoading()V

    .line 338
    :cond_f
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->val$weakThis:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    iput-boolean v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->loadingItems:Z

    .line 339
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "AdobeAssetDataSource.loadNextPage"

    const-string v3, "Failed to list product packages: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;->getMessage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 341
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 225
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method
