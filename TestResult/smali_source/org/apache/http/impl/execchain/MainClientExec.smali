.class public Lorg/apache/http/impl/execchain/MainClientExec;
.super Ljava/lang/Object;
.source "MainClientExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

.field private final connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

.field private final keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

.field private final proxyHttpProcessor:Lorg/apache/http/protocol/HttpProcessor;

.field private final requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

.field private final reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

.field private final routeDirector:Lorg/apache/http/conn/routing/HttpRouteDirector;

.field private final targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

.field private final userTokenHandler:Lorg/apache/http/client/UserTokenHandler;


# direct methods
.method public constructor <init>(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;)V
    .registers 12
    .param p1, "requestExecutor"    # Lorg/apache/http/protocol/HttpRequestExecutor;
    .param p2, "connManager"    # Lorg/apache/http/conn/HttpClientConnectionManager;
    .param p3, "reuseStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p4, "keepAliveStrategy"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .param p5, "targetAuthStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p6, "proxyAuthStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p7, "userTokenHandler"    # Lorg/apache/http/client/UserTokenHandler;

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    .line 111
    const-string v0, "HTTP request executor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 112
    const-string v0, "Client connection manager"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 113
    const-string v0, "Connection reuse strategy"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 114
    const-string v0, "Connection keep alive strategy"

    invoke-static {p4, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 115
    const-string v0, "Target authentication strategy"

    invoke-static {p5, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 116
    const-string v0, "Proxy authentication strategy"

    invoke-static {p6, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 117
    const-string v0, "User token handler"

    invoke-static {p7, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 118
    new-instance v0, Lorg/apache/http/impl/auth/HttpAuthenticator;

    invoke-direct {v0}, Lorg/apache/http/impl/auth/HttpAuthenticator;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    .line 119
    new-instance v0, Lorg/apache/http/protocol/ImmutableHttpProcessor;

    const/4 v1, 0x2

    new-array v1, v1, [Lorg/apache/http/HttpRequestInterceptor;

    const/4 v2, 0x0

    new-instance v3, Lorg/apache/http/protocol/RequestTargetHost;

    invoke-direct {v3}, Lorg/apache/http/protocol/RequestTargetHost;-><init>()V

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Lorg/apache/http/client/protocol/RequestClientConnControl;

    invoke-direct {v3}, Lorg/apache/http/client/protocol/RequestClientConnControl;-><init>()V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lorg/apache/http/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/http/HttpRequestInterceptor;)V

    iput-object v0, p0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyHttpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    .line 121
    new-instance v0, Lorg/apache/http/conn/routing/BasicRouteDirector;

    invoke-direct {v0}, Lorg/apache/http/conn/routing/BasicRouteDirector;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/execchain/MainClientExec;->routeDirector:Lorg/apache/http/conn/routing/HttpRouteDirector;

    .line 122
    iput-object p1, p0, Lorg/apache/http/impl/execchain/MainClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    .line 123
    iput-object p2, p0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    .line 124
    iput-object p3, p0, Lorg/apache/http/impl/execchain/MainClientExec;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 125
    iput-object p4, p0, Lorg/apache/http/impl/execchain/MainClientExec;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .line 126
    iput-object p5, p0, Lorg/apache/http/impl/execchain/MainClientExec;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 127
    iput-object p6, p0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 128
    iput-object p7, p0, Lorg/apache/http/impl/execchain/MainClientExec;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    .line 129
    return-void
.end method

.method private createTunnelToProxy(Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/client/protocol/HttpClientContext;)Z
    .registers 6
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "hop"    # I
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 521
    new-instance v0, Lorg/apache/http/HttpException;

    const-string v1, "Proxy chains are not supported."

    invoke-direct {v0, v1}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private createTunnelToTarget(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/protocol/HttpClientContext;)Z
    .registers 22
    .param p1, "proxyAuthState"    # Lorg/apache/http/auth/AuthState;
    .param p2, "managedConn"    # Lorg/apache/http/HttpClientConnection;
    .param p3, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p4, "request"    # Lorg/apache/http/HttpRequest;
    .param p5, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 425
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v10

    .line 426
    .local v10, "config":Lorg/apache/http/client/config/RequestConfig;
    invoke-virtual {v10}, Lorg/apache/http/client/config/RequestConfig;->getConnectTimeout()I

    move-result v15

    .line 428
    .local v15, "timeout":I
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v14

    .line 429
    .local v14, "target":Lorg/apache/http/HttpHost;
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v4

    .line 432
    .local v4, "proxy":Lorg/apache/http/HttpHost;
    invoke-virtual {v14}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v9

    .line 433
    .local v9, "authority":Ljava/lang/String;
    new-instance v11, Lorg/apache/http/message/BasicHttpRequest;

    const-string v3, "CONNECT"

    invoke-interface/range {p4 .. p4}, Lorg/apache/http/HttpRequest;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v6

    invoke-direct {v11, v3, v9, v6}, Lorg/apache/http/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/ProtocolVersion;)V

    .line 435
    .local v11, "connect":Lorg/apache/http/HttpRequest;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/execchain/MainClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyHttpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    move-object/from16 v0, p5

    invoke-virtual {v3, v11, v6, v0}, Lorg/apache/http/protocol/HttpRequestExecutor;->preProcess(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 438
    :cond_2c
    :goto_2c
    invoke-interface/range {p2 .. p2}, Lorg/apache/http/HttpClientConnection;->isOpen()Z

    move-result v3

    if-nez v3, :cond_42

    .line 439
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    if-lez v15, :cond_87

    move v3, v15

    :goto_39
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    invoke-interface {v6, v0, v1, v3, v2}, Lorg/apache/http/conn/HttpClientConnectionManager;->connect(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)V

    .line 446
    :cond_42
    const-string v3, "Proxy-Authorization"

    invoke-interface {v11, v3}, Lorg/apache/http/HttpRequest;->removeHeaders(Ljava/lang/String;)V

    .line 447
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p1

    move-object/from16 v1, p5

    invoke-virtual {v3, v11, v0, v1}, Lorg/apache/http/impl/auth/HttpAuthenticator;->generateAuthResponse(Lorg/apache/http/HttpRequest;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)V

    .line 449
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/execchain/MainClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v3, v11, v0, v1}, Lorg/apache/http/protocol/HttpRequestExecutor;->execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 451
    .local v5, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    .line 452
    .local v13, "status":I
    const/16 v3, 0xc8

    if-ge v13, v3, :cond_89

    .line 453
    new-instance v3, Lorg/apache/http/HttpException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected response to CONNECT request: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 439
    .end local v5    # "response":Lorg/apache/http/HttpResponse;
    .end local v13    # "status":I
    :cond_87
    const/4 v3, 0x0

    goto :goto_39

    .line 457
    .restart local v5    # "response":Lorg/apache/http/HttpResponse;
    .restart local v13    # "status":I
    :cond_89
    invoke-virtual {v10}, Lorg/apache/http/client/config/RequestConfig;->isAuthenticationEnabled()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 458
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object/from16 v7, p1

    move-object/from16 v8, p5

    invoke-virtual/range {v3 .. v8}, Lorg/apache/http/impl/auth/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_d6

    .line 460
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object/from16 v7, p1

    move-object/from16 v8, p5

    invoke-virtual/range {v3 .. v8}, Lorg/apache/http/impl/auth/HttpAuthenticator;->handleAuthChallenge(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_d6

    .line 463
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/execchain/MainClientExec;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    move-object/from16 v0, p5

    invoke-interface {v3, v5, v0}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_d1

    .line 464
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Connection kept alive"

    invoke-interface {v3, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 466
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v12

    .line 467
    .local v12, "entity":Lorg/apache/http/HttpEntity;
    invoke-static {v12}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    goto/16 :goto_2c

    .line 469
    .end local v12    # "entity":Lorg/apache/http/HttpEntity;
    :cond_d1
    invoke-interface/range {p2 .. p2}, Lorg/apache/http/HttpClientConnection;->close()V

    goto/16 :goto_2c

    .line 480
    :cond_d6
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    .line 482
    const/16 v3, 0x12b

    if-le v13, v3, :cond_110

    .line 485
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v12

    .line 486
    .restart local v12    # "entity":Lorg/apache/http/HttpEntity;
    if-eqz v12, :cond_f0

    .line 487
    new-instance v3, Lorg/apache/http/entity/BufferedHttpEntity;

    invoke-direct {v3, v12}, Lorg/apache/http/entity/BufferedHttpEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    invoke-interface {v5, v3}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 490
    :cond_f0
    invoke-interface/range {p2 .. p2}, Lorg/apache/http/HttpClientConnection;->close()V

    .line 491
    new-instance v3, Lorg/apache/http/impl/execchain/TunnelRefusedException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CONNECT refused by proxy: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6, v5}, Lorg/apache/http/impl/execchain/TunnelRefusedException;-><init>(Ljava/lang/String;Lorg/apache/http/HttpResponse;)V

    throw v3

    .line 499
    .end local v12    # "entity":Lorg/apache/http/HttpEntity;
    :cond_110
    const/4 v3, 0x0

    return v3
.end method

.method private needAuthentication(Lorg/apache/http/auth/AuthState;Lorg/apache/http/auth/AuthState;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/protocol/HttpClientContext;)Z
    .registers 16
    .param p1, "targetAuthState"    # Lorg/apache/http/auth/AuthState;
    .param p2, "proxyAuthState"    # Lorg/apache/http/auth/AuthState;
    .param p3, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p4, "response"    # Lorg/apache/http/HttpResponse;
    .param p5, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;

    .prologue
    .line 530
    invoke-virtual {p5}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v8

    .line 531
    .local v8, "config":Lorg/apache/http/client/config/RequestConfig;
    invoke-virtual {v8}, Lorg/apache/http/client/config/RequestConfig;->isAuthenticationEnabled()Z

    move-result v0

    if-eqz v0, :cond_6c

    .line 532
    invoke-virtual {p5}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 533
    .local v1, "target":Lorg/apache/http/HttpHost;
    if-nez v1, :cond_14

    .line 534
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 536
    :cond_14
    invoke-virtual {v1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v0

    if-gez v0, :cond_30

    .line 537
    new-instance v9, Lorg/apache/http/HttpHost;

    invoke-virtual {v1}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v2

    invoke-virtual {v1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v9, v0, v2, v4}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v1    # "target":Lorg/apache/http/HttpHost;
    .local v9, "target":Lorg/apache/http/HttpHost;
    move-object v1, v9

    .line 542
    .end local v9    # "target":Lorg/apache/http/HttpHost;
    .restart local v1    # "target":Lorg/apache/http/HttpHost;
    :cond_30
    iget-object v0, p0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    iget-object v3, p0, Lorg/apache/http/impl/execchain/MainClientExec;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object v2, p4

    move-object v4, p1

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/auth/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    if-eqz v0, :cond_49

    .line 544
    iget-object v0, p0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    iget-object v3, p0, Lorg/apache/http/impl/execchain/MainClientExec;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object v2, p4

    move-object v4, p1

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/auth/HttpAuthenticator;->handleAuthChallenge(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    .line 558
    .end local v1    # "target":Lorg/apache/http/HttpHost;
    :goto_48
    return v0

    .line 547
    .restart local v1    # "target":Lorg/apache/http/HttpHost;
    :cond_49
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    .line 548
    .local v3, "proxy":Lorg/apache/http/HttpHost;
    iget-object v2, p0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    iget-object v5, p0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object v4, p4

    move-object v6, p2

    move-object v7, p5

    invoke-virtual/range {v2 .. v7}, Lorg/apache/http/impl/auth/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    if-eqz v0, :cond_6c

    .line 551
    if-nez v3, :cond_60

    .line 552
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    .line 554
    :cond_60
    iget-object v2, p0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    iget-object v5, p0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object v4, p4

    move-object v6, p2

    move-object v7, p5

    invoke-virtual/range {v2 .. v7}, Lorg/apache/http/impl/auth/HttpAuthenticator;->handleAuthChallenge(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    goto :goto_48

    .line 558
    .end local v1    # "target":Lorg/apache/http/HttpHost;
    .end local v3    # "proxy":Lorg/apache/http/HttpHost;
    :cond_6c
    const/4 v0, 0x0

    goto :goto_48
.end method


# virtual methods
.method establishRoute(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/protocol/HttpClientContext;)V
    .registers 18
    .param p1, "proxyAuthState"    # Lorg/apache/http/auth/AuthState;
    .param p2, "managedConn"    # Lorg/apache/http/HttpClientConnection;
    .param p3, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p4, "request"    # Lorg/apache/http/HttpRequest;
    .param p5, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 346
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v1

    .line 347
    .local v1, "config":Lorg/apache/http/client/config/RequestConfig;
    invoke-virtual {v1}, Lorg/apache/http/client/config/RequestConfig;->getConnectTimeout()I

    move-result v7

    .line 348
    .local v7, "timeout":I
    new-instance v8, Lorg/apache/http/conn/routing/RouteTracker;

    invoke-direct {v8, p3}, Lorg/apache/http/conn/routing/RouteTracker;-><init>(Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 351
    .local v8, "tracker":Lorg/apache/http/conn/routing/RouteTracker;
    :cond_d
    invoke-virtual {v8}, Lorg/apache/http/conn/routing/RouteTracker;->toRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v2

    .line 352
    .local v2, "fact":Lorg/apache/http/conn/routing/HttpRoute;
    iget-object v9, p0, Lorg/apache/http/impl/execchain/MainClientExec;->routeDirector:Lorg/apache/http/conn/routing/HttpRouteDirector;

    invoke-interface {v9, p3, v2}, Lorg/apache/http/conn/routing/HttpRouteDirector;->nextStep(Lorg/apache/http/conn/routing/RouteInfo;Lorg/apache/http/conn/routing/RouteInfo;)I

    move-result v6

    .line 354
    .local v6, "step":I
    packed-switch v6, :pswitch_data_c8

    .line 403
    new-instance v9, Ljava/lang/IllegalStateException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unknown step indicator "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " from RouteDirector."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 357
    :pswitch_39
    iget-object v10, p0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    if-lez v7, :cond_4d

    move v9, v7

    :goto_3e
    move-object/from16 v0, p5

    invoke-interface {v10, p2, p3, v9, v0}, Lorg/apache/http/conn/HttpClientConnectionManager;->connect(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)V

    .line 362
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->isSecure()Z

    move-result v9

    invoke-virtual {v8, v9}, Lorg/apache/http/conn/routing/RouteTracker;->connectTarget(Z)V

    .line 407
    :goto_4a
    if-gtz v6, :cond_d

    .line 408
    return-void

    .line 357
    :cond_4d
    const/4 v9, 0x0

    goto :goto_3e

    .line 365
    :pswitch_4f
    iget-object v10, p0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    if-lez v7, :cond_62

    move v9, v7

    :goto_54
    move-object/from16 v0, p5

    invoke-interface {v10, p2, p3, v9, v0}, Lorg/apache/http/conn/HttpClientConnectionManager;->connect(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)V

    .line 370
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v4

    .line 371
    .local v4, "proxy":Lorg/apache/http/HttpHost;
    const/4 v9, 0x0

    invoke-virtual {v8, v4, v9}, Lorg/apache/http/conn/routing/RouteTracker;->connectProxy(Lorg/apache/http/HttpHost;Z)V

    goto :goto_4a

    .line 365
    .end local v4    # "proxy":Lorg/apache/http/HttpHost;
    :cond_62
    const/4 v9, 0x0

    goto :goto_54

    .line 374
    :pswitch_64
    invoke-direct/range {p0 .. p5}, Lorg/apache/http/impl/execchain/MainClientExec;->createTunnelToTarget(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/protocol/HttpClientContext;)Z

    move-result v5

    .line 376
    .local v5, "secure":Z
    iget-object v9, p0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v10, "Tunnel to target created."

    invoke-interface {v9, v10}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 377
    invoke-virtual {v8, v5}, Lorg/apache/http/conn/routing/RouteTracker;->tunnelTarget(Z)V

    goto :goto_4a

    .line 385
    .end local v5    # "secure":Z
    :pswitch_73
    invoke-virtual {v2}, Lorg/apache/http/conn/routing/HttpRoute;->getHopCount()I

    move-result v9

    add-int/lit8 v3, v9, -0x1

    .line 386
    .local v3, "hop":I
    move-object/from16 v0, p5

    invoke-direct {p0, p3, v3, v0}, Lorg/apache/http/impl/execchain/MainClientExec;->createTunnelToProxy(Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/client/protocol/HttpClientContext;)Z

    move-result v5

    .line 387
    .restart local v5    # "secure":Z
    iget-object v9, p0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v10, "Tunnel to proxy created."

    invoke-interface {v9, v10}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 388
    invoke-virtual {p3, v3}, Lorg/apache/http/conn/routing/HttpRoute;->getHopTarget(I)Lorg/apache/http/HttpHost;

    move-result-object v9

    invoke-virtual {v8, v9, v5}, Lorg/apache/http/conn/routing/RouteTracker;->tunnelProxy(Lorg/apache/http/HttpHost;Z)V

    goto :goto_4a

    .line 392
    .end local v3    # "hop":I
    .end local v5    # "secure":Z
    :pswitch_8e
    iget-object v9, p0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    move-object/from16 v0, p5

    invoke-interface {v9, p2, p3, v0}, Lorg/apache/http/conn/HttpClientConnectionManager;->upgrade(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V

    .line 393
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->isSecure()Z

    move-result v9

    invoke-virtual {v8, v9}, Lorg/apache/http/conn/routing/RouteTracker;->layerProtocol(Z)V

    goto :goto_4a

    .line 397
    :pswitch_9d
    new-instance v9, Lorg/apache/http/HttpException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unable to establish route: planned = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "; current = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 400
    :pswitch_c0
    iget-object v9, p0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    move-object/from16 v0, p5

    invoke-interface {v9, p2, p3, v0}, Lorg/apache/http/conn/HttpClientConnectionManager;->routeComplete(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V

    goto :goto_4a

    .line 354
    :pswitch_data_c8
    .packed-switch -0x1
        :pswitch_9d
        :pswitch_c0
        :pswitch_39
        :pswitch_4f
        :pswitch_64
        :pswitch_73
        :pswitch_8e
    .end packed-switch
.end method

.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .registers 33
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 136
    const-string v4, "HTTP route"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 137
    const-string v4, "HTTP request"

    move-object/from16 v0, p2

    invoke-static {v0, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 138
    const-string v4, "HTTP context"

    move-object/from16 v0, p3

    invoke-static {v0, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetAuthState()Lorg/apache/http/auth/AuthState;

    move-result-object v25

    .line 141
    .local v25, "targetAuthState":Lorg/apache/http/auth/AuthState;
    if-nez v25, :cond_29

    .line 142
    new-instance v25, Lorg/apache/http/auth/AuthState;

    .end local v25    # "targetAuthState":Lorg/apache/http/auth/AuthState;
    invoke-direct/range {v25 .. v25}, Lorg/apache/http/auth/AuthState;-><init>()V

    .line 143
    .restart local v25    # "targetAuthState":Lorg/apache/http/auth/AuthState;
    const-string v4, "http.auth.target-scope"

    move-object/from16 v0, p3

    move-object/from16 v1, v25

    invoke-virtual {v0, v4, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 145
    :cond_29
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getProxyAuthState()Lorg/apache/http/auth/AuthState;

    move-result-object v5

    .line 146
    .local v5, "proxyAuthState":Lorg/apache/http/auth/AuthState;
    if-nez v5, :cond_3b

    .line 147
    new-instance v5, Lorg/apache/http/auth/AuthState;

    .end local v5    # "proxyAuthState":Lorg/apache/http/auth/AuthState;
    invoke-direct {v5}, Lorg/apache/http/auth/AuthState;-><init>()V

    .line 148
    .restart local v5    # "proxyAuthState":Lorg/apache/http/auth/AuthState;
    const-string v4, "http.auth.proxy-scope"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4, v5}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 151
    :cond_3b
    move-object/from16 v0, p2

    instance-of v4, v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v4, :cond_48

    move-object/from16 v4, p2

    .line 152
    check-cast v4, Lorg/apache/http/HttpEntityEnclosingRequest;

    invoke-static {v4}, Lorg/apache/http/impl/execchain/Proxies;->enhanceEntity(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    .line 155
    :cond_48
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getUserToken()Ljava/lang/Object;

    move-result-object v27

    .line 157
    .local v27, "userToken":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-interface {v4, v0, v1}, Lorg/apache/http/conn/HttpClientConnectionManager;->requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ConnectionRequest;

    move-result-object v16

    .line 158
    .local v16, "connRequest":Lorg/apache/http/conn/ConnectionRequest;
    if-eqz p4, :cond_72

    .line 159
    invoke-interface/range {p4 .. p4}, Lorg/apache/http/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v4

    if-eqz v4, :cond_6b

    .line 160
    invoke-interface/range {v16 .. v16}, Lorg/apache/http/conn/ConnectionRequest;->cancel()Z

    .line 161
    new-instance v4, Lorg/apache/http/impl/execchain/RequestAbortedException;

    const-string v7, "Request aborted"

    invoke-direct {v4, v7}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 163
    :cond_6b
    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/apache/http/client/methods/HttpExecutionAware;->setCancellable(Lorg/apache/http/concurrent/Cancellable;)V

    .line 167
    :cond_72
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v14

    .line 171
    .local v14, "config":Lorg/apache/http/client/config/RequestConfig;
    :try_start_76
    invoke-virtual {v14}, Lorg/apache/http/client/config/RequestConfig;->getConnectionRequestTimeout()I

    move-result v26

    .line 172
    .local v26, "timeout":I
    if-lez v26, :cond_f0

    move/from16 v0, v26

    int-to-long v8, v0

    :goto_7f
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v16

    invoke-interface {v0, v8, v9, v4}, Lorg/apache/http/conn/ConnectionRequest;->get(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/HttpClientConnection;
    :try_end_86
    .catch Ljava/lang/InterruptedException; {:try_start_76 .. :try_end_86} :catch_f3
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_76 .. :try_end_86} :catch_105

    move-result-object v6

    .line 184
    .local v6, "managedConn":Lorg/apache/http/HttpClientConnection;
    const-string v4, "http.connection"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4, v6}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 186
    invoke-virtual {v14}, Lorg/apache/http/client/config/RequestConfig;->isStaleConnectionCheckEnabled()Z

    move-result v4

    if-eqz v4, :cond_b5

    .line 188
    invoke-interface {v6}, Lorg/apache/http/HttpClientConnection;->isOpen()Z

    move-result v4

    if-eqz v4, :cond_b5

    .line 189
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Stale connection check"

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 190
    invoke-interface {v6}, Lorg/apache/http/HttpClientConnection;->isStale()Z

    move-result v4

    if-eqz v4, :cond_b5

    .line 191
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Stale connection detected"

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 192
    invoke-interface {v6}, Lorg/apache/http/HttpClientConnection;->close()V

    .line 197
    :cond_b5
    new-instance v15, Lorg/apache/http/impl/execchain/ConnectionHolder;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    invoke-direct {v15, v4, v7, v6}, Lorg/apache/http/impl/execchain/ConnectionHolder;-><init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/HttpClientConnection;)V

    .line 199
    .local v15, "connHolder":Lorg/apache/http/impl/execchain/ConnectionHolder;
    if-eqz p4, :cond_c9

    .line 200
    :try_start_c4
    move-object/from16 v0, p4

    invoke-interface {v0, v15}, Lorg/apache/http/client/methods/HttpExecutionAware;->setCancellable(Lorg/apache/http/concurrent/Cancellable;)V

    .line 204
    :cond_c9
    const/16 v21, 0x1

    .line 206
    .local v21, "execCount":I
    :goto_cb
    const/4 v4, 0x1

    move/from16 v0, v21

    if-le v0, v4, :cond_116

    invoke-static/range {p2 .. p2}, Lorg/apache/http/impl/execchain/Proxies;->isRepeatable(Lorg/apache/http/HttpRequest;)Z

    move-result v4

    if-nez v4, :cond_116

    .line 207
    new-instance v4, Lorg/apache/http/client/NonRepeatableRequestException;

    const-string v7, "Cannot retry request with a non-repeatable request entity."

    invoke-direct {v4, v7}, Lorg/apache/http/client/NonRepeatableRequestException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_de
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_c4 .. :try_end_de} :catch_de
    .catch Lorg/apache/http/HttpException; {:try_start_c4 .. :try_end_de} :catch_126
    .catch Ljava/io/IOException; {:try_start_c4 .. :try_end_de} :catch_173
    .catch Ljava/lang/RuntimeException; {:try_start_c4 .. :try_end_de} :catch_31b

    .line 320
    .end local v21    # "execCount":I
    :catch_de
    move-exception v20

    .line 321
    .local v20, "ex":Lorg/apache/http/impl/conn/ConnectionShutdownException;
    new-instance v23, Ljava/io/InterruptedIOException;

    const-string v4, "Connection has been shut down"

    move-object/from16 v0, v23

    invoke-direct {v0, v4}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 323
    .local v23, "ioex":Ljava/io/InterruptedIOException;
    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 324
    throw v23

    .line 172
    .end local v6    # "managedConn":Lorg/apache/http/HttpClientConnection;
    .end local v15    # "connHolder":Lorg/apache/http/impl/execchain/ConnectionHolder;
    .end local v20    # "ex":Lorg/apache/http/impl/conn/ConnectionShutdownException;
    .end local v23    # "ioex":Ljava/io/InterruptedIOException;
    :cond_f0
    const-wide/16 v8, 0x0

    goto :goto_7f

    .line 173
    .end local v26    # "timeout":I
    :catch_f3
    move-exception v22

    .line 174
    .local v22, "interrupted":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->interrupt()V

    .line 175
    new-instance v4, Lorg/apache/http/impl/execchain/RequestAbortedException;

    const-string v7, "Request aborted"

    move-object/from16 v0, v22

    invoke-direct {v4, v7, v0}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 176
    .end local v22    # "interrupted":Ljava/lang/InterruptedException;
    :catch_105
    move-exception v20

    .line 177
    .local v20, "ex":Ljava/util/concurrent/ExecutionException;
    invoke-virtual/range {v20 .. v20}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v13

    .line 178
    .local v13, "cause":Ljava/lang/Throwable;
    if-nez v13, :cond_10e

    .line 179
    move-object/from16 v13, v20

    .line 181
    :cond_10e
    new-instance v4, Lorg/apache/http/impl/execchain/RequestAbortedException;

    const-string v7, "Request execution failed"

    invoke-direct {v4, v7, v13}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 211
    .end local v13    # "cause":Ljava/lang/Throwable;
    .end local v20    # "ex":Ljava/util/concurrent/ExecutionException;
    .restart local v6    # "managedConn":Lorg/apache/http/HttpClientConnection;
    .restart local v15    # "connHolder":Lorg/apache/http/impl/execchain/ConnectionHolder;
    .restart local v21    # "execCount":I
    .restart local v26    # "timeout":I
    :cond_116
    if-eqz p4, :cond_12b

    :try_start_118
    invoke-interface/range {p4 .. p4}, Lorg/apache/http/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v4

    if-eqz v4, :cond_12b

    .line 212
    new-instance v4, Lorg/apache/http/impl/execchain/RequestAbortedException;

    const-string v7, "Request aborted"

    invoke-direct {v4, v7}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_126
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_118 .. :try_end_126} :catch_de
    .catch Lorg/apache/http/HttpException; {:try_start_118 .. :try_end_126} :catch_126
    .catch Ljava/io/IOException; {:try_start_118 .. :try_end_126} :catch_173
    .catch Ljava/lang/RuntimeException; {:try_start_118 .. :try_end_126} :catch_31b

    .line 325
    .end local v21    # "execCount":I
    :catch_126
    move-exception v20

    .line 326
    .local v20, "ex":Lorg/apache/http/HttpException;
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 327
    throw v20

    .line 215
    .end local v20    # "ex":Lorg/apache/http/HttpException;
    .restart local v21    # "execCount":I
    :cond_12b
    :try_start_12b
    invoke-interface {v6}, Lorg/apache/http/HttpClientConnection;->isOpen()Z

    move-result v4

    if-nez v4, :cond_158

    .line 216
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Opening connection "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_14d
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_12b .. :try_end_14d} :catch_de
    .catch Lorg/apache/http/HttpException; {:try_start_12b .. :try_end_14d} :catch_126
    .catch Ljava/io/IOException; {:try_start_12b .. :try_end_14d} :catch_173
    .catch Ljava/lang/RuntimeException; {:try_start_12b .. :try_end_14d} :catch_31b

    move-object/from16 v4, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    .line 218
    :try_start_155
    invoke-virtual/range {v4 .. v9}, Lorg/apache/http/impl/execchain/MainClientExec;->establishRoute(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/protocol/HttpClientContext;)V
    :try_end_158
    .catch Lorg/apache/http/impl/execchain/TunnelRefusedException; {:try_start_155 .. :try_end_158} :catch_178
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_155 .. :try_end_158} :catch_de
    .catch Lorg/apache/http/HttpException; {:try_start_155 .. :try_end_158} :catch_126
    .catch Ljava/io/IOException; {:try_start_155 .. :try_end_158} :catch_173
    .catch Ljava/lang/RuntimeException; {:try_start_155 .. :try_end_158} :catch_31b

    .line 227
    :cond_158
    :try_start_158
    invoke-virtual {v14}, Lorg/apache/http/client/config/RequestConfig;->getSocketTimeout()I

    move-result v26

    .line 228
    if-ltz v26, :cond_163

    .line 229
    move/from16 v0, v26

    invoke-interface {v6, v0}, Lorg/apache/http/HttpClientConnection;->setSocketTimeout(I)V

    .line 232
    :cond_163
    if-eqz p4, :cond_1c3

    invoke-interface/range {p4 .. p4}, Lorg/apache/http/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v4

    if-eqz v4, :cond_1c3

    .line 233
    new-instance v4, Lorg/apache/http/impl/execchain/RequestAbortedException;

    const-string v7, "Request aborted"

    invoke-direct {v4, v7}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_173
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_158 .. :try_end_173} :catch_de
    .catch Lorg/apache/http/HttpException; {:try_start_158 .. :try_end_173} :catch_126
    .catch Ljava/io/IOException; {:try_start_158 .. :try_end_173} :catch_173
    .catch Ljava/lang/RuntimeException; {:try_start_158 .. :try_end_173} :catch_31b

    .line 328
    .end local v21    # "execCount":I
    :catch_173
    move-exception v20

    .line 329
    .local v20, "ex":Ljava/io/IOException;
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 330
    throw v20

    .line 219
    .end local v20    # "ex":Ljava/io/IOException;
    .restart local v21    # "execCount":I
    :catch_178
    move-exception v20

    .line 220
    .local v20, "ex":Lorg/apache/http/impl/execchain/TunnelRefusedException;
    :try_start_179
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_18e

    .line 221
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual/range {v20 .. v20}, Lorg/apache/http/impl/execchain/TunnelRefusedException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 223
    :cond_18e
    invoke-virtual/range {v20 .. v20}, Lorg/apache/http/impl/execchain/TunnelRefusedException;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object v11

    .line 303
    .end local v20    # "ex":Lorg/apache/http/impl/execchain/TunnelRefusedException;
    .local v11, "response":Lorg/apache/http/HttpResponse;
    :cond_192
    if-nez v27, :cond_1a7

    .line 304
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    move-object/from16 v0, p3

    invoke-interface {v4, v0}, Lorg/apache/http/client/UserTokenHandler;->getUserToken(Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v27

    .line 305
    const-string v4, "http.user-token"

    move-object/from16 v0, p3

    move-object/from16 v1, v27

    invoke-virtual {v0, v4, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 307
    :cond_1a7
    if-eqz v27, :cond_1ae

    .line 308
    move-object/from16 v0, v27

    invoke-virtual {v15, v0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->setState(Ljava/lang/Object;)V

    .line 312
    :cond_1ae
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v17

    .line 313
    .local v17, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v17, :cond_1ba

    invoke-interface/range {v17 .. v17}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v4

    if-nez v4, :cond_36c

    .line 315
    :cond_1ba
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->releaseConnection()V

    .line 316
    const/4 v4, 0x0

    invoke-static {v11, v4}, Lorg/apache/http/impl/execchain/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v4

    .line 318
    :goto_1c2
    return-object v4

    .line 236
    .end local v11    # "response":Lorg/apache/http/HttpResponse;
    .end local v17    # "entity":Lorg/apache/http/HttpEntity;
    :cond_1c3
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_1eb

    .line 237
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Executing request "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 240
    :cond_1eb
    const-string v4, "Authorization"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/http/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_22a

    .line 241
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_21d

    .line 242
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Target auth state: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual/range {v25 .. v25}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 244
    :cond_21d
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p2

    move-object/from16 v1, v25

    move-object/from16 v2, p3

    invoke-virtual {v4, v0, v1, v2}, Lorg/apache/http/impl/auth/HttpAuthenticator;->generateAuthResponse(Lorg/apache/http/HttpRequest;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)V

    .line 246
    :cond_22a
    const-string v4, "Proxy-Authorization"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/http/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_26d

    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v4

    if-nez v4, :cond_26d

    .line 247
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_262

    .line 248
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Proxy auth state: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 250
    :cond_262
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v4, v0, v5, v1}, Lorg/apache/http/impl/auth/HttpAuthenticator;->generateAuthResponse(Lorg/apache/http/HttpRequest;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)V

    .line 253
    :cond_26d
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v4, v0, v6, v1}, Lorg/apache/http/protocol/HttpRequestExecutor;->execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v11

    .line 256
    .restart local v11    # "response":Lorg/apache/http/HttpResponse;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    move-object/from16 v0, p3

    invoke-interface {v4, v11, v0}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v4

    if-eqz v4, :cond_317

    .line 258
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    move-object/from16 v0, p3

    invoke-interface {v4, v11, v0}, Lorg/apache/http/conn/ConnectionKeepAliveStrategy;->getKeepAliveDuration(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)J

    move-result-wide v18

    .line 259
    .local v18, "duration":J
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_2dc

    .line 261
    const-wide/16 v8, 0x0

    cmp-long v4, v18, v8

    if-lez v4, :cond_314

    .line 262
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "for "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, v18

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 266
    .local v24, "s":Ljava/lang/String;
    :goto_2c0
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Connection can be kept alive "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v24

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 268
    .end local v24    # "s":Ljava/lang/String;
    :cond_2dc
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, v18

    invoke-virtual {v15, v0, v1, v4}, Lorg/apache/http/impl/execchain/ConnectionHolder;->setValidFor(JLjava/util/concurrent/TimeUnit;)V

    .line 269
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->markReusable()V

    .end local v18    # "duration":J
    :goto_2e6
    move-object/from16 v7, p0

    move-object/from16 v8, v25

    move-object v9, v5

    move-object/from16 v10, p1

    move-object/from16 v12, p3

    .line 274
    invoke-direct/range {v7 .. v12}, Lorg/apache/http/impl/execchain/MainClientExec;->needAuthentication(Lorg/apache/http/auth/AuthState;Lorg/apache/http/auth/AuthState;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/protocol/HttpClientContext;)Z

    move-result v4

    if-eqz v4, :cond_192

    .line 277
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v17

    .line 278
    .restart local v17    # "entity":Lorg/apache/http/HttpEntity;
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->isReusable()Z

    move-result v4

    if-eqz v4, :cond_320

    .line 279
    invoke-static/range {v17 .. v17}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 296
    :cond_302
    :goto_302
    const-string v4, "Authorization"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/http/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    .line 297
    const-string v4, "Proxy-Authorization"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/http/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    .line 204
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_cb

    .line 264
    .end local v17    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v18    # "duration":J
    :cond_314
    const-string v24, "indefinitely"

    .restart local v24    # "s":Ljava/lang/String;
    goto :goto_2c0

    .line 271
    .end local v18    # "duration":J
    .end local v24    # "s":Ljava/lang/String;
    :cond_317
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->markNonReusable()V
    :try_end_31a
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_179 .. :try_end_31a} :catch_de
    .catch Lorg/apache/http/HttpException; {:try_start_179 .. :try_end_31a} :catch_126
    .catch Ljava/io/IOException; {:try_start_179 .. :try_end_31a} :catch_173
    .catch Ljava/lang/RuntimeException; {:try_start_179 .. :try_end_31a} :catch_31b

    goto :goto_2e6

    .line 331
    .end local v11    # "response":Lorg/apache/http/HttpResponse;
    .end local v21    # "execCount":I
    :catch_31b
    move-exception v20

    .line 332
    .local v20, "ex":Ljava/lang/RuntimeException;
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 333
    throw v20

    .line 281
    .end local v20    # "ex":Ljava/lang/RuntimeException;
    .restart local v11    # "response":Lorg/apache/http/HttpResponse;
    .restart local v17    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v21    # "execCount":I
    :cond_320
    :try_start_320
    invoke-interface {v6}, Lorg/apache/http/HttpClientConnection;->close()V

    .line 282
    invoke-virtual {v5}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v4

    sget-object v7, Lorg/apache/http/auth/AuthProtocolState;->SUCCESS:Lorg/apache/http/auth/AuthProtocolState;

    if-ne v4, v7, :cond_347

    invoke-virtual {v5}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v4

    if-eqz v4, :cond_347

    invoke-virtual {v5}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v4

    if-eqz v4, :cond_347

    .line 285
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Resetting proxy auth state"

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 286
    invoke-virtual {v5}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 288
    :cond_347
    invoke-virtual/range {v25 .. v25}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v4

    sget-object v7, Lorg/apache/http/auth/AuthProtocolState;->SUCCESS:Lorg/apache/http/auth/AuthProtocolState;

    if-ne v4, v7, :cond_302

    invoke-virtual/range {v25 .. v25}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v4

    if-eqz v4, :cond_302

    invoke-virtual/range {v25 .. v25}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v4

    if-eqz v4, :cond_302

    .line 291
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Resetting target auth state"

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 292
    invoke-virtual/range {v25 .. v25}, Lorg/apache/http/auth/AuthState;->reset()V

    goto :goto_302

    .line 318
    :cond_36c
    invoke-static {v11, v15}, Lorg/apache/http/impl/execchain/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_36f
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_320 .. :try_end_36f} :catch_de
    .catch Lorg/apache/http/HttpException; {:try_start_320 .. :try_end_36f} :catch_126
    .catch Ljava/io/IOException; {:try_start_320 .. :try_end_36f} :catch_173
    .catch Ljava/lang/RuntimeException; {:try_start_320 .. :try_end_36f} :catch_31b

    move-result-object v4

    goto/16 :goto_1c2
.end method
