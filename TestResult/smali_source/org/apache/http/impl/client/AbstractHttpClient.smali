.class public abstract Lorg/apache/http/impl/client/AbstractHttpClient;
.super Lorg/apache/http/impl/client/CloseableHttpClient;
.source "AbstractHttpClient.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private backoffManager:Lorg/apache/http/client/BackoffManager;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private connManager:Lorg/apache/http/conn/ClientConnectionManager;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private cookieStore:Lorg/apache/http/client/CookieStore;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private credsProvider:Lorg/apache/http/client/CredentialsProvider;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private defaultParams:Lorg/apache/http/params/HttpParams;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final log:Lorg/apache/commons/logging/Log;

.field private mutableProcessor:Lorg/apache/http/protocol/BasicHttpProcessor;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private redirectStrategy:Lorg/apache/http/client/RedirectStrategy;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private supportedAuthSchemes:Lorg/apache/http/auth/AuthSchemeRegistry;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private supportedCookieSpecs:Lorg/apache/http/cookie/CookieSpecRegistry;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private userTokenHandler:Lorg/apache/http/client/UserTokenHandler;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    .registers 4
    .param p1, "conman"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 271
    invoke-direct {p0}, Lorg/apache/http/impl/client/CloseableHttpClient;-><init>()V

    .line 185
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->log:Lorg/apache/commons/logging/Log;

    .line 272
    iput-object p2, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->defaultParams:Lorg/apache/http/params/HttpParams;

    .line 273
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    .line 274
    return-void
.end method

.method private declared-synchronized getProtocolProcessor()Lorg/apache/http/protocol/HttpProcessor;
    .registers 8

    .prologue
    .line 705
    monitor-enter p0

    :try_start_1
    iget-object v6, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;

    if-nez v6, :cond_34

    .line 707
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v1

    .line 709
    .local v1, "proc":Lorg/apache/http/protocol/BasicHttpProcessor;
    invoke-virtual {v1}, Lorg/apache/http/protocol/BasicHttpProcessor;->getRequestInterceptorCount()I

    move-result v2

    .line 710
    .local v2, "reqc":I
    new-array v3, v2, [Lorg/apache/http/HttpRequestInterceptor;

    .line 711
    .local v3, "reqinterceptors":[Lorg/apache/http/HttpRequestInterceptor;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    if-ge v0, v2, :cond_1b

    .line 712
    invoke-virtual {v1, v0}, Lorg/apache/http/protocol/BasicHttpProcessor;->getRequestInterceptor(I)Lorg/apache/http/HttpRequestInterceptor;

    move-result-object v6

    aput-object v6, v3, v0

    .line 711
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 714
    :cond_1b
    invoke-virtual {v1}, Lorg/apache/http/protocol/BasicHttpProcessor;->getResponseInterceptorCount()I

    move-result v4

    .line 715
    .local v4, "resc":I
    new-array v5, v4, [Lorg/apache/http/HttpResponseInterceptor;

    .line 716
    .local v5, "resinterceptors":[Lorg/apache/http/HttpResponseInterceptor;
    const/4 v0, 0x0

    :goto_22
    if-ge v0, v4, :cond_2d

    .line 717
    invoke-virtual {v1, v0}, Lorg/apache/http/protocol/BasicHttpProcessor;->getResponseInterceptor(I)Lorg/apache/http/HttpResponseInterceptor;

    move-result-object v6

    aput-object v6, v5, v0

    .line 716
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 719
    :cond_2d
    new-instance v6, Lorg/apache/http/protocol/ImmutableHttpProcessor;

    invoke-direct {v6, v3, v5}, Lorg/apache/http/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/http/HttpRequestInterceptor;[Lorg/apache/http/HttpResponseInterceptor;)V

    iput-object v6, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;

    .line 721
    .end local v0    # "i":I
    .end local v1    # "proc":Lorg/apache/http/protocol/BasicHttpProcessor;
    .end local v2    # "reqc":I
    .end local v3    # "reqinterceptors":[Lorg/apache/http/HttpRequestInterceptor;
    .end local v4    # "resc":I
    .end local v5    # "resinterceptors":[Lorg/apache/http/HttpResponseInterceptor;
    :cond_34
    iget-object v6, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;
    :try_end_36
    .catchall {:try_start_1 .. :try_end_36} :catchall_38

    monitor-exit p0

    return-object v6

    .line 705
    :catchall_38
    move-exception v6

    monitor-exit p0

    throw v6
.end method


# virtual methods
.method public declared-synchronized addRequestInterceptor(Lorg/apache/http/HttpRequestInterceptor;)V
    .registers 3
    .param p1, "itcp"    # Lorg/apache/http/HttpRequestInterceptor;

    .prologue
    .line 761
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/BasicHttpProcessor;->addInterceptor(Lorg/apache/http/HttpRequestInterceptor;)V

    .line 762
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 763
    monitor-exit p0

    return-void

    .line 761
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addRequestInterceptor(Lorg/apache/http/HttpRequestInterceptor;I)V
    .registers 4
    .param p1, "itcp"    # Lorg/apache/http/HttpRequestInterceptor;
    .param p2, "index"    # I

    .prologue
    .line 766
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/protocol/BasicHttpProcessor;->addInterceptor(Lorg/apache/http/HttpRequestInterceptor;I)V

    .line 767
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 768
    monitor-exit p0

    return-void

    .line 766
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addResponseInterceptor(Lorg/apache/http/HttpResponseInterceptor;)V
    .registers 3
    .param p1, "itcp"    # Lorg/apache/http/HttpResponseInterceptor;

    .prologue
    .line 741
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/BasicHttpProcessor;->addInterceptor(Lorg/apache/http/HttpResponseInterceptor;)V

    .line 742
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 743
    monitor-exit p0

    return-void

    .line 741
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addResponseInterceptor(Lorg/apache/http/HttpResponseInterceptor;I)V
    .registers 4
    .param p1, "itcp"    # Lorg/apache/http/HttpResponseInterceptor;
    .param p2, "index"    # I

    .prologue
    .line 746
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/protocol/BasicHttpProcessor;->addInterceptor(Lorg/apache/http/HttpResponseInterceptor;I)V

    .line 747
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 748
    monitor-exit p0

    return-void

    .line 746
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearRequestInterceptors()V
    .registers 2

    .prologue
    .line 771
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/protocol/BasicHttpProcessor;->clearRequestInterceptors()V

    .line 772
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 773
    monitor-exit p0

    return-void

    .line 771
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearResponseInterceptors()V
    .registers 2

    .prologue
    .line 751
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/protocol/BasicHttpProcessor;->clearResponseInterceptors()V

    .line 752
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 753
    monitor-exit p0

    return-void

    .line 751
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public close()V
    .registers 2

    .prologue
    .line 991
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 992
    return-void
.end method

.method protected createAuthSchemeRegistry()Lorg/apache/http/auth/AuthSchemeRegistry;
    .registers 4

    .prologue
    .line 337
    new-instance v0, Lorg/apache/http/auth/AuthSchemeRegistry;

    invoke-direct {v0}, Lorg/apache/http/auth/AuthSchemeRegistry;-><init>()V

    .line 338
    .local v0, "registry":Lorg/apache/http/auth/AuthSchemeRegistry;
    const-string v1, "Basic"

    new-instance v2, Lorg/apache/http/impl/auth/BasicSchemeFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/auth/BasicSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lorg/apache/http/auth/AuthSchemeFactory;)V

    .line 341
    const-string v1, "Digest"

    new-instance v2, Lorg/apache/http/impl/auth/DigestSchemeFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/auth/DigestSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lorg/apache/http/auth/AuthSchemeFactory;)V

    .line 344
    const-string v1, "NTLM"

    new-instance v2, Lorg/apache/http/impl/auth/NTLMSchemeFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/auth/NTLMSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lorg/apache/http/auth/AuthSchemeFactory;)V

    .line 347
    const-string v1, "negotiate"

    new-instance v2, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lorg/apache/http/auth/AuthSchemeFactory;)V

    .line 350
    const-string v1, "Kerberos"

    new-instance v2, Lorg/apache/http/impl/auth/KerberosSchemeFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/auth/KerberosSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lorg/apache/http/auth/AuthSchemeFactory;)V

    .line 353
    return-object v0
