.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;
.super Ljava/lang/Object;
.source "AdobeAssetFile.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithTypeForData(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler",
        "<[B>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field final synthetic val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

.field final synthetic val$dimensions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

.field final synthetic val$ocObj:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;

.field final synthetic val$page:I

.field final synthetic val$type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;)V
    .registers 7
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 580
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$dimensions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iput p5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$page:I

    iput-object p6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$ocObj:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onHit(Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .registers 3

    .prologue
    .line 580
    check-cast p1, [B

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->onHit([BLcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V

    return-void
.end method

.method public onHit([BLcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .registers 10
    .param p1, "data"    # [B
    .param p2, "location"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    .prologue
    .line 583
    new-instance v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;

    invoke-direct {v5, p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7$1;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;[B)V

    .line 608
    .local v5, "dictHandler":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheGUID()Ljava/lang/String;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$100(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "modified-data"

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-static {v3}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v3

    const-string v4, "com.adobe.cc.storage"

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$ocObj:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;

    iget-object v6, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;->handler:Landroid/os/Handler;

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getDictionaryFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z

    .line 609
    return-void
.end method

.method public onMiss()V
    .registers 6

    .prologue
    .line 613
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$type:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$dimensions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iget v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$page:I

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$7;->val$dataDelegate:Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionFromServerWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    invoke-static {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$300(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 615
    return-void
.end method
