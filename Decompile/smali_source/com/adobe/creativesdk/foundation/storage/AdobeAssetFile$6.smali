.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;
.super Ljava/lang/Object;
.source "AdobeAssetFile.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
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

.field final synthetic val$fileInternal:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

.field final synthetic val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 455
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$fileInternal:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onHit(Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .registers 3

    .prologue
    .line 455
    check-cast p1, [B

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->onHit([BLcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V

    return-void
.end method

.method public onHit([BLcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .registers 23
    .param p1, "data"    # [B
    .param p2, "location"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    .prologue
    .line 458
    new-instance v16, Ljava/lang/String;

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    invoke-static/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    .line 459
    .local v14, "parsedData":Lorg/json/JSONObject;
    const-string v16, "hls_playlist"

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 462
    .local v2, "cachedHLSHref":Ljava/lang/String;
    const/4 v15, 0x1

    .line 463
    .local v15, "refreshCache":Z
    if-eqz v2, :cond_60

    .line 467
    :try_start_1c
    const-string v16, "UTF-8"

    move-object/from16 v0, v16

    invoke-static {v2, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_23
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1c .. :try_end_23} :catch_9f

    move-result-object v2

    .line 471
    :goto_24
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    .line 472
    .local v3, "currDate":Ljava/util/Date;
    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v16

    const-wide/16 v18, 0x3e8

    div-long v4, v16, v18

    .line 473
    .local v4, "currentTime":J
    const-string v16, "~exp=(\\d+)~"

    const/16 v17, 0x2

    invoke-static/range {v16 .. v17}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v13

    .line 474
    .local v13, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v13, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v12

    .line 475
    .local v12, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v12}, Ljava/util/regex/Matcher;->find()Z

    move-result v16

    if-eqz v16, :cond_60

    .line 477
    invoke-virtual {v12}, Ljava/util/regex/Matcher;->start()I

    move-result v16

    add-int/lit8 v16, v16, 0x5

    invoke-virtual {v12}, Ljava/util/regex/Matcher;->end()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 478
    .local v8, "expiration":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 479
    .local v10, "expirationTime":J
    cmp-long v16, v4, v10

    if-ltz v16, :cond_a4

    .line 480
    const/4 v2, 0x0

    .line 486
    .end local v3    # "currDate":Ljava/util/Date;
    .end local v4    # "currentTime":J
    .end local v8    # "expiration":Ljava/lang/String;
    .end local v10    # "expirationTime":J
    .end local v12    # "m":Ljava/util/regex/Matcher;
    .end local v13    # "p":Ljava/util/regex/Pattern;
    :cond_60
    :goto_60
    if-eqz v15, :cond_a6

    .line 488
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-object/from16 v17, v0

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->cacheGUID()Ljava/lang/String;
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$100(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Ljava/lang/String;

    move-result-object v17

    const-string v18, "video-data"

    const-string v19, "com.adobe.cc.storage"

    invoke-virtual/range {v16 .. v19}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeItemWithGUID(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 489
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$fileInternal:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    iput-object v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->hlsHref:Ljava/lang/String;

    .line 490
    new-instance v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$1;

    move-object/from16 v0, p0

    invoke-direct {v9, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$1;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;)V

    .line 498
    .local v9, "hlsHrefHandler":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lorg/json/JSONObject;>;"
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$2;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$2;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;)V

    .line 504
    .local v7, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getVideoMetadata(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    invoke-static {v0, v9, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$200(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 511
    .end local v7    # "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    .end local v9    # "hlsHrefHandler":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lorg/json/JSONObject;>;"
    :cond_9e
    :goto_9e
    return-void

    .line 468
    :catch_9f
    move-exception v6

    .line 469
    .local v6, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v6}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_24

    .line 482
    .end local v6    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v3    # "currDate":Ljava/util/Date;
    .restart local v4    # "currentTime":J
    .restart local v8    # "expiration":Ljava/lang/String;
    .restart local v10    # "expirationTime":J
    .restart local v12    # "m":Ljava/util/regex/Matcher;
    .restart local v13    # "p":Ljava/util/regex/Pattern;
    :cond_a4
    const/4 v15, 0x0

    goto :goto_60

    .line 506
    .end local v3    # "currDate":Ljava/util/Date;
    .end local v4    # "currentTime":J
    .end local v8    # "expiration":Ljava/lang/String;
    .end local v10    # "expirationTime":J
    .end local v12    # "m":Ljava/util/regex/Matcher;
    .end local v13    # "p":Ljava/util/regex/Pattern;
    :cond_a6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$fileInternal:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->hlsHref:Ljava/lang/String;

    move-object/from16 v16, v0

    if-eqz v16, :cond_c8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$fileInternal:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->hlsHref:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_9e

    .line 508
    :cond_c8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$fileInternal:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    move-object/from16 v16, v0

    const-string v17, "hls_playlist"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    iput-object v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->hlsHref:Ljava/lang/String;

    .line 509
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$fileInternal:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    move-object/from16 v16, v0

    const-string v17, "duration"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->_videDuration:I

    goto :goto_9e
.end method

.method public onMiss()V
    .registers 4

    .prologue
    .line 515
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$3;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;)V

    .line 523
    .local v1, "hlsHrefHandler":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lorg/json/JSONObject;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$4;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6$4;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;)V

    .line 529
    .local v0, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$6;->val$that:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    # invokes: Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getVideoMetadata(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    invoke-static {v2, v1, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->access$200(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 530
    return-void
.end method
