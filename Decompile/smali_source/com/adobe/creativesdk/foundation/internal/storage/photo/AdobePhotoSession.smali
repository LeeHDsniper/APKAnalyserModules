.class public Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
.super Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
.source "AdobePhotoSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$92;
    }
.end annotation


# static fields
.field private static requestMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected _cacheConfigured:Z


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V
    .registers 5
    .param p1, "cloudEndpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 188
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 190
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->setUpService()V

    .line 191
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobePhotoServiceDisconnectedNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->setDisconnectionNotifier(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;)V

    .line 192
    const-wide/16 v0, 0xf

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->setupOngoingConnectionTimer(JZ)V

    .line 193
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->requestMap:Ljava/util/Map;

    .line 194
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 100
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 100
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->parseNavigationLink(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300()Ljava/util/Map;
    .registers 1

    .prologue
    .line 100
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->requestMap:Ljava/util/Map;

    return-object v0
.end method

.method private checkEntitlements()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .registers 5

    .prologue
    .line 5459
    const/4 v1, 0x0

    .line 5461
    .local v1, "result":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v0

    .line 5463
    .local v0, "publicServices":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getServices()Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_30

    .line 5464
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getServices()Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "lightroom"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_30

    .line 5465
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getServices()Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "lightroom"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "entitled"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_30

    .line 5468
    new-instance v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .end local v1    # "result":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNotEntitledToService:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 5471
    .restart local v1    # "result":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_30
    return-object v1
.end method

.method private getPhotoErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    .registers 9
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 5369
    if-nez p1, :cond_4

    .line 5370
    const/4 v0, 0x0

    .line 5388
    :cond_3
    :goto_3
    return-object v0

    .line 5372
    :cond_4
    const/4 v0, 0x0

    .line 5373
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v1

    .line 5374
    .local v1, "status":I
    const/16 v2, 0x19c

    if-ne v1, v2, :cond_3c

    .line 5375
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_CONFLICTING_CHANGES:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 5376
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 5375
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoErrUtils;->createPhotoError(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    .line 5384
    :cond_23
    :goto_23
    if-nez v0, :cond_3

    .line 5385
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 5386
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 5385
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoErrUtils;->createPhotoError(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    goto :goto_3

    .line 5377
    :cond_3c
    const/16 v2, 0x1fb

    if-ne v1, v2, :cond_57

    .line 5378
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_EXCEEDED_QUOTA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 5379
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 5378
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoErrUtils;->createPhotoError(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    goto :goto_23

    .line 5380
    :cond_57
    const/16 v2, 0x19f

    if-ne v1, v2, :cond_23

    .line 5381
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNSUPPORTED_MEDIA:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 5382
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 5381
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoErrUtils;->createPhotoError(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    move-result-object v0

    goto :goto_23
.end method

.method private getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 16
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "data"    # [B
    .param p4, "callback"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    .param p5, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    const/4 v9, 0x0

    .line 5290
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v0

    .line 5291
    .local v0, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    if-nez v0, :cond_2d

    .line 5293
    const-string v8, "Adobe cloud not specified."

    .line 5295
    .local v8, "errorMsg":Ljava/lang/String;
    if-eqz p4, :cond_21

    .line 5297
    new-instance v7, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNoCloudSpecified:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v7, v1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 5298
    .local v7, "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    if-eqz p5, :cond_1d

    .line 5299
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$89;

    invoke-direct {v1, p0, p4, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$89;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    invoke-virtual {p5, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 5362
    .end local v7    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .end local v8    # "errorMsg":Ljava/lang/String;
    :goto_1c
    return-object v9

    .line 5306
    .restart local v7    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .restart local v8    # "errorMsg":Ljava/lang/String;
    :cond_1d
    invoke-interface {p4, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    goto :goto_1c

    .line 5311
    .end local v7    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_21
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c

    .line 5317
    .end local v8    # "errorMsg":Ljava/lang/String;
    :cond_2d
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->checkEntitlements()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    move-result-object v6

    .line 5318
    .local v6, "entitlementError":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    if-eqz v6, :cond_54

    .line 5319
    if-eqz p4, :cond_44

    .line 5320
    if-eqz p5, :cond_40

    .line 5321
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$90;

    invoke-direct {v1, p0, p4, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$90;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    invoke-virtual {p5, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1c

    .line 5328
    :cond_40
    invoke-interface {p4, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    goto :goto_1c

    .line 5331
    :cond_44
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Entitlement Check failed"

    invoke-static {v1, v2, v3, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    goto :goto_1c

    .line 5336
    :cond_54
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$91;

    invoke-direct {v4, p0, p1, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$91;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)V

    .line 5350
    .local v4, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    if-nez p2, :cond_6a

    .line 5352
    invoke-virtual {p1, p3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setBody([B)V

    .line 5353
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    invoke-virtual {v0, p1, v1, v4, p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v9

    .line 5360
    .local v9, "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :goto_64
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->requestMap:Ljava/util/Map;

    invoke-interface {v1, p1, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1c

    .line 5355
    .end local v9    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :cond_6a
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-ne v1, v2, :cond_7c

    .line 5356
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    move-object v1, p1

    move-object v2, p2

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDownloadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v9

    .restart local v9    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    goto :goto_64

    .line 5358
    .end local v9    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :cond_7c
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    move-object v1, p1

    move-object v2, p2

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForUploadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v9

    .restart local v9    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    goto :goto_64
.end method

.method private getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .registers 4
    .param p1, "exception"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 5223
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "Response"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 5224
    :cond_12
    const/4 v0, 0x0

    .line 5226
    :goto_13
    return-object v0

    :cond_14
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "Response"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    goto :goto_13
.end method

.method protected static getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .registers 7

    .prologue
    .line 134
    const/4 v3, 0x0

    .line 135
    .local v3, "serviceEndpointURL":Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v0

    .line 137
    .local v0, "environment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$92;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_3c

    .line 154
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "An undefined authentication endpoint has been specified."

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    :goto_21
    const/4 v1, 0x0

    .line 160
    .local v1, "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :try_start_22
    new-instance v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    const/4 v4, 0x0

    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    sget-object v6, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-direct {v2, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;-><init>(Ljava/lang/String;Ljava/net/URL;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)V
    :try_end_2f
    .catch Ljava/net/MalformedURLException; {:try_start_22 .. :try_end_2f} :catch_3a

    .end local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .local v2, "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    move-object v1, v2

    .line 165
    .end local v2    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .restart local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :goto_30
    return-object v1

    .line 140
    .end local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :pswitch_31
    const-string v3, "https://photo-api.adobe.io"

    .line 141
    goto :goto_21

    .line 145
    :pswitch_34
    const-string v3, "https://photo-api-stage.adobe.io"

    .line 146
    goto :goto_21

    .line 149
    :pswitch_37
    const-string v3, "https://api.oznext.com"

    .line 150
    goto :goto_21

    .line 162
    .restart local v1    # "serviceEndpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :catch_3a
    move-exception v4

    goto :goto_30

    .line 137
    :pswitch_data_3c
    .packed-switch 0x1
        :pswitch_31
        :pswitch_34
        :pswitch_34
        :pswitch_37
    .end packed-switch
.end method

.method public static getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    .registers 2
    .param p0, "cloudEndpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 178
    if-nez p0, :cond_6

    .line 180
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getServiceEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    move-result-object p0

    .line 183
    :cond_6
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 184
    .local v0, "session":Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
    return-object v0
.end method

.method private parseNavigationLink(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .registers 8
    .param p1, "link"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
        }
    .end annotation

    .prologue
    .line 5404
    if-nez p1, :cond_a

    .line 5405
    new-instance v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-direct {v4, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;)V

    throw v4

    .line 5408
    :cond_a
    const-string v4, "((captured|updated|order)_(before|after|since))=([a-zA-Z_0-9-:.%]+)"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 5409
    .local v3, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 5411
    .local v1, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 5413
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v4

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 5414
    .local v0, "kvp":Ljava/lang/String;
    new-instance v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    invoke-direct {v2, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;-><init>(Ljava/lang/String;)V

    .line 5416
    .local v2, "page":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    return-object v2

    .line 5419
    .end local v0    # "kvp":Ljava/lang/String;
    .end local v2    # "page":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    :cond_2d
    new-instance v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-direct {v4, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;)V

    throw v4
.end method


# virtual methods
.method public downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 16
    .param p1, "rendition"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    .param p2, "fromAsset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<[B>;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;"
        }
    .end annotation

    .prologue
    .local p3, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<[B>;"
    .local p4, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    const/4 v8, 0x0

    .line 4193
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v4

    .line 4194
    .local v4, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    if-nez v4, :cond_24

    .line 4196
    const-string v2, "Adobe cloud not specified."

    .line 4198
    .local v2, "errorMsg":Ljava/lang/String;
    if-eqz p4, :cond_18

    .line 4200
    new-instance v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v9, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNoCloudSpecified:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v1, v9}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 4201
    .local v1, "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    if-eqz p4, :cond_17

    .line 4202
    invoke-interface {p4, v1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 4267
    .end local v1    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .end local v2    # "errorMsg":Ljava/lang/String;
    :cond_17
    :goto_17
    return-object v8

    .line 4207
    .restart local v2    # "errorMsg":Ljava/lang/String;
    :cond_18
    sget-object v9, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v10, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_17

    .line 4212
    .end local v2    # "errorMsg":Ljava/lang/String;
    :cond_24
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->getDataPath()Ljava/net/URI;

    move-result-object v9

    invoke-virtual {v9}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getBaseURL()Ljava/net/URL;

    move-result-object v10

    invoke-virtual {v10}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageLastPathComponentUtil;->getRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 4214
    .local v7, "urlStr":Ljava/lang/String;
    :try_start_38
    new-instance v5, Ljava/net/URI;

    invoke-direct {v5, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 4215
    .local v5, "uri":Ljava/net/URI;
    invoke-virtual {v5}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v6

    .line 4217
    .local v6, "url":Ljava/net/URL;
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 4218
    .local v3, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v3, v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 4219
    sget-object v9, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v3, v9}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 4221
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;

    invoke-direct {v0, p0, p2, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$73;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 4259
    .local v0, "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {p0, v3, v9, v10, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :try_end_58
    .catch Ljava/net/MalformedURLException; {:try_start_38 .. :try_end_58} :catch_5c
    .catch Ljava/net/URISyntaxException; {:try_start_38 .. :try_end_58} :catch_5a

    move-result-object v8

    goto :goto_17

    .line 4263
    .end local v0    # "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    .end local v3    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v5    # "uri":Ljava/net/URI;
    .end local v6    # "url":Ljava/net/URL;
    :catch_5a
    move-exception v9

    goto :goto_17

    .line 4261
    :catch_5c
    move-exception v9

    goto :goto_17
.end method

.method public getAssetCountInCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 16
    .param p1, "collection"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;"
        }
    .end annotation

    .prologue
    .line 2914
    .local p2, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Ljava/lang/Integer;>;"
    .local p3, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v4

    .line 2915
    .local v4, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    if-nez v4, :cond_24

    .line 2917
    const-string v2, "Adobe cloud not specified."

    .line 2919
    .local v2, "errorMsg":Ljava/lang/String;
    if-eqz p3, :cond_18

    .line 2921
    new-instance v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v8, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNoCloudSpecified:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v1, v8}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 2922
    .local v1, "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    if-eqz p3, :cond_16

    .line 2923
    invoke-interface {p3, v1}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 2931
    .end local v1    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_16
    :goto_16
    const/4 v8, 0x0

    .line 3004
    .end local v2    # "errorMsg":Ljava/lang/String;
    :goto_17
    return-object v8

    .line 2928
    .restart local v2    # "errorMsg":Ljava/lang/String;
    :cond_18
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v9, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v9}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_16

    .line 2933
    .end local v2    # "errorMsg":Ljava/lang/String;
    :cond_24
    const-string v8, "%s/assets/count"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getHref()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getBaseURL()Ljava/net/URL;

    move-result-object v9

    invoke-virtual {v9}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageLastPathComponentUtil;->getRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2935
    .local v7, "urlStr":Ljava/lang/String;
    :try_start_40
    new-instance v5, Ljava/net/URI;

    invoke-direct {v5, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 2936
    .local v5, "uri":Ljava/net/URI;
    invoke-virtual {v5}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v6

    .line 2938
    .local v6, "url":Ljava/net/URL;
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 2939
    .local v3, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v3, v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 2940
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v3, v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 2942
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;

    invoke-direct {v0, p0, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$52;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 2996
    .local v0, "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {p0, v3, v8, v9, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :try_end_60
    .catch Ljava/net/MalformedURLException; {:try_start_40 .. :try_end_60} :catch_65
    .catch Ljava/net/URISyntaxException; {:try_start_40 .. :try_end_60} :catch_62

    move-result-object v8

    goto :goto_17

    .line 3000
    .end local v0    # "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    .end local v3    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v5    # "uri":Ljava/net/URI;
    .end local v6    # "url":Ljava/net/URL;
    :catch_62
    move-exception v8

    .line 3004
    :goto_63
    const/4 v8, 0x0

    goto :goto_17

    .line 2998
    :catch_65
    move-exception v8

    goto :goto_63
.end method

.method public getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 12
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "data"    # [B
    .param p4, "callback"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;

    .prologue
    .line 5277
    const/4 v5, 0x0

    .line 5279
    .local v5, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_1
    new-instance v5, Landroid/os/Handler;

    .end local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v5}, Landroid/os/Handler;-><init>()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_10

    .restart local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_6
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 5284
    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v0

    return-object v0

    .line 5280
    .end local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    :catch_10
    move-exception v6

    .line 5281
    .local v6, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    .restart local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_6
.end method

.method protected isCacheConfigured()Z
    .registers 2

    .prologue
    .line 249
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->_cacheConfigured:Z

    return v0
.end method

.method public listAssetsInCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;ILcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 26
    .param p1, "collection"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    .param p2, "forPage"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .param p3, "sortType"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;
    .param p4, "withFlag"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;
    .param p5, "limit"    # I
    .param p6, "completionCallback"    # Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;",
            "I",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;"
        }
    .end annotation

    .prologue
    .line 2658
    .local p7, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    const/16 v2, 0x1f4

    move/from16 v0, p5

    if-le v0, v2, :cond_1d

    .line 2659
    const-string v9, "The limit cannot be greater than 500."

    .line 2660
    .local v9, "errorStr":Ljava/lang/String;
    new-instance v10, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorBadRequest:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v10, v2}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 2661
    .local v10, "exception":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v3, "PhotoSession:ListAssetsInCollection"

    invoke-static {v2, v3, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 2662
    move-object/from16 v0, p7

    invoke-interface {v0, v10}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 2663
    const/4 v2, 0x0

    .line 2831
    .end local v9    # "errorStr":Ljava/lang/String;
    .end local v10    # "exception":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :goto_1c
    return-object v2

    .line 2666
    :cond_1d
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v4

    .line 2667
    .local v4, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    if-nez v4, :cond_43

    .line 2669
    const-string v8, "Adobe cloud not specified."

    .line 2671
    .local v8, "errorMsg":Ljava/lang/String;
    if-eqz p7, :cond_37

    .line 2673
    new-instance v7, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNoCloudSpecified:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v7, v2}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 2674
    .local v7, "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    if-eqz p7, :cond_35

    .line 2675
    move-object/from16 v0, p7

    invoke-interface {v0, v7}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 2683
    .end local v7    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_35
    :goto_35
    const/4 v2, 0x0

    goto :goto_1c

    .line 2680
    :cond_37
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_35

    .line 2686
    .end local v8    # "errorMsg":Ljava/lang/String;
    :cond_43
    const-string v13, ""

    .line 2687
    .local v13, "pageKVP":Ljava/lang/String;
    if-eqz p2, :cond_cd

    .line 2689
    const-string v2, "&%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;->getKey()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 2699
    :cond_57
    :goto_57
    const-string v12, ""

    .line 2700
    .local v12, "flagKVP":Ljava/lang/String;
    const/4 v11, 0x0

    .line 2701
    .local v11, "flagArgument":Ljava/lang/String;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$92;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobePhotoCollection$AdobePhotoCollectionFlag:[I

    invoke-virtual/range {p4 .. p4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_e8

    .line 2720
    :goto_65
    if-eqz v11, :cond_73

    .line 2721
    const-string v2, "&flag=%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v11, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 2723
    :cond_73
    const-string v2, "%s/assets?limit=%d%s%s"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getHref()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    const/4 v5, 0x1

    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v5

    const/4 v5, 0x2

    aput-object v13, v3, v5

    const/4 v5, 0x3

    aput-object v12, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 2724
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getBaseURL()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2723
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageLastPathComponentUtil;->getRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2726
    .local v17, "urlStr":Ljava/lang/String;
    :try_start_9c
    new-instance v15, Ljava/net/URI;

    move-object/from16 v0, v17

    invoke-direct {v15, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 2727
    .local v15, "uri":Ljava/net/URI;
    invoke-virtual {v15}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v16

    .line 2729
    .local v16, "url":Ljava/net/URL;
    new-instance v14, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v14}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 2730
    .local v14, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 2731
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v14, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 2733
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    invoke-direct/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$49;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 2823
    .local v1, "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v2, v3, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :try_end_ca
    .catch Ljava/net/MalformedURLException; {:try_start_9c .. :try_end_ca} :catch_e5
    .catch Ljava/net/URISyntaxException; {:try_start_9c .. :try_end_ca} :catch_e1

    move-result-object v2

    goto/16 :goto_1c

    .line 2693
    .end local v1    # "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    .end local v11    # "flagArgument":Ljava/lang/String;
    .end local v12    # "flagKVP":Ljava/lang/String;
    .end local v14    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v15    # "uri":Ljava/net/URI;
    .end local v16    # "url":Ljava/net/URL;
    .end local v17    # "urlStr":Ljava/lang/String;
    :cond_cd
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;->ADOBE_PHOTO_COLLECTION_SORT_BY_CUSTOM_ORDER:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;

    move-object/from16 v0, p3

    if-ne v0, v2, :cond_57

    .line 2695
    const-string v13, "&order_after=-"

    goto :goto_57

    .line 2704
    .restart local v11    # "flagArgument":Ljava/lang/String;
    .restart local v12    # "flagKVP":Ljava/lang/String;
    :pswitch_d6
    const/4 v11, 0x0

    .line 2705
    goto :goto_65

    .line 2708
    :pswitch_d8
    const-string v11, "pick"

    .line 2709
    goto :goto_65

    .line 2712
    :pswitch_db
    const-string v11, "unflagged"

    .line 2713
    goto :goto_65

    .line 2716
    :pswitch_de
    const-string v11, "reject"

    goto :goto_65

    .line 2827
    .restart local v17    # "urlStr":Ljava/lang/String;
    :catch_e1
    move-exception v2

    .line 2831
    :goto_e2
    const/4 v2, 0x0

    goto/16 :goto_1c

    .line 2825
    :catch_e5
    move-exception v2

    goto :goto_e2

    .line 2701
    nop

    :pswitch_data_e8
    .packed-switch 0x1
        :pswitch_d6
        :pswitch_d8
        :pswitch_db
        :pswitch_de
    .end packed-switch
.end method

.method public listCatalogsOfType(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 19
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;
    .param p2, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;",
            ">;>;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;"
        }
    .end annotation

    .prologue
    .line 842
    .local p3, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;>;>;"
    .local p4, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    move-object v5, p0

    .line 843
    .local v5, "self":Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
    const-string v8, "all"

    .line 844
    .local v8, "catalogType":Ljava/lang/String;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$92;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobePhotoCatalog$AdobePhotoCatalogType:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_72

    .line 851
    :goto_e
    const-string v10, ""

    .line 852
    .local v10, "subtypeKVP":Ljava/lang/String;
    if-eqz v8, :cond_1e

    .line 853
    const-string v1, "subtype=%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v8, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 854
    :cond_1e
    const-string v1, "/v1.0/catalogs?%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v10, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getBaseURL()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageLastPathComponentUtil;->getRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 856
    .local v13, "urlStr":Ljava/lang/String;
    :try_start_3a
    new-instance v11, Ljava/net/URI;

    invoke-direct {v11, v13}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 857
    .local v11, "uri":Ljava/net/URI;
    invoke-virtual {v11}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v12

    .line 859
    .local v12, "url":Ljava/net/URL;
    new-instance v9, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v9}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 860
    .local v9, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v9, v12}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 861
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v9, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 863
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 864
    .local v4, "catalogs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;

    move-object v1, p0

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$15;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Ljava/util/ArrayList;Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 950
    .local v0, "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v9, v1, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :try_end_67
    .catch Ljava/net/URISyntaxException; {:try_start_3a .. :try_end_67} :catch_6f
    .catch Ljava/net/MalformedURLException; {:try_start_3a .. :try_end_67} :catch_6c

    move-result-object v1

    .line 958
    .end local v0    # "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    .end local v4    # "catalogs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;>;"
    .end local v9    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v11    # "uri":Ljava/net/URI;
    .end local v12    # "url":Ljava/net/URL;
    :goto_68
    return-object v1

    .line 847
    .end local v10    # "subtypeKVP":Ljava/lang/String;
    .end local v13    # "urlStr":Ljava/lang/String;
    :pswitch_69
    const-string v8, "lightroom%3BX-lightroom"

    goto :goto_e

    .line 954
    .restart local v10    # "subtypeKVP":Ljava/lang/String;
    .restart local v13    # "urlStr":Ljava/lang/String;
    :catch_6c
    move-exception v1

    .line 958
    :goto_6d
    const/4 v1, 0x0

    goto :goto_68

    .line 952
    :catch_6f
    move-exception v1

    goto :goto_6d

    .line 844
    nop

    :pswitch_data_72
    .packed-switch 0x1
        :pswitch_69
    .end packed-switch
.end method

.method public listCollectionsInCatalog(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;Ljava/lang/String;ILcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 19
    .param p1, "catalog"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;",
            "Ljava/lang/String;",
            "I",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;",
            ">;>;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;"
        }
    .end annotation

    .prologue
    .line 1037
    .local p4, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;>;>;"
    .local p5, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v4

    .line 1038
    .local v4, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    if-nez v4, :cond_26

    .line 1040
    const-string v8, "Adobe cloud not specified."

    .line 1042
    .local v8, "errorMsg":Ljava/lang/String;
    if-eqz p5, :cond_1a

    .line 1044
    new-instance v7, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNoCloudSpecified:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v7, v2}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 1045
    .local v7, "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    if-eqz p5, :cond_18

    .line 1046
    move-object/from16 v0, p5

    invoke-interface {v0, v7}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    .line 1054
    .end local v7    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_18
    :goto_18
    const/4 v2, 0x0

    .line 1150
    .end local v8    # "errorMsg":Ljava/lang/String;
    :goto_19
    return-object v2

    .line 1051
    .restart local v8    # "errorMsg":Ljava/lang/String;
    :cond_1a
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_18

    .line 1057
    .end local v8    # "errorMsg":Ljava/lang/String;
    :cond_26
    const-string v2, "%s/albums"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getHref()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getBaseURL()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageLastPathComponentUtil;->getRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1059
    .local v12, "urlStr":Ljava/lang/String;
    :try_start_42
    new-instance v10, Ljava/net/URI;

    invoke-direct {v10, v12}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 1060
    .local v10, "uri":Ljava/net/URI;
    invoke-virtual {v10}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v11

    .line 1062
    .local v11, "url":Ljava/net/URL;
    new-instance v9, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v9}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 1063
    .local v9, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v9, v11}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 1064
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v9, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 1066
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession$18;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 1143
    .local v1, "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v9, v2, v3, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :try_end_68
    .catch Ljava/net/MalformedURLException; {:try_start_42 .. :try_end_68} :catch_6d
    .catch Ljava/net/URISyntaxException; {:try_start_42 .. :try_end_68} :catch_6a

    move-result-object v2

    goto :goto_19

    .line 1146
    .end local v1    # "callback":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    .end local v9    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v10    # "uri":Ljava/net/URI;
    .end local v11    # "url":Ljava/net/URL;
    :catch_6a
    move-exception v2

    .line 1150
    :goto_6b
    const/4 v2, 0x0

    goto :goto_19

    .line 1144
    :catch_6d
    move-exception v2

    goto :goto_6b
.end method

.method public setUpService()V
    .registers 10

    .prologue
    .line 210
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getSharedKeychain()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthKeychain;->getAdobeID()Ljava/lang/String;

    move-result-object v0

    .line 212
    .local v0, "adobeID":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->isCacheConfigured()Z

    move-result v1

    if-nez v1, :cond_2f

    if-eqz v0, :cond_2f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2f

    .line 214
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLRU:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    invoke-static {v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v6

    .line 215
    .local v6, "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    const/4 v8, 0x0

    .line 217
    .local v8, "error":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :try_start_1d
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v1

    const-string v2, "com.adobe.cc.photo"

    const/16 v3, 0x64

    const-wide/high16 v4, 0x41a0000000000000L

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->configureCache(Ljava/lang/String;IDLjava/util/EnumSet;)V
    :try_end_2a
    .catch Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException; {:try_start_1d .. :try_end_2a} :catch_30

    .line 221
    :goto_2a
    if-eqz v8, :cond_33

    .line 222
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->_cacheConfigured:Z

    .line 229
    .end local v6    # "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    .end local v8    # "error":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :cond_2f
    :goto_2f
    return-void

    .line 218
    .restart local v6    # "policy":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;>;"
    .restart local v8    # "error":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :catch_30
    move-exception v7

    .line 219
    .local v7, "e":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    move-object v8, v7

    goto :goto_2a

    .line 226
    .end local v7    # "e":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
    :cond_33
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2f
.end method

.method public tearDownService()V
    .registers 4

    .prologue
    .line 234
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->tearDownService()V

    .line 235
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    const-string v1, "com.adobe.cc.photo"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->doesCacheExist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 237
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    const-string v1, "com.adobe.cc.photo"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->printStatistics(Ljava/lang/String;)V

    .line 239
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    const-string v1, "com.adobe.cc.photo"

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeCache(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_31

    .line 241
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Removal of cache failed"

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    :cond_31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->_cacheConfigured:Z

    .line 246
    return-void
.end method