.end method

.method protected createClientConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
    .registers 11

    .prologue
    .line 305
    invoke-static {}, Lorg/apache/http/impl/conn/SchemeRegistryFactory;->createDefault()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v6

    .line 307
    .local v6, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    const/4 v2, 0x0

    .line 308
    .local v2, "connManager":Lorg/apache/http/conn/ClientConnectionManager;
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v5

    .line 310
    .local v5, "params":Lorg/apache/http/params/HttpParams;
    const/4 v4, 0x0

    .line 312
    .local v4, "factory":Lorg/apache/http/conn/ClientConnectionManagerFactory;
    const-string v7, "http.connection-manager.factory-class-name"

    invoke-interface {v5, v7}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 314
    .local v0, "className":Ljava/lang/String;
    if-eqz v0, :cond_1e

    .line 316
    :try_start_14
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 317
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "factory":Lorg/apache/http/conn/ClientConnectionManagerFactory;
    check-cast v4, Lorg/apache/http/conn/ClientConnectionManagerFactory;
    :try_end_1e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_14 .. :try_end_1e} :catch_25
    .catch Ljava/lang/IllegalAccessException; {:try_start_14 .. :try_end_1e} :catch_3f
    .catch Ljava/lang/InstantiationException; {:try_start_14 .. :try_end_1e} :catch_4a

    .line 326
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v4    # "factory":Lorg/apache/http/conn/ClientConnectionManagerFactory;
    :cond_1e
    if-eqz v4, :cond_55

    .line 327
    invoke-interface {v4, v5, v6}, Lorg/apache/http/conn/ClientConnectionManagerFactory;->newInstance(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    .line 332
    :goto_24
    return-object v2

    .line 318
    .end local v4    # "factory":Lorg/apache/http/conn/ClientConnectionManagerFactory;
    :catch_25
    move-exception v3

    .line 319
    .local v3, "ex":Ljava/lang/ClassNotFoundException;
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Invalid class name: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 320
    .end local v3    # "ex":Ljava/lang/ClassNotFoundException;
    :catch_3f
    move-exception v3

    .line 321
    .local v3, "ex":Ljava/lang/IllegalAccessException;
    new-instance v7, Ljava/lang/IllegalAccessError;

    invoke-virtual {v3}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v7

    .line 322
    .end local v3    # "ex":Ljava/lang/IllegalAccessException;
    :catch_4a
    move-exception v3

    .line 323
    .local v3, "ex":Ljava/lang/InstantiationException;
    new-instance v7, Ljava/lang/InstantiationError;

    invoke-virtual {v3}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/InstantiationError;-><init>(Ljava/lang/String;)V

    throw v7

    .line 329
    .end local v3    # "ex":Ljava/lang/InstantiationException;
    .restart local v4    # "factory":Lorg/apache/http/conn/ClientConnectionManagerFactory;
    :cond_55
    new-instance v2, Lorg/apache/http/impl/conn/BasicClientConnectionManager;

    .end local v2    # "connManager":Lorg/apache/http/conn/ClientConnectionManager;
    invoke-direct {v2, v6}, Lorg/apache/http/impl/conn/BasicClientConnectionManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .restart local v2    # "connManager":Lorg/apache/http/conn/ClientConnectionManager;
    goto :goto_24
.end method

.method protected createClientRequestDirector(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/RequestDirector;
    .registers 26
    .param p1, "requestExec"    # Lorg/apache/http/protocol/HttpRequestExecutor;
    .param p2, "conman"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p3, "reustrat"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p4, "kastrat"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .param p5, "rouplan"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .param p6, "httpProcessor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p7, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;
    .param p8, "redirectHandler"    # Lorg/apache/http/client/RedirectHandler;
    .param p9, "targetAuthHandler"    # Lorg/apache/http/client/AuthenticationHandler;
    .param p10, "proxyAuthHandler"    # Lorg/apache/http/client/AuthenticationHandler;
    .param p11, "userTokenHandler"    # Lorg/apache/http/client/UserTokenHandler;
    .param p12, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 888
    new-instance v0, Lorg/apache/http/impl/client/DefaultRequestDirector;

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    invoke-direct/range {v0 .. v12}, Lorg/apache/http/impl/client/DefaultRequestDirector;-><init>(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V

    return-object v0
.end method

.method protected createClientRequestDirector(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/RequestDirector;
    .registers 27
    .param p1, "requestExec"    # Lorg/apache/http/protocol/HttpRequestExecutor;
    .param p2, "conman"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p3, "reustrat"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p4, "kastrat"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .param p5, "rouplan"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .param p6, "httpProcessor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p7, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;
    .param p8, "redirectStrategy"    # Lorg/apache/http/client/RedirectStrategy;
    .param p9, "targetAuthHandler"    # Lorg/apache/http/client/AuthenticationHandler;
    .param p10, "proxyAuthHandler"    # Lorg/apache/http/client/AuthenticationHandler;
    .param p11, "userTokenHandler"    # Lorg/apache/http/client/UserTokenHandler;
    .param p12, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 920
    new-instance v0, Lorg/apache/http/impl/client/DefaultRequestDirector;

    iget-object v1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->log:Lorg/apache/commons/logging/Log;

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    invoke-direct/range {v0 .. v13}, Lorg/apache/http/impl/client/DefaultRequestDirector;-><init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V

    return-object v0
.end method

.method protected createClientRequestDirector(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/RequestDirector;
    .registers 27
    .param p1, "requestExec"    # Lorg/apache/http/protocol/HttpRequestExecutor;
    .param p2, "conman"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p3, "reustrat"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p4, "kastrat"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .param p5, "rouplan"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .param p6, "httpProcessor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p7, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;
    .param p8, "redirectStrategy"    # Lorg/apache/http/client/RedirectStrategy;
    .param p9, "targetAuthStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p10, "proxyAuthStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p11, "userTokenHandler"    # Lorg/apache/http/client/UserTokenHandler;
    .param p12, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 953
    new-instance v0, Lorg/apache/http/impl/client/DefaultRequestDirector;

    iget-object v1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->log:Lorg/apache/commons/logging/Log;

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    invoke-direct/range {v0 .. v13}, Lorg/apache/http/impl/client/DefaultRequestDirector;-><init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V

    return-object v0
.end method

.method protected createConnectionKeepAliveStrategy()Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .registers 2

    .prologue
    .line 389
    new-instance v0, Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultConnectionKeepAliveStrategy;-><init>()V

    return-object v0
.end method

.method protected createConnectionReuseStrategy()Lorg/apache/http/ConnectionReuseStrategy;
    .registers 2

    .prologue
    .line 385
    new-instance v0, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;-><init>()V

    return-object v0
.end method

.method protected createCookieSpecRegistry()Lorg/apache/http/cookie/CookieSpecRegistry;
    .registers 4

    .prologue
    .line 358
    new-instance v0, Lorg/apache/http/cookie/CookieSpecRegistry;

    invoke-direct {v0}, Lorg/apache/http/cookie/CookieSpecRegistry;-><init>()V

    .line 359
    .local v0, "registry":Lorg/apache/http/cookie/CookieSpecRegistry;
    const-string v1, "best-match"

    new-instance v2, Lorg/apache/http/impl/cookie/BestMatchSpecFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/BestMatchSpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lorg/apache/http/cookie/CookieSpecFactory;)V

    .line 362
    const-string v1, "compatibility"

    new-instance v2, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/BrowserCompatSpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lorg/apache/http/cookie/CookieSpecFactory;)V

    .line 365
    const-string v1, "netscape"

    new-instance v2, Lorg/apache/http/impl/cookie/NetscapeDraftSpecFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/NetscapeDraftSpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lorg/apache/http/cookie/CookieSpecFactory;)V

    .line 368
    const-string v1, "rfc2109"

    new-instance v2, Lorg/apache/http/impl/cookie/RFC2109SpecFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/RFC2109SpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lorg/apache/http/cookie/CookieSpecFactory;)V

    .line 371
    const-string v1, "rfc2965"

    new-instance v2, Lorg/apache/http/impl/cookie/RFC2965SpecFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/RFC2965SpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lorg/apache/http/cookie/CookieSpecFactory;)V

    .line 374
    const-string v1, "ignoreCookies"

    new-instance v2, Lorg/apache/http/impl/cookie/IgnoreSpecFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/cookie/IgnoreSpecFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/cookie/CookieSpecRegistry;->register(Ljava/lang/String;Lorg/apache/http/cookie/CookieSpecFactory;)V

    .line 377
    return-object v0
