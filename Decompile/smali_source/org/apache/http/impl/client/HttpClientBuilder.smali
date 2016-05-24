.class public Lorg/apache/http/impl/client/HttpClientBuilder;
.super Ljava/lang/Object;
.source "HttpClientBuilder.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field static final DEFAULT_USER_AGENT:Ljava/lang/String;


# instance fields
.field private authCachingDisabled:Z

.field private authSchemeRegistry:Lorg/apache/http/config/Lookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/auth/AuthSchemeProvider;",
            ">;"
        }
    .end annotation
.end field

.field private automaticRetriesDisabled:Z

.field private backoffManager:Lorg/apache/http/client/BackoffManager;

.field private closeables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/Closeable;",
            ">;"
        }
    .end annotation
.end field

.field private connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

.field private connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

.field private connectionStateDisabled:Z

.field private contentCompressionDisabled:Z

.field private cookieManagementDisabled:Z

.field private cookieSpecRegistry:Lorg/apache/http/config/Lookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/cookie/CookieSpecProvider;",
            ">;"
        }
    .end annotation
.end field

.field private cookieStore:Lorg/apache/http/client/CookieStore;

.field private credentialsProvider:Lorg/apache/http/client/CredentialsProvider;

.field private defaultConnectionConfig:Lorg/apache/http/config/ConnectionConfig;

.field private defaultHeaders:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<+",
            "Lorg/apache/http/Header;",
            ">;"
        }
    .end annotation
.end field

.field private defaultRequestConfig:Lorg/apache/http/client/config/RequestConfig;

.field private defaultSocketConfig:Lorg/apache/http/config/SocketConfig;

.field private hostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

.field private httpprocessor:Lorg/apache/http/protocol/HttpProcessor;

.field private keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

.field private maxConnPerRoute:I

.field private maxConnTotal:I

.field private proxy:Lorg/apache/http/HttpHost;

.field private proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

.field private redirectHandlingDisabled:Z

.field private redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

.field private requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

.field private requestFirst:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/apache/http/HttpRequestInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private requestLast:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/apache/http/HttpRequestInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private responseFirst:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/apache/http/HttpResponseInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private responseLast:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/apache/http/HttpResponseInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

.field private reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

.field private routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

.field private schemePortResolver:Lorg/apache/http/conn/SchemePortResolver;

.field private serviceUnavailStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

.field private sslSocketFactory:Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;

.field private sslcontext:Ljavax/net/ssl/SSLContext;

.field private systemProperties:Z

.field private targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

.field private userAgent:Ljava/lang/String;

