.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;
.super Ljava/lang/Object;
.source "AdobeAssetDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->onCompletion(Ljava/util/ArrayList;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

.field final synthetic val$itemArray:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;Ljava/util/ArrayList;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    .prologue
    .line 294
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;->val$itemArray:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 10
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    const/4 v7, 0x0

    .line 297
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->numberProcessed:[I

    aget v3, v2, v7

    add-int/lit8 v3, v3, 0x1

    aput v3, v2, v7

    .line 298
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;

    move-result-object v0

    .line 302
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;
    instance-of v2, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    if-eqz v2, :cond_2b

    move-object v1, p1

    .line 303
    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .line 304
    .local v1, "err":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;->getErrorCode()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->getValue()I

    move-result v2

    const/16 v3, 0x194

    if-eq v2, v3, :cond_3f

    .line 305
    if-eqz v0, :cond_2b

    .line 306
    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeAssetDataSourceDelegate;->didFailToLoadMoreDataWithError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    .line 316
    .end local v1    # "err":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    :cond_2b
    :goto_2b
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;->val$itemArray:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->numberProcessed:[I

    aget v3, v3, v7

    if-ne v2, v3, :cond_3e

    .line 317
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->allItemsLoaded()V
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;)V

    .line 319
    :cond_3e
    return-void

    .line 311
    .restart local v1    # "err":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    :cond_3f
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v3, "AdobeAssetDataSource.loadNextPage"

    const-string v4, "Failed to load the package metadata: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;->getMessage()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2b
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 294
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$3;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method
