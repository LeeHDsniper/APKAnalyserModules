.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$1;
.super Ljava/lang/Object;
.source "AdobeAssetFile.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->onHit([BLcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
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
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;

    .prologue
    .line 490
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 490
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$1;->onCompletion(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onCompletion(Lorg/json/JSONObject;)V
    .registers 5
    .param p1, "requestResult"    # Lorg/json/JSONObject;

    .prologue
    .line 493
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$fileInternal:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    const-string v1, "hls_playlist"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->hlsHref:Ljava/lang/String;

    .line 494
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$1;->this$1:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$fileInternal:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    const-string v1, "duration"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->_videDuration:I

    .line 495
    return-void
.end method
