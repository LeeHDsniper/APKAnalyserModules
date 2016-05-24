.class Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;
.super Ljava/lang/Object;
.source "AdobeStorageSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getDirectory(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

.field final synthetic val$dir:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

.field final synthetic val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;

.field final synthetic val$mode:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .prologue
    .line 1342
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$dir:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$mode:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 11
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x130

    const/4 v4, 0x0

    .line 1345
    const/4 v1, 0x0

    .line 1346
    .local v1, "error":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v3

    .line 1347
    .local v3, "statusCode":I
    const/16 v5, 0xc8

    if-eq v3, v5, :cond_f

    if-ne v3, v6, :cond_63

    .line 1348
    :cond_f
    if-eq v3, v6, :cond_50

    .line 1350
    :try_start_11
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$dir:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$mode:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageNextPageAppend:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    if-ne v7, v8, :cond_1e

    const/4 v4, 0x1

    :cond_1e
    invoke-virtual {v5, v6, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->updateFromData(Ljava/lang/String;Z)V

    .line 1351
    const-string v2, "x-children-next-start"

    .line 1352
    .local v2, "nextChildHeaderKey":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v4

    if-eqz v4, :cond_51

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_51

    .line 1353
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$dir:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    const/4 v6, 0x0

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setNextStartIndex(Ljava/lang/String;)V

    .line 1357
    :goto_49
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$dir:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;->onComplete(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 1372
    .end local v2    # "nextChildHeaderKey":Ljava/lang/String;
    :cond_50
    :goto_50
    return-void

    .line 1355
    .restart local v2    # "nextChildHeaderKey":Ljava/lang/String;
    :cond_51
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$dir:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setNextStartIndex(Ljava/lang/String;)V
    :try_end_57
    .catch Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException; {:try_start_11 .. :try_end_57} :catch_58

    goto :goto_49

    .line 1359
    .end local v2    # "nextChildHeaderKey":Ljava/lang/String;
    :catch_58
    move-exception v0

    .line 1360
    .local v0, "e":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;->getError()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    .line 1361
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;

    invoke-interface {v4, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;->onError(Ljava/lang/Object;)V

    goto :goto_50

    .line 1367
    .end local v0    # "e":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/ParsingDataException;
    :cond_63
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v4, p1, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getAssetErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v1

    .line 1368
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;

    invoke-interface {v4, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;->onError(Ljava/lang/Object;)V

    goto :goto_50
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 1381
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getStorageError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    move-result-object v0

    .line 1382
    .local v0, "err":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$10;->val$handler:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;

    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;->onError(Ljava/lang/Object;)V

    .line 1383
    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progressPercent"    # D

    .prologue
    .line 1377
    return-void
.end method
