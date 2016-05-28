.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;
.super Ljava/lang/Object;
.source "AdobeAssetFile.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->onHit([BLcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

.field final synthetic val$data:[B


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;[B)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    .prologue
    .line 583
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->val$data:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onHit(Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .registers 3

    .prologue
    .line 583
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->onHit(Ljava/util/Map;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V

    return-void
.end method

.method public onHit(Ljava/util/Map;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .registers 9
    .param p2, "location"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;",
            ")V"
        }
    .end annotation

    .prologue
    .line 587
    .local p1, "dictObj":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "md5"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 590
    .local v0, "cachedMD5":Ljava/lang/String;
    if-eqz v0, :cond_20

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->md5Hash:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 592
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->val$data:[B

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onCompletion(Ljava/lang/Object;)V

    .line 600
    :goto_1f
    return-void

    .line 597
    :cond_20
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheGUID()Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$100(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.adobe.cc.storage"

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeSetWithGUID(Ljava/lang/String;Ljava/lang/String;)Z

    .line 598
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$dimensions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget v4, v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$page:I

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v5, v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionFromServerWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    invoke-static {v1, v2, v3, v4, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$300(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    goto :goto_1f
.end method

.method public onMiss()V
    .registers 6

    .prologue
    .line 604
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$dimensions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget v3, v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$page:I

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;

    iget-object v4, v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionFromServerWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    invoke-static {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$300(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 605
    return-void
.end method
