.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;
.super Ljava/lang/Object;
.source "AdobeAssetFile.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getVideoMetadata(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field final synthetic val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

.field final synthetic val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 630
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete([B)V
    .registers 9
    .param p1, "data"    # [B

    .prologue
    .line 634
    if-eqz p1, :cond_44

    .line 636
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 637
    .local v6, "map":Lorg/json/JSONObject;
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;->val$completionCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    invoke-interface {v0, v6}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 640
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheGUID()Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$100(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "video-data"

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepOnDiskCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-static {v1, v4}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v4

    const-string v5, "com.adobe.cc.storage"

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->addData([BLjava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_44

    .line 642
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v1, "AdobeAssetFile:getVideoMetadata"

    const-string v2, "Adding to caches is failed for %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v5, v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->href:Ljava/net/URI;

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 646
    .end local v6    # "map":Lorg/json/JSONObject;
    :cond_44
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 657
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;->val$errorCallback:Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 658
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 630
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$8;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 652
    return-void
.end method
