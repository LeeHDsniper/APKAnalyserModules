.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;
.super Ljava/lang/Object;
.source "AdobeAssetFile.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageDataRequestCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionFromServerWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field final synthetic val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

.field final synthetic val$dim:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

.field final synthetic val$page:I

.field final synthetic val$type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 691
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$dim:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iput p4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$page:I

    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete([B)V
    .registers 10
    .param p1, "data"    # [B

    .prologue
    .line 695
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->renditionRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 698
    if-eqz p1, :cond_45

    .line 700
    const-string v5, "com.adobe.cc.storage"

    .line 703
    .local v5, "cacheName":Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheGUID()Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$100(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$dim:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iget v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$page:I

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheKey(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)Ljava/lang/String;
    invoke-static {v3, v4, v6, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$400(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepOnDiskCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    .line 704
    invoke-static {v4, v6}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v4

    move-object v1, p1

    .line 703
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->addData([BLjava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4b

    .line 706
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "AdobeAssetFile:getRenditionFromServer"

    const-string v3, "Adding to caches is failed for %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->href:Ljava/net/URI;

    aput-object v7, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 725
    .end local v5    # "cacheName":Ljava/lang/String;
    :cond_45
    :goto_45
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    .line 728
    return-void

    .line 711
    .restart local v5    # "cacheName":Ljava/lang/String;
    :cond_4b
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->md5Hash:Ljava/lang/String;

    if-eqz v0, :cond_45

    .line 713
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 714
    .local v1, "meta":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, "md5"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->md5Hash:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 715
    const-string v0, "modified"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->modificationDate:Ljava/util/Date;

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    const-string v0, "etag"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->etag:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 718
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheGUID()Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$100(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "modified-data"

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepOnDiskCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    .line 719
    invoke-static {v4, v6}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v4

    .line 718
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->addDictionary(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;)Z

    goto :goto_45
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 5
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 738
    if-eqz p1, :cond_34

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;->getErrorCode()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorCancelled:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    if-ne v1, v2, :cond_34

    .line 740
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Renditon Request for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->href:Ljava/net/URI;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "has been cancelled"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 741
    .local v0, "errStr":Ljava/lang/String;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "AssetFile.getRendition"

    invoke-static {v1, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 742
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCancellation()V

    .line 751
    .end local v0    # "errStr":Ljava/lang/String;
    :cond_33
    :goto_33
    return-void

    .line 744
    :cond_34
    if-eqz p1, :cond_33

    .line 746
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Renditon Request for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->href:Ljava/net/URI;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "ended in error"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 747
    .restart local v0    # "errStr":Ljava/lang/String;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "AssetFile.getRendition"

    invoke-static {v1, v2, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    .line 748
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v1, p1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onError(Ljava/lang/Object;)V

    goto :goto_33
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 691
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method

.method public onProgress(D)V
    .registers 4
    .param p1, "progress"    # D

    .prologue
    .line 732
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$9;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    invoke-interface {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onProgress(D)V

    .line 733
    return-void
.end method