.end method

.method protected createCookieStore()Lorg/apache/http/client/CookieStore;
    .registers 2

    .prologue
    .line 429
    new-instance v0, Lorg/apache/http/impl/client/BasicCookieStore;

    invoke-direct {v0}, Lorg/apache/http/impl/client/BasicCookieStore;-><init>()V

    return-object v0
.end method

.method protected createCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;
    .registers 2

    .prologue
    .line 433
    new-instance v0, Lorg/apache/http/impl/client/BasicCredentialsProvider;

    invoke-direct {v0}, Lorg/apache/http/impl/client/BasicCredentialsProvider;-><init>()V

    return-object v0
.end method

.method protected createHttpContext()Lorg/apache/http/protocol/HttpContext;
    .registers 4

    .prologue
    .line 284
    new-instance v0, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v0}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 285
    .local v0, "context":Lorg/apache/http/protocol/HttpContext;
    const-string v1, "http.scheme-registry"

    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 288
    const-string v1, "http.authscheme-registry"

    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getAuthSchemes()Lorg/apache/http/auth/AuthSchemeRegistry;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 291
    const-string v1, "http.cookiespec-registry"

    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getCookieSpecs()Lorg/apache/http/cookie/CookieSpecRegistry;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 294
    const-string v1, "http.cookie-store"

    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getCookieStore()Lorg/apache/http/client/CookieStore;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 297
    const-string v1, "http.auth.credentials-provider"

    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 300
    return-object v0
