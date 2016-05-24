.class abstract Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;
.super Ljava/lang/Object;
.source "AdobeNetworkHttpTask.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;",
        ">;"
    }
.end annotation


# static fields
.field protected static retryOn5xxDelays:[D


# instance fields
.field protected _accessToken:Ljava/lang/String;

.field protected _completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;

.field protected _numRetries:I

.field protected _request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

.field protected _requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field _response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

.field protected _urlConnection:Ljava/net/HttpURLConnection;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 74
    const/4 v0, 0x3

    new-array v0, v0, [D

    fill-array-data v0, :array_a

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->retryOn5xxDelays:[D

    return-void

    nop

    :array_a
    .array-data 8
        0x3fb999999999999aL
        0x3ff0000000000000L
        0x4000000000000000L
    .end array-data
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;

    .line 58
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 59
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_accessToken:Ljava/lang/String;

    .line 60
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    .line 61
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_numRetries:I

    .line 63
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    return-void
.end method

.method private getRFC2047DecodedValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "rawValue"    # Ljava/lang/String;

    .prologue
    .line 305
    move-object v3, p1

    .line 307
    .local v3, "resultString":Ljava/lang/String;
    if-eqz p1, :cond_45

    const-string v5, "=?"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_45

    const-string v5, "?="

    invoke-virtual {p1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_45

    .line 311
    const-string v5, "\\?"

    invoke-virtual {p1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 312
    .local v4, "subStrings":[Ljava/lang/String;
    if-eqz v4, :cond_20

    array-length v5, v4

    const/4 v6, 0x4

    if-ge v5, v6, :cond_20

    .line 329
    .end local v4    # "subStrings":[Ljava/lang/String;
    .end local p1    # "rawValue":Ljava/lang/String;
    :goto_1f
    return-object p1

    .line 315
    .restart local v4    # "subStrings":[Ljava/lang/String;
    .restart local p1    # "rawValue":Ljava/lang/String;
    :cond_20
    const/4 v5, 0x3

    aget-object v0, v4, v5

    .line 316
    .local v0, "actualData":Ljava/lang/String;
    const/4 v5, 0x2

    aget-object v1, v4, v5

    .line 318
    .local v1, "dataEncodedType":Ljava/lang/String;
    const/4 v5, 0x1

    aget-object v5, v4, v5

    const-string v6, "utf-8"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_45

    .line 319
    const-string v5, "b"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_47

    .line 321
    const/4 v5, 0x0

    invoke-static {v0, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    .line 322
    .local v2, "decodedbytes":[B
    new-instance v3, Ljava/lang/String;

    .end local v3    # "resultString":Ljava/lang/String;
    sget-object v5, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v2, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .end local v0    # "actualData":Ljava/lang/String;
    .end local v1    # "dataEncodedType":Ljava/lang/String;
    .end local v2    # "decodedbytes":[B
    .end local v4    # "subStrings":[Ljava/lang/String;
    .restart local v3    # "resultString":Ljava/lang/String;
    :cond_45
    :goto_45
    move-object p1, v3

    .line 329
    goto :goto_1f

    .line 324
    .restart local v0    # "actualData":Ljava/lang/String;
    .restart local v1    # "dataEncodedType":Ljava/lang/String;
    .restart local v4    # "subStrings":[Ljava/lang/String;
    :cond_47
    const-string v5, "q"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_45

    .line 325
    new-instance v3, Ljava/lang/String;

    .end local v3    # "resultString":Ljava/lang/String;
    sget-object v5, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v5

    sget-object v6, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v5, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .restart local v3    # "resultString":Ljava/lang/String;
    goto :goto_45
.end method

.method private setUserAgent(Ljava/net/URLConnection;)V
    .registers 8
    .param p1, "connection"    # Ljava/net/URLConnection;

    .prologue
    .line 270
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 271
    .local v1, "manufacturer":Ljava/lang/String;
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 272
    .local v2, "model":Ljava/lang/String;
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 274
    .local v0, "deviceOSVersion":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->getApplicationName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->getApplicationVersion()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Android"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 276
    .local v3, "usrAgentString":Ljava/lang/String;
    const-string v4, "User-Agent"

    invoke-virtual {p1, v4, v3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    return-void
.end method


# virtual methods
.method protected addRequestMethod()V
    .registers 5

    .prologue
    .line 354
    :try_start_0
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask$1;->$SwitchMap$com$adobe$creativesdk$foundation$internal$net$AdobeNetworkHttpRequestMethod:[I

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_46

    .line 375
    :goto_11
    return-void

    .line 356
    :pswitch_12
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    const-string v2, "GET"

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_19} :catch_1a

    goto :goto_11

    .line 371
    :catch_1a
    move-exception v0

    .line 372
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "NetworkService"

    const-string v3, "Error while setting Http request method."

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_11

    .line 359
    .end local v0    # "e":Ljava/lang/Exception;
    :pswitch_25
    :try_start_25
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    const-string v2, "DELETE"

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    goto :goto_11

    .line 362
    :pswitch_2d
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    const-string v2, "HEAD"

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    goto :goto_11

    .line 365
    :pswitch_35
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    const-string v2, "POST"

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    goto :goto_11

    .line 368
    :pswitch_3d
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    const-string v2, "PUT"

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_44} :catch_1a

    goto :goto_11

    .line 354
    nop

    :pswitch_data_46
    .packed-switch 0x1
        :pswitch_12
        :pswitch_25
        :pswitch_2d
        :pswitch_35
        :pswitch_3d
    .end packed-switch
.end method

.method public call()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .registers 9

    .prologue
    const/16 v7, 0x194

    const/4 v6, 0x0

    .line 380
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->isCancelled()Z

    move-result v3

    if-nez v3, :cond_74

    .line 382
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-direct {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .line 385
    :cond_12
    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    .line 386
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v3, v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setStatusCode(I)V

    .line 390
    :try_start_19
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->openConnection(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;)Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    .line 391
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getUrl()Ljava/net/URL;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setURL(Ljava/net/URL;)V

    .line 392
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->addRequestMethod()V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_31} :catch_7c

    .line 398
    :goto_31
    const/4 v2, 0x0

    .line 399
    .local v2, "isTaskCancelled":Z
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    if-eqz v3, :cond_6c

    .line 401
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->useAccessTokenInHeaders()V

    .line 404
    :try_start_39
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->writeToOutputStream()V

    .line 405
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->isCancelled()Z
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_39 .. :try_end_41} :catch_98

    move-result v2

    .line 406
    if-nez v2, :cond_5d

    .line 409
    :try_start_44
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setStatusCode(I)V
    :try_end_4f
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_4f} :catch_8b

    .line 413
    :goto_4f
    :try_start_4f
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->parseHttpHeaders(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    .line 414
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->captureInputStream()V

    .line 415
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->isCancelled()Z
    :try_end_5c
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_5c} :catch_98

    move-result v2

    .line 426
    :cond_5d
    :goto_5d
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    if-eqz v3, :cond_6c

    .line 428
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 429
    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    .line 430
    if-eqz v2, :cond_6c

    .line 431
    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .line 436
    :cond_6c
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->checkIfShouldRetry(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Z

    move-result v3

    if-nez v3, :cond_12

    .line 438
    .end local v2    # "isTaskCancelled":Z
    :cond_74
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->onPostExecute(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    .line 439
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    return-object v3

    .line 394
    :catch_7c
    move-exception v0

    .line 395
    .local v0, "e":Ljava/io/IOException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Error opening url connection"

    invoke-static {v3, v4, v5, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_31

    .line 410
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "isTaskCancelled":Z
    :catch_8b
    move-exception v0

    .line 411
    .restart local v0    # "e":Ljava/io/IOException;
    :try_start_8c
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setStatusCode(I)V
    :try_end_97
    .catch Ljava/io/IOException; {:try_start_8c .. :try_end_97} :catch_98

    goto :goto_4f

    .line 417
    .end local v0    # "e":Ljava/io/IOException;
    :catch_98
    move-exception v1

    .line 418
    .local v1, "exception":Ljava/io/IOException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Error during io operation"

    invoke-static {v3, v4, v5, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 419
    instance-of v3, v1, Ljavax/net/ssl/SSLException;

    if-eqz v3, :cond_b7

    .line 420
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    const/16 v4, 0x258

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setStatusCode(I)V

    .line 423
    :goto_b1
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v3, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setNetworkException(Ljava/lang/Exception;)V

    goto :goto_5d

    .line 422
    :cond_b7
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v3, v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setStatusCode(I)V

    goto :goto_b1
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->call()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method protected captureData(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 9
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 200
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v3

    .line 201
    .local v3, "statusCode":I
    const/16 v4, 0xc8

    if-lt v3, v4, :cond_31

    const/16 v4, 0x12b

    if-ge v3, v4, :cond_31

    .line 203
    :try_start_c
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 204
    .local v2, "is":Ljava/io/InputStream;
    if-eqz v2, :cond_22

    .line 205
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 206
    .local v0, "bytes":[B
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setData(Ljava/nio/ByteBuffer;)V

    .line 207
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_22} :catch_23

    .line 226
    .end local v0    # "bytes":[B
    .end local v2    # "is":Ljava/io/InputStream;
    :cond_22
    :goto_22
    return-void

    .line 209
    :catch_23
    move-exception v1

    .line 210
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 211
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v5, "NetworkService"

    const-string v6, "Error during io operation"

    invoke-static {v4, v5, v6, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_22

    .line 215
    .end local v1    # "e":Ljava/io/IOException;
    :cond_31
    :try_start_31
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v2

    .line 216
    .restart local v2    # "is":Ljava/io/InputStream;
    if-eqz v2, :cond_22

    .line 217
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 218
    .restart local v0    # "bytes":[B
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setData(Ljava/nio/ByteBuffer;)V

    .line 219
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_47} :catch_48

    goto :goto_22

    .line 221
    .end local v0    # "bytes":[B
    .end local v2    # "is":Ljava/io/InputStream;
    :catch_48
    move-exception v1

    .line 222
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 223
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v5, "NetworkService"

    const-string v6, "Error during io operation"

    invoke-static {v4, v5, v6, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_22
.end method

.method protected abstract captureInputStream()V
.end method

.method protected checkIfShouldRetry(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Z
    .registers 10
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 280
    const/4 v1, 0x0

    .line 282
    .local v1, "shouldRetry":Z
    if-eqz p1, :cond_31

    .line 284
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v2

    .line 285
    .local v2, "statusCode":I
    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_numRetries:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_numRetries:I

    .line 288
    const/16 v3, 0x1f3

    if-le v2, v3, :cond_31

    const/16 v3, 0x258

    if-ge v2, v3, :cond_31

    const/16 v3, 0x1fb

    if-eq v2, v3, :cond_31

    .line 290
    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_numRetries:I

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->retryOn5xxDelays:[D

    array-length v4, v4

    if-ge v3, v4, :cond_31

    .line 291
    const/4 v1, 0x1

    .line 293
    :try_start_21
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->retryOn5xxDelays:[D

    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_numRetries:I

    aget-wide v4, v3, v4

    const-wide v6, 0x408f400000000000L

    mul-double/2addr v4, v6

    double-to-long v4, v4

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_31
    .catch Ljava/lang/InterruptedException; {:try_start_21 .. :try_end_31} :catch_32

    .line 301
    .end local v2    # "statusCode":I
    :cond_31
    :goto_31
    return v1

    .line 294
    .restart local v2    # "statusCode":I
    :catch_32
    move-exception v0

    .line 295
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v4, "NetworkService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Retry connection for"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_31
.end method

.method public init(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V
    .registers 7
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "accessToken"    # Ljava/lang/String;
    .param p3, "responseHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;
    .param p4, "requestHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .prologue
    const/4 v1, 0x0

    .line 77
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 78
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;

    .line 79
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 80
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_accessToken:Ljava/lang/String;

    .line 81
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    .line 82
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_numRetries:I

    .line 83
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .line 84
    return-void
.end method

.method protected onPostExecute(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 3
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 235
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;

    if-eqz v0, :cond_9

    .line 236
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_completionHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;->handleResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    .line 238
    :cond_9
    return-void
.end method

.method protected onProgressUpdate(Ljava/lang/Integer;)V
    .registers 4
    .param p1, "progress"    # Ljava/lang/Integer;

    .prologue
    .line 230
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->notifyProgress(I)V

    .line 231
    return-void
.end method

.method protected openConnection(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;)Ljava/net/URLConnection;
    .registers 7
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 241
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getUrl()Ljava/net/URL;

    move-result-object v2

    .line 242
    .local v2, "url":Ljava/net/URL;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getQueryString()Ljava/lang/String;

    move-result-object v1

    .line 243
    .local v1, "queryParameters":Ljava/lang/String;
    if-eqz v1, :cond_44

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_44

    .line 244
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-eq v3, v4, :cond_20

    .line 245
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodHEAD:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-ne v3, v4, :cond_44

    .line 246
    :cond_20
    new-instance v2, Ljava/net/URL;

    .end local v2    # "url":Ljava/net/URL;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getUrl()Ljava/net/URL;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getQueryString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 248
    .restart local v2    # "url":Ljava/net/URL;
    :cond_44
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 249
    .local v0, "connection":Ljava/net/URLConnection;
    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->setHttpRequestParameters(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/net/URLConnection;)V

    .line 250
    return-object v0
.end method

.method protected parseHttpHeaders(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 10
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 333
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 334
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v5

    .line 335
    .local v5, "responseMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_13
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_45

    .line 336
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 338
    .local v4, "key":Ljava/lang/String;
    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 339
    .local v6, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 340
    .local v0, "headerValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2b
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    if-ge v2, v7, :cond_41

    .line 343
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-direct {p0, v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->getRFC2047DecodedValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 340
    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    .line 345
    :cond_41
    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_13

    .line 347
    .end local v0    # "headerValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "i":I
    .end local v4    # "key":Ljava/lang/String;
    .end local v6    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_45
    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setHeaders(Ljava/util/Map;)V

    .line 349
    return-void
.end method

.method protected setHttpRequestParameters(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/net/URLConnection;)V
    .registers 9
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "connection"    # Ljava/net/URLConnection;

    .prologue
    .line 254
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestProperties()Ljava/util/Map;

    move-result-object v2

    .line 255
    .local v2, "requestProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 257
    .local v0, "keyValuePairs":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 258
    .local v1, "kvPair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p2, v3, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c

    .line 261
    .end local v1    # "kvPair":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_28
    invoke-static {}, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->getApplicationName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3d

    invoke-static {}, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->getApplicationName()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3d

    .line 263
    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->setUserAgent(Ljava/net/URLConnection;)V

    .line 265
    :cond_3d
    const-string v3, "Connection"

    const-string v4, "close"

    invoke-virtual {p2, v3, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    return-void
.end method

.method protected useAccessTokenInHeaders()V
    .registers 5

    .prologue
    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_accessToken:Ljava/lang/String;

    if-eqz v0, :cond_20

    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    const-string v1, "Authorization"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bearer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_accessToken:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    :cond_20
    return-void
.end method

.method protected writeToOutputStream()V
    .registers 23

    .prologue
    .line 89
    const/16 v16, 0x0

    .line 91
    .local v16, "wr":Ljava/io/DataOutputStream;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v18

    sget-object v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPOST:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_1c1

    .line 92
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 94
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getQueryParams()Ljava/util/Map;

    move-result-object v18

    if-eqz v18, :cond_1a4

    .line 95
    new-instance v14, Ljava/util/LinkedList;

    invoke-direct {v14}, Ljava/util/LinkedList;-><init>()V

    .line 96
    .local v14, "paramsList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    .line 97
    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getQueryParams()Ljava/util/Map;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v18

    .line 96
    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_42
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_88

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map$Entry;

    .line 98
    .local v11, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v21, Lorg/apache/http/message/BasicNameValuePair;

    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 99
    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    move-object/from16 v0, v21

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_6a} :catch_6b
    .catchall {:try_start_2 .. :try_end_6a} :catchall_277

    goto :goto_42

    .line 169
    .end local v11    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v14    # "paramsList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :catch_6b
    move-exception v9

    .line 170
    .local v9, "e":Ljava/lang/Exception;
    :goto_6c
    :try_start_6c
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    .line 171
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;

    .line 172
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    .line 171
    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_82
    .catchall {:try_start_6c .. :try_end_82} :catchall_277

    .line 176
    if-eqz v16, :cond_87

    .line 179
    :try_start_84
    invoke-virtual/range {v16 .. v16}, Ljava/io/DataOutputStream;->close()V
    :try_end_87
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_87} :catch_24c

    .line 187
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_87
    :goto_87
    return-void

    .line 102
    .restart local v14    # "paramsList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :cond_88
    :try_start_88
    const-string v18, "UTF-8"

    move-object/from16 v0, v18

    invoke-static {v14, v0}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 105
    .local v13, "paramString":Ljava/lang/String;
    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-eqz v18, :cond_b3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    .line 106
    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getBody()[B

    move-result-object v18

    if-eqz v18, :cond_1a4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    .line 107
    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getBody()[B

    move-result-object v18

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    if-eqz v18, :cond_1a4

    .line 108
    :cond_b3
    new-instance v17, Ljava/io/DataOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    .line 109
    invoke-virtual/range {v18 .. v18}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_c2
    .catch Ljava/lang/Exception; {:try_start_88 .. :try_end_c2} :catch_6b
    .catchall {:try_start_88 .. :try_end_c2} :catchall_277

    .line 110
    .end local v16    # "wr":Ljava/io/DataOutputStream;
    .local v17, "wr":Ljava/io/DataOutputStream;
    :try_start_c2
    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_cd

    .line 111
    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 112
    :cond_cd
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getBody()[B

    move-result-object v18

    if-eqz v18, :cond_19f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    .line 113
    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getBody()[B

    move-result-object v18

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    if-eqz v18, :cond_19f

    .line 115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getBody()[B

    move-result-object v18

    move-object/from16 v0, v18

    array-length v15, v0

    .line 116
    .local v15, "totalBytes":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getBody()[B

    move-result-object v18

    move-object/from16 v0, v18

    array-length v6, v0

    .line 118
    .local v6, "bytesAvailable":I
    new-instance v5, Ljava/io/ByteArrayInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getBody()[B

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v5, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 120
    .local v5, "byteStream":Ljava/io/ByteArrayInputStream;
    const/16 v18, 0x1000

    move/from16 v0, v18

    invoke-static {v6, v0}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 121
    .local v4, "bufferSize":I
    new-array v3, v4, [B

    .line 124
    .local v3, "buffer":[B
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v5, v3, v0, v4}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result v7

    .line 125
    .local v7, "bytesRead":I
    const/4 v8, 0x0

    .line 126
    .local v8, "bytesUploadedTillNow":I
    :goto_128
    if-lez v7, :cond_191

    .line 127
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->isCancelled()Z
    :try_end_133
    .catch Ljava/lang/Exception; {:try_start_c2 .. :try_end_133} :catch_18c
    .catchall {:try_start_c2 .. :try_end_133} :catchall_243

    move-result v18

    if-eqz v18, :cond_154

    .line 176
    if-eqz v17, :cond_13b

    .line 179
    :try_start_138
    invoke-virtual/range {v17 .. v17}, Ljava/io/DataOutputStream;->close()V
    :try_end_13b
    .catch Ljava/io/IOException; {:try_start_138 .. :try_end_13b} :catch_13f

    :cond_13b
    :goto_13b
    move-object/from16 v16, v17

    .line 129
    .end local v17    # "wr":Ljava/io/DataOutputStream;
    .restart local v16    # "wr":Ljava/io/DataOutputStream;
    goto/16 :goto_87

    .line 180
    .end local v16    # "wr":Ljava/io/DataOutputStream;
    .restart local v17    # "wr":Ljava/io/DataOutputStream;
    :catch_13f
    move-exception v10

    .line 181
    .local v10, "e1":Ljava/io/IOException;
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;

    .line 182
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    .line 181
    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v10}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_13b

    .line 132
    .end local v10    # "e1":Ljava/io/IOException;
    :cond_154
    const/16 v18, 0x0

    :try_start_156
    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v0, v3, v1, v7}, Ljava/io/DataOutputStream;->write([BII)V

    .line 133
    add-int/2addr v8, v7

    .line 134
    sub-int/2addr v6, v7

    .line 135
    const/16 v18, 0x1000

    move/from16 v0, v18

    invoke-static {v6, v0}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 136
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v5, v3, v0, v4}, Ljava/io/ByteArrayInputStream;->read([BII)I

    move-result v7

    .line 138
    int-to-float v0, v8

    move/from16 v18, v0

    int-to-float v0, v15

    move/from16 v19, v0

    div-float v18, v18, v19

    const/high16 v19, 0x42c80000

    mul-float v18, v18, v19

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->onProgressUpdate(Ljava/lang/Integer;)V

    goto :goto_128

    .line 169
    .end local v3    # "buffer":[B
    .end local v4    # "bufferSize":I
    .end local v5    # "byteStream":Ljava/io/ByteArrayInputStream;
    .end local v6    # "bytesAvailable":I
    .end local v7    # "bytesRead":I
    .end local v8    # "bytesUploadedTillNow":I
    .end local v13    # "paramString":Ljava/lang/String;
    .end local v14    # "paramsList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v15    # "totalBytes":I
    :catch_18c
    move-exception v9

    move-object/from16 v16, v17

    .end local v17    # "wr":Ljava/io/DataOutputStream;
    .restart local v16    # "wr":Ljava/io/DataOutputStream;
    goto/16 :goto_6c

    .line 143
    .end local v16    # "wr":Ljava/io/DataOutputStream;
    .restart local v3    # "buffer":[B
    .restart local v4    # "bufferSize":I
    .restart local v5    # "byteStream":Ljava/io/ByteArrayInputStream;
    .restart local v6    # "bytesAvailable":I
    .restart local v7    # "bytesRead":I
    .restart local v8    # "bytesUploadedTillNow":I
    .restart local v13    # "paramString":Ljava/lang/String;
    .restart local v14    # "paramsList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v15    # "totalBytes":I
    .restart local v17    # "wr":Ljava/io/DataOutputStream;
    :cond_191
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setBytesSent(I)V

    .line 144
    invoke-virtual {v5}, Ljava/io/ByteArrayInputStream;->close()V

    .line 150
    .end local v3    # "buffer":[B
    .end local v4    # "bufferSize":I
    .end local v5    # "byteStream":Ljava/io/ByteArrayInputStream;
    .end local v6    # "bytesAvailable":I
    .end local v7    # "bytesRead":I
    .end local v8    # "bytesUploadedTillNow":I
    .end local v15    # "totalBytes":I
    :cond_19f
    invoke-virtual/range {v17 .. v17}, Ljava/io/DataOutputStream;->flush()V
    :try_end_1a2
    .catch Ljava/lang/Exception; {:try_start_156 .. :try_end_1a2} :catch_18c
    .catchall {:try_start_156 .. :try_end_1a2} :catchall_243

    .end local v13    # "paramString":Ljava/lang/String;
    .end local v14    # "paramsList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :goto_1a2
    move-object/from16 v16, v17

    .line 176
    .end local v17    # "wr":Ljava/io/DataOutputStream;
    .restart local v16    # "wr":Ljava/io/DataOutputStream;
    :cond_1a4
    if-eqz v16, :cond_87

    .line 179
    :try_start_1a6
    invoke-virtual/range {v16 .. v16}, Ljava/io/DataOutputStream;->close()V
    :try_end_1a9
    .catch Ljava/io/IOException; {:try_start_1a6 .. :try_end_1a9} :catch_1ab

    goto/16 :goto_87

    .line 180
    :catch_1ab
    move-exception v10

    .line 181
    .restart local v10    # "e1":Ljava/io/IOException;
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;

    .line 182
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    .line 181
    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v10}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_87

    .line 155
    .end local v10    # "e1":Ljava/io/IOException;
    :cond_1c1
    :try_start_1c1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v18

    sget-object v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPUT:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_1a4

    .line 157
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getBody()[B

    move-result-object v18

    if-eqz v18, :cond_1a4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getBody()[B

    move-result-object v18

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    if-eqz v18, :cond_1a4

    .line 159
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getUrl()Ljava/net/URL;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v18

    const-string v19, "UTF-8"

    invoke-static/range {v18 .. v19}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/apache/commons/io/FilenameUtils;->getName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 162
    .local v12, "filename":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    const-string v19, "file"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    new-instance v17, Ljava/io/DataOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_231
    .catch Ljava/lang/Exception; {:try_start_1c1 .. :try_end_231} :catch_6b
    .catchall {:try_start_1c1 .. :try_end_231} :catchall_277

    .line 165
    .end local v16    # "wr":Ljava/io/DataOutputStream;
    .restart local v17    # "wr":Ljava/io/DataOutputStream;
    :try_start_231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getBody()[B

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/io/DataOutputStream;->write([B)V

    .line 166
    invoke-virtual/range {v17 .. v17}, Ljava/io/DataOutputStream;->flush()V
    :try_end_241
    .catch Ljava/lang/Exception; {:try_start_231 .. :try_end_241} :catch_18c
    .catchall {:try_start_231 .. :try_end_241} :catchall_243

    goto/16 :goto_1a2

    .line 176
    .end local v12    # "filename":Ljava/lang/String;
    :catchall_243
    move-exception v18

    move-object/from16 v16, v17

    .end local v17    # "wr":Ljava/io/DataOutputStream;
    .restart local v16    # "wr":Ljava/io/DataOutputStream;
    :goto_246
    if-eqz v16, :cond_24b

    .line 179
    :try_start_248
    invoke-virtual/range {v16 .. v16}, Ljava/io/DataOutputStream;->close()V
    :try_end_24b
    .catch Ljava/io/IOException; {:try_start_248 .. :try_end_24b} :catch_262

    .line 184
    :cond_24b
    :goto_24b
    throw v18

    .line 180
    .restart local v9    # "e":Ljava/lang/Exception;
    :catch_24c
    move-exception v10

    .line 181
    .restart local v10    # "e1":Ljava/io/IOException;
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;

    .line 182
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    .line 181
    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v10}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_87

    .line 180
    .end local v9    # "e":Ljava/lang/Exception;
    .end local v10    # "e1":Ljava/io/IOException;
    :catch_262
    move-exception v10

    .line 181
    .restart local v10    # "e1":Ljava/io/IOException;
    sget-object v19, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v20, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;

    .line 182
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v20

    const-string v21, "Error during io operation"

    .line 181
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2, v10}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_24b

    .line 176
    .end local v10    # "e1":Ljava/io/IOException;
    :catchall_277
    move-exception v18

    goto :goto_246
.end method
