.class public Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
.super Ljava/lang/Object;
.source "AdobeANSSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$8;,
        Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;
    }
.end annotation


# static fields
.field private static _userToken:Ljava/lang/String;

.field private static observer:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;

.field private static sharedService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

.field private static sharedSession:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 48
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->observer:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$1;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->observer:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;

    .line 53
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-static {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->getErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    move-result-object v0

    return-object v0
.end method

.method private static dataUsingEncoding(Ljava/lang/String;)[B
    .registers 4
    .param p0, "postData"    # Ljava/lang/String;

    .prologue
    .line 698
    :try_start_0
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    .line 705
    :goto_6
    return-object v0

    .line 701
    :catch_7
    move-exception v1

    .line 703
    .local v1, "exp":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 705
    const/4 v0, 0x0

    goto :goto_6
.end method

.method private static getErrorFromResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    .registers 5
    .param p0, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "details"    # Ljava/lang/String;

    .prologue
    .line 670
    new-instance v0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorBadRequest:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    return-object v0
.end method

.method private getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 14
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "httpMethod"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;
    .param p3, "postData"    # Ljava/lang/String;
    .param p4, "contentType"    # Ljava/lang/String;
    .param p5, "responseCallback"    # Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;

    .prologue
    .line 619
    invoke-virtual {p1, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestMethod(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 620
    if-eqz p3, :cond_33

    .line 621
    const-string v3, "Content-Type"

    invoke-virtual {p1, v3, p4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 622
    const-string v3, "Content-length"

    const-string v4, "%d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 623
    invoke-static {p3}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->dataUsingEncoding(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setBody([B)V

    .line 624
    new-instance v3, Ljava/lang/String;

    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V

    .line 626
    :cond_33
    const-string v3, "Accept"

    const-string v4, "application/json"

    invoke-virtual {p1, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    const/4 v0, 0x0

    .line 629
    .local v0, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_3b
    new-instance v0, Landroid/os/Handler;

    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_40} :catch_4d

    .line 634
    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_40
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;

    invoke-direct {v1, p0, p5, p2}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$7;-><init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;)V

    .line 665
    .local v1, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    invoke-virtual {v3, p1, v4, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 666
    return-object p1

    .line 630
    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    .end local v1    # "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    :catch_4d
    move-exception v2

    .line 631
    .local v2, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_40
.end method

.method private static initWithHTTPService(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    .registers 2
    .param p0, "service"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 108
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    if-nez v0, :cond_b

    .line 110
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    .line 112
    :cond_b
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 113
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    return-object v0
.end method

.method public static resetSharedSession()V
    .registers 1

    .prologue
    .line 91
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    .line 92
    return-void
.end method

.method public static sharedSession()Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    .registers 9

    .prologue
    const/4 v4, 0x0

    .line 56
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    if-nez v5, :cond_59

    .line 58
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v2

    .line 59
    .local v2, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_19

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_1a

    .line 87
    :cond_19
    :goto_19
    return-object v4

    .line 61
    :cond_1a
    const-string v5, "Bearer %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    sput-object v5, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->_userToken:Ljava/lang/String;

    .line 63
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v1

    .line 64
    .local v1, "imsEnvironment":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;
    const/4 v3, 0x0

    .line 65
    .local v3, "serviceUrl":Ljava/lang/String;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 67
    .local v0, "additionalHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$8;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_78

    .line 79
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v6, "ANS Session"

    const-string v7, "An undefined authentication endpoint has been specified for the ANS session"

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    :goto_4a
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-direct {v5, v3, v4, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    sput-object v5, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 83
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->initWithHTTPService(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    move-result-object v4

    sput-object v4, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    .line 85
    :cond_59
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->observer:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;

    invoke-virtual {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 86
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->observer:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$LoginNotificationObserver;

    invoke-virtual {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 87
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    goto :goto_19

    .line 70
    :pswitch_72
    const-string v3, "https://stg-ans.oobesaas.adobe.com"

    .line 71
    goto :goto_4a

    .line 74
    :pswitch_75
    const-string v3, "https://ans.oobesaas.adobe.com"

    .line 75
    goto :goto_4a

    .line 67
    :pswitch_data_78
    .packed-switch 0x1
        :pswitch_72
        :pswitch_75
    .end packed-switch
.end method


# virtual methods
.method public queryNotifications(Ljava/lang/String;Ljava/lang/String;JJILcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationQueryCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 22
    .param p1, "adobeAppID"    # Ljava/lang/String;
    .param p2, "deviceID"    # Ljava/lang/String;
    .param p3, "fromTimestamp"    # J
    .param p5, "toTimeStamp"    # J
    .param p7, "pageSize"    # I
    .param p8, "callback"    # Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationQueryCallback;

    .prologue
    .line 232
    if-eqz p2, :cond_8

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_16

    .line 233
    :cond_8
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v3, "queryNotifications"

    const-string v4, "device ID cannot be nil"

    invoke-static {v1, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    invoke-interface/range {p8 .. p8}, Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationQueryCallback;->onError()V

    .line 235
    const/4 v1, 0x0

    .line 270
    :goto_15
    return-object v1

    .line 237
    :cond_16
    const/4 v1, 0x1

    move/from16 v0, p7

    if-lt v0, v1, :cond_21

    const/16 v1, 0xa

    move/from16 v0, p7

    if-le v0, v1, :cond_2f

    .line 239
    :cond_21
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v3, "queryNotifications"

    const-string v4, "page size must be between 1 and 10"

    invoke-static {v1, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    invoke-interface/range {p8 .. p8}, Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationQueryCallback;->onError()V

    .line 241
    const/4 v1, 0x0

    goto :goto_15

    .line 244
    :cond_2f
    const-string v1, "/ans/v1/notifications?from=%s&to=%s&page_size=%s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static/range {p5 .. p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 245
    .local v10, "urlString":Ljava/lang/String;
    const/4 v8, 0x0

    .line 247
    .local v8, "url":Ljava/net/URL;
    :try_start_4e
    new-instance v9, Ljava/net/URL;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v9, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_6e
    .catch Ljava/net/MalformedURLException; {:try_start_4e .. :try_end_6e} :catch_ae

    .end local v8    # "url":Ljava/net/URL;
    .local v9, "url":Ljava/net/URL;
    move-object v8, v9

    .line 251
    .end local v9    # "url":Ljava/net/URL;
    .restart local v8    # "url":Ljava/net/URL;
    :goto_6f
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 252
    .local v2, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v2, v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 253
    const-string v1, "Bearer %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 255
    .local v11, "userToken":Ljava/lang/String;
    const-string v1, "x-user-token"

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->_userToken:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    const-string v1, "x-adobe-app-id"

    invoke-virtual {v2, v1, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    const-string v1, "x-adobe-device-id"

    invoke-virtual {v2, v1, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$3;

    move-object/from16 v0, p8

    invoke-direct {v6, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationQueryCallback;)V

    .line 270
    .local v6, "responseCallback":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v1

    goto/16 :goto_15

    .line 248
    .end local v2    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v6    # "responseCallback":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;
    .end local v11    # "userToken":Ljava/lang/String;
    :catch_ae
    move-exception v7

    .line 249
    .local v7, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v7}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_6f
.end method

.method public queryUnreadNotificationCount(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 16
    .param p1, "adobeAppID"    # Ljava/lang/String;
    .param p2, "userID"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;

    .prologue
    const/4 v3, 0x0

    .line 276
    if-eqz p2, :cond_9

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_16

    .line 278
    :cond_9
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "queryUnreadNotificationCount"

    const-string v4, "userID ID cannot be nil"

    invoke-static {v0, v2, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    invoke-interface {p3}, Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;->onError()V

    .line 310
    :goto_15
    return-object v3

    .line 282
    :cond_16
    const-string v9, "/ans/v2/notifications/count"

    .line 283
    .local v9, "urlString":Ljava/lang/String;
    const/4 v7, 0x0

    .line 285
    .local v7, "url":Ljava/net/URL;
    :try_start_19
    new-instance v8, Ljava/net/URL;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_39
    .catch Ljava/net/MalformedURLException; {:try_start_19 .. :try_end_39} :catch_75

    .end local v7    # "url":Ljava/net/URL;
    .local v8, "url":Ljava/net/URL;
    move-object v7, v8

    .line 289
    .end local v8    # "url":Ljava/net/URL;
    .restart local v7    # "url":Ljava/net/URL;
    :goto_3a
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 290
    .local v1, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v1, v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 291
    const-string v0, "Bearer %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v11

    invoke-virtual {v11}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v2, v4

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 293
    .local v10, "userToken":Ljava/lang/String;
    const-string v0, "x-user-token"

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->_userToken:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    const-string v0, "x-adobe-app-id"

    invoke-virtual {v1, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    const-string v0, "x-adobe-device-id"

    invoke-virtual {v1, v0, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$4;

    invoke-direct {v5, p0, p3}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;)V

    .line 310
    .local v5, "responseCallback":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-object v0, p0

    move-object v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v3

    goto :goto_15

    .line 286
    .end local v1    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v5    # "responseCallback":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;
    .end local v10    # "userToken":Ljava/lang/String;
    :catch_75
    move-exception v6

    .line 287
    .local v6, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v6}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_3a
.end method

.method public registerDevice(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceRegistrationCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 19
    .param p1, "adobeAppID"    # Ljava/lang/String;
    .param p2, "googleRegistrationID"    # Ljava/lang/String;
    .param p3, "appPackageName"    # Ljava/lang/String;
    .param p4, "callback"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceRegistrationCallback;

    .prologue
    .line 130
    if-eqz p2, :cond_8

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_16

    .line 132
    :cond_8
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v3, "registerDevice"

    const-string v5, "device token cannot be null."

    invoke-static {v1, v3, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    invoke-interface/range {p4 .. p4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceRegistrationCallback;->onError()V

    .line 138
    const/4 v10, 0x0

    .line 190
    :goto_15
    return-object v10

    .line 140
    :cond_16
    const/4 v10, 0x0

    .line 141
    .local v10, "returnRequest":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 143
    .local v9, "object":Lorg/json/JSONObject;
    :try_start_1c
    const-string v1, "device-type"

    const-string v3, "Phone"

    invoke-virtual {v9, v1, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 144
    const-string v1, "device-platform"

    const-string v3, "Android"

    invoke-virtual {v9, v1, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 145
    const-string v1, "device-os-name"

    const-string v3, "android"

    invoke-virtual {v9, v1, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 146
    const-string v1, "device-os-version"

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v1, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    const-string v1, "android-registration-id"

    move-object/from16 v0, p2

    invoke-virtual {v9, v1, v0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 148
    const-string v1, "android-package-name"

    move-object/from16 v0, p3

    invoke-virtual {v9, v1, v0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 149
    const-string v1, "locale"

    const-string v3, "en_US"

    invoke-virtual {v9, v1, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_51
    .catch Lorg/json/JSONException; {:try_start_1c .. :try_end_51} :catch_9d

    .line 155
    :goto_51
    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    .line 157
    .local v4, "jsonData":Ljava/lang/String;
    if-eqz v4, :cond_a7

    .line 158
    const-string v13, "/ans/v1/device"

    .line 159
    .local v13, "urlString":Ljava/lang/String;
    const/4 v11, 0x0

    .line 161
    .local v11, "url":Ljava/net/URL;
    :try_start_5a
    new-instance v12, Ljava/net/URL;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v12, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_76
    .catch Ljava/net/MalformedURLException; {:try_start_5a .. :try_end_76} :catch_a2

    .end local v11    # "url":Ljava/net/URL;
    .local v12, "url":Ljava/net/URL;
    move-object v11, v12

    .line 165
    .end local v12    # "url":Ljava/net/URL;
    .restart local v11    # "url":Ljava/net/URL;
    :goto_77
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 166
    .local v2, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v2, v11}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 169
    const-string v1, "x-user-token"

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->_userToken:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    const-string v1, "x-adobe-app-id"

    invoke-virtual {v2, v1, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$1;

    move-object/from16 v0, p4

    invoke-direct {v6, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceRegistrationCallback;)V

    .line 186
    .local v6, "responseCallback":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPOST:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const-string v5, "application/json"

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v10

    .line 187
    goto/16 :goto_15

    .line 151
    .end local v2    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v4    # "jsonData":Ljava/lang/String;
    .end local v6    # "responseCallback":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;
    .end local v11    # "url":Ljava/net/URL;
    .end local v13    # "urlString":Ljava/lang/String;
    :catch_9d
    move-exception v8

    .line 153
    .local v8, "exp":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_51

    .line 162
    .end local v8    # "exp":Lorg/json/JSONException;
    .restart local v4    # "jsonData":Ljava/lang/String;
    .restart local v11    # "url":Ljava/net/URL;
    .restart local v13    # "urlString":Ljava/lang/String;
    :catch_a2
    move-exception v7

    .line 163
    .local v7, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v7}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_77

    .line 188
    .end local v7    # "e":Ljava/net/MalformedURLException;
    .end local v11    # "url":Ljava/net/URL;
    .end local v13    # "urlString":Ljava/lang/String;
    :cond_a7
    invoke-interface/range {p4 .. p4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceRegistrationCallback;->onError()V

    goto/16 :goto_15
.end method

.method public unregisterDevice(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 14
    .param p1, "adobeAppID"    # Ljava/lang/String;
    .param p2, "deviceID"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;

    .prologue
    const/4 v3, 0x0

    .line 196
    if-eqz p2, :cond_9

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_16

    .line 197
    :cond_9
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "unregisterDevice"

    const-string v4, "device ID cannot be nil."

    invoke-static {v0, v2, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    invoke-interface {p3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;->onError()V

    .line 228
    :goto_15
    return-object v3

    .line 201
    :cond_16
    const-string v9, "/ans/v1/device"

    .line 202
    .local v9, "urlString":Ljava/lang/String;
    const/4 v7, 0x0

    .line 204
    .local v7, "url":Ljava/net/URL;
    :try_start_19
    new-instance v8, Ljava/net/URL;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_39
    .catch Ljava/net/MalformedURLException; {:try_start_19 .. :try_end_39} :catch_61

    .end local v7    # "url":Ljava/net/URL;
    .local v8, "url":Ljava/net/URL;
    move-object v7, v8

    .line 208
    .end local v8    # "url":Ljava/net/URL;
    .restart local v7    # "url":Ljava/net/URL;
    :goto_3a
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 209
    .local v1, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v1, v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 212
    const-string v0, "x-user-token"

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->_userToken:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    const-string v0, "x-adobe-app-id"

    invoke-virtual {v1, v0, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    const-string v0, "x-adobe-device-id"

    invoke-virtual {v1, v0, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$2;

    invoke-direct {v5, p0, p3}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;)V

    .line 228
    .local v5, "responseCallBack":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodDELETE:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    move-object v0, p0

    move-object v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v3

    goto :goto_15

    .line 205
    .end local v1    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v5    # "responseCallBack":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;
    :catch_61
    move-exception v6

    .line 206
    .local v6, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v6}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_3a
.end method

.method public updateNotifications(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .registers 29
    .param p1, "adobeAppID"    # Ljava/lang/String;
    .param p3, "newState"    # Ljava/lang/String;
    .param p4, "updateNotificationCallback"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;",
            ")",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;"
        }
    .end annotation

    .prologue
    .line 316
    .local p2, "notificationIDs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    if-eqz p2, :cond_8

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_16

    .line 317
    :cond_8
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v4, "updateNotifications"

    const-string v6, "notificationIDs can not be nil or empty"

    invoke-static {v2, v4, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    invoke-interface/range {p4 .. p4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;->onError()V

    .line 321
    const/4 v2, 0x0

    .line 387
    :goto_15
    return-object v2

    .line 325
    :cond_16
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 326
    .local v12, "notifications":Lorg/json/JSONArray;
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_58

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;

    .line 327
    .local v14, "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 329
    .local v11, "notification":Lorg/json/JSONObject;
    :try_start_30
    const-string v4, "notification-id"

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getNotificationID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v11, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 330
    const-string v4, "state"

    move-object/from16 v0, p3

    invoke-virtual {v11, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 331
    const-string v4, "timestamp"

    invoke-virtual {v14}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getTimestamp()J

    move-result-wide v20

    const-wide/16 v22, 0x1

    add-long v20, v20, v22

    move-wide/from16 v0, v20

    invoke-virtual {v11, v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 332
    invoke-virtual {v12, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_52
    .catch Lorg/json/JSONException; {:try_start_30 .. :try_end_52} :catch_53

    goto :goto_1f

    .line 333
    :catch_53
    move-exception v8

    .line 334
    .local v8, "e":Lorg/json/JSONException;
    invoke-virtual {v8}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1f

    .line 339
    .end local v8    # "e":Lorg/json/JSONException;
    .end local v11    # "notification":Lorg/json/JSONObject;
    .end local v14    # "pushNotification":Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
    :cond_58
    :try_start_58
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 340
    .local v10, "innerContainer":Lorg/json/JSONObject;
    const-string v2, "notification"

    invoke-virtual {v10, v2, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 341
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 342
    .local v13, "outerContainer":Lorg/json/JSONObject;
    const-string v2, "notifications"

    invoke-virtual {v13, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 343
    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    .line 344
    .local v5, "jsonData":Ljava/lang/String;
    if-eqz v5, :cond_e6

    .line 346
    const-string v17, "/ans/v1/notifications"
    :try_end_74
    .catch Lorg/json/JSONException; {:try_start_58 .. :try_end_74} :catch_df

    .line 347
    .local v17, "urlString":Ljava/lang/String;
    const/4 v15, 0x0

    .line 349
    .local v15, "url":Ljava/net/URL;
    :try_start_75
    new-instance v16, Ljava/net/URL;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedService:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->baseURL()Ljava/net/URL;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_99
    .catch Ljava/net/MalformedURLException; {:try_start_75 .. :try_end_99} :catch_da
    .catch Lorg/json/JSONException; {:try_start_75 .. :try_end_99} :catch_df

    .end local v15    # "url":Ljava/net/URL;
    .local v16, "url":Ljava/net/URL;
    move-object/from16 v15, v16

    .line 353
    .end local v16    # "url":Ljava/net/URL;
    .restart local v15    # "url":Ljava/net/URL;
    :goto_9b
    :try_start_9b
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    invoke-direct {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>()V

    .line 354
    .local v3, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    invoke-virtual {v3, v15}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setUrl(Ljava/net/URL;)V

    .line 355
    const-string v2, "Bearer %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v4, v6

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    .line 357
    .local v18, "userToken":Ljava/lang/String;
    const-string v2, "x-user-token"

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->_userToken:Ljava/lang/String;

    invoke-virtual {v3, v2, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    const-string v2, "x-adobe-app-id"

    move-object/from16 v0, p1

    invoke-virtual {v3, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$5;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v7, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession$5;-><init>(Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;)V

    .line 373
    .local v7, "responseCallback":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodPUT:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const-string v6, "application/json"

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v2

    goto/16 :goto_15

    .line 350
    .end local v3    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v7    # "responseCallback":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeANSResponseCallback;
    .end local v18    # "userToken":Ljava/lang/String;
    :catch_da
    move-exception v8

    .line 351
    .local v8, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v8}, Ljava/net/MalformedURLException;->printStackTrace()V
    :try_end_de
    .catch Lorg/json/JSONException; {:try_start_9b .. :try_end_de} :catch_df

    goto :goto_9b

    .line 382
    .end local v5    # "jsonData":Ljava/lang/String;
    .end local v8    # "e":Ljava/net/MalformedURLException;
    .end local v10    # "innerContainer":Lorg/json/JSONObject;
    .end local v13    # "outerContainer":Lorg/json/JSONObject;
    .end local v15    # "url":Ljava/net/URL;
    .end local v17    # "urlString":Ljava/lang/String;
    :catch_df
    move-exception v9

    .line 384
    .local v9, "exp":Lorg/json/JSONException;
    invoke-virtual {v9}, Lorg/json/JSONException;->printStackTrace()V

    .line 387
    const/4 v2, 0x0

    goto/16 :goto_15

    .line 378
    .end local v9    # "exp":Lorg/json/JSONException;
    .restart local v5    # "jsonData":Ljava/lang/String;
    .restart local v10    # "innerContainer":Lorg/json/JSONObject;
    .restart local v13    # "outerContainer":Lorg/json/JSONObject;
    :cond_e6
    :try_start_e6
    invoke-interface/range {p4 .. p4}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;->onError()V
    :try_end_e9
    .catch Lorg/json/JSONException; {:try_start_e6 .. :try_end_e9} :catch_df

    .line 380
    const/4 v2, 0x0

    goto/16 :goto_15
.end method