.end method

.method protected abstract createHttpParams()Lorg/apache/http/params/HttpParams;
.end method

.method protected abstract createHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;
.end method

.method protected createHttpRequestRetryHandler()Lorg/apache/http/client/HttpRequestRetryHandler;
    .registers 2

    .prologue
    .line 393
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;-><init>()V

    return-object v0
.end method

.method protected createHttpRoutePlanner()Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .registers 3

    .prologue
    .line 437
    new-instance v0, Lorg/apache/http/impl/conn/DefaultHttpRoutePlanner;

    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/http/impl/conn/DefaultHttpRoutePlanner;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    return-object v0
.end method

.method protected createProxyAuthenticationHandler()Lorg/apache/http/client/AuthenticationHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 425
    new-instance v0, Lorg/apache/http/impl/client/DefaultProxyAuthenticationHandler;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultProxyAuthenticationHandler;-><init>()V

    return-object v0
.end method

.method protected createProxyAuthenticationStrategy()Lorg/apache/http/client/AuthenticationStrategy;
    .registers 2

    .prologue
    .line 417
    new-instance v0, Lorg/apache/http/impl/client/ProxyAuthenticationStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/ProxyAuthenticationStrategy;-><init>()V

    return-object v0
.end method

.method protected createRedirectHandler()Lorg/apache/http/client/RedirectHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 401
    new-instance v0, Lorg/apache/http/impl/client/DefaultRedirectHandler;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultRedirectHandler;-><init>()V

    return-object v0
.end method

.method protected createRequestExecutor()Lorg/apache/http/protocol/HttpRequestExecutor;
    .registers 2

    .prologue
    .line 381
    new-instance v0, Lorg/apache/http/protocol/HttpRequestExecutor;

    invoke-direct {v0}, Lorg/apache/http/protocol/HttpRequestExecutor;-><init>()V

    return-object v0
.end method

.method protected createTargetAuthenticationHandler()Lorg/apache/http/client/AuthenticationHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 413
    new-instance v0, Lorg/apache/http/impl/client/DefaultTargetAuthenticationHandler;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultTargetAuthenticationHandler;-><init>()V

    return-object v0
.end method

.method protected createTargetAuthenticationStrategy()Lorg/apache/http/client/AuthenticationStrategy;
    .registers 2

    .prologue
    .line 405
    new-instance v0, Lorg/apache/http/impl/client/TargetAuthenticationStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/TargetAuthenticationStrategy;-><init>()V

    return-object v0
.end method

.method protected createUserTokenHandler()Lorg/apache/http/client/UserTokenHandler;
    .registers 2

    .prologue
    .line 441
    new-instance v0, Lorg/apache/http/impl/client/DefaultUserTokenHandler;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultUserTokenHandler;-><init>()V

    return-object v0
.end method

.method protected determineParams(Lorg/apache/http/HttpRequest;)Lorg/apache/http/params/HttpParams;
    .registers 6
    .param p1, "req"    # Lorg/apache/http/HttpRequest;

    .prologue
    const/4 v3, 0x0

    .line 985
    new-instance v0, Lorg/apache/http/impl/client/ClientParamsStack;

    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    invoke-direct {v0, v3, v1, v2, v3}, Lorg/apache/http/impl/client/ClientParamsStack;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;Lorg/apache/http/params/HttpParams;)V

    return-object v0
.end method

