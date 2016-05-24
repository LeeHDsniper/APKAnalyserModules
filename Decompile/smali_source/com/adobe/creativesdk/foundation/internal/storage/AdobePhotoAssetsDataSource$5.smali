.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;
.super Ljava/lang/Object;
.source "AdobePhotoAssetsDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->loadAssetsOnPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

.field final synthetic val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    .prologue
    .line 194
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)V
    .registers 7
    .param p2, "previousPage"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .param p3, "nextPage"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "assets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
    const/4 v2, 0x0

    .line 197
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    const/4 v1, 0x1

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_initialQueryRequested:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->access$602(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Z)Z

    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    move-result-object v0

    if-nez v0, :cond_1e

    .line 202
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    invoke-static {v0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->access$702(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    .line 204
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    if-eqz v0, :cond_1d

    .line 205
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 231
    :cond_1d
    :goto_1d
    return-void

    .line 209
    :cond_1e
    if-eqz p3, :cond_2c

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;->isEqualToPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)Z

    move-result v0

    if-eqz v0, :cond_2e

    :cond_2c
    if-nez p3, :cond_4e

    .line 211
    :cond_2e
    if-nez p2, :cond_3f

    if-nez p3, :cond_3f

    .line 212
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Unexpected state returned from server: no paging history."

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    :cond_3f
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    invoke-static {v0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->access$702(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    .line 217
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    if-eqz v0, :cond_1d

    .line 218
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_1d

    .line 224
    :cond_4e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->_nextRequestedPage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    invoke-static {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;->access$702(Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    .line 226
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    if-eqz v0, :cond_1d

    .line 227
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobePhotoAssetsDataSource$5;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v0, v2}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_1d
.end method