.field private userTokenHandler:Lorg/apache/http/client/UserTokenHandler;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 204
    const-string v2, "org.apache.http.client"

    const-class v3, Lorg/apache/http/impl/client/HttpClientBuilder;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/http/util/VersionInfo;->loadVersionInfo(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;

    move-result-object v1

    .line 206
    .local v1, "vi":Lorg/apache/http/util/VersionInfo;
    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Lorg/apache/http/util/VersionInfo;->getRelease()Ljava/lang/String;

    move-result-object v0

    .line 208
    .local v0, "release":Ljava/lang/String;
    :goto_12
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Apache-HttpClient/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (java 1.5)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/apache/http/impl/client/HttpClientBuilder;->DEFAULT_USER_AGENT:Ljava/lang/String;

    .line 209
    return-void

    .line 206
    .end local v0    # "release":Ljava/lang/String;
    :cond_2e
    const-string v0, "UNAVAILABLE"

    goto :goto_12
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    iput v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->maxConnTotal:I

    .line 198
    iput v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->maxConnPerRoute:I

    .line 217
    return-void
.end method

.method public static create()Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 1

    .prologue
    .line 212
    new-instance v0, Lorg/apache/http/impl/client/HttpClientBuilder;

    invoke-direct {v0}, Lorg/apache/http/impl/client/HttpClientBuilder;-><init>()V

    return-object v0
.end method

.method private static split(Ljava/lang/String;)[Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 687
    invoke-static {p0}, Lorg/apache/http/util/TextUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 688
    const/4 v0, 0x0

    .line 690
    :goto_7
    return-object v0

    :cond_8
    const-string v0, " *, *"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method


# virtual methods
.method protected addCloseable(Ljava/io/Closeable;)V
    .registers 3
    .param p1, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 677
    if-nez p1, :cond_3

    .line 684
    :goto_2
    return-void

    .line 680
    :cond_3
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->closeables:Ljava/util/List;

    if-nez v0, :cond_e

    .line 681
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->closeables:Ljava/util/List;

    .line 683
    :cond_e
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->closeables:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public final addInterceptorFirst(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 3
    .param p1, "itcp"    # Lorg/apache/http/HttpRequestInterceptor;

    .prologue
    .line 446
    if-nez p1, :cond_3

    .line 453
    :goto_2
    return-object p0

    .line 449
    :cond_3
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestFirst:Ljava/util/LinkedList;

    if-nez v0, :cond_e

    .line 450
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestFirst:Ljava/util/LinkedList;

    .line 452
    :cond_e
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestFirst:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_2
.end method

.method public final addInterceptorFirst(Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 3
    .param p1, "itcp"    # Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 412
    if-nez p1, :cond_3

    .line 419
    :goto_2
    return-object p0

    .line 415
    :cond_3
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->responseFirst:Ljava/util/LinkedList;

    if-nez v0, :cond_e

    .line 416
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->responseFirst:Ljava/util/LinkedList;

    .line 418
    :cond_e
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->responseFirst:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_2
.end method

.method public final addInterceptorLast(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 3
    .param p1, "itcp"    # Lorg/apache/http/HttpRequestInterceptor;

    .prologue
    .line 463
    if-nez p1, :cond_3

    .line 470
    :goto_2
    return-object p0

    .line 466
    :cond_3
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestLast:Ljava/util/LinkedList;

    if-nez v0, :cond_e

    .line 467
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestLast:Ljava/util/LinkedList;

    .line 469
    :cond_e
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestLast:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_2
.end method

.method public final addInterceptorLast(Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 3
    .param p1, "itcp"    # Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 429
    if-nez p1, :cond_3

    .line 436
    :goto_2
    return-object p0

    .line 432
    :cond_3
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->responseLast:Ljava/util/LinkedList;

    if-nez v0, :cond_e

    .line 433
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->responseLast:Ljava/util/LinkedList;

    .line 435
    :cond_e
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->responseLast:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_2
.end method

.method public build()Lorg/apache/http/impl/client/CloseableHttpClient;
    .registers 42

    .prologue
    .line 695
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    .line 696
    .local v5, "requestExec":Lorg/apache/http/protocol/HttpRequestExecutor;
    if-nez v5, :cond_b

    .line 697
    new-instance v5, Lorg/apache/http/protocol/HttpRequestExecutor;

    .end local v5    # "requestExec":Lorg/apache/http/protocol/HttpRequestExecutor;
    invoke-direct {v5}, Lorg/apache/http/protocol/HttpRequestExecutor;-><init>()V

    .line 699
    .restart local v5    # "requestExec":Lorg/apache/http/protocol/HttpRequestExecutor;
    :cond_b
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    .line 700
    .local v6, "connManager":Lorg/apache/http/conn/HttpClientConnectionManager;
    if-nez v6, :cond_eb

    .line 701
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->sslSocketFactory:Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;

    move-object/from16 v37, v0

    .line 702
    .local v37, "sslSocketFactory":Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
    if-nez v37, :cond_5a

    .line 703
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_182

    const-string v12, "https.protocols"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/apache/http/impl/client/HttpClientBuilder;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v39

    .line 705
    .local v39, "supportedProtocols":[Ljava/lang/String;
    :goto_29
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_186

    const-string v12, "https.cipherSuites"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/apache/http/impl/client/HttpClientBuilder;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v38

    .line 707
    .local v38, "supportedCipherSuites":[Ljava/lang/String;
    :goto_39
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->hostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    move-object/from16 v26, v0

    .line 708
    .local v26, "hostnameVerifier":Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    if-nez v26, :cond_43

    .line 709
    sget-object v26, Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;->BROWSER_COMPATIBLE_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .line 711
    :cond_43
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->sslcontext:Ljavax/net/ssl/SSLContext;

    if-eqz v12, :cond_18a

    .line 712
    new-instance v37, Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;

    .end local v37    # "sslSocketFactory":Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->sslcontext:Ljavax/net/ssl/SSLContext;

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    move-object/from16 v2, v38

    move-object/from16 v3, v26

    invoke-direct {v0, v12, v1, v2, v3}, Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;[Ljava/lang/String;[Ljava/lang/String;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 727
    .end local v26    # "hostnameVerifier":Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    .end local v38    # "supportedCipherSuites":[Ljava/lang/String;
    .end local v39    # "supportedProtocols":[Ljava/lang/String;
    .restart local v37    # "sslSocketFactory":Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
    :cond_5a
    :goto_5a
    new-instance v31, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;

    invoke-static {}, Lorg/apache/http/config/RegistryBuilder;->create()Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "http"

    invoke-static {}, Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;->getSocketFactory()Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "https"

    move-object/from16 v0, v37

    invoke-virtual {v12, v13, v0}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/http/config/RegistryBuilder;->build()Lorg/apache/http/config/Registry;

    move-result-object v12

    move-object/from16 v0, v31

    invoke-direct {v0, v12}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Registry;)V

    .line 732
    .local v31, "poolingmgr":Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultSocketConfig:Lorg/apache/http/config/SocketConfig;

    if-eqz v12, :cond_8a

    .line 733
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultSocketConfig:Lorg/apache/http/config/SocketConfig;

    move-object/from16 v0, v31

    invoke-virtual {v0, v12}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->setDefaultSocketConfig(Lorg/apache/http/config/SocketConfig;)V

    .line 735
    :cond_8a
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultConnectionConfig:Lorg/apache/http/config/ConnectionConfig;

    if-eqz v12, :cond_99

    .line 736
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultConnectionConfig:Lorg/apache/http/config/ConnectionConfig;

    move-object/from16 v0, v31

    invoke-virtual {v0, v12}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->setDefaultConnectionConfig(Lorg/apache/http/config/ConnectionConfig;)V

    .line 738
    :cond_99
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_cb

    .line 739
    const-string v12, "http.keepAlive"

    const-string v13, "true"

    invoke-static {v12, v13}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 740
    .local v34, "s":Ljava/lang/String;
    const-string v12, "true"

    move-object/from16 v0, v34

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_cb

    .line 741
    const-string v12, "http.maxConnections"

    const-string v13, "5"

    invoke-static {v12, v13}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 742
    invoke-static/range {v34 .. v34}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v30

    .line 743
    .local v30, "max":I
    move-object/from16 v0, v31

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->setDefaultMaxPerRoute(I)V

    .line 744
    mul-int/lit8 v12, v30, 0x2

    move-object/from16 v0, v31

    invoke-virtual {v0, v12}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->setMaxTotal(I)V

    .line 747
    .end local v30    # "max":I
    .end local v34    # "s":Ljava/lang/String;
    :cond_cb
    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->maxConnTotal:I

    if-lez v12, :cond_da

    .line 748
    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->maxConnTotal:I

    move-object/from16 v0, v31

    invoke-virtual {v0, v12}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->setMaxTotal(I)V

    .line 750
    :cond_da
    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->maxConnPerRoute:I

    if-lez v12, :cond_e9

    .line 751
    move-object/from16 v0, p0

    iget v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->maxConnPerRoute:I

    move-object/from16 v0, v31

    invoke-virtual {v0, v12}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->setDefaultMaxPerRoute(I)V

    .line 753
    :cond_e9
    move-object/from16 v6, v31

    .line 755
    .end local v31    # "poolingmgr":Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;
    .end local v37    # "sslSocketFactory":Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
    :cond_eb
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 756
    .local v7, "reuseStrategy":Lorg/apache/http/ConnectionReuseStrategy;
    if-nez v7, :cond_10b

    .line 757
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_1b8

    .line 758
    const-string v12, "http.keepAlive"

    const-string v13, "true"

    invoke-static {v12, v13}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 759
    .restart local v34    # "s":Ljava/lang/String;
    const-string v12, "true"

    move-object/from16 v0, v34

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1b4

    .line 760
    sget-object v7, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lorg/apache/http/impl/DefaultConnectionReuseStrategy;

    .line 768
    .end local v34    # "s":Ljava/lang/String;
    :cond_10b
    :goto_10b
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .line 769
    .local v8, "keepAliveStrategy":Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    if-nez v8, :cond_113

    .line 770
    sget-object v8, Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;->INSTANCE:Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;

    .line 772
    :cond_113
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 773
    .local v9, "targetAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    if-nez v9, :cond_11b

    .line 774
    sget-object v9, Lorg/apache/http/impl/client/TargetAuthenticationStrategy;->INSTANCE:Lorg/apache/http/impl/client/TargetAuthenticationStrategy;

    .line 776
    :cond_11b
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 777
    .local v10, "proxyAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    if-nez v10, :cond_123

    .line 778
    sget-object v10, Lorg/apache/http/impl/client/ProxyAuthenticationStrategy;->INSTANCE:Lorg/apache/http/impl/client/ProxyAuthenticationStrategy;

    .line 780
    :cond_123
    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    .line 781
    .local v11, "userTokenHandler":Lorg/apache/http/client/UserTokenHandler;
    if-nez v11, :cond_131

    .line 782
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->connectionStateDisabled:Z

    if-nez v12, :cond_1bc

    .line 783
    sget-object v11, Lorg/apache/http/impl/client/DefaultUserTokenHandler;->INSTANCE:Lorg/apache/http/impl/client/DefaultUserTokenHandler;

    .line 788
    :cond_131
    :goto_131
    new-instance v4, Lorg/apache/http/impl/execchain/MainClientExec;

    invoke-direct/range {v4 .. v11}, Lorg/apache/http/impl/execchain/MainClientExec;-><init>(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;)V

    .line 797
    .local v4, "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/apache/http/impl/client/HttpClientBuilder;->decorateMainExec(Lorg/apache/http/impl/execchain/ClientExecChain;)Lorg/apache/http/impl/execchain/ClientExecChain;

    move-result-object v4

    .line 799
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->httpprocessor:Lorg/apache/http/protocol/HttpProcessor;

    move-object/from16 v27, v0

    .line 800
    .local v27, "httpprocessor":Lorg/apache/http/protocol/HttpProcessor;
    if-nez v27, :cond_2bc

    .line 802
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->userAgent:Ljava/lang/String;

    move-object/from16 v40, v0

    .line 803
    .local v40, "userAgent":Ljava/lang/String;
    if-nez v40, :cond_15c

    .line 804
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_158

    .line 805
    const-string v12, "http.agent"

    invoke-static {v12}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    .line 807
    :cond_158
    if-nez v40, :cond_15c

    .line 808
    sget-object v40, Lorg/apache/http/impl/client/HttpClientBuilder;->DEFAULT_USER_AGENT:Ljava/lang/String;

    .line 812
    :cond_15c
    invoke-static {}, Lorg/apache/http/protocol/HttpProcessorBuilder;->create()Lorg/apache/http/protocol/HttpProcessorBuilder;

    move-result-object v22

    .line 813
    .local v22, "b":Lorg/apache/http/protocol/HttpProcessorBuilder;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestFirst:Ljava/util/LinkedList;

    if-eqz v12, :cond_1c0

    .line 814
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestFirst:Ljava/util/LinkedList;

    invoke-virtual {v12}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v29

    .local v29, "i$":Ljava/util/Iterator;
    :goto_16e
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1c0

    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/apache/http/HttpRequestInterceptor;

    .line 815
    .local v28, "i":Lorg/apache/http/HttpRequestInterceptor;
    move-object/from16 v0, v22

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/apache/http/protocol/HttpProcessorBuilder;->addFirst(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    goto :goto_16e

    .line 703
    .end local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .end local v7    # "reuseStrategy":Lorg/apache/http/ConnectionReuseStrategy;
    .end local v8    # "keepAliveStrategy":Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .end local v9    # "targetAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    .end local v10    # "proxyAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    .end local v11    # "userTokenHandler":Lorg/apache/http/client/UserTokenHandler;
    .end local v22    # "b":Lorg/apache/http/protocol/HttpProcessorBuilder;
    .end local v27    # "httpprocessor":Lorg/apache/http/protocol/HttpProcessor;
    .end local v28    # "i":Lorg/apache/http/HttpRequestInterceptor;
    .end local v29    # "i$":Ljava/util/Iterator;
    .end local v40    # "userAgent":Ljava/lang/String;
    .restart local v37    # "sslSocketFactory":Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
    :cond_182
    const/16 v39, 0x0

    goto/16 :goto_29

    .line 705
    .restart local v39    # "supportedProtocols":[Ljava/lang/String;
    :cond_186
    const/16 v38, 0x0

    goto/16 :goto_39

    .line 715
    .restart local v26    # "hostnameVerifier":Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    .restart local v38    # "supportedCipherSuites":[Ljava/lang/String;
    :cond_18a
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_1a5

    .line 716
    new-instance v37, Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;

    .end local v37    # "sslSocketFactory":Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v12

    check-cast v12, Ljavax/net/ssl/SSLSocketFactory;

    move-object/from16 v0, v37

    move-object/from16 v1, v39

    move-object/from16 v2, v38

    move-object/from16 v3, v26

    invoke-direct {v0, v12, v1, v2, v3}, Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;[Ljava/lang/String;[Ljava/lang/String;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .restart local v37    # "sslSocketFactory":Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
    goto/16 :goto_5a

    .line 720
    :cond_1a5
    new-instance v37, Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;

    .end local v37    # "sslSocketFactory":Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
    invoke-static {}, Lorg/apache/http/conn/ssl/SSLContexts;->createDefault()Ljavax/net/ssl/SSLContext;

    move-result-object v12

    move-object/from16 v0, v37

    move-object/from16 v1, v26

    invoke-direct {v0, v12, v1}, Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .restart local v37    # "sslSocketFactory":Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
    goto/16 :goto_5a

    .line 762
    .end local v26    # "hostnameVerifier":Lorg/apache/http/conn/ssl/X509HostnameVerifier;
    .end local v37    # "sslSocketFactory":Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
    .end local v38    # "supportedCipherSuites":[Ljava/lang/String;
    .end local v39    # "supportedProtocols":[Ljava/lang/String;
    .restart local v7    # "reuseStrategy":Lorg/apache/http/ConnectionReuseStrategy;
    .restart local v34    # "s":Ljava/lang/String;
    :cond_1b4
    sget-object v7, Lorg/apache/http/impl/NoConnectionReuseStrategy;->INSTANCE:Lorg/apache/http/impl/NoConnectionReuseStrategy;

    goto/16 :goto_10b

    .line 765
    .end local v34    # "s":Ljava/lang/String;
    :cond_1b8
    sget-object v7, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lorg/apache/http/impl/DefaultConnectionReuseStrategy;

    goto/16 :goto_10b

    .line 785
    .restart local v8    # "keepAliveStrategy":Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .restart local v9    # "targetAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    .restart local v10    # "proxyAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    .restart local v11    # "userTokenHandler":Lorg/apache/http/client/UserTokenHandler;
    :cond_1bc
    sget-object v11, Lorg/apache/http/impl/client/NoopUserTokenHandler;->INSTANCE:Lorg/apache/http/impl/client/NoopUserTokenHandler;

    goto/16 :goto_131

    .line 818
    .restart local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .restart local v22    # "b":Lorg/apache/http/protocol/HttpProcessorBuilder;
    .restart local v27    # "httpprocessor":Lorg/apache/http/protocol/HttpProcessor;
    .restart local v40    # "userAgent":Ljava/lang/String;
    :cond_1c0
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->responseFirst:Ljava/util/LinkedList;

    if-eqz v12, :cond_1e2

    .line 819
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->responseFirst:Ljava/util/LinkedList;

    invoke-virtual {v12}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v29

    .restart local v29    # "i$":Ljava/util/Iterator;
    :goto_1ce
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1e2

    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/apache/http/HttpResponseInterceptor;

    .line 820
    .local v28, "i":Lorg/apache/http/HttpResponseInterceptor;
    move-object/from16 v0, v22

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/apache/http/protocol/HttpProcessorBuilder;->addFirst(Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    goto :goto_1ce

    .line 823
    .end local v28    # "i":Lorg/apache/http/HttpResponseInterceptor;
    .end local v29    # "i$":Ljava/util/Iterator;
    :cond_1e2
    const/4 v12, 0x6

    new-array v12, v12, [Lorg/apache/http/HttpRequestInterceptor;

    const/4 v13, 0x0

    new-instance v14, Lorg/apache/http/client/protocol/RequestDefaultHeaders;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultHeaders:Ljava/util/Collection;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-direct {v14, v0}, Lorg/apache/http/client/protocol/RequestDefaultHeaders;-><init>(Ljava/util/Collection;)V

    aput-object v14, v12, v13

    const/4 v13, 0x1

    new-instance v14, Lorg/apache/http/protocol/RequestContent;

    invoke-direct {v14}, Lorg/apache/http/protocol/RequestContent;-><init>()V

    aput-object v14, v12, v13

    const/4 v13, 0x2

    new-instance v14, Lorg/apache/http/protocol/RequestTargetHost;

    invoke-direct {v14}, Lorg/apache/http/protocol/RequestTargetHost;-><init>()V

    aput-object v14, v12, v13

    const/4 v13, 0x3

    new-instance v14, Lorg/apache/http/client/protocol/RequestClientConnControl;

    invoke-direct {v14}, Lorg/apache/http/client/protocol/RequestClientConnControl;-><init>()V

    aput-object v14, v12, v13

    const/4 v13, 0x4

    new-instance v14, Lorg/apache/http/protocol/RequestUserAgent;

    move-object/from16 v0, v40

    invoke-direct {v14, v0}, Lorg/apache/http/protocol/RequestUserAgent;-><init>(Ljava/lang/String;)V

    aput-object v14, v12, v13

    const/4 v13, 0x5

    new-instance v14, Lorg/apache/http/client/protocol/RequestExpectContinue;

    invoke-direct {v14}, Lorg/apache/http/client/protocol/RequestExpectContinue;-><init>()V

    aput-object v14, v12, v13

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lorg/apache/http/protocol/HttpProcessorBuilder;->addAll([Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    .line 830
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->cookieManagementDisabled:Z

    if-nez v12, :cond_234

    .line 831
    new-instance v12, Lorg/apache/http/client/protocol/RequestAddCookies;

    invoke-direct {v12}, Lorg/apache/http/client/protocol/RequestAddCookies;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lorg/apache/http/protocol/HttpProcessorBuilder;->add(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    .line 833
    :cond_234
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->contentCompressionDisabled:Z

    if-nez v12, :cond_244

    .line 834
    new-instance v12, Lorg/apache/http/client/protocol/RequestAcceptEncoding;

    invoke-direct {v12}, Lorg/apache/http/client/protocol/RequestAcceptEncoding;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lorg/apache/http/protocol/HttpProcessorBuilder;->add(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    .line 836
    :cond_244
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->authCachingDisabled:Z

    if-nez v12, :cond_254

    .line 837
    new-instance v12, Lorg/apache/http/client/protocol/RequestAuthCache;

    invoke-direct {v12}, Lorg/apache/http/client/protocol/RequestAuthCache;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lorg/apache/http/protocol/HttpProcessorBuilder;->add(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    .line 839
    :cond_254
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->cookieManagementDisabled:Z

    if-nez v12, :cond_264

    .line 840
    new-instance v12, Lorg/apache/http/client/protocol/ResponseProcessCookies;

    invoke-direct {v12}, Lorg/apache/http/client/protocol/ResponseProcessCookies;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lorg/apache/http/protocol/HttpProcessorBuilder;->add(Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    .line 842
    :cond_264
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->contentCompressionDisabled:Z

    if-nez v12, :cond_274

    .line 843
    new-instance v12, Lorg/apache/http/client/protocol/ResponseContentEncoding;

    invoke-direct {v12}, Lorg/apache/http/client/protocol/ResponseContentEncoding;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lorg/apache/http/protocol/HttpProcessorBuilder;->add(Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    .line 845
    :cond_274
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestLast:Ljava/util/LinkedList;

    if-eqz v12, :cond_296

    .line 846
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestLast:Ljava/util/LinkedList;

    invoke-virtual {v12}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v29

    .restart local v29    # "i$":Ljava/util/Iterator;
    :goto_282
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_296

    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/apache/http/HttpRequestInterceptor;

    .line 847
    .local v28, "i":Lorg/apache/http/HttpRequestInterceptor;
    move-object/from16 v0, v22

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/apache/http/protocol/HttpProcessorBuilder;->addLast(Lorg/apache/http/HttpRequestInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    goto :goto_282

    .line 850
    .end local v28    # "i":Lorg/apache/http/HttpRequestInterceptor;
    .end local v29    # "i$":Ljava/util/Iterator;
    :cond_296
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->responseLast:Ljava/util/LinkedList;

    if-eqz v12, :cond_2b8

    .line 851
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->responseLast:Ljava/util/LinkedList;

    invoke-virtual {v12}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v29

    .restart local v29    # "i$":Ljava/util/Iterator;
    :goto_2a4
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2b8

    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/apache/http/HttpResponseInterceptor;

    .line 852
    .local v28, "i":Lorg/apache/http/HttpResponseInterceptor;
    move-object/from16 v0, v22

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/apache/http/protocol/HttpProcessorBuilder;->addLast(Lorg/apache/http/HttpResponseInterceptor;)Lorg/apache/http/protocol/HttpProcessorBuilder;

    goto :goto_2a4

    .line 855
    .end local v28    # "i":Lorg/apache/http/HttpResponseInterceptor;
    .end local v29    # "i$":Ljava/util/Iterator;
    :cond_2b8
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/protocol/HttpProcessorBuilder;->build()Lorg/apache/http/protocol/HttpProcessor;

    move-result-object v27

    .line 857
    .end local v22    # "b":Lorg/apache/http/protocol/HttpProcessorBuilder;
    .end local v40    # "userAgent":Ljava/lang/String;
    :cond_2bc
    new-instance v25, Lorg/apache/http/impl/execchain/ProtocolExec;

    move-object/from16 v0, v25

    move-object/from16 v1, v27

    invoke-direct {v0, v4, v1}, Lorg/apache/http/impl/execchain/ProtocolExec;-><init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/protocol/HttpProcessor;)V

    .line 859
    .end local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .local v25, "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/HttpClientBuilder;->decorateProtocolExec(Lorg/apache/http/impl/execchain/ClientExecChain;)Lorg/apache/http/impl/execchain/ClientExecChain;

    move-result-object v4

    .line 862
    .end local v25    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .restart local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->automaticRetriesDisabled:Z

    if-nez v12, :cond_2e8

    .line 863
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    move-object/from16 v33, v0

    .line 864
    .local v33, "retryHandler":Lorg/apache/http/client/HttpRequestRetryHandler;
    if-nez v33, :cond_2dd

    .line 865
    sget-object v33, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->INSTANCE:Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;

    .line 867
    :cond_2dd
    new-instance v25, Lorg/apache/http/impl/execchain/RetryExec;

    move-object/from16 v0, v25

    move-object/from16 v1, v33

    invoke-direct {v0, v4, v1}, Lorg/apache/http/impl/execchain/RetryExec;-><init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/client/HttpRequestRetryHandler;)V

    .end local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .restart local v25    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    move-object/from16 v4, v25

    .line 870
    .end local v25    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .end local v33    # "retryHandler":Lorg/apache/http/client/HttpRequestRetryHandler;
    .restart local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    :cond_2e8
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

    .line 871
    .local v15, "routePlanner":Lorg/apache/http/conn/routing/HttpRoutePlanner;
    if-nez v15, :cond_309

    .line 872
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->schemePortResolver:Lorg/apache/http/conn/SchemePortResolver;

    move-object/from16 v35, v0

    .line 873
    .local v35, "schemePortResolver":Lorg/apache/http/conn/SchemePortResolver;
    if-nez v35, :cond_2f8

    .line 874
    sget-object v35, Lorg/apache/http/impl/conn/DefaultSchemePortResolver;->INSTANCE:Lorg/apache/http/impl/conn/DefaultSchemePortResolver;

    .line 876
    :cond_2f8
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->proxy:Lorg/apache/http/HttpHost;

    if-eqz v12, :cond_43d

    .line 877
    new-instance v15, Lorg/apache/http/impl/conn/DefaultProxyRoutePlanner;

    .end local v15    # "routePlanner":Lorg/apache/http/conn/routing/HttpRoutePlanner;
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->proxy:Lorg/apache/http/HttpHost;

    move-object/from16 v0, v35

    invoke-direct {v15, v12, v0}, Lorg/apache/http/impl/conn/DefaultProxyRoutePlanner;-><init>(Lorg/apache/http/HttpHost;Lorg/apache/http/conn/SchemePortResolver;)V

    .line 886
    .end local v35    # "schemePortResolver":Lorg/apache/http/conn/SchemePortResolver;
    .restart local v15    # "routePlanner":Lorg/apache/http/conn/routing/HttpRoutePlanner;
    :cond_309
    :goto_309
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->redirectHandlingDisabled:Z

    if-nez v12, :cond_324

    .line 887
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

    move-object/from16 v32, v0

    .line 888
    .local v32, "redirectStrategy":Lorg/apache/http/client/RedirectStrategy;
    if-nez v32, :cond_319

    .line 889
    sget-object v32, Lorg/apache/http/impl/client/DefaultRedirectStrategy;->INSTANCE:Lorg/apache/http/impl/client/DefaultRedirectStrategy;

    .line 891
    :cond_319
    new-instance v25, Lorg/apache/http/impl/execchain/RedirectExec;

    move-object/from16 v0, v25

    move-object/from16 v1, v32

    invoke-direct {v0, v4, v15, v1}, Lorg/apache/http/impl/execchain/RedirectExec;-><init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/client/RedirectStrategy;)V

    .end local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .restart local v25    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    move-object/from16 v4, v25

    .line 895
    .end local v25    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .end local v32    # "redirectStrategy":Lorg/apache/http/client/RedirectStrategy;
    .restart local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    :cond_324
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->serviceUnavailStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    move-object/from16 v36, v0

    .line 896
    .local v36, "serviceUnavailStrategy":Lorg/apache/http/client/ServiceUnavailableRetryStrategy;
    if-eqz v36, :cond_337

    .line 897
    new-instance v25, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    invoke-direct {v0, v4, v1}, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;-><init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/client/ServiceUnavailableRetryStrategy;)V

    .end local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .restart local v25    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    move-object/from16 v4, v25

    .line 900
    .end local v25    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .restart local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    :cond_337
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->backoffManager:Lorg/apache/http/client/BackoffManager;

    move-object/from16 v23, v0

    .line 901
    .local v23, "backoffManager":Lorg/apache/http/client/BackoffManager;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

    move-object/from16 v24, v0

    .line 902
    .local v24, "connectionBackoffStrategy":Lorg/apache/http/client/ConnectionBackoffStrategy;
    if-eqz v23, :cond_354

    if-eqz v24, :cond_354

    .line 903
    new-instance v25, Lorg/apache/http/impl/execchain/BackoffStrategyExec;

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    move-object/from16 v2, v23

    invoke-direct {v0, v4, v1, v2}, Lorg/apache/http/impl/execchain/BackoffStrategyExec;-><init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/client/ConnectionBackoffStrategy;Lorg/apache/http/client/BackoffManager;)V

    .end local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .restart local v25    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    move-object/from16 v4, v25

    .line 906
    .end local v25    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    .restart local v4    # "execChain":Lorg/apache/http/impl/execchain/ClientExecChain;
    :cond_354
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->authSchemeRegistry:Lorg/apache/http/config/Lookup;

    move-object/from16 v17, v0

    .line 907
    .local v17, "authSchemeRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/auth/AuthSchemeProvider;>;"
    if-nez v17, :cond_39b

    .line 908
    invoke-static {}, Lorg/apache/http/config/RegistryBuilder;->create()Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "Basic"

    new-instance v14, Lorg/apache/http/impl/auth/BasicSchemeFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/auth/BasicSchemeFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "Digest"

    new-instance v14, Lorg/apache/http/impl/auth/DigestSchemeFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/auth/DigestSchemeFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "NTLM"

    new-instance v14, Lorg/apache/http/impl/auth/NTLMSchemeFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/auth/NTLMSchemeFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "negotiate"

    new-instance v14, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "Kerberos"

    new-instance v14, Lorg/apache/http/impl/auth/KerberosSchemeFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/auth/KerberosSchemeFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/http/config/RegistryBuilder;->build()Lorg/apache/http/config/Registry;

    move-result-object v17

    .line 916
    :cond_39b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->cookieSpecRegistry:Lorg/apache/http/config/Lookup;

    move-object/from16 v16, v0

    .line 917
    .local v16, "cookieSpecRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/cookie/CookieSpecProvider;>;"
    if-nez v16, :cond_3f8

    .line 918
    invoke-static {}, Lorg/apache/http/config/RegistryBuilder;->create()Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "best-match"

    new-instance v14, Lorg/apache/http/impl/cookie/BestMatchSpecFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/cookie/BestMatchSpecFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "standard"

    new-instance v14, Lorg/apache/http/impl/cookie/RFC2965SpecFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/cookie/RFC2965SpecFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "compatibility"

    new-instance v14, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "netscape"

    new-instance v14, Lorg/apache/http/impl/cookie/NetscapeDraftSpecFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/cookie/NetscapeDraftSpecFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "ignoreCookies"

    new-instance v14, Lorg/apache/http/impl/cookie/IgnoreSpecFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/cookie/IgnoreSpecFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "rfc2109"

    new-instance v14, Lorg/apache/http/impl/cookie/RFC2109SpecFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/cookie/RFC2109SpecFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    const-string v13, "rfc2965"

    new-instance v14, Lorg/apache/http/impl/cookie/RFC2965SpecFactory;

    invoke-direct {v14}, Lorg/apache/http/impl/cookie/RFC2965SpecFactory;-><init>()V

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/http/config/RegistryBuilder;->build()Lorg/apache/http/config/Registry;

    move-result-object v16

    .line 929
    :cond_3f8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->cookieStore:Lorg/apache/http/client/CookieStore;

    move-object/from16 v18, v0

    .line 930
    .local v18, "defaultCookieStore":Lorg/apache/http/client/CookieStore;
    if-nez v18, :cond_405

    .line 931
    new-instance v18, Lorg/apache/http/impl/client/BasicCookieStore;

    .end local v18    # "defaultCookieStore":Lorg/apache/http/client/CookieStore;
    invoke-direct/range {v18 .. v18}, Lorg/apache/http/impl/client/BasicCookieStore;-><init>()V

    .line 934
    .restart local v18    # "defaultCookieStore":Lorg/apache/http/client/CookieStore;
    :cond_405
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->credentialsProvider:Lorg/apache/http/client/CredentialsProvider;

    move-object/from16 v19, v0

    .line 935
    .local v19, "defaultCredentialsProvider":Lorg/apache/http/client/CredentialsProvider;
    if-nez v19, :cond_418

    .line 936
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_459

    .line 937
    new-instance v19, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;

    .end local v19    # "defaultCredentialsProvider":Lorg/apache/http/client/CredentialsProvider;
    invoke-direct/range {v19 .. v19}, Lorg/apache/http/impl/client/SystemDefaultCredentialsProvider;-><init>()V

    .line 943
    .restart local v19    # "defaultCredentialsProvider":Lorg/apache/http/client/CredentialsProvider;
    :cond_418
    :goto_418
    new-instance v12, Lorg/apache/http/impl/client/InternalHttpClient;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultRequestConfig:Lorg/apache/http/client/config/RequestConfig;

    if-eqz v13, :cond_45f

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultRequestConfig:Lorg/apache/http/client/config/RequestConfig;

    move-object/from16 v20, v0

    :goto_426
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->closeables:Ljava/util/List;

    if-eqz v13, :cond_462

    new-instance v21, Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->closeables:Ljava/util/List;

    move-object/from16 v0, v21

    invoke-direct {v0, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_437
    move-object v13, v4

    move-object v14, v6

    invoke-direct/range {v12 .. v21}, Lorg/apache/http/impl/client/InternalHttpClient;-><init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/config/Lookup;Lorg/apache/http/config/Lookup;Lorg/apache/http/client/CookieStore;Lorg/apache/http/client/CredentialsProvider;Lorg/apache/http/client/config/RequestConfig;Ljava/util/List;)V

    return-object v12

    .line 878
    .end local v16    # "cookieSpecRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/cookie/CookieSpecProvider;>;"
    .end local v17    # "authSchemeRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/auth/AuthSchemeProvider;>;"
    .end local v18    # "defaultCookieStore":Lorg/apache/http/client/CookieStore;
    .end local v19    # "defaultCredentialsProvider":Lorg/apache/http/client/CredentialsProvider;
    .end local v23    # "backoffManager":Lorg/apache/http/client/BackoffManager;
    .end local v24    # "connectionBackoffStrategy":Lorg/apache/http/client/ConnectionBackoffStrategy;
    .end local v36    # "serviceUnavailStrategy":Lorg/apache/http/client/ServiceUnavailableRetryStrategy;
    .restart local v35    # "schemePortResolver":Lorg/apache/http/conn/SchemePortResolver;
    :cond_43d
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/http/impl/client/HttpClientBuilder;->systemProperties:Z

    if-eqz v12, :cond_450

    .line 879
    new-instance v15, Lorg/apache/http/impl/conn/SystemDefaultRoutePlanner;

    .end local v15    # "routePlanner":Lorg/apache/http/conn/routing/HttpRoutePlanner;
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v12

    move-object/from16 v0, v35

    invoke-direct {v15, v0, v12}, Lorg/apache/http/impl/conn/SystemDefaultRoutePlanner;-><init>(Lorg/apache/http/conn/SchemePortResolver;Ljava/net/ProxySelector;)V

    .restart local v15    # "routePlanner":Lorg/apache/http/conn/routing/HttpRoutePlanner;
    goto/16 :goto_309

    .line 882
    :cond_450
    new-instance v15, Lorg/apache/http/impl/conn/DefaultRoutePlanner;

    .end local v15    # "routePlanner":Lorg/apache/http/conn/routing/HttpRoutePlanner;
    move-object/from16 v0, v35

    invoke-direct {v15, v0}, Lorg/apache/http/impl/conn/DefaultRoutePlanner;-><init>(Lorg/apache/http/conn/SchemePortResolver;)V

    .restart local v15    # "routePlanner":Lorg/apache/http/conn/routing/HttpRoutePlanner;
    goto/16 :goto_309

    .line 939
    .end local v35    # "schemePortResolver":Lorg/apache/http/conn/SchemePortResolver;
    .restart local v16    # "cookieSpecRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/cookie/CookieSpecProvider;>;"
    .restart local v17    # "authSchemeRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/auth/AuthSchemeProvider;>;"
    .restart local v18    # "defaultCookieStore":Lorg/apache/http/client/CookieStore;
    .restart local v19    # "defaultCredentialsProvider":Lorg/apache/http/client/CredentialsProvider;
    .restart local v23    # "backoffManager":Lorg/apache/http/client/BackoffManager;
    .restart local v24    # "connectionBackoffStrategy":Lorg/apache/http/client/ConnectionBackoffStrategy;
    .restart local v36    # "serviceUnavailStrategy":Lorg/apache/http/client/ServiceUnavailableRetryStrategy;
    :cond_459
    new-instance v19, Lorg/apache/http/impl/client/BasicCredentialsProvider;

    .end local v19    # "defaultCredentialsProvider":Lorg/apache/http/client/CredentialsProvider;
    invoke-direct/range {v19 .. v19}, Lorg/apache/http/impl/client/BasicCredentialsProvider;-><init>()V

    .restart local v19    # "defaultCredentialsProvider":Lorg/apache/http/client/CredentialsProvider;
    goto :goto_418

    .line 943
    :cond_45f
    sget-object v20, Lorg/apache/http/client/config/RequestConfig;->DEFAULT:Lorg/apache/http/client/config/RequestConfig;

    goto :goto_426

    :cond_462
    const/16 v21, 0x0

    goto :goto_437
.end method

.method protected decorateMainExec(Lorg/apache/http/impl/execchain/ClientExecChain;)Lorg/apache/http/impl/execchain/ClientExecChain;
    .registers 2
    .param p1, "mainExec"    # Lorg/apache/http/impl/execchain/ClientExecChain;

    .prologue
    .line 663
    return-object p1
.end method

.method protected decorateProtocolExec(Lorg/apache/http/impl/execchain/ClientExecChain;)Lorg/apache/http/impl/execchain/ClientExecChain;
    .registers 2
    .param p1, "protocolExec"    # Lorg/apache/http/impl/execchain/ClientExecChain;

    .prologue
    .line 670
    return-object p1
.end method

.method public final disableAuthCaching()Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 502
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->authCachingDisabled:Z

    .line 503
    return-object p0
.end method

.method public final disableAutomaticRetries()Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 529
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->automaticRetriesDisabled:Z

    .line 530
    return-object p0
.end method

.method public final disableConnectionState()Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 370
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->connectionStateDisabled:Z

    .line 371
    return-object p0
.end method

.method public final disableContentCompression()Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 491
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->contentCompressionDisabled:Z

    .line 492
    return-object p0
.end method

.method public final disableCookieManagement()Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 480
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->cookieManagementDisabled:Z

    .line 481
    return-object p0
.end method

.method public final disableRedirectHandling()Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 568
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->redirectHandlingDisabled:Z

    .line 569
    return-object p0
.end method

.method public final setBackoffManager(Lorg/apache/http/client/BackoffManager;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "backoffManager"    # Lorg/apache/http/client/BackoffManager;

    .prologue
    .line 585
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->backoffManager:Lorg/apache/http/client/BackoffManager;

    .line 586
    return-object p0
.end method

.method public final setConnectionBackoffStrategy(Lorg/apache/http/client/ConnectionBackoffStrategy;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "connectionBackoffStrategy"    # Lorg/apache/http/client/ConnectionBackoffStrategy;

    .prologue
    .line 577
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

    .line 578
    return-object p0
.end method

.method public final setConnectionManager(Lorg/apache/http/conn/HttpClientConnectionManager;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "connManager"    # Lorg/apache/http/conn/HttpClientConnectionManager;

    .prologue
    .line 313
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    .line 314
    return-object p0
.end method

.method public final setConnectionReuseStrategy(Lorg/apache/http/ConnectionReuseStrategy;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "reuseStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;

    .prologue
    .line 322
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 323
    return-object p0
.end method

.method public final setDefaultAuthSchemeRegistry(Lorg/apache/http/config/Lookup;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/auth/AuthSchemeProvider;",
            ">;)",
            "Lorg/apache/http/impl/client/HttpClientBuilder;"
        }
    .end annotation

    .prologue
    .line 625
    .local p1, "authSchemeRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/auth/AuthSchemeProvider;>;"
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->authSchemeRegistry:Lorg/apache/http/config/Lookup;

    .line 626
    return-object p0
.end method

.method public final setDefaultConnectionConfig(Lorg/apache/http/config/ConnectionConfig;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "config"    # Lorg/apache/http/config/ConnectionConfig;

    .prologue
    .line 304
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultConnectionConfig:Lorg/apache/http/config/ConnectionConfig;

    .line 305
    return-object p0
.end method

.method public final setDefaultCookieSpecRegistry(Lorg/apache/http/config/Lookup;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/cookie/CookieSpecProvider;",
            ">;)",
            "Lorg/apache/http/impl/client/HttpClientBuilder;"
        }
    .end annotation

    .prologue
    .line 636
    .local p1, "cookieSpecRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/cookie/CookieSpecProvider;>;"
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->cookieSpecRegistry:Lorg/apache/http/config/Lookup;

    .line 637
    return-object p0
.end method

.method public final setDefaultCookieStore(Lorg/apache/http/client/CookieStore;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "cookieStore"    # Lorg/apache/http/client/CookieStore;

    .prologue
    .line 603
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->cookieStore:Lorg/apache/http/client/CookieStore;

    .line 604
    return-object p0
.end method

.method public final setDefaultCredentialsProvider(Lorg/apache/http/client/CredentialsProvider;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "credentialsProvider"    # Lorg/apache/http/client/CredentialsProvider;

    .prologue
    .line 614
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->credentialsProvider:Lorg/apache/http/client/CredentialsProvider;

    .line 615
    return-object p0
.end method

.method public final setDefaultHeaders(Ljava/util/Collection;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lorg/apache/http/Header;",
            ">;)",
            "Lorg/apache/http/impl/client/HttpClientBuilder;"
        }
    .end annotation

    .prologue
    .line 401
    .local p1, "defaultHeaders":Ljava/util/Collection;, "Ljava/util/Collection<+Lorg/apache/http/Header;>;"
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultHeaders:Ljava/util/Collection;

    .line 402
    return-object p0
.end method

.method public final setDefaultRequestConfig(Lorg/apache/http/client/config/RequestConfig;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "config"    # Lorg/apache/http/client/config/RequestConfig;

    .prologue
    .line 646
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultRequestConfig:Lorg/apache/http/client/config/RequestConfig;

    .line 647
    return-object p0
.end method

.method public final setDefaultSocketConfig(Lorg/apache/http/config/SocketConfig;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "config"    # Lorg/apache/http/config/SocketConfig;

    .prologue
    .line 293
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->defaultSocketConfig:Lorg/apache/http/config/SocketConfig;

    .line 294
    return-object p0
.end method

.method public final setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "hostnameVerifier"    # Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .prologue
    .line 235
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->hostnameVerifier:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    .line 236
    return-object p0
.end method

.method public final setHttpProcessor(Lorg/apache/http/protocol/HttpProcessor;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "httpprocessor"    # Lorg/apache/http/protocol/HttpProcessor;

    .prologue
    .line 510
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->httpprocessor:Lorg/apache/http/protocol/HttpProcessor;

    .line 511
    return-object p0
.end method

.method public final setKeepAliveStrategy(Lorg/apache/http/conn/ConnectionKeepAliveStrategy;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "keepAliveStrategy"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .prologue
    .line 331
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .line 332
    return-object p0
.end method

.method public final setMaxConnPerRoute(I)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "maxConnPerRoute"    # I

    .prologue
    .line 282
    iput p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->maxConnPerRoute:I

    .line 283
    return-object p0
.end method

.method public final setMaxConnTotal(I)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "maxConnTotal"    # I

    .prologue
    .line 271
    iput p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->maxConnTotal:I

    .line 272
    return-object p0
.end method

.method public final setProxy(Lorg/apache/http/HttpHost;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "proxy"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 541
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->proxy:Lorg/apache/http/HttpHost;

    .line 542
    return-object p0
.end method

.method public final setProxyAuthenticationStrategy(Lorg/apache/http/client/AuthenticationStrategy;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "proxyAuthStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;

    .prologue
    .line 351
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 352
    return-object p0
.end method

.method public final setRedirectStrategy(Lorg/apache/http/client/RedirectStrategy;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "redirectStrategy"    # Lorg/apache/http/client/RedirectStrategy;

    .prologue
    .line 560
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

    .line 561
    return-object p0
.end method

.method public final setRequestExecutor(Lorg/apache/http/protocol/HttpRequestExecutor;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "requestExec"    # Lorg/apache/http/protocol/HttpRequestExecutor;

    .prologue
    .line 223
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    .line 224
    return-object p0
.end method

.method public final setRetryHandler(Lorg/apache/http/client/HttpRequestRetryHandler;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;

    .prologue
    .line 521
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    .line 522
    return-object p0
.end method

.method public final setRoutePlanner(Lorg/apache/http/conn/routing/HttpRoutePlanner;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "routePlanner"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;

    .prologue
    .line 552
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

    .line 553
    return-object p0
.end method

.method public final setSSLSocketFactory(Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "sslSocketFactory"    # Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;

    .prologue
    .line 260
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->sslSocketFactory:Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;

    .line 261
    return-object p0
.end method

.method public final setSchemePortResolver(Lorg/apache/http/conn/SchemePortResolver;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "schemePortResolver"    # Lorg/apache/http/conn/SchemePortResolver;

    .prologue
    .line 379
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->schemePortResolver:Lorg/apache/http/conn/SchemePortResolver;

    .line 380
    return-object p0
.end method

.method public final setServiceUnavailableRetryStrategy(Lorg/apache/http/client/ServiceUnavailableRetryStrategy;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "serviceUnavailStrategy"    # Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    .prologue
    .line 594
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->serviceUnavailStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    .line 595
    return-object p0
.end method

.method public final setSslcontext(Ljavax/net/ssl/SSLContext;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "sslcontext"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 248
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->sslcontext:Ljavax/net/ssl/SSLContext;

    .line 249
    return-object p0
.end method

.method public final setTargetAuthenticationStrategy(Lorg/apache/http/client/AuthenticationStrategy;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "targetAuthStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;

    .prologue
    .line 341
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 342
    return-object p0
.end method

.method public final setUserAgent(Ljava/lang/String;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 390
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->userAgent:Ljava/lang/String;

    .line 391
    return-object p0
.end method

.method public final setUserTokenHandler(Lorg/apache/http/client/UserTokenHandler;)Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2
    .param p1, "userTokenHandler"    # Lorg/apache/http/client/UserTokenHandler;

    .prologue
    .line 362
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    .line 363
    return-object p0
.end method

.method public final useSystemProperties()Lorg/apache/http/impl/client/HttpClientBuilder;
    .registers 2

    .prologue
    .line 655
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/client/HttpClientBuilder;->systemProperties:Z

    .line 656
    return-object p0
.end method
