.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;
.super Ljava/lang/Object;
.source "AdobeStorageAsyncResponseHandler.java"


# instance fields
.field callback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;

.field secondsToRetry:J

.field session:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;


# direct methods
.method protected constructor <init>(JLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;)V
    .registers 6
    .param p1, "secondsToRetry"    # J
    .param p3, "session"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    .param p4, "callback"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-wide p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->secondsToRetry:J

    .line 37
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->callback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;

    .line 38
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->session:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;Ljava/lang/String;JLandroid/os/Handler;)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # J
    .param p4, "x3"    # Landroid/os/Handler;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->poll(Ljava/lang/String;JLandroid/os/Handler;)V

    return-void
.end method

.method private poll(Ljava/lang/String;JLandroid/os/Handler;)V
    .registers 19
    .param p1, "href"    # Ljava/lang/String;
    .param p2, "frequency"    # J
    .param p4, "callbackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    .line 62
    :try_start_0
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->session:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .line 63
    .local v10, "storageSession":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    const-string v0, "files"

    invoke-virtual {v10, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v9

    .line 64
    .local v9, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    new-instance v11, Ljava/net/URI;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v11, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 66
    .local v11, "uri":Ljava/net/URI;
    invoke-virtual {v11}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v12

    .line 67
    .local v12, "url":Ljava/net/URL;
    new-instance v8, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 68
    .local v8, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v8, v12}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 69
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 71
    const/4 v6, 0x0

    const/4 v13, 0x0

    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;

    move-object v1, p0

    move-wide/from16 v2, p2

    move-object v4, p1

    move-object/from16 v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;JLjava/lang/String;Landroid/os/Handler;)V

    move-object v1, v10

    move-object v2, v8

    move-object v3, v6

    move-object v4, v13

    move-object v5, v0

    move-object/from16 v6, p4

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :try_end_4e
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_4e} :catch_4f
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_4e} :catch_54

    .line 133
    .end local v8    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v9    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .end local v10    # "storageSession":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    .end local v11    # "uri":Ljava/net/URI;
    .end local v12    # "url":Ljava/net/URL;
    :goto_4e
    return-void

    .line 128
    :catch_4f
    move-exception v7

    .line 129
    .local v7, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v7}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_4e

    .line 130
    .end local v7    # "e":Ljava/net/MalformedURLException;
    :catch_54
    move-exception v7

    .line 131
    .local v7, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v7}, Ljava/net/URISyntaxException;->printStackTrace()V

    goto :goto_4e
.end method


# virtual methods
.method public startMonitoringServiceEndPoint(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 8
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 44
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 45
    .local v3, "jsonObject":Lorg/json/JSONObject;
    const-string v4, "href"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_e} :catch_1e

    move-result-object v2

    .line 47
    .local v2, "href":Ljava/lang/String;
    const/4 v0, 0x0

    .line 49
    .local v0, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_10
    new-instance v0, Landroid/os/Handler;

    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_15} :catch_1b
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_15} :catch_1e

    .line 53
    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_15
    :try_start_15
    iget-wide v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->secondsToRetry:J

    invoke-direct {p0, v2, v4, v5, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->poll(Ljava/lang/String;JLandroid/os/Handler;)V
    :try_end_1a
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_1a} :catch_1e

    .line 58
    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    .end local v2    # "href":Ljava/lang/String;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    :goto_1a
    return-void

    .line 50
    .restart local v2    # "href":Ljava/lang/String;
    .restart local v3    # "jsonObject":Lorg/json/JSONObject;
    :catch_1b
    move-exception v1

    .line 51
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_15

    .line 54
    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "href":Ljava/lang/String;
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    :catch_1e
    move-exception v1

    .line 56
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1a
.end method
