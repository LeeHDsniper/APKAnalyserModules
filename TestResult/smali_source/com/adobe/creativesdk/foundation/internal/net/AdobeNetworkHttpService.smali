.class public Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
.super Ljava/lang/Object;
.source "AdobeNetworkHttpService.java"


# static fields
.field private static AdobeNetworkHTTPServiceMaxAuthTokenHistory:I

.field private static AdobeNetworkHTTPServiceMaxConcurrentRequests:I


# instance fields
.field private _accessToken:Ljava/lang/String;

.field private _additionalHTTPHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _applicationName:Ljava/lang/String;

.field private _authTokenHistory:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Date;",
            ">;"
        }
    .end annotation
.end field

.field private _baseURL:Ljava/net/URL;

.field private _numConcurrentRequests:I

.field private _recentAuthTokens:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _recentAuthTokensMutex:Ljava/lang/Object;

.field private _recentErrorCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private _recentErrorThresholdToDisconnect:I

.field private _requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

.field private _serviceDelegate:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 78
    const/4 v0, 0x5

    sput v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->AdobeNetworkHTTPServiceMaxConcurrentRequests:I

    .line 79
    const/16 v0, 0xa

    sput v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->AdobeNetworkHTTPServiceMaxAuthTokenHistory:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 12
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "applicationName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "additionalHTTPHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v4, 0x5

    const/4 v1, 0x0

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_baseURL:Ljava/net/URL;

    .line 87
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_applicationName:Ljava/lang/String;

    .line 88
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_additionalHTTPHeaders:Ljava/util/Map;

    .line 89
    iput v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_numConcurrentRequests:I

    .line 90
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_accessToken:Ljava/lang/String;

    .line 91
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_serviceDelegate:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;

    .line 92
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    .line 93
    iput v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentErrorThresholdToDisconnect:I

    .line 94
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentErrorCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 95
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_authTokenHistory:Ljava/util/List;

    .line 96
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentAuthTokens:Ljava/util/List;

    .line 97
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentAuthTokensMutex:Ljava/lang/Object;

    .line 112
    :try_start_22
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_baseURL:Ljava/net/URL;
    :try_end_29
    .catch Ljava/net/MalformedURLException; {:try_start_22 .. :try_end_29} :catch_5c

    .line 116
    :goto_29
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_applicationName:Ljava/lang/String;

    .line 117
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_additionalHTTPHeaders:Ljava/util/Map;

    .line 119
    iput v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_numConcurrentRequests:I

    .line 121
    iput v4, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentErrorThresholdToDisconnect:I

    .line 122
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentErrorCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 124
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_authTokenHistory:Ljava/util/List;

    .line 125
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentAuthTokens:Ljava/util/List;

    .line 127
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_numConcurrentRequests:I

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_numConcurrentRequests:I

    const-wide/16 v4, 0x64

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    .line 130
    return-void

    .line 113
    :catch_5c
    move-exception v0

    .line 114
    .local v0, "e":Ljava/net/MalformedURLException;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Malformed url"

    invoke-static {v1, v2, v3, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_29
.end method

.method private ConvertHeaderKeyToLowerCase(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 9
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 490
    if-nez p1, :cond_3

    .line 507
    :cond_2
    :goto_2
    return-void

    .line 493
    :cond_3
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v1

    .line 495
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v5

    if-eqz v5, :cond_2

    .line 496
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 497
    .local v3, "lowerCaseHeader":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1c
    :goto_1c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 498
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 499
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 501
    .local v4, "value":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v2, :cond_1c

    .line 502
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1c

    .line 505
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3e
    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setHeaders(Ljava/util/Map;)V

    goto :goto_2
.end method

.method private _addAdditionalHttpHeaders(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;)V
    .registers 6
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .prologue
    .line 681
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_additionalHTTPHeaders:Ljava/util/Map;

    if-nez v1, :cond_5

    .line 688
    :cond_4
    return-void

    .line 684
    :cond_5
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_additionalHTTPHeaders:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 685
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getRequestProperties()Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_additionalHTTPHeaders:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f
.end method

.method private _analyseResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Ljava/lang/Runnable;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
    .registers 16
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .param p2, "requestHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .param p3, "requestRunner"    # Ljava/lang/Runnable;
    .param p4, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .param p5, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    const/16 v9, 0x191

    .line 516
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->ConvertHeaderKeyToLowerCase(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    .line 517
    const/4 v5, 0x0

    .line 518
    .local v5, "shouldRescheduleThisRequest":Z
    if-eqz p1, :cond_b4

    .line 520
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v6

    if-ne v6, v9, :cond_69

    .line 522
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentAuthTokensMutex:Ljava/lang/Object;

    monitor-enter v7

    .line 533
    :try_start_11
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 534
    .local v0, "accessTokenForThisRequest":Ljava/lang/String;
    if-nez v0, :cond_19

    .line 535
    const-string v0, "no-token"

    .line 538
    :cond_19
    const/4 v4, -0x1

    .line 539
    .local v4, "indexOfAuthToken":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1b
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentAuthTokens:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_35

    .line 540
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentAuthTokens:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_32

    .line 541
    move v4, v3

    .line 539
    :cond_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    .line 545
    :cond_35
    const/4 v6, -0x1

    if-eq v4, v6, :cond_a6

    const/4 v1, 0x1

    .line 547
    .local v1, "alreadyAddressed":Z
    :goto_39
    if-nez v1, :cond_4a

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_serviceDelegate:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;

    if-eqz v6, :cond_4a

    .line 548
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pause()V

    .line 549
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_serviceDelegate:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;

    .line 550
    invoke-interface {v6, p0}, Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;->HTTPServiceAuthenticationDidFail(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Z

    move-result v5

    .line 554
    :cond_4a
    if-nez v1, :cond_68

    .line 555
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentAuthTokens:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    sget v8, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->AdobeNetworkHTTPServiceMaxConcurrentRequests:I

    if-lt v6, v8, :cond_63

    .line 556
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentAuthTokens:Ljava/util/List;

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentAuthTokens:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-interface {v6, v8}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 559
    :cond_63
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentAuthTokens:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 562
    :cond_68
    monitor-exit v7
    :try_end_69
    .catchall {:try_start_11 .. :try_end_69} :catchall_a8

    .line 565
    .end local v0    # "accessTokenForThisRequest":Ljava/lang/String;
    .end local v1    # "alreadyAddressed":Z
    .end local v3    # "i":I
    .end local v4    # "indexOfAuthToken":I
    :cond_69
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v6

    if-ne v6, v9, :cond_89

    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_hasUserCancelled(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)Z

    move-result v6

    if-nez v6, :cond_89

    .line 566
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentErrorCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 568
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_serviceDelegate:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;

    if-eqz v6, :cond_89

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->isConnected()Z

    move-result v6

    if-nez v6, :cond_89

    .line 569
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_serviceDelegate:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;

    invoke-interface {v6, p0}, Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;->HTTPServiceDidDisconnect(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)V

    .line 573
    :cond_89
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v6

    const/16 v7, 0x190

    if-ge v6, v7, :cond_a0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->hasFileError()Z

    move-result v6

    if-nez v6, :cond_a0

    .line 575
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_serviceDelegate:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;

    if-eqz v6, :cond_a0

    .line 576
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_serviceDelegate:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;

    invoke-interface {v6, p0}, Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;->HTTPServiceIsActive(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)V

    .line 580
    :cond_a0
    if-eqz v5, :cond_ab

    .line 581
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 643
    :goto_a5
    return-void

    .line 545
    .restart local v0    # "accessTokenForThisRequest":Ljava/lang/String;
    .restart local v3    # "i":I
    .restart local v4    # "indexOfAuthToken":I
    :cond_a6
    const/4 v1, 0x0

    goto :goto_39

    .line 562
    .end local v0    # "accessTokenForThisRequest":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "indexOfAuthToken":I
    :catchall_a8
    move-exception v6

    :try_start_a9
    monitor-exit v7
    :try_end_aa
    .catchall {:try_start_a9 .. :try_end_aa} :catchall_a8

    throw v6

    .line 583
    :cond_ab
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;

    invoke-direct {v2, p0, p4, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$7;-><init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V

    .line 625
    .local v2, "callBack":Ljava/lang/Runnable;
    invoke-direct {p0, v2, p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_sendResponse(Ljava/lang/Runnable;Landroid/os/Handler;)V

    goto :goto_a5

    .line 630
    .end local v2    # "callBack":Ljava/lang/Runnable;
    :cond_b4
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$8;

    invoke-direct {v2, p0, p4, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$8;-><init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V

    .line 641
    .restart local v2    # "callBack":Ljava/lang/Runnable;
    invoke-direct {p0, v2, p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_sendResponse(Ljava/lang/Runnable;Landroid/os/Handler;)V

    goto :goto_a5
.end method

.method private _hasUserCancelled(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)Z
    .registers 3
    .param p1, "requestHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .prologue
    .line 676
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->isCancelled()Z

    move-result v0

    return v0
.end method

.method private _sendDisconnectError(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
    .registers 5
    .param p1, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .param p2, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    .line 656
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$9;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$9;-><init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;)V

    .line 667
    .local v0, "callBack":Ljava/lang/Runnable;
    if-eqz p2, :cond_b

    .line 668
    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 673
    :goto_a
    return-void

    .line 670
    :cond_b
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_a
.end method

.method private _sendResponse(Ljava/lang/Runnable;Landroid/os/Handler;)V
    .registers 4
    .param p1, "callBack"    # Ljava/lang/Runnable;
    .param p2, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    .line 646
    if-eqz p2, :cond_6

    .line 647
    invoke-virtual {p2, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 651
    :goto_5
    return-void

    .line 649
    :cond_6
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_5
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Ljava/lang/Runnable;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
    .registers 6
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    .param p2, "x2"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .param p3, "x3"    # Ljava/lang/Runnable;
    .param p4, "x4"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .param p5, "x5"    # Landroid/os/Handler;

    .prologue
    .line 74
    invoke-direct/range {p0 .. p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_analyseResponse(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Ljava/lang/Runnable;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .param p2, "x2"    # Landroid/os/Handler;

    .prologue
    .line 74
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_sendDisconnectError(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    return-void
.end method

.method private areStringsEqual(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p1, "string1"    # Ljava/lang/String;
    .param p2, "string2"    # Ljava/lang/String;

    .prologue
    .line 710
    const/4 v0, 0x0

    .line 712
    .local v0, "result":Z
    if-nez p1, :cond_7

    if-nez p2, :cond_7

    .line 714
    const/4 v0, 0x1

    .line 720
    :cond_6
    :goto_6
    return v0

    .line 716
    :cond_7
    if-eqz p1, :cond_6

    if-eqz p2, :cond_6

    .line 718
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_6
.end method

.method private areURLsEqual(Ljava/net/URL;Ljava/net/URL;)Z
    .registers 6
    .param p1, "url1"    # Ljava/net/URL;
    .param p2, "url2"    # Ljava/net/URL;

    .prologue
    .line 725
    const/4 v0, 0x0

    .line 727
    .local v0, "result":Z
    if-nez p1, :cond_7

    if-nez p2, :cond_7

    .line 729
    const/4 v0, 0x1

    .line 735
    :cond_6
    :goto_6
    return v0

    .line 731
    :cond_7
    if-eqz p1, :cond_6

    if-eqz p2, :cond_6

    .line 733
    invoke-virtual {p1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_6
.end method


# virtual methods
.method public baseURL()Ljava/net/URL;
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_baseURL:Ljava/net/URL;

    return-object v0
.end method

.method public clearQueuedRequests()V
    .registers 9

    .prologue
    .line 228
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->shutdownNow()Ljava/util/List;

    .line 229
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_numConcurrentRequests:I

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_numConcurrentRequests:I

    const-wide/16 v4, 0x64

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    .line 232
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 693
    const/4 v0, 0x0

    .line 695
    .local v0, "result":Z
    if-eqz p1, :cond_24

    instance-of v2, p1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    if-eqz v2, :cond_24

    move-object v1, p1

    .line 697
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 698
    .local v1, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_baseURL:Ljava/net/URL;

    iget-object v3, v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_baseURL:Ljava/net/URL;

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->areURLsEqual(Ljava/net/URL;Ljava/net/URL;)Z

    move-result v0

    .line 701
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_applicationName:Ljava/lang/String;

    iget-object v3, v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_applicationName:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->areStringsEqual(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    and-int/2addr v0, v2

    .line 702
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_accessToken:Ljava/lang/String;

    iget-object v3, v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_accessToken:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->areStringsEqual(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    and-int/2addr v0, v2

    .line 705
    .end local v1    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :cond_24
    return v0
.end method

.method public declared-synchronized getAccessToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 286
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_accessToken:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getBaseURL()Ljava/net/URL;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_baseURL:Ljava/net/URL;

    return-object v0
.end method

.method public getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 12
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "priority"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;
    .param p3, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .param p4, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    .line 308
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_addAdditionalHttpHeaders(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;)V

    .line 309
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-direct {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;-><init>()V

    .line 311
    .local v4, "requestHandler":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$1;

    invoke-direct {v3, p0, v4, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    .line 318
    .local v3, "responseHandler":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;

    move-object v1, p0

    move-object v2, p1

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    .line 332
    .local v0, "requestRunner":Ljava/lang/Runnable;
    iput-object v0, v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;->_requestRunner:Ljava/lang/Runnable;

    .line 334
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 335
    return-object v4
.end method

.method public getResponseForDownloadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 14
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "priority"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;
    .param p4, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .param p5, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    .line 401
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_addAdditionalHttpHeaders(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;)V

    .line 402
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-direct {v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;-><init>()V

    .line 403
    .local v5, "requestHandler":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    invoke-virtual {v5, p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->setNotifyHandler(Landroid/os/Handler;)V

    .line 404
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;

    invoke-direct {v4, p0, v5, p4, p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    .line 411
    .local v4, "responseHandler":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$4;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    .line 426
    .local v0, "requestRunner":Ljava/lang/Runnable;
    iput-object v0, v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;->_requestRunner:Ljava/lang/Runnable;

    .line 428
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 429
    return-object v5
.end method

.method public getResponseForUploadRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 14
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "priority"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;
    .param p4, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .param p5, "callBackRequiredForHandler"    # Landroid/os/Handler;

    .prologue
    .line 456
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_addAdditionalHttpHeaders(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;)V

    .line 457
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-direct {v5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;-><init>()V

    .line 458
    .local v5, "requestHandler":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    invoke-virtual {v5, p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->setNotifyHandler(Landroid/os/Handler;)V

    .line 459
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$5;

    invoke-direct {v4, p0, v5, p4, p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$5;-><init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    .line 466
    .local v4, "responseHandler":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService$6;-><init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)V

    .line 481
    .local v0, "requestRunner":Ljava/lang/Runnable;
    iput-object v0, v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;->_requestRunner:Ljava/lang/Runnable;

    .line 483
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 484
    return-object v5
.end method

.method public declared-synchronized hasEncounteredTooManyAuthFailures()Z
    .registers 13

    .prologue
    .line 248
    monitor-enter p0

    const/4 v6, 0x0

    .line 250
    .local v6, "tooManyFailures":Z
    :try_start_2
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_authTokenHistory:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    sget v8, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->AdobeNetworkHTTPServiceMaxAuthTokenHistory:I
    :try_end_a
    .catchall {:try_start_2 .. :try_end_a} :catchall_3b

    if-ge v7, v8, :cond_f

    .line 251
    const/4 v6, 0x0

    .line 265
    :cond_d
    :goto_d
    monitor-exit p0

    return v6

    .line 254
    :cond_f
    :try_start_f
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 255
    .local v2, "currentTime":Ljava/util/Date;
    const-wide/32 v0, 0x493e0

    .line 256
    .local v0, "_5mindiff":J
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_18
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_authTokenHistory:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v3, v7, :cond_d

    .line 257
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_authTokenHistory:Ljava/util/List;

    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Date;

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J
    :try_end_2f
    .catchall {:try_start_f .. :try_end_2f} :catchall_3b

    move-result-wide v10

    sub-long v4, v8, v10

    .line 258
    .local v4, "diff":J
    cmp-long v7, v4, v0

    if-lez v7, :cond_38

    .line 259
    const/4 v6, 0x1

    .line 260
    goto :goto_d

    .line 256
    :cond_38
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 248
    .end local v0    # "_5mindiff":J
    .end local v2    # "currentTime":Ljava/util/Date;
    .end local v3    # "i":I
    .end local v4    # "diff":J
    :catchall_3b
    move-exception v7

    monitor-exit p0

    throw v7
.end method

.method public declared-synchronized isConnected()Z
    .registers 3

    .prologue
    .line 197
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentErrorCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentErrorThresholdToDisconnect:I
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_10

    if-ge v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_c
    monitor-exit p0

    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_c

    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reconnect()V
    .registers 3

    .prologue
    .line 184
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_recentErrorCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 185
    monitor-exit p0

    return-void

    .line 184
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAccessToken(Ljava/lang/String;)V
    .registers 4
    .param p1, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 272
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_accessToken:Ljava/lang/String;

    .line 274
    if-eqz p1, :cond_28

    .line 275
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_authTokenHistory:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    sget v1, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->AdobeNetworkHTTPServiceMaxAuthTokenHistory:I

    if-lt v0, v1, :cond_1c

    .line 276
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_authTokenHistory:Ljava/util/List;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_authTokenHistory:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 279
    :cond_1c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_authTokenHistory:Ljava/util/List;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_26
    .catchall {:try_start_1 .. :try_end_26} :catchall_30

    .line 283
    :goto_26
    monitor-exit p0

    return-void

    .line 281
    :cond_28
    :try_start_28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_authTokenHistory:Ljava/util/List;
    :try_end_2f
    .catchall {:try_start_28 .. :try_end_2f} :catchall_30

    goto :goto_26

    .line 272
    :catchall_30
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setBaseURL(Ljava/net/URL;)V
    .registers 2
    .param p1, "baseURL"    # Ljava/net/URL;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_baseURL:Ljava/net/URL;

    .line 149
    return-void
.end method

.method public setHttpServiceDelegate(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;)V
    .registers 2
    .param p1, "serviceDelegate"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;

    .prologue
    .line 135
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_serviceDelegate:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;

    .line 136
    return-void
.end method

.method public setSuspended(Z)V
    .registers 3
    .param p1, "suspended"    # Z

    .prologue
    .line 214
    if-eqz p1, :cond_8

    .line 216
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->pause()V

    .line 222
    :goto_7
    return-void

    .line 220
    :cond_8
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->_requestExecutor:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;->resume()V

    goto :goto_7
.end method