.method protected final doExecute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .registers 35
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 785
    const-string v4, "HTTP request"

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 789
    const/16 v23, 0x0

    .line 790
    .local v23, "execContext":Lorg/apache/http/protocol/HttpContext;
    const/16 v21, 0x0

    .line 791
    .local v21, "director":Lorg/apache/http/client/RequestDirector;
    const/16 v29, 0x0

    .line 792
    .local v29, "routePlanner":Lorg/apache/http/conn/routing/HttpRoutePlanner;
    const/16 v19, 0x0

    .line 793
    .local v19, "connectionBackoffStrategy":Lorg/apache/http/client/ConnectionBackoffStrategy;
    const/16 v17, 0x0

    .line 797
    .local v17, "backoffManager":Lorg/apache/http/client/BackoffManager;
    monitor-enter p0

    .line 799
    :try_start_12
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createHttpContext()Lorg/apache/http/protocol/HttpContext;

    move-result-object v20

    .line 800
    .local v20, "defaultContext":Lorg/apache/http/protocol/HttpContext;
    if-nez p3, :cond_a4

    .line 801
    move-object/from16 v23, v20

    .line 805
    :goto_1a
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/AbstractHttpClient;->determineParams(Lorg/apache/http/HttpRequest;)Lorg/apache/http/params/HttpParams;

    move-result-object v16

    .line 806
    .local v16, "params":Lorg/apache/http/params/HttpParams;
    invoke-static/range {v16 .. v16}, Lorg/apache/http/client/params/HttpClientParamConfig;->getRequestConfig(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/config/RequestConfig;

    move-result-object v18

    .line 807
    .local v18, "config":Lorg/apache/http/client/config/RequestConfig;
    const-string v4, "http.request-config"

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-interface {v0, v4, v1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 810
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getRequestExecutor()Lorg/apache/http/protocol/HttpRequestExecutor;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getConnectionReuseStrategy()Lorg/apache/http/ConnectionReuseStrategy;

    move-result-object v7

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getConnectionKeepAliveStrategy()Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    move-result-object v8

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getRoutePlanner()Lorg/apache/http/conn/routing/HttpRoutePlanner;

    move-result-object v9

    invoke-direct/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getProtocolProcessor()Lorg/apache/http/protocol/HttpProcessor;

    move-result-object v10

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpRequestRetryHandler()Lorg/apache/http/client/HttpRequestRetryHandler;

    move-result-object v11

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getRedirectStrategy()Lorg/apache/http/client/RedirectStrategy;

    move-result-object v12

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getTargetAuthenticationStrategy()Lorg/apache/http/client/AuthenticationStrategy;

    move-result-object v13

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getProxyAuthenticationStrategy()Lorg/apache/http/client/AuthenticationStrategy;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getUserTokenHandler()Lorg/apache/http/client/UserTokenHandler;

    move-result-object v15

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v16}, Lorg/apache/http/impl/client/AbstractHttpClient;->createClientRequestDirector(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/RequestDirector;

    move-result-object v21

    .line 823
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getRoutePlanner()Lorg/apache/http/conn/routing/HttpRoutePlanner;

    move-result-object v29

    .line 824
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getConnectionBackoffStrategy()Lorg/apache/http/client/ConnectionBackoffStrategy;

    move-result-object v19

    .line 825
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getBackoffManager()Lorg/apache/http/client/BackoffManager;

    move-result-object v17

    .line 826
    monitor-exit p0
    :try_end_6e
    .catchall {:try_start_12 .. :try_end_6e} :catchall_b3

    .line 829
    if-eqz v19, :cond_119

    if-eqz v17, :cond_119

    .line 830
    if-eqz p1, :cond_b6

    move-object/from16 v30, p1

    .line 833
    .local v30, "targetForRoute":Lorg/apache/http/HttpHost;
    :goto_76
    :try_start_76
    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move-object/from16 v2, p2

    move-object/from16 v3, v23

    invoke-interface {v0, v1, v2, v3}, Lorg/apache/http/conn/routing/HttpRoutePlanner;->determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;
    :try_end_81
    .catch Lorg/apache/http/HttpException; {:try_start_76 .. :try_end_81} :catch_dc

    move-result-object v28

    .line 837
    .local v28, "route":Lorg/apache/http/conn/routing/HttpRoute;
    :try_start_82
    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v23

    invoke-interface {v0, v1, v2, v3}, Lorg/apache/http/client/RequestDirector;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/impl/client/CloseableHttpResponseProxy;->newProxy(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_91
    .catch Ljava/lang/RuntimeException; {:try_start_82 .. :try_end_91} :catch_c9
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_91} :catch_e5
    .catch Lorg/apache/http/HttpException; {:try_start_82 .. :try_end_91} :catch_dc

    move-result-object v26

    .line 856
    .local v26, "out":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_start_92
    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Lorg/apache/http/client/ConnectionBackoffStrategy;->shouldBackoff(Lorg/apache/http/HttpResponse;)Z

    move-result v4

    if-eqz v4, :cond_111

    .line 857
    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Lorg/apache/http/client/BackoffManager;->backOff(Lorg/apache/http/conn/routing/HttpRoute;)V
    :try_end_a3
    .catch Lorg/apache/http/HttpException; {:try_start_92 .. :try_end_a3} :catch_dc

    .line 863
    .end local v26    # "out":Lorg/apache/http/client/methods/CloseableHttpResponse;
    .end local v28    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v30    # "targetForRoute":Lorg/apache/http/HttpHost;
    :goto_a3
    return-object v26

    .line 803
    .end local v16    # "params":Lorg/apache/http/params/HttpParams;
    .end local v18    # "config":Lorg/apache/http/client/config/RequestConfig;
    :cond_a4
    :try_start_a4
    new-instance v24, Lorg/apache/http/protocol/DefaultedHttpContext;

    move-object/from16 v0, v24

    move-object/from16 v1, p3

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lorg/apache/http/protocol/DefaultedHttpContext;-><init>(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/protocol/HttpContext;)V

    .end local v23    # "execContext":Lorg/apache/http/protocol/HttpContext;
    .local v24, "execContext":Lorg/apache/http/protocol/HttpContext;
    move-object/from16 v23, v24

    .end local v24    # "execContext":Lorg/apache/http/protocol/HttpContext;
    .restart local v23    # "execContext":Lorg/apache/http/protocol/HttpContext;
    goto/16 :goto_1a

    .line 826
    .end local v20    # "defaultContext":Lorg/apache/http/protocol/HttpContext;
    :catchall_b3
    move-exception v4

    monitor-exit p0
    :try_end_b5
    .catchall {:try_start_a4 .. :try_end_b5} :catchall_b3

    throw v4

    .line 830
    .restart local v16    # "params":Lorg/apache/http/params/HttpParams;
    .restart local v18    # "config":Lorg/apache/http/client/config/RequestConfig;
    .restart local v20    # "defaultContext":Lorg/apache/http/protocol/HttpContext;
    :cond_b6
    :try_start_b6
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/AbstractHttpClient;->determineParams(Lorg/apache/http/HttpRequest;)Lorg/apache/http/params/HttpParams;

    move-result-object v4

    const-string v5, "http.default-host"

    invoke-interface {v4, v5}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/HttpHost;

    move-object/from16 v30, v4

    goto :goto_76

    .line 839
    .restart local v28    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v30    # "targetForRoute":Lorg/apache/http/HttpHost;
    :catch_c9
    move-exception v27

    .line 840
    .local v27, "re":Ljava/lang/RuntimeException;
    move-object/from16 v0, v19

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Lorg/apache/http/client/ConnectionBackoffStrategy;->shouldBackoff(Ljava/lang/Throwable;)Z

    move-result v4

    if-eqz v4, :cond_db

    .line 841
    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Lorg/apache/http/client/BackoffManager;->backOff(Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 843
    :cond_db
    throw v27
    :try_end_dc
    .catch Lorg/apache/http/HttpException; {:try_start_b6 .. :try_end_dc} :catch_dc

    .line 866
    .end local v27    # "re":Ljava/lang/RuntimeException;
    .end local v28    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v30    # "targetForRoute":Lorg/apache/http/HttpHost;
    :catch_dc
    move-exception v25

    .line 867
    .local v25, "httpException":Lorg/apache/http/HttpException;
    new-instance v4, Lorg/apache/http/client/ClientProtocolException;

    move-object/from16 v0, v25

    invoke-direct {v4, v0}, Lorg/apache/http/client/ClientProtocolException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 844
    .end local v25    # "httpException":Lorg/apache/http/HttpException;
    .restart local v28    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v30    # "targetForRoute":Lorg/apache/http/HttpHost;
    :catch_e5
    move-exception v22

    .line 845
    .local v22, "e":Ljava/lang/Exception;
    :try_start_e6
    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/http/client/ConnectionBackoffStrategy;->shouldBackoff(Ljava/lang/Throwable;)Z

    move-result v4

    if-eqz v4, :cond_f7

    .line 846
    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Lorg/apache/http/client/BackoffManager;->backOff(Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 848
    :cond_f7
    move-object/from16 v0, v22

    instance-of v4, v0, Lorg/apache/http/HttpException;

    if-eqz v4, :cond_100

    .line 849
    check-cast v22, Lorg/apache/http/HttpException;

    .end local v22    # "e":Ljava/lang/Exception;
    throw v22

    .line 851
    .restart local v22    # "e":Ljava/lang/Exception;
    :cond_100
    move-object/from16 v0, v22

    instance-of v4, v0, Ljava/io/IOException;

    if-eqz v4, :cond_109

    .line 852
    check-cast v22, Ljava/io/IOException;

    .end local v22    # "e":Ljava/lang/Exception;
    throw v22

    .line 854
    .restart local v22    # "e":Ljava/lang/Exception;
    :cond_109
    new-instance v4, Ljava/lang/reflect/UndeclaredThrowableException;

    move-object/from16 v0, v22

    invoke-direct {v4, v0}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 859
    .end local v22    # "e":Ljava/lang/Exception;
    .restart local v26    # "out":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :cond_111
    move-object/from16 v0, v17

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Lorg/apache/http/client/BackoffManager;->probe(Lorg/apache/http/conn/routing/HttpRoute;)V

    goto :goto_a3

    .line 863
    .end local v26    # "out":Lorg/apache/http/client/methods/CloseableHttpResponse;
    .end local v28    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v30    # "targetForRoute":Lorg/apache/http/HttpHost;
    :cond_119
    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v23

    invoke-interface {v0, v1, v2, v3}, Lorg/apache/http/client/RequestDirector;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/impl/client/CloseableHttpResponseProxy;->newProxy(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_128
    .catch Lorg/apache/http/HttpException; {:try_start_e6 .. :try_end_128} :catch_dc

    move-result-object v26

    goto/16 :goto_a3
.end method

.method public final declared-synchronized getAuthSchemes()Lorg/apache/http/auth/AuthSchemeRegistry;
    .registers 2

    .prologue
    .line 480
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->supportedAuthSchemes:Lorg/apache/http/auth/AuthSchemeRegistry;

    if-nez v0, :cond_b

    .line 481
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createAuthSchemeRegistry()Lorg/apache/http/auth/AuthSchemeRegistry;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->supportedAuthSchemes:Lorg/apache/http/auth/AuthSchemeRegistry;

    .line 483
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->supportedAuthSchemes:Lorg/apache/http/auth/AuthSchemeRegistry;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 480
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getBackoffManager()Lorg/apache/http/client/BackoffManager;
    .registers 2

    .prologue
    .line 506
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->backoffManager:Lorg/apache/http/client/BackoffManager;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getConnectionBackoffStrategy()Lorg/apache/http/client/ConnectionBackoffStrategy;
    .registers 2

    .prologue
    .line 491
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getConnectionKeepAliveStrategy()Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .registers 2

    .prologue
    .line 531
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    if-nez v0, :cond_b

    .line 532
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createConnectionKeepAliveStrategy()Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .line 534
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 531
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 464
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    if-nez v0, :cond_b

    .line 465
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createClientConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    .line 467
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->connManager:Lorg/apache/http/conn/ClientConnectionManager;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 464
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getConnectionReuseStrategy()Lorg/apache/http/ConnectionReuseStrategy;
    .registers 2

    .prologue
    .line 518
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    if-nez v0, :cond_b

    .line 519
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createConnectionReuseStrategy()Lorg/apache/http/ConnectionReuseStrategy;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 521
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 518
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getCookieSpecs()Lorg/apache/http/cookie/CookieSpecRegistry;
    .registers 2

    .prologue
    .line 499
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->supportedCookieSpecs:Lorg/apache/http/cookie/CookieSpecRegistry;

    if-nez v0, :cond_b

    .line 500
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createCookieSpecRegistry()Lorg/apache/http/cookie/CookieSpecRegistry;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->supportedCookieSpecs:Lorg/apache/http/cookie/CookieSpecRegistry;

    .line 502
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->supportedCookieSpecs:Lorg/apache/http/cookie/CookieSpecRegistry;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 499
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getCookieStore()Lorg/apache/http/client/CookieStore;
    .registers 2

    .prologue
    .line 654
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->cookieStore:Lorg/apache/http/client/CookieStore;

    if-nez v0, :cond_b

    .line 655
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createCookieStore()Lorg/apache/http/client/CookieStore;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->cookieStore:Lorg/apache/http/client/CookieStore;

    .line 657
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->cookieStore:Lorg/apache/http/client/CookieStore;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 654
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;
    .registers 2

    .prologue
    .line 665
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->credsProvider:Lorg/apache/http/client/CredentialsProvider;

    if-nez v0, :cond_b

    .line 666
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->credsProvider:Lorg/apache/http/client/CredentialsProvider;

    .line 668
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->credsProvider:Lorg/apache/http/client/CredentialsProvider;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 665
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected final declared-synchronized getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;
    .registers 2

    .prologue
    .line 698
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->mutableProcessor:Lorg/apache/http/protocol/BasicHttpProcessor;

    if-nez v0, :cond_b

    .line 699
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->mutableProcessor:Lorg/apache/http/protocol/BasicHttpProcessor;

    .line 701
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->mutableProcessor:Lorg/apache/http/protocol/BasicHttpProcessor;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 698
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getHttpRequestRetryHandler()Lorg/apache/http/client/HttpRequestRetryHandler;
    .registers 2

    .prologue
    .line 544
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    if-nez v0, :cond_b

    .line 545
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createHttpRequestRetryHandler()Lorg/apache/http/client/HttpRequestRetryHandler;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    .line 547
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 544
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getParams()Lorg/apache/http/params/HttpParams;
    .registers 2

    .prologue
    .line 446
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->defaultParams:Lorg/apache/http/params/HttpParams;

    if-nez v0, :cond_b

    .line 447
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createHttpParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->defaultParams:Lorg/apache/http/params/HttpParams;

    .line 449
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->defaultParams:Lorg/apache/http/params/HttpParams;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 446
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getProxyAuthenticationHandler()Lorg/apache/http/client/AuthenticationHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 625
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createProxyAuthenticationHandler()Lorg/apache/http/client/AuthenticationHandler;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_7

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getProxyAuthenticationStrategy()Lorg/apache/http/client/AuthenticationStrategy;
    .registers 2

    .prologue
    .line 640
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    if-nez v0, :cond_b

    .line 641
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createProxyAuthenticationStrategy()Lorg/apache/http/client/AuthenticationStrategy;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 643
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 640
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getRedirectHandler()Lorg/apache/http/client/RedirectHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 559
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createRedirectHandler()Lorg/apache/http/client/RedirectHandler;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_7

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getRedirectStrategy()Lorg/apache/http/client/RedirectStrategy;
    .registers 2

    .prologue
    .line 574
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

    if-nez v0, :cond_c

    .line 575
    new-instance v0, Lorg/apache/http/impl/client/DefaultRedirectStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultRedirectStrategy;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

    .line 577
    :cond_c
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-object v0

    .line 574
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getRequestExecutor()Lorg/apache/http/protocol/HttpRequestExecutor;
    .registers 2

    .prologue
    .line 472
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    if-nez v0, :cond_b

    .line 473
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createRequestExecutor()Lorg/apache/http/protocol/HttpRequestExecutor;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    .line 475
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 472
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRequestInterceptor(I)Lorg/apache/http/HttpRequestInterceptor;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 733
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/BasicHttpProcessor;->getRequestInterceptor(I)Lorg/apache/http/HttpRequestInterceptor;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRequestInterceptorCount()I
    .registers 2

    .prologue
    .line 737
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/protocol/BasicHttpProcessor;->getRequestInterceptorCount()I
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result v0

    monitor-exit p0

    return v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getResponseInterceptor(I)Lorg/apache/http/HttpResponseInterceptor;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 729
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/BasicHttpProcessor;->getResponseInterceptor(I)Lorg/apache/http/HttpResponseInterceptor;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getResponseInterceptorCount()I
    .registers 2

    .prologue
    .line 725
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/protocol/BasicHttpProcessor;->getResponseInterceptorCount()I
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_b

    move-result v0

    monitor-exit p0

    return v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getRoutePlanner()Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .registers 2

    .prologue
    .line 676
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

    if-nez v0, :cond_b

    .line 677
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createHttpRoutePlanner()Lorg/apache/http/conn/routing/HttpRoutePlanner;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

    .line 679
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 676
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getTargetAuthenticationHandler()Lorg/apache/http/client/AuthenticationHandler;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 592
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createTargetAuthenticationHandler()Lorg/apache/http/client/AuthenticationHandler;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_7

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getTargetAuthenticationStrategy()Lorg/apache/http/client/AuthenticationStrategy;
    .registers 2

    .prologue
    .line 607
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    if-nez v0, :cond_b

    .line 608
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createTargetAuthenticationStrategy()Lorg/apache/http/client/AuthenticationStrategy;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 610
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 607
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getUserTokenHandler()Lorg/apache/http/client/UserTokenHandler;
    .registers 2

    .prologue
    .line 687
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    if-nez v0, :cond_b

    .line 688
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->createUserTokenHandler()Lorg/apache/http/client/UserTokenHandler;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    .line 690
    :cond_b
    iget-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 687
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeRequestInterceptorByClass(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/apache/http/HttpRequestInterceptor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 776
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/apache/http/HttpRequestInterceptor;>;"
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/BasicHttpProcessor;->removeRequestInterceptorByClass(Ljava/lang/Class;)V

    .line 777
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 778
    monitor-exit p0

    return-void

    .line 776
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeResponseInterceptorByClass(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/apache/http/HttpResponseInterceptor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 756
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/apache/http/HttpResponseInterceptor;>;"
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/http/protocol/BasicHttpProcessor;->removeResponseInterceptorByClass(Ljava/lang/Class;)V

    .line 757
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->protocolProcessor:Lorg/apache/http/protocol/ImmutableHttpProcessor;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 758
    monitor-exit p0

    return-void

    .line 756
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAuthSchemes(Lorg/apache/http/auth/AuthSchemeRegistry;)V
    .registers 3
    .param p1, "registry"    # Lorg/apache/http/auth/AuthSchemeRegistry;

    .prologue
    .line 487
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->supportedAuthSchemes:Lorg/apache/http/auth/AuthSchemeRegistry;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 488
    monitor-exit p0

    return-void

    .line 487
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setBackoffManager(Lorg/apache/http/client/BackoffManager;)V
    .registers 3
    .param p1, "manager"    # Lorg/apache/http/client/BackoffManager;

    .prologue
    .line 510
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->backoffManager:Lorg/apache/http/client/BackoffManager;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 511
    monitor-exit p0

    return-void

    .line 510
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setConnectionBackoffStrategy(Lorg/apache/http/client/ConnectionBackoffStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lorg/apache/http/client/ConnectionBackoffStrategy;

    .prologue
    .line 495
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 496
    monitor-exit p0

    return-void

    .line 495
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCookieSpecs(Lorg/apache/http/cookie/CookieSpecRegistry;)V
    .registers 3
    .param p1, "registry"    # Lorg/apache/http/cookie/CookieSpecRegistry;

    .prologue
    .line 514
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->supportedCookieSpecs:Lorg/apache/http/cookie/CookieSpecRegistry;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 515
    monitor-exit p0

    return-void

    .line 514
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCookieStore(Lorg/apache/http/client/CookieStore;)V
    .registers 3
    .param p1, "cookieStore"    # Lorg/apache/http/client/CookieStore;

    .prologue
    .line 661
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->cookieStore:Lorg/apache/http/client/CookieStore;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 662
    monitor-exit p0

    return-void

    .line 661
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCredentialsProvider(Lorg/apache/http/client/CredentialsProvider;)V
    .registers 3
    .param p1, "credsProvider"    # Lorg/apache/http/client/CredentialsProvider;

    .prologue
    .line 672
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->credsProvider:Lorg/apache/http/client/CredentialsProvider;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 673
    monitor-exit p0

    return-void

    .line 672
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setHttpRequestRetryHandler(Lorg/apache/http/client/HttpRequestRetryHandler;)V
    .registers 3
    .param p1, "handler"    # Lorg/apache/http/client/HttpRequestRetryHandler;

    .prologue
    .line 551
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 552
    monitor-exit p0

    return-void

    .line 551
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setKeepAliveStrategy(Lorg/apache/http/conn/ConnectionKeepAliveStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .prologue
    .line 539
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 540
    monitor-exit p0

    return-void

    .line 539
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setParams(Lorg/apache/http/params/HttpParams;)V
    .registers 3
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 459
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->defaultParams:Lorg/apache/http/params/HttpParams;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 460
    monitor-exit p0

    return-void

    .line 459
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProxyAuthenticationHandler(Lorg/apache/http/client/AuthenticationHandler;)V
    .registers 3
    .param p1, "handler"    # Lorg/apache/http/client/AuthenticationHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 633
    monitor-enter p0

    :try_start_1
    new-instance v0, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;-><init>(Lorg/apache/http/client/AuthenticationHandler;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 634
    monitor-exit p0

    return-void

    .line 633
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProxyAuthenticationStrategy(Lorg/apache/http/client/AuthenticationStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lorg/apache/http/client/AuthenticationStrategy;

    .prologue
    .line 650
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 651
    monitor-exit p0

    return-void

    .line 650
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRedirectHandler(Lorg/apache/http/client/RedirectHandler;)V
    .registers 3
    .param p1, "handler"    # Lorg/apache/http/client/RedirectHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 567
    monitor-enter p0

    :try_start_1
    new-instance v0, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;-><init>(Lorg/apache/http/client/RedirectHandler;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 568
    monitor-exit p0

    return-void

    .line 567
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRedirectStrategy(Lorg/apache/http/client/RedirectStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lorg/apache/http/client/RedirectStrategy;

    .prologue
    .line 584
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 585
    monitor-exit p0

    return-void

    .line 584
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setReuseStrategy(Lorg/apache/http/ConnectionReuseStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lorg/apache/http/ConnectionReuseStrategy;

    .prologue
    .line 526
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 527
    monitor-exit p0

    return-void

    .line 526
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRoutePlanner(Lorg/apache/http/conn/routing/HttpRoutePlanner;)V
    .registers 3
    .param p1, "routePlanner"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;

    .prologue
    .line 683
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 684
    monitor-exit p0

    return-void

    .line 683
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setTargetAuthenticationHandler(Lorg/apache/http/client/AuthenticationHandler;)V
    .registers 3
    .param p1, "handler"    # Lorg/apache/http/client/AuthenticationHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 600
    monitor-enter p0

    :try_start_1
    new-instance v0, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;-><init>(Lorg/apache/http/client/AuthenticationHandler;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 601
    monitor-exit p0

    return-void

    .line 600
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setTargetAuthenticationStrategy(Lorg/apache/http/client/AuthenticationStrategy;)V
    .registers 3
    .param p1, "strategy"    # Lorg/apache/http/client/AuthenticationStrategy;

    .prologue
    .line 617
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 618
    monitor-exit p0

    return-void

    .line 617
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setUserTokenHandler(Lorg/apache/http/client/UserTokenHandler;)V
    .registers 3
    .param p1, "handler"    # Lorg/apache/http/client/UserTokenHandler;

    .prologue
    .line 694
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/apache/http/impl/client/AbstractHttpClient;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 695
    monitor-exit p0

    return-void

    .line 694
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method
