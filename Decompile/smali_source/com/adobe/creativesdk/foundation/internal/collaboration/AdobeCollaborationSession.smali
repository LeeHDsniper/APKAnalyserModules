.class public Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
.super Ljava/lang/Object;
.source "AdobeCollaborationSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$15;,
        Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;,
        Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    }
.end annotation


# static fields
.field private static imsEnvironment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

.field private static imsService:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

.field private static observer:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;

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

.field private static sharedSession:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;


# instance fields
.field private service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 49
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .line 53
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->observer:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->observer:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;

    .line 58
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaborationExceptionFromNetworkResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->jsonObjectFromResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->jsonArrayFromResponse(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500()Ljava/util/Map;
    .registers 1

    .prologue
    .line 47
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->requestMap:Ljava/util/Map;

    return-object v0
.end method

.method private dataUsingEncoding(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p1, "postData"    # Ljava/lang/String;

    .prologue
    .line 841
    return-object p1
.end method

.method private getCollaborationExceptionFromNetworkResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    .registers 9
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 890
    if-nez p1, :cond_4

    .line 891
    const/4 v0, 0x0

    .line 911
    :cond_3
    :goto_3
    return-object v0

    .line 893
    :cond_4
    const/4 v0, 0x0

    .line 894
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v1

    .line 904
    .local v1, "status":I
    const/16 v2, 0x191

    if-ne v1, v2, :cond_23

    .line 905
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;->ADOBE_COLLABORATION_ERROR_UNAUTHORIZED:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 906
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 905
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrUtils;->createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    .line 907
    :cond_23
    if-nez v0, :cond_3

    .line 908
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;->ADOBE_COLLABORATION_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getUrl()Ljava/net/URL;

    move-result-object v3

    .line 909
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v5

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v6

    .line 908
    invoke-static {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrUtils;->createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    goto :goto_3
.end method

.method private getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 13
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "data"    # Ljava/lang/String;
    .param p4, "responseCallback"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;

    .prologue
    .line 655
    const/4 v5, 0x0

    .line 657
    .local v5, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_1
    new-instance v5, Landroid/os/Handler;

    .end local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v5}, Landroid/os/Handler;-><init>()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_24

    .line 662
    .restart local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_6
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$11;

    invoke-direct {v4, p0, p1, p4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$11;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)V

    .line 677
    .local v4, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    if-nez p2, :cond_27

    .line 678
    if-eqz p3, :cond_16

    .line 679
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setBody([B)V

    .line 680
    :cond_16
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    invoke-virtual {v0, p1, v1, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v7

    .line 690
    .local v7, "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :goto_1e
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->requestMap:Ljava/util/Map;

    invoke-interface {v0, p1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 691
    return-object p1

    .line 658
    .end local v4    # "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .end local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    .end local v7    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :catch_24
    move-exception v6

    .line 659
    .local v6, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    .restart local v5    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_6

    .line 681
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v4    # "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    :cond_27
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-ne v0, v1, :cond_3a

    .line 682
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDownloadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v7

    .restart local v7    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    goto :goto_1e

    .line 684
    .end local v7    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :cond_3a
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestMethod()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodHEAD:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    if-ne v0, v1, :cond_4b

    .line 685
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    invoke-virtual {v0, p1, v1, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v7

    .restart local v7    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    goto :goto_1e

    .line 687
    .end local v7    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    :cond_4b
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForUploadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-result-object v7

    .restart local v7    # "handle":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    goto :goto_1e
.end method

.method private getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 9
    .param p1, "urlString"    # Ljava/lang/String;
    .param p2, "responseCallBack"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;

    .prologue
    const/4 v3, 0x0

    .line 608
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-object v0, p0

    move-object v1, p1

    move-object v4, v3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v0

    return-object v0
.end method

.method private getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 10
    .param p1, "urlString"    # Ljava/lang/String;
    .param p2, "httpMethod"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    .param p3, "responseCallback"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;

    .prologue
    const/4 v3, 0x0

    .line 612
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, v3

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v0

    return-object v0
.end method

.method private getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 13
    .param p1, "urlString"    # Ljava/lang/String;
    .param p2, "httpMethod"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    .param p3, "postData"    # Ljava/lang/String;
    .param p4, "contentType"    # Ljava/lang/String;
    .param p5, "responseCallback"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;

    .prologue
    const/4 v4, 0x0

    .line 616
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 642
    :cond_7
    :goto_7
    return-object v4

    .line 620
    :cond_8
    invoke-direct {p0, p3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_14

    invoke-direct {p0, p4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_7

    .line 625
    :cond_14
    :try_start_14
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 626
    .local v1, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    new-instance v2, Ljava/net/URI;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 627
    .local v2, "uri":Ljava/net/URI;
    invoke-virtual {v2}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v3

    .line 628
    .local v3, "url":Ljava/net/URL;
    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 629
    invoke-virtual {v1, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 630
    if-eqz p3, :cond_55

    .line 631
    const-string v5, "Accept"

    invoke-virtual {v1, v5, p4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 632
    const-string v5, "Content-Type"

    invoke-virtual {v1, v5, p4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 636
    :cond_55
    const/4 v6, 0x0

    if-eqz p3, :cond_61

    invoke-direct {p0, p3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->dataUsingEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_5c
    invoke-direct {p0, v1, v6, v5, p5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    :try_end_5f
    .catch Ljava/net/URISyntaxException; {:try_start_14 .. :try_end_5f} :catch_63
    .catch Ljava/net/MalformedURLException; {:try_start_14 .. :try_end_5f} :catch_68

    move-result-object v4

    goto :goto_7

    :cond_61
    move-object v5, v4

    goto :goto_5c

    .line 637
    .end local v1    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v2    # "uri":Ljava/net/URI;
    .end local v3    # "url":Ljava/net/URL;
    :catch_63
    move-exception v0

    .line 638
    .local v0, "exp":Ljava/net/URISyntaxException;
    invoke-virtual {v0}, Ljava/net/URISyntaxException;->printStackTrace()V

    goto :goto_7

    .line 640
    .end local v0    # "exp":Ljava/net/URISyntaxException;
    :catch_68
    move-exception v0

    .line 641
    .local v0, "exp":Ljava/net/MalformedURLException;
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_7
.end method

.method private getResponseFromError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .registers 4
    .param p1, "exception"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 915
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->getData()Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "Response"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 916
    :cond_12
    const/4 v0, 0x0

    .line 918
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

.method public static getSharedSession()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    .registers 8

    .prologue
    .line 61
    const-class v5, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    monitor-enter v5

    .line 62
    :try_start_3
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    if-nez v4, :cond_89

    .line 63
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    invoke-direct {v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;-><init>()V

    sput-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .line 64
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v4

    sput-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->imsService:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    .line 65
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->imsService:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "accessToken":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->imsService:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v4

    sput-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->imsEnvironment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    .line 68
    const/4 v3, 0x0

    .line 69
    .local v3, "serviceUrl":Ljava/lang/String;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 71
    .local v1, "additionalHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$15;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->imsEnvironment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v6

    aget v4, v4, v6

    packed-switch v4, :pswitch_data_b0

    .line 88
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v6, "Collaboration Session"

    const-string v7, "An undefined authentication endpoint has been specified for the collaboration session"

    invoke-static {v4, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    :goto_3e
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    sput-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->requestMap:Ljava/util/Map;

    .line 93
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->imsService:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 94
    .local v2, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setAccessToken(Ljava/lang/String;)V

    .line 95
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    invoke-virtual {v4, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->initWithHTTPService(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .line 98
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->getSharedModel()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    move-result-object v4

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    invoke-virtual {v4, v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->setCollaborationSession(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;)V

    .line 101
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->getSharedModel()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setHttpServiceDelegate(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;)V

    .line 102
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v4

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->observer:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;

    invoke-virtual {v4, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 103
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v4

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->observer:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;

    invoke-virtual {v4, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 104
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v4

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginExternalNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->observer:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$LoginNotificationObserver;

    invoke-virtual {v4, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 107
    :cond_89
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    monitor-exit v5

    return-object v4

    .line 73
    .end local v2    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :pswitch_8d
    const-string v3, "https://cc-collab-dev.adobe.io"

    .line 74
    goto :goto_3e

    .line 77
    :pswitch_90
    const-string v3, "https://cc-collab-stage.adobe.io"

    .line 78
    const-string v4, "x-api-key"

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->imsService:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3e

    .line 108
    .end local v1    # "additionalHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "serviceUrl":Ljava/lang/String;
    :catchall_9e
    move-exception v4

    monitor-exit v5
    :try_end_a0
    .catchall {:try_start_3 .. :try_end_a0} :catchall_9e

    throw v4

    .line 82
    .restart local v1    # "additionalHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "serviceUrl":Ljava/lang/String;
    :pswitch_a1
    :try_start_a1
    const-string v3, "https://cc-collab.adobe.io"

    .line 83
    const-string v4, "x-api-key"

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->imsService:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_ae
    .catchall {:try_start_a1 .. :try_end_ae} :catchall_9e

    goto :goto_3e

    .line 71
    nop

    :pswitch_data_b0
    .packed-switch 0x1
        :pswitch_8d
        :pswitch_90
        :pswitch_a1
    .end packed-switch
.end method

.method private isEmpty(Ljava/lang/String;)Z
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 824
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_a

    .line 825
    :cond_8
    const/4 v0, 0x1

    .line 826
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static jsonArrayFromResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 3
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 856
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_5} :catch_6

    .line 861
    :goto_5
    return-object v1

    .line 857
    :catch_6
    move-exception v0

    .line 858
    .local v0, "exp":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 861
    const/4 v1, 0x0

    goto :goto_5
.end method

.method private static jsonObjectFromResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 3
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 847
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_5} :catch_6

    .line 851
    :goto_5
    return-object v1

    .line 848
    :catch_6
    move-exception v0

    .line 849
    .local v0, "exp":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 851
    const/4 v1, 0x0

    goto :goto_5
.end method


# virtual methods
.method public createComment(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeAddCommentCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 16
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p2, "userName"    # Ljava/lang/String;
    .param p3, "emailAddress"    # Ljava/lang/String;
    .param p4, "comment"    # Ljava/lang/String;
    .param p5, "callback"    # Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeAddCommentCallback;

    .prologue
    .line 735
    if-nez p1, :cond_10

    .line 736
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "createComment"

    const-string v3, "resource cannot be null."

    invoke-static {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 737
    invoke-interface {p5}, Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeAddCommentCallback;->onError()V

    .line 738
    const/4 v9, 0x0

    .line 780
    :cond_f
    :goto_f
    return-object v9

    .line 741
    :cond_10
    const/4 v9, 0x0

    .line 743
    .local v9, "returnRequest":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    const-string v1, "comments"

    .line 745
    .local v1, "urlString":Ljava/lang/String;
    :try_start_13
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 746
    .local v8, "postData":Lorg/json/JSONObject;
    const-string v0, "resourceType"

    const-string v2, "application/vnd.adobe.asset"

    invoke-virtual {v8, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 747
    const-string v0, "resource"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getHref()Ljava/net/URI;

    move-result-object v2

    invoke-virtual {v8, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 748
    const-string v0, "username"

    invoke-virtual {v8, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 749
    const-string v0, "email"

    invoke-virtual {v8, v0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 750
    const-string v0, "content"

    invoke-virtual {v8, v0, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 751
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 752
    .local v7, "object":Lorg/json/JSONObject;
    const-string v0, "attributes"

    invoke-virtual {v8, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 753
    if-eqz v8, :cond_f

    .line 755
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$13;

    invoke-direct {v5, p0, p5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$13;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeAddCommentCallback;)V

    .line 773
    .local v5, "responseCallback":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPOST:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "application/json"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    :try_end_54
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_54} :catch_56

    move-result-object v9

    goto :goto_f

    .line 775
    .end local v5    # "responseCallback":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    .end local v7    # "object":Lorg/json/JSONObject;
    .end local v8    # "postData":Lorg/json/JSONObject;
    :catch_56
    move-exception v6

    .line 777
    .local v6, "exp":Lorg/json/JSONException;
    invoke-interface {p5}, Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeAddCommentCallback;->onError()V

    .line 778
    const/4 v9, 0x0

    goto :goto_f
.end method

.method public createInvite(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 18
    .param p1, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .param p2, "email"    # Ljava/lang/String;
    .param p3, "inviteUserCallBack"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;

    .prologue
    .line 220
    if-nez p1, :cond_12

    .line 221
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;->ADOBE_COLLABORATION_ERROR_INVALID_FOLDER:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;

    const/4 v3, 0x0

    const-string v5, "Invalid Folder"

    invoke-static {v1, v3, v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrUtils;->createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v10

    .line 222
    .local v10, "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    move-object/from16 v0, p3

    invoke-interface {v0, v10}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    .line 223
    const/4 v1, 0x0

    .line 271
    .end local v10    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    :goto_11
    return-object v1

    .line 225
    :cond_12
    if-eqz p2, :cond_1a

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2a

    .line 226
    :cond_1a
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;->ADOBE_COLLABORATION_ERROR_INVALID_EMAIL:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;

    const/4 v3, 0x0

    const-string v5, "Invalid Email Address"

    invoke-static {v1, v3, v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrUtils;->createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v10

    .line 227
    .restart local v10    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    move-object/from16 v0, p3

    invoke-interface {v0, v10}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    .line 228
    const/4 v1, 0x0

    goto :goto_11

    .line 230
    .end local v10    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    :cond_2a
    const-string v12, "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

    .line 231
    .local v12, "pattern":Ljava/lang/String;
    invoke-static {v12}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    .line 232
    .local v8, "emailPattern":Ljava/util/regex/Pattern;
    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 233
    .local v7, "emailMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v9

    .line 234
    .local v9, "emailValid":Z
    if-nez v9, :cond_4c

    .line 235
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;->ADOBE_COLLABORATION_ERROR_INVALID_EMAIL:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;

    const/4 v3, 0x0

    const-string v5, "Invalid Email Address"

    invoke-static {v1, v3, v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrUtils;->createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v10

    .line 236
    .restart local v10    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    move-object/from16 v0, p3

    invoke-interface {v0, v10}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    .line 237
    const/4 v1, 0x0

    goto :goto_11

    .line 239
    .end local v10    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    :cond_4c
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;

    move-object/from16 v0, p3

    invoke-direct {v6, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationInviteUserCallBack;)V

    .line 265
    .local v6, "responseCallBack":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    const-string v2, "invites"

    .line 266
    .local v2, "urlString":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getHref()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v11

    .line 268
    .local v11, "hrefString":Ljava/lang/String;
    const-string v13, "https://cc-api-storage.adobe.io"

    .line 269
    .local v13, "storageUrl":Ljava/lang/String;
    const-string v1, "{\"resourceUrl\": \"%s%s\",\"recipientEmail\": \"%s\",\"resourceType\": \"CCStorage\"}"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v13, v3, v5

    const/4 v5, 0x1

    aput-object v11, v3, v5

    const/4 v5, 0x2

    aput-object p2, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 271
    .local v4, "postData":Ljava/lang/String;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPOST:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const-string v5, "application/json"

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v1

    goto :goto_11
.end method

.method public createNewLink(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 21
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "download"    # Z
    .param p5, "comment"    # Z
    .param p6, "createLinkCallBack"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;

    .prologue
    .line 457
    if-nez p1, :cond_b

    .line 459
    const/16 v1, 0x190

    move-object/from16 v0, p6

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;->onError(I)V

    .line 460
    const/4 v12, 0x0

    .line 543
    :cond_a
    :goto_a
    return-object v12

    .line 463
    :cond_b
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$8;

    move-object/from16 v0, p6

    invoke-direct {v6, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$8;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;)V

    .line 477
    .local v6, "responseCallBack":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    const/4 v12, 0x0

    .line 479
    .local v12, "returnRequest":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    const-string v2, "links"

    .line 481
    .local v2, "urlString":Ljava/lang/String;
    const/4 v10, 0x0

    .line 482
    .local v10, "resourcePath":Ljava/lang/String;
    const/4 v11, 0x0

    .line 484
    .local v11, "resourceType":Ljava/lang/String;
    const-string v1, "application/vnd.adobe"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_62

    .line 485
    move-object v10, p1

    .line 486
    const-string v11, "application/vnd.adobe.asset"

    .line 521
    :cond_24
    :goto_24
    :try_start_24
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 522
    .local v8, "permissionsDictionary":Lorg/json/JSONObject;
    const-string v1, "download"

    move/from16 v0, p4

    invoke-virtual {v8, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 523
    const-string v1, "comment"

    move/from16 v0, p5

    invoke-virtual {v8, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 525
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 526
    .local v9, "postDictionary":Lorg/json/JSONObject;
    const-string v1, "resource"

    invoke-virtual {v9, v1, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 527
    const-string v1, "name"

    move-object/from16 v0, p3

    invoke-virtual {v9, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 528
    const-string v1, "resourceType"

    invoke-virtual {v9, v1, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 529
    const-string v1, "permissions"

    invoke-virtual {v9, v1, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 531
    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    .line 533
    .local v4, "postData":Ljava/lang/String;
    if-eqz v4, :cond_a

    .line 534
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPOST:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const-string v5, "application/json"

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    :try_end_60
    .catch Lorg/json/JSONException; {:try_start_24 .. :try_end_60} :catch_bb

    move-result-object v12

    goto :goto_a

    .line 487
    .end local v4    # "postData":Ljava/lang/String;
    .end local v8    # "permissionsDictionary":Lorg/json/JSONObject;
    .end local v9    # "postDictionary":Lorg/json/JSONObject;
    :cond_62
    const-string v1, "vnd.adobe.directory"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_70

    .line 488
    move-object v10, p1

    .line 489
    const-string v11, "application/x-sharedcloud-collection+json"

    goto :goto_24

    .line 490
    :cond_70
    const-string v1, "vnd.adobe.library"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_84

    const-string v1, "vnd.adobe.element"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 491
    :cond_84
    const/4 v13, 0x0

    .line 493
    .local v13, "serviceUrl":Ljava/lang/String;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$15;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->imsEnvironment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v3

    aget v1, v1, v3

    packed-switch v1, :pswitch_data_c6

    .line 508
    :goto_92
    if-eqz v13, :cond_a3

    .line 509
    const-string v1, "%s/assets/adobe-libraries/%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v13, v3, v5

    const/4 v5, 0x1

    aput-object p1, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 511
    :cond_a3
    const-string v1, "vnd.adobe.library"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_b7

    .line 512
    const-string v11, "application/vnd.adobe.library+dcx"

    goto/16 :goto_24

    .line 495
    :pswitch_b1
    const-string v13, "https://cc-api-storage-stage.adobe.io"

    .line 496
    goto :goto_92

    .line 499
    :pswitch_b4
    const-string v13, "https://cc-api-storage.adobe.io"

    .line 500
    goto :goto_92

    .line 514
    :cond_b7
    move-object/from16 v11, p2

    goto/16 :goto_24

    .line 538
    .end local v13    # "serviceUrl":Ljava/lang/String;
    :catch_bb
    move-exception v7

    .line 539
    .local v7, "exp":Lorg/json/JSONException;
    const/16 v1, 0x190

    move-object/from16 v0, p6

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;->onError(I)V

    .line 540
    const/4 v12, 0x0

    goto/16 :goto_a

    .line 493
    :pswitch_data_c6
    .packed-switch 0x2
        :pswitch_b1
        :pswitch_b4
    .end packed-switch
.end method

.method public deleteComment(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeDeleteCommentCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 12
    .param p1, "commentURL"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeDeleteCommentCallback;

    .prologue
    const/4 v5, 0x0

    .line 786
    if-nez p1, :cond_10

    .line 787
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v7, "deleteComment"

    const-string v8, "url cannot be null"

    invoke-static {v6, v7, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 788
    invoke-interface {p2}, Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeDeleteCommentCallback;->onError()V

    .line 817
    :goto_f
    return-object v5

    .line 792
    :cond_10
    const-string v5, "%s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 793
    .local v4, "urlString":Ljava/lang/String;
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$14;

    invoke-direct {v3, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$14;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeDeleteCommentCallback;)V

    .line 808
    .local v3, "responseCallback":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    :try_start_21
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 809
    .local v0, "deleteCommentURL":Ljava/net/URL;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 810
    .local v2, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 811
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodDELETE:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 812
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct {p0, v2, v5, v6, v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    :try_end_38
    .catch Ljava/net/MalformedURLException; {:try_start_21 .. :try_end_38} :catch_3a

    move-result-object v5

    goto :goto_f

    .line 813
    .end local v0    # "deleteCommentURL":Ljava/net/URL;
    .end local v2    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    :catch_3a
    move-exception v1

    .line 814
    .local v1, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 817
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodDELETE:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-direct {p0, v4, v5, v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v5

    goto :goto_f
.end method

.method public getCollaboration(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 10
    .param p1, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .param p2, "getCollaborationCallback"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;

    .prologue
    const/4 v4, 0x0

    .line 132
    if-nez p1, :cond_f

    .line 134
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;->ADOBE_COLLABORATION_ERROR_INVALID_FOLDER:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;

    const-string v6, "Invalid Folder"

    invoke-static {v5, v4, v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrUtils;->createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    .line 135
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-interface {p2, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    .line 173
    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    :goto_e
    return-object v4

    .line 138
    :cond_f
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getHref()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    .line 141
    .local v1, "hrefString":Ljava/lang/String;
    invoke-static {v1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "%2F"

    const-string v6, "/"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    .line 142
    const-string v4, "collaboration%s?fields=ownerId"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 143
    .local v3, "urlString":Ljava/lang/String;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;

    invoke-direct {v2, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;)V

    .line 173
    .local v2, "responseCallBack":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    invoke-direct {p0, v3, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v4

    goto :goto_e
.end method

.method public getComments(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 9
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p2, "commentsCallback"    # Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;

    .prologue
    .line 697
    if-nez p1, :cond_d

    .line 698
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v4, "GetComments"

    const-string v5, "Resource Cannot be Null"

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 700
    const/4 v3, 0x0

    .line 727
    :goto_c
    return-object v3

    .line 702
    :cond_d
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getHref()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    .line 703
    .local v0, "hrefString":Ljava/lang/String;
    invoke-static {v0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "%2F"

    const-string v5, "/"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    .line 704
    const-string v3, "comments%s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 705
    .local v2, "urlString":Ljava/lang/String;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$12;

    invoke-direct {v1, p0, p2, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$12;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 727
    .local v1, "responseCallback":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    invoke-direct {p0, v2, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v3

    goto :goto_c
.end method

.method public getInvites(Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 5
    .param p1, "getInvitesCallBack"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;

    .prologue
    .line 276
    const-string v1, "invites"

    .line 277
    .local v1, "urlString":Ljava/lang/String;
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;)V

    .line 318
    .local v0, "responseCallBack":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    invoke-direct {p0, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v2

    return-object v2
.end method

.method public initWithHTTPService(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    .registers 2
    .param p1, "service"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 120
    return-object p0
.end method

.method public rejectInvite(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationAcceptOrRejectInviteCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 9
    .param p1, "inviteID"    # Ljava/lang/String;
    .param p2, "rejectInviteCallBack"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationAcceptOrRejectInviteCallBack;

    .prologue
    const/4 v3, 0x0

    .line 358
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_15

    .line 359
    :cond_9
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;->ADOBE_COLLABORATION_ERROR_INVALID_INVITE_ID:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;

    const-string v5, "Invalid Invitation ID"

    invoke-static {v4, v3, v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrUtils;->createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    .line 360
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-interface {p2, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationAcceptOrRejectInviteCallBack;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    .line 389
    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    :goto_14
    return-object v3

    .line 363
    :cond_15
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$6;

    invoke-direct {v1, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$6;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationAcceptOrRejectInviteCallBack;)V

    .line 388
    .local v1, "responseCallBack":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    const-string v3, "invites/%s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 389
    .local v2, "urlString":Ljava/lang/String;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodDELETE:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-direct {p0, v2, v3, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v3

    goto :goto_14
.end method

.method public removeCollaborator(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 11
    .param p1, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .param p2, "userID"    # Ljava/lang/String;
    .param p3, "removeCollaboratorCallBack"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;

    .prologue
    const/4 v4, 0x0

    .line 177
    if-nez p1, :cond_f

    .line 178
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;->ADOBE_COLLABORATION_ERROR_INVALID_FOLDER:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;

    const-string v6, "Invalid Folder"

    invoke-static {v5, v4, v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrUtils;->createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    .line 179
    .local v0, "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-interface {p3, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    .line 214
    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    :goto_e
    return-object v4

    .line 182
    :cond_f
    if-eqz p2, :cond_17

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_23

    .line 183
    :cond_17
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;->ADOBE_COLLABORATION_ERROR_INVALID_USER_ID:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;

    const-string v6, "Invalid User ID"

    invoke-static {v5, v4, v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrUtils;->createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    move-result-object v0

    .line 184
    .restart local v0    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    invoke-interface {p3, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;->onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V

    goto :goto_e

    .line 187
    .end local v0    # "exception":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    :cond_23
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;

    invoke-direct {v2, p0, p3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationRemoveCollaboratorCallback;)V

    .line 211
    .local v2, "responseCallBack":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getHref()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    .line 212
    .local v1, "hrefString":Ljava/lang/String;
    invoke-static {v1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "%2F"

    const-string v6, "/"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    .line 213
    const-string v4, "collaborators%s?user=%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 214
    .local v3, "urlString":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodDELETE:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-direct {p0, v3, v4, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v4

    goto :goto_e
.end method

.method public retrieveLink(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 13
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "retrieveLinkCallBack"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;

    .prologue
    const/4 v3, 0x0

    const/16 v8, 0x190

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 393
    if-nez p1, :cond_b

    .line 395
    invoke-interface {p3, v8}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;->onError(I)V

    .line 453
    :goto_a
    return-object v3

    .line 399
    :cond_b
    const/4 v2, 0x0

    .line 401
    .local v2, "urlString":Ljava/lang/String;
    const-string v4, "application/vnd.adobe"

    invoke-virtual {p2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_24

    .line 402
    const-string v4, "links%s"

    new-array v5, v7, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 429
    :cond_1e
    :goto_1e
    if-nez v2, :cond_6b

    .line 431
    invoke-interface {p3, v8}, Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;->onError(I)V

    goto :goto_a

    .line 403
    :cond_24
    const-string v4, "vnd.adobe.directory"

    invoke-virtual {p2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_37

    .line 404
    const-string v4, "links%s"

    new-array v5, v7, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1e

    .line 405
    :cond_37
    const-string v4, "vnd.adobe.library"

    invoke-virtual {p2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_47

    const-string v4, "vnd.adobe.element"

    invoke-virtual {p2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 406
    :cond_47
    const/4 v1, 0x0

    .line 408
    .local v1, "serviceUrl":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$15;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->imsEnvironment:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_76

    .line 423
    :goto_55
    if-eqz v1, :cond_1e

    .line 424
    const-string v4, "links/%s/assets/adobe-libraries/%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v6

    aput-object p1, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1e

    .line 410
    :pswitch_65
    const-string v1, "https://cc-api-storage-stage.adobe.io"

    .line 411
    goto :goto_55

    .line 414
    :pswitch_68
    const-string v1, "https://cc-api-storage.adobe.io"

    .line 415
    goto :goto_55

    .line 435
    .end local v1    # "serviceUrl":Ljava/lang/String;
    :cond_6b
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$7;

    invoke-direct {v0, p0, p3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$7;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationPublicLinkCallBack;)V

    .line 453
    .local v0, "responseCallBack":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;
    invoke-direct {p0, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getResponseForString(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession$IAdobeCollaborationResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v3

    goto :goto_a

    .line 408
    nop

    :pswitch_data_76
    .packed-switch 0x2
        :pswitch_65
        :pswitch_68
    .end packed-switch
.end method

.method public service()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    return-object v0
.end method
