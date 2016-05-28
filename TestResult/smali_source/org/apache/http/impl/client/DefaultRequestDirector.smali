.class public Lorg/apache/http/impl/client/DefaultRequestDirector;
.super Ljava/lang/Object;
.source "DefaultRequestDirector.java"

# interfaces
.implements Lorg/apache/http/client/RequestDirector;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

.field protected final connManager:Lorg/apache/http/conn/ClientConnectionManager;

.field private execCount:I

.field protected final httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

.field protected final keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

.field private final log:Lorg/apache/commons/logging/Log;

.field protected managedConn:Lorg/apache/http/conn/ManagedClientConnection;

.field private final maxRedirects:I

.field protected final params:Lorg/apache/http/params/HttpParams;

.field protected final proxyAuthHandler:Lorg/apache/http/client/AuthenticationHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final proxyAuthState:Lorg/apache/http/auth/AuthState;

.field protected final proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

.field private redirectCount:I

.field protected final redirectHandler:Lorg/apache/http/client/RedirectHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

.field protected final requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

.field protected final retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

.field protected final reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

.field protected final routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

.field protected final targetAuthHandler:Lorg/apache/http/client/AuthenticationHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final targetAuthState:Lorg/apache/http/auth/AuthState;

.field protected final targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

.field protected final userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

.field private virtualHost:Lorg/apache/http/HttpHost;


# direct methods
.method public constructor <init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V
    .registers 29
    .param p1, "log"    # Lorg/apache/commons/logging/Log;
    .param p2, "requestExec"    # Lorg/apache/http/protocol/HttpRequestExecutor;
    .param p3, "conman"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p4, "reustrat"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p5, "kastrat"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .param p6, "rouplan"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .param p7, "httpProcessor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p8, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;
    .param p9, "redirectStrategy"    # Lorg/apache/http/client/RedirectStrategy;
    .param p10, "targetAuthHandler"    # Lorg/apache/http/client/AuthenticationHandler;
    .param p11, "proxyAuthHandler"    # Lorg/apache/http/client/AuthenticationHandler;
    .param p12, "userTokenHandler"    # Lorg/apache/http/client/UserTokenHandler;
    .param p13, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 243
    const-class v1, Lorg/apache/http/impl/client/DefaultRequestDirector;

    invoke-static {v1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v11, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    move-object/from16 v0, p10

    invoke-direct {v11, v0}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;-><init>(Lorg/apache/http/client/AuthenticationHandler;)V

    new-instance v12, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    move-object/from16 v0, p11

    invoke-direct {v12, v0}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;-><init>(Lorg/apache/http/client/AuthenticationHandler;)V

    move-object v1, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    invoke-direct/range {v1 .. v14}, Lorg/apache/http/impl/client/DefaultRequestDirector;-><init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V

    .line 250
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V
    .registers 18
    .param p1, "log"    # Lorg/apache/commons/logging/Log;
    .param p2, "requestExec"    # Lorg/apache/http/protocol/HttpRequestExecutor;
    .param p3, "conman"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p4, "reustrat"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p5, "kastrat"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .param p6, "rouplan"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .param p7, "httpProcessor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p8, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;
    .param p9, "redirectStrategy"    # Lorg/apache/http/client/RedirectStrategy;
    .param p10, "targetAuthStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p11, "proxyAuthStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p12, "userTokenHandler"    # Lorg/apache/http/client/UserTokenHandler;
    .param p13, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 268
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    const-string v1, "Log"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 271
    const-string v1, "Request executor"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 272
    const-string v1, "Client connection manager"

    invoke-static {p3, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 273
    const-string v1, "Connection reuse strategy"

    invoke-static {p4, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 274
    const-string v1, "Connection keep alive strategy"

    invoke-static {p5, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 275
    const-string v1, "Route planner"

    invoke-static {p6, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 276
    const-string v1, "HTTP protocol processor"

    invoke-static {p7, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 277
    const-string v1, "HTTP request retry handler"

    invoke-static {p8, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 278
    const-string v1, "Redirect strategy"

    invoke-static {p9, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 279
    const-string v1, "Target authentication strategy"

    invoke-static {p10, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 280
    const-string v1, "Proxy authentication strategy"

    invoke-static {p11, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 281
    const-string v1, "User token handler"

    move-object/from16 v0, p12

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 282
    const-string v1, "HTTP parameters"

    move-object/from16 v0, p13

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 283
    iput-object p1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    .line 284
    new-instance v1, Lorg/apache/http/impl/client/HttpAuthenticator;

    invoke-direct {v1, p1}, Lorg/apache/http/impl/client/HttpAuthenticator;-><init>(Lorg/apache/commons/logging/Log;)V

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    .line 285
    iput-object p2, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    .line 286
    iput-object p3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    .line 287
    iput-object p4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 288
    iput-object p5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .line 289
    iput-object p6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

    .line 290
    iput-object p7, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    .line 291
    iput-object p8, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    .line 292
    iput-object p9, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

    .line 293
    iput-object p10, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 294
    iput-object p11, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 295
    move-object/from16 v0, p12

    iput-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    .line 296
    move-object/from16 v0, p13

    iput-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    .line 298
    instance-of v1, p9, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;

    if-eqz v1, :cond_b5

    .line 299
    check-cast p9, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;

    .end local p9    # "redirectStrategy":Lorg/apache/http/client/RedirectStrategy;
    invoke-virtual {p9}, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;->getHandler()Lorg/apache/http/client/RedirectHandler;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectHandler:Lorg/apache/http/client/RedirectHandler;

    .line 303
    :goto_79
    instance-of v1, p10, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    if-eqz v1, :cond_b9

    .line 304
    check-cast p10, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    .end local p10    # "targetAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    invoke-virtual {p10}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;->getHandler()Lorg/apache/http/client/AuthenticationHandler;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthHandler:Lorg/apache/http/client/AuthenticationHandler;

    .line 308
    :goto_85
    instance-of v1, p11, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    if-eqz v1, :cond_bd

    .line 309
    check-cast p11, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    .end local p11    # "proxyAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    invoke-virtual {p11}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;->getHandler()Lorg/apache/http/client/AuthenticationHandler;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthHandler:Lorg/apache/http/client/AuthenticationHandler;

    .line 314
    :goto_91
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 316
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->execCount:I

    .line 317
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectCount:I

    .line 318
    new-instance v1, Lorg/apache/http/auth/AuthState;

    invoke-direct {v1}, Lorg/apache/http/auth/AuthState;-><init>()V

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    .line 319
    new-instance v1, Lorg/apache/http/auth/AuthState;

    invoke-direct {v1}, Lorg/apache/http/auth/AuthState;-><init>()V

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    .line 320
    iget-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    const-string v2, "http.protocol.max-redirects"

    const/16 v3, 0x64

    invoke-interface {v1, v2, v3}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->maxRedirects:I

    .line 321
    return-void

    .line 301
    .restart local p9    # "redirectStrategy":Lorg/apache/http/client/RedirectStrategy;
    .restart local p10    # "targetAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    .restart local p11    # "proxyAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    :cond_b5
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectHandler:Lorg/apache/http/client/RedirectHandler;

    goto :goto_79

    .line 306
    .end local p9    # "redirectStrategy":Lorg/apache/http/client/RedirectStrategy;
    :cond_b9
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthHandler:Lorg/apache/http/client/AuthenticationHandler;

    goto :goto_85

    .line 311
    .end local p10    # "targetAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    :cond_bd
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthHandler:Lorg/apache/http/client/AuthenticationHandler;

    goto :goto_91
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V
    .registers 28
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
    .line 218
    const-class v1, Lorg/apache/http/impl/client/DefaultRequestDirector;

    invoke-static {v1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v10, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;

    move-object/from16 v0, p8

    invoke-direct {v10, v0}, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;-><init>(Lorg/apache/http/client/RedirectHandler;)V

    new-instance v11, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    move-object/from16 v0, p9

    invoke-direct {v11, v0}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;-><init>(Lorg/apache/http/client/AuthenticationHandler;)V

    new-instance v12, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    move-object/from16 v0, p10

    invoke-direct {v12, v0}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;-><init>(Lorg/apache/http/client/AuthenticationHandler;)V

    move-object v1, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v13, p11

    move-object/from16 v14, p12

    invoke-direct/range {v1 .. v14}, Lorg/apache/http/impl/client/DefaultRequestDirector;-><init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V

    .line 225
    return-void
.end method

.method private abortConnection()V
    .registers 6

    .prologue
    .line 1109
    iget-object v2, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 1110
    .local v2, "mcc":Lorg/apache/http/conn/ManagedClientConnection;
    if-eqz v2, :cond_d

    .line 1113
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 1115
    :try_start_7
    invoke-interface {v2}, Lorg/apache/http/conn/ManagedClientConnection;->abortConnection()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_a} :catch_e

    .line 1123
    :cond_a
    :goto_a
    :try_start_a
    invoke-interface {v2}, Lorg/apache/http/conn/ManagedClientConnection;->releaseConnection()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_d} :catch_21

    .line 1128
    :cond_d
    :goto_d
    return-void

    .line 1116
    :catch_e
    move-exception v0

    .line 1117
    .local v0, "ex":Ljava/io/IOException;
    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 1118
    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_a

    .line 1124
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_21
    move-exception v1

    .line 1125
    .local v1, "ignored":Ljava/io/IOException;
    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Error releasing connection"

    invoke-interface {v3, v4, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_d
.end method

.method private tryConnect(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/protocol/HttpContext;)V
    .registers 10
    .param p1, "req"    # Lorg/apache/http/impl/client/RoutedRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 600
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v2

    .line 601
    .local v2, "route":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRequest()Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v3

    .line 603
    .local v3, "wrapper":Lorg/apache/http/HttpRequest;
    const/4 v0, 0x0

    .line 605
    .local v0, "connectCount":I
    :cond_9
    :goto_9
    const-string v4, "http.request"

    invoke-interface {p2, v4, v3}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 607
    add-int/lit8 v0, v0, 0x1

    .line 609
    :try_start_10
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v4}, Lorg/apache/http/conn/ManagedClientConnection;->isOpen()Z

    move-result v4

    if-nez v4, :cond_23

    .line 610
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v4, v2, p2, v5}, Lorg/apache/http/conn/ManagedClientConnection;->open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 614
    :goto_1f
    invoke-virtual {p0, v2, p2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->establishRoute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V

    .line 636
    return-void

    .line 612
    :cond_23
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-static {v5}, Lorg/apache/http/params/HttpConnectionParams;->getSoTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v5

    invoke-interface {v4, v5}, Lorg/apache/http/conn/ManagedClientConnection;->setSocketTimeout(I)V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_2e} :catch_2f

    goto :goto_1f

    .line 616
    :catch_2f
    move-exception v1

    .line 618
    .local v1, "ex":Ljava/io/IOException;
    :try_start_30
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v4}, Lorg/apache/http/conn/ManagedClientConnection;->close()V
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_35} :catch_8e

    .line 621
    :goto_35
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    invoke-interface {v4, v1, v0, p2}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v4

    if-eqz v4, :cond_8d

    .line 622
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 623
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "I/O exception ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") caught when connecting to the target host: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 626
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_84

    .line 627
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 629
    :cond_84
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Retrying connect"

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    goto/16 :goto_9

    .line 632
    :cond_8d
    throw v1

    .line 619
    :catch_8e
    move-exception v4

    goto :goto_35
.end method

.method private tryExecute(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 11
    .param p1, "req"    # Lorg/apache/http/impl/client/RoutedRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 643
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRequest()Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v4

    .line 644
    .local v4, "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v3

    .line 645
    .local v3, "route":Lorg/apache/http/conn/routing/HttpRoute;
    const/4 v1, 0x0

    .line 647
    .local v1, "response":Lorg/apache/http/HttpResponse;
    const/4 v2, 0x0

    .line 650
    .local v2, "retryReason":Ljava/lang/Exception;
    :goto_a
    iget v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->execCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->execCount:I

    .line 652
    invoke-virtual {v4}, Lorg/apache/http/impl/client/RequestWrapper;->incrementExecCount()V

    .line 653
    invoke-virtual {v4}, Lorg/apache/http/impl/client/RequestWrapper;->isRepeatable()Z

    move-result v5

    if-nez v5, :cond_32

    .line 654
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Cannot retry non-repeatable request"

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 655
    if-eqz v2, :cond_2a

    .line 656
    new-instance v5, Lorg/apache/http/client/NonRepeatableRequestException;

    const-string v6, "Cannot retry request with a non-repeatable request entity.  The cause lists the reason the original request failed."

    invoke-direct {v5, v6, v2}, Lorg/apache/http/client/NonRepeatableRequestException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 660
    :cond_2a
    new-instance v5, Lorg/apache/http/client/NonRepeatableRequestException;

    const-string v6, "Cannot retry request with a non-repeatable request entity."

    invoke-direct {v5, v6}, Lorg/apache/http/client/NonRepeatableRequestException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 666
    :cond_32
    :try_start_32
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v5}, Lorg/apache/http/conn/ManagedClientConnection;->isOpen()Z

    move-result v5

    if-nez v5, :cond_4e

    .line 669
    invoke-virtual {v3}, Lorg/apache/http/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v5

    if-nez v5, :cond_7f

    .line 670
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Reopening the direct connection."

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 671
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v5, v3, p2, v6}, Lorg/apache/http/conn/ManagedClientConnection;->open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 679
    :cond_4e
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_76

    .line 680
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Attempt "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->execCount:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " to execute request"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 682
    :cond_76
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-virtual {v5, v4, v6, p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 707
    :goto_7e
    return-object v1

    .line 674
    :cond_7f
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Proxied connection. Need to start over."

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_86
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_86} :catch_87

    goto :goto_7e

    .line 685
    :catch_87
    move-exception v0

    .line 686
    .local v0, "ex":Ljava/io/IOException;
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Closing the connection."

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 688
    :try_start_8f
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v5}, Lorg/apache/http/conn/ManagedClientConnection;->close()V
    :try_end_94
    .catch Ljava/io/IOException; {:try_start_8f .. :try_end_94} :catch_f2

    .line 691
    :goto_94
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    invoke-virtual {v4}, Lorg/apache/http/impl/client/RequestWrapper;->getExecCount()I

    move-result v6

    invoke-interface {v5, v0, v6, p2}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v5

    if-eqz v5, :cond_f1

    .line 692
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v5

    if-eqz v5, :cond_d6

    .line 693
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "I/O exception ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ") caught when processing request: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 697
    :cond_d6
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_e7

    .line 698
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 700
    :cond_e7
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Retrying request"

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 701
    move-object v2, v0

    goto/16 :goto_a

    .line 703
    :cond_f1
    throw v0

    .line 689
    :catch_f2
    move-exception v5

    goto :goto_94
.end method

.method private wrapRequest(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/RequestWrapper;
    .registers 3
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 326
    instance-of v0, p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_c

    .line 327
    new-instance v0, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;

    check-cast p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local p1    # "request":Lorg/apache/http/HttpRequest;
    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;-><init>(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    .line 330
    :goto_b
    return-object v0

    .restart local p1    # "request":Lorg/apache/http/HttpRequest;
    :cond_c
    new-instance v0, Lorg/apache/http/impl/client/RequestWrapper;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/RequestWrapper;-><init>(Lorg/apache/http/HttpRequest;)V

    goto :goto_b
.end method


# virtual methods
.method protected createConnectRequest(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpRequest;
    .registers 13
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 973
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v6

    .line 975
    .local v6, "target":Lorg/apache/http/HttpHost;
    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v2

    .line 976
    .local v2, "host":Ljava/lang/String;
    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v3

    .line 977
    .local v3, "port":I
    if-gez v3, :cond_20

    .line 978
    iget-object v8, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    invoke-interface {v8}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v8

    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Ljava/lang/String;)Lorg/apache/http/conn/scheme/Scheme;

    move-result-object v5

    .line 980
    .local v5, "scheme":Lorg/apache/http/conn/scheme/Scheme;
    invoke-virtual {v5}, Lorg/apache/http/conn/scheme/Scheme;->getDefaultPort()I

    move-result v3

    .line 983
    .end local v5    # "scheme":Lorg/apache/http/conn/scheme/Scheme;
    :cond_20
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x6

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 984
    .local v1, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 985
    const/16 v8, 0x3a

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 986
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 988
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 989
    .local v0, "authority":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-static {v8}, Lorg/apache/http/params/HttpProtocolParams;->getVersion(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/ProtocolVersion;

    move-result-object v7

    .line 990
    .local v7, "ver":Lorg/apache/http/ProtocolVersion;
    new-instance v4, Lorg/apache/http/message/BasicHttpRequest;

    const-string v8, "CONNECT"

    invoke-direct {v4, v8, v0, v7}, Lorg/apache/http/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/ProtocolVersion;)V

    .line 993
    .local v4, "req":Lorg/apache/http/HttpRequest;
    return-object v4
.end method

.method protected createTunnelToProxy(Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)Z
    .registers 6
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "hop"    # I
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 953
    new-instance v0, Lorg/apache/http/HttpException;

    const-string v1, "Proxy chains are not supported."

    invoke-direct {v0, v1}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected createTunnelToTarget(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 13
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 842
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 843
    .local v1, "proxy":Lorg/apache/http/HttpHost;
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v9

    .line 844
    .local v9, "target":Lorg/apache/http/HttpHost;
    const/4 v2, 0x0

    .line 847
    .local v2, "response":Lorg/apache/http/HttpResponse;
    :cond_9
    :goto_9
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->isOpen()Z

    move-result v0

    if-nez v0, :cond_18

    .line 848
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v0, p1, p2, v3}, Lorg/apache/http/conn/ManagedClientConnection;->open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 851
    :cond_18
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->createConnectRequest(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpRequest;

    move-result-object v6

    .line 852
    .local v6, "connect":Lorg/apache/http/HttpRequest;
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v6, v0}, Lorg/apache/http/HttpRequest;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 855
    const-string v0, "http.target_host"

    invoke-interface {p2, v0, v9}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 856
    const-string v0, "http.proxy_host"

    invoke-interface {p2, v0, v1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 857
    const-string v0, "http.connection"

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {p2, v0, v3}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 858
    const-string v0, "http.request"

    invoke-interface {p2, v0, v6}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 860
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-virtual {v0, v6, v3, p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->preProcess(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 862
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-virtual {v0, v6, v3, p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 864
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v2, v0}, Lorg/apache/http/HttpResponse;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 865
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-virtual {v0, v2, v3, p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->postProcess(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 867
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    .line 868
    .local v8, "status":I
    const/16 v0, 0xc8

    if-ge v8, v0, :cond_7b

    .line 869
    new-instance v0, Lorg/apache/http/HttpException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected response to CONNECT request: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 873
    :cond_7b
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-static {v0}, Lorg/apache/http/client/params/HttpClientParams;->isAuthenticating(Lorg/apache/http/params/HttpParams;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 874
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    if-eqz v0, :cond_bc

    .line 876
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/HttpAuthenticator;->authenticate(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    if-eqz v0, :cond_bc

    .line 879
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    invoke-interface {v0, v2, p2}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    if-eqz v0, :cond_b5

    .line 880
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v3, "Connection kept alive"

    invoke-interface {v0, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 882
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    .line 883
    .local v7, "entity":Lorg/apache/http/HttpEntity;
    invoke-static {v7}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    goto/16 :goto_9

    .line 885
    .end local v7    # "entity":Lorg/apache/http/HttpEntity;
    :cond_b5
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->close()V

    goto/16 :goto_9

    .line 896
    :cond_bc
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    .line 898
    const/16 v0, 0x12b

    if-le v8, v0, :cond_f8

    .line 901
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    .line 902
    .restart local v7    # "entity":Lorg/apache/http/HttpEntity;
    if-eqz v7, :cond_d6

    .line 903
    new-instance v0, Lorg/apache/http/entity/BufferedHttpEntity;

    invoke-direct {v0, v7}, Lorg/apache/http/entity/BufferedHttpEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    invoke-interface {v2, v0}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 906
    :cond_d6
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->close()V

    .line 907
    new-instance v0, Lorg/apache/http/impl/client/TunnelRefusedException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CONNECT refused by proxy: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3, v2}, Lorg/apache/http/impl/client/TunnelRefusedException;-><init>(Ljava/lang/String;Lorg/apache/http/HttpResponse;)V

    throw v0

    .line 911
    .end local v7    # "entity":Lorg/apache/http/HttpEntity;
    :cond_f8
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->markReusable()V

    .line 917
    const/4 v0, 0x0

    return v0
.end method

.method protected determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;
    .registers 7
    .param p1, "targetHost"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 748
    iget-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

    if-eqz p1, :cond_9

    .end local p1    # "targetHost":Lorg/apache/http/HttpHost;
    :goto_4
    invoke-interface {v1, p1, p2, p3}, Lorg/apache/http/conn/routing/HttpRoutePlanner;->determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v0

    return-object v0

    .restart local p1    # "targetHost":Lorg/apache/http/HttpHost;
    :cond_9
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    const-string v2, "http.default-host"

    invoke-interface {v0, v2}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpHost;

    move-object p1, v0

    goto :goto_4
.end method

.method protected establishRoute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V
    .registers 11
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 767
    new-instance v2, Lorg/apache/http/conn/routing/BasicRouteDirector;

    invoke-direct {v2}, Lorg/apache/http/conn/routing/BasicRouteDirector;-><init>()V

    .line 770
    .local v2, "rowdy":Lorg/apache/http/conn/routing/HttpRouteDirector;
    :cond_5
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v5}, Lorg/apache/http/conn/ManagedClientConnection;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v0

    .line 771
    .local v0, "fact":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-interface {v2, p1, v0}, Lorg/apache/http/conn/routing/HttpRouteDirector;->nextStep(Lorg/apache/http/conn/routing/RouteInfo;Lorg/apache/http/conn/routing/RouteInfo;)I

    move-result v4

    .line 773
    .local v4, "step":I
    packed-switch v4, :pswitch_data_96

    .line 810
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unknown step indicator "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " from RouteDirector."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 777
    :pswitch_31
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v5, p1, p2, v6}, Lorg/apache/http/conn/ManagedClientConnection;->open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 814
    :goto_38
    :pswitch_38
    if-gtz v4, :cond_5

    .line 816
    return-void

    .line 781
    :pswitch_3b
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->createTunnelToTarget(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    .line 782
    .local v3, "secure":Z
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Tunnel to target created."

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 783
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v5, v3, v6}, Lorg/apache/http/conn/ManagedClientConnection;->tunnelTarget(ZLorg/apache/http/params/HttpParams;)V

    goto :goto_38

    .line 791
    .end local v3    # "secure":Z
    :pswitch_4e
    invoke-virtual {v0}, Lorg/apache/http/conn/routing/HttpRoute;->getHopCount()I

    move-result v5

    add-int/lit8 v1, v5, -0x1

    .line 792
    .local v1, "hop":I
    invoke-virtual {p0, p1, v1, p2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->createTunnelToProxy(Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    .line 793
    .restart local v3    # "secure":Z
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Tunnel to proxy created."

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 794
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-virtual {p1, v1}, Lorg/apache/http/conn/routing/HttpRoute;->getHopTarget(I)Lorg/apache/http/HttpHost;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v5, v6, v3, v7}, Lorg/apache/http/conn/ManagedClientConnection;->tunnelProxy(Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V

    goto :goto_38

    .line 800
    .end local v1    # "hop":I
    .end local v3    # "secure":Z
    :pswitch_6b
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v5, p2, v6}, Lorg/apache/http/conn/ManagedClientConnection;->layerProtocol(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    goto :goto_38

    .line 804
    :pswitch_73
    new-instance v5, Lorg/apache/http/HttpException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to establish route: planned = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; current = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 773
    :pswitch_data_96
    .packed-switch -0x1
        :pswitch_73
        :pswitch_38
        :pswitch_31
        :pswitch_31
        :pswitch_3b
        :pswitch_4e
        :pswitch_6b
    .end packed-switch
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 38
    .param p1, "targetHost"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 372
    const-string v31, "http.auth.target-scope"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v32, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 373
    const-string v31, "http.auth.proxy-scope"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v32, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 375
    move-object/from16 v25, p1

    .line 377
    .local v25, "target":Lorg/apache/http/HttpHost;
    move-object/from16 v15, p2

    .line 378
    .local v15, "orig":Lorg/apache/http/HttpRequest;
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/apache/http/impl/client/DefaultRequestDirector;->wrapRequest(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v17

    .line 379
    .local v17, "origWrapper":Lorg/apache/http/impl/client/RequestWrapper;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    move-object/from16 v31, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/RequestWrapper;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 380
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v17

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/impl/client/DefaultRequestDirector;->determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v16

    .line 382
    .local v16, "origRoute":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-virtual/range {v17 .. v17}, Lorg/apache/http/impl/client/RequestWrapper;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v31

    const-string v32, "http.virtual-host"

    invoke-interface/range {v31 .. v32}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lorg/apache/http/HttpHost;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    .line 385
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v31, v0

    if-eqz v31, :cond_a8

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v31

    const/16 v32, -0x1

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_a8

    .line 386
    if-eqz v25, :cond_2f4

    move-object/from16 v12, v25

    .line 387
    .local v12, "host":Lorg/apache/http/HttpHost;
    :goto_75
    invoke-virtual {v12}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v18

    .line 388
    .local v18, "port":I
    const/16 v31, -0x1

    move/from16 v0, v18

    move/from16 v1, v31

    if-eq v0, v1, :cond_a8

    .line 389
    new-instance v31, Lorg/apache/http/HttpHost;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move/from16 v2, v18

    move-object/from16 v3, v33

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    .line 393
    .end local v12    # "host":Lorg/apache/http/HttpHost;
    .end local v18    # "port":I
    :cond_a8
    new-instance v22, Lorg/apache/http/impl/client/RoutedRequest;

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/client/RoutedRequest;-><init>(Lorg/apache/http/impl/client/RequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 395
    .local v22, "roureq":Lorg/apache/http/impl/client/RoutedRequest;
    const/16 v21, 0x0

    .line 396
    .local v21, "reuse":Z
    const/4 v5, 0x0

    .line 398
    .local v5, "done":Z
    const/16 v20, 0x0

    .line 399
    .local v20, "response":Lorg/apache/http/HttpResponse;
    :cond_b8
    :goto_b8
    if-nez v5, :cond_32b

    .line 405
    :try_start_ba
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/impl/client/RoutedRequest;->getRequest()Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v30

    .line 406
    .local v30, "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v23

    .line 407
    .local v23, "route":Lorg/apache/http/conn/routing/HttpRoute;
    const/16 v20, 0x0

    .line 410
    const-string v31, "http.user-token"

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    invoke-interface {v0, v1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v28

    .line 413
    .local v28, "userToken":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    if-nez v31, :cond_153

    .line 414
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v23

    move-object/from16 v2, v28

    invoke-interface {v0, v1, v2}, Lorg/apache/http/conn/ClientConnectionManager;->requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ClientConnectionRequest;

    move-result-object v4

    .line 416
    .local v4, "connRequest":Lorg/apache/http/conn/ClientConnectionRequest;
    instance-of v0, v15, Lorg/apache/http/client/methods/AbortableHttpRequest;

    move/from16 v31, v0

    if-eqz v31, :cond_f6

    .line 417
    move-object v0, v15

    check-cast v0, Lorg/apache/http/client/methods/AbortableHttpRequest;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Lorg/apache/http/client/methods/AbortableHttpRequest;->setConnectionRequest(Lorg/apache/http/conn/ClientConnectionRequest;)V

    .line 420
    :cond_f6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    move-object/from16 v31, v0

    invoke-static/range {v31 .. v31}, Lorg/apache/http/client/params/HttpClientParams;->getConnectionManagerTimeout(Lorg/apache/http/params/HttpParams;)J
    :try_end_ff
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_ba .. :try_end_ff} :catch_2e6
    .catch Lorg/apache/http/HttpException; {:try_start_ba .. :try_end_ff} :catch_308
    .catch Ljava/io/IOException; {:try_start_ba .. :try_end_ff} :catch_416
    .catch Ljava/lang/RuntimeException; {:try_start_ba .. :try_end_ff} :catch_435

    move-result-wide v26

    .line 422
    .local v26, "timeout":J
    :try_start_100
    sget-object v31, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, v26

    move-object/from16 v2, v31

    invoke-interface {v4, v0, v1, v2}, Lorg/apache/http/conn/ClientConnectionRequest;->getConnection(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/conn/ManagedClientConnection;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;
    :try_end_110
    .catch Ljava/lang/InterruptedException; {:try_start_100 .. :try_end_110} :catch_2fa
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_100 .. :try_end_110} :catch_2e6
    .catch Lorg/apache/http/HttpException; {:try_start_100 .. :try_end_110} :catch_308
    .catch Ljava/io/IOException; {:try_start_100 .. :try_end_110} :catch_416
    .catch Ljava/lang/RuntimeException; {:try_start_100 .. :try_end_110} :catch_435

    .line 428
    :try_start_110
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    move-object/from16 v31, v0

    invoke-static/range {v31 .. v31}, Lorg/apache/http/params/HttpConnectionParams;->isStaleCheckingEnabled(Lorg/apache/http/params/HttpParams;)Z

    move-result v31

    if-eqz v31, :cond_153

    .line 430
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->isOpen()Z

    move-result v31

    if-eqz v31, :cond_153

    .line 431
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    const-string v32, "Stale connection check"

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 432
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->isStale()Z

    move-result v31

    if-eqz v31, :cond_153

    .line 433
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    const-string v32, "Stale connection detected"

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 434
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->close()V

    .line 440
    .end local v4    # "connRequest":Lorg/apache/http/conn/ClientConnectionRequest;
    .end local v26    # "timeout":J
    :cond_153
    instance-of v0, v15, Lorg/apache/http/client/methods/AbortableHttpRequest;

    move/from16 v31, v0

    if-eqz v31, :cond_167

    .line 441
    move-object v0, v15

    check-cast v0, Lorg/apache/http/client/methods/AbortableHttpRequest;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v32, v0

    invoke-interface/range {v31 .. v32}, Lorg/apache/http/client/methods/AbortableHttpRequest;->setReleaseTrigger(Lorg/apache/http/conn/ConnectionReleaseTrigger;)V
    :try_end_167
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_110 .. :try_end_167} :catch_2e6
    .catch Lorg/apache/http/HttpException; {:try_start_110 .. :try_end_167} :catch_308
    .catch Ljava/io/IOException; {:try_start_110 .. :try_end_167} :catch_416
    .catch Ljava/lang/RuntimeException; {:try_start_110 .. :try_end_167} :catch_435

    .line 445
    :cond_167
    :try_start_167
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->tryConnect(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/protocol/HttpContext;)V
    :try_end_170
    .catch Lorg/apache/http/impl/client/TunnelRefusedException; {:try_start_167 .. :try_end_170} :catch_30d
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_167 .. :try_end_170} :catch_2e6
    .catch Lorg/apache/http/HttpException; {:try_start_167 .. :try_end_170} :catch_308
    .catch Ljava/io/IOException; {:try_start_167 .. :try_end_170} :catch_416
    .catch Ljava/lang/RuntimeException; {:try_start_167 .. :try_end_170} :catch_435

    .line 454
    :try_start_170
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/impl/client/RequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v29

    .line 455
    .local v29, "userinfo":Ljava/lang/String;
    if-eqz v29, :cond_191

    .line 456
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    new-instance v32, Lorg/apache/http/impl/auth/BasicScheme;

    invoke-direct/range {v32 .. v32}, Lorg/apache/http/impl/auth/BasicScheme;-><init>()V

    new-instance v33, Lorg/apache/http/auth/UsernamePasswordCredentials;

    move-object/from16 v0, v33

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v31 .. v33}, Lorg/apache/http/auth/AuthState;->update(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;)V

    .line 461
    :cond_191
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v31, v0

    if-eqz v31, :cond_34c

    .line 462
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v25, v0

    .line 469
    :cond_19f
    :goto_19f
    if-nez v25, :cond_1a5

    .line 470
    invoke-virtual/range {v23 .. v23}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v25

    .line 474
    :cond_1a5
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/impl/client/RequestWrapper;->resetHeaders()V

    .line 476
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->rewriteRequestURI(Lorg/apache/http/impl/client/RequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 479
    const-string v31, "http.target_host"

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 480
    const-string v31, "http.route"

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 481
    const-string v31, "http.connection"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v32, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 484
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    move-object/from16 v32, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v30

    move-object/from16 v2, v32

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/protocol/HttpRequestExecutor;->preProcess(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 486
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->tryExecute(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v20

    .line 487
    if-eqz v20, :cond_b8

    .line 493
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    move-object/from16 v31, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v31

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 494
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    move-object/from16 v32, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    move-object/from16 v2, v32

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/protocol/HttpRequestExecutor;->postProcess(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 498
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v21

    .line 499
    if-eqz v21, :cond_2a3

    .line 501
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lorg/apache/http/conn/ConnectionKeepAliveStrategy;->getKeepAliveDuration(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)J

    move-result-wide v6

    .line 502
    .local v6, "duration":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v31

    if-eqz v31, :cond_294

    .line 504
    const-wide/16 v32, 0x0

    cmp-long v31, v6, v32

    if-lez v31, :cond_35c

    .line 505
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "for "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, " "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    sget-object v32, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 509
    .local v24, "s":Ljava/lang/String;
    :goto_274
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "Connection can be kept alive "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 511
    .end local v24    # "s":Ljava/lang/String;
    :cond_294
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    sget-object v32, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    invoke-interface {v0, v6, v7, v1}, Lorg/apache/http/conn/ManagedClientConnection;->setIdleDuration(JLjava/util/concurrent/TimeUnit;)V

    .line 514
    .end local v6    # "duration":J
    :cond_2a3
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/impl/client/DefaultRequestDirector;->handleResponse(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/impl/client/RoutedRequest;

    move-result-object v11

    .line 515
    .local v11, "followup":Lorg/apache/http/impl/client/RoutedRequest;
    if-nez v11, :cond_360

    .line 516
    const/4 v5, 0x1

    .line 547
    :goto_2b2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    if-eqz v31, :cond_b8

    .line 548
    if-nez v28, :cond_2d5

    .line 549
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, p3

    invoke-interface {v0, v1}, Lorg/apache/http/client/UserTokenHandler;->getUserToken(Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v28

    .line 550
    const-string v31, "http.user-token"

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v28

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 552
    :cond_2d5
    if-eqz v28, :cond_b8

    .line 553
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Lorg/apache/http/conn/ManagedClientConnection;->setState(Ljava/lang/Object;)V
    :try_end_2e4
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_170 .. :try_end_2e4} :catch_2e6
    .catch Lorg/apache/http/HttpException; {:try_start_170 .. :try_end_2e4} :catch_308
    .catch Ljava/io/IOException; {:try_start_170 .. :try_end_2e4} :catch_416
    .catch Ljava/lang/RuntimeException; {:try_start_170 .. :try_end_2e4} :catch_435

    goto/16 :goto_b8

    .line 577
    .end local v11    # "followup":Lorg/apache/http/impl/client/RoutedRequest;
    .end local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v28    # "userToken":Ljava/lang/Object;
    .end local v29    # "userinfo":Ljava/lang/String;
    .end local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :catch_2e6
    move-exception v10

    .line 578
    .local v10, "ex":Lorg/apache/http/impl/conn/ConnectionShutdownException;
    new-instance v14, Ljava/io/InterruptedIOException;

    const-string v31, "Connection has been shut down"

    move-object/from16 v0, v31

    invoke-direct {v14, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 580
    .local v14, "ioex":Ljava/io/InterruptedIOException;
    invoke-virtual {v14, v10}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 581
    throw v14

    .line 386
    .end local v5    # "done":Z
    .end local v10    # "ex":Lorg/apache/http/impl/conn/ConnectionShutdownException;
    .end local v14    # "ioex":Ljava/io/InterruptedIOException;
    .end local v20    # "response":Lorg/apache/http/HttpResponse;
    .end local v21    # "reuse":Z
    .end local v22    # "roureq":Lorg/apache/http/impl/client/RoutedRequest;
    :cond_2f4
    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v12

    goto/16 :goto_75

    .line 423
    .restart local v4    # "connRequest":Lorg/apache/http/conn/ClientConnectionRequest;
    .restart local v5    # "done":Z
    .restart local v20    # "response":Lorg/apache/http/HttpResponse;
    .restart local v21    # "reuse":Z
    .restart local v22    # "roureq":Lorg/apache/http/impl/client/RoutedRequest;
    .restart local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v26    # "timeout":J
    .restart local v28    # "userToken":Ljava/lang/Object;
    .restart local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :catch_2fa
    move-exception v13

    .line 424
    .local v13, "interrupted":Ljava/lang/InterruptedException;
    :try_start_2fb
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Thread;->interrupt()V

    .line 425
    new-instance v31, Ljava/io/InterruptedIOException;

    invoke-direct/range {v31 .. v31}, Ljava/io/InterruptedIOException;-><init>()V

    throw v31
    :try_end_308
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_2fb .. :try_end_308} :catch_2e6
    .catch Lorg/apache/http/HttpException; {:try_start_2fb .. :try_end_308} :catch_308
    .catch Ljava/io/IOException; {:try_start_2fb .. :try_end_308} :catch_416
    .catch Ljava/lang/RuntimeException; {:try_start_2fb .. :try_end_308} :catch_435

    .line 582
    .end local v4    # "connRequest":Lorg/apache/http/conn/ClientConnectionRequest;
    .end local v13    # "interrupted":Ljava/lang/InterruptedException;
    .end local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v26    # "timeout":J
    .end local v28    # "userToken":Ljava/lang/Object;
    .end local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :catch_308
    move-exception v10

    .line 583
    .local v10, "ex":Lorg/apache/http/HttpException;
    invoke-direct/range {p0 .. p0}, Lorg/apache/http/impl/client/DefaultRequestDirector;->abortConnection()V

    .line 584
    throw v10

    .line 446
    .end local v10    # "ex":Lorg/apache/http/HttpException;
    .restart local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v28    # "userToken":Ljava/lang/Object;
    .restart local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :catch_30d
    move-exception v10

    .line 447
    .local v10, "ex":Lorg/apache/http/impl/client/TunnelRefusedException;
    :try_start_30e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v31

    if-eqz v31, :cond_327

    .line 448
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    invoke-virtual {v10}, Lorg/apache/http/impl/client/TunnelRefusedException;->getMessage()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 450
    :cond_327
    invoke-virtual {v10}, Lorg/apache/http/impl/client/TunnelRefusedException;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object v20

    .line 561
    .end local v10    # "ex":Lorg/apache/http/impl/client/TunnelRefusedException;
    .end local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v28    # "userToken":Ljava/lang/Object;
    .end local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :cond_32b
    if-eqz v20, :cond_33d

    invoke-interface/range {v20 .. v20}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v31

    if-eqz v31, :cond_33d

    invoke-interface/range {v20 .. v20}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v31

    if-nez v31, :cond_41b

    .line 564
    :cond_33d
    if-eqz v21, :cond_348

    .line 565
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->markReusable()V

    .line 567
    :cond_348
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/DefaultRequestDirector;->releaseConnection()V

    .line 575
    :goto_34b
    return-object v20

    .line 464
    .restart local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v28    # "userToken":Ljava/lang/Object;
    .restart local v29    # "userinfo":Ljava/lang/String;
    .restart local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :cond_34c
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/impl/client/RequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v19

    .line 465
    .local v19, "requestURI":Ljava/net/URI;
    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->isAbsolute()Z

    move-result v31

    if-eqz v31, :cond_19f

    .line 466
    invoke-static/range {v19 .. v19}, Lorg/apache/http/client/utils/URIUtils;->extractHost(Ljava/net/URI;)Lorg/apache/http/HttpHost;

    move-result-object v25

    goto/16 :goto_19f

    .line 507
    .end local v19    # "requestURI":Ljava/net/URI;
    .restart local v6    # "duration":J
    :cond_35c
    const-string v24, "indefinitely"

    .restart local v24    # "s":Ljava/lang/String;
    goto/16 :goto_274

    .line 518
    .end local v6    # "duration":J
    .end local v24    # "s":Ljava/lang/String;
    .restart local v11    # "followup":Lorg/apache/http/impl/client/RoutedRequest;
    :cond_360
    if-eqz v21, :cond_387

    .line 520
    invoke-interface/range {v20 .. v20}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    .line 521
    .local v8, "entity":Lorg/apache/http/HttpEntity;
    invoke-static {v8}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 524
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->markReusable()V

    .line 541
    .end local v8    # "entity":Lorg/apache/http/HttpEntity;
    :cond_372
    :goto_372
    invoke-virtual {v11}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v31

    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Lorg/apache/http/conn/routing/HttpRoute;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-nez v31, :cond_383

    .line 542
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/DefaultRequestDirector;->releaseConnection()V

    .line 544
    :cond_383
    move-object/from16 v22, v11

    goto/16 :goto_2b2

    .line 526
    :cond_387
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->close()V

    .line 527
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v31

    sget-object v32, Lorg/apache/http/auth/AuthProtocolState;->CHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual/range {v31 .. v32}, Lorg/apache/http/auth/AuthProtocolState;->compareTo(Ljava/lang/Enum;)I

    move-result v31

    if-lez v31, :cond_3d2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v31

    if-eqz v31, :cond_3d2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v31

    if-eqz v31, :cond_3d2

    .line 530
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    const-string v32, "Resetting proxy auth state"

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 531
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 533
    :cond_3d2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v31

    sget-object v32, Lorg/apache/http/auth/AuthProtocolState;->CHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual/range {v31 .. v32}, Lorg/apache/http/auth/AuthProtocolState;->compareTo(Ljava/lang/Enum;)I

    move-result v31

    if-lez v31, :cond_372

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v31

    if-eqz v31, :cond_372

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v31

    if-eqz v31, :cond_372

    .line 536
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    const-string v32, "Resetting target auth state"

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 537
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->reset()V
    :try_end_414
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_30e .. :try_end_414} :catch_2e6
    .catch Lorg/apache/http/HttpException; {:try_start_30e .. :try_end_414} :catch_308
    .catch Ljava/io/IOException; {:try_start_30e .. :try_end_414} :catch_416
    .catch Ljava/lang/RuntimeException; {:try_start_30e .. :try_end_414} :catch_435

    goto/16 :goto_372

    .line 585
    .end local v11    # "followup":Lorg/apache/http/impl/client/RoutedRequest;
    .end local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v28    # "userToken":Ljava/lang/Object;
    .end local v29    # "userinfo":Ljava/lang/String;
    .end local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :catch_416
    move-exception v10

    .line 586
    .local v10, "ex":Ljava/io/IOException;
    invoke-direct/range {p0 .. p0}, Lorg/apache/http/impl/client/DefaultRequestDirector;->abortConnection()V

    .line 587
    throw v10

    .line 570
    .end local v10    # "ex":Ljava/io/IOException;
    :cond_41b
    :try_start_41b
    invoke-interface/range {v20 .. v20}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    .line 571
    .restart local v8    # "entity":Lorg/apache/http/HttpEntity;
    new-instance v9, Lorg/apache/http/conn/BasicManagedEntity;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move/from16 v1, v21

    invoke-direct {v9, v8, v0, v1}, Lorg/apache/http/conn/BasicManagedEntity;-><init>(Lorg/apache/http/HttpEntity;Lorg/apache/http/conn/ManagedClientConnection;Z)V

    .line 572
    .end local v8    # "entity":Lorg/apache/http/HttpEntity;
    .local v9, "entity":Lorg/apache/http/HttpEntity;
    move-object/from16 v0, v20

    invoke-interface {v0, v9}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_433
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_41b .. :try_end_433} :catch_2e6
    .catch Lorg/apache/http/HttpException; {:try_start_41b .. :try_end_433} :catch_308
    .catch Ljava/io/IOException; {:try_start_41b .. :try_end_433} :catch_416
    .catch Ljava/lang/RuntimeException; {:try_start_41b .. :try_end_433} :catch_435

    goto/16 :goto_34b

    .line 588
    .end local v9    # "entity":Lorg/apache/http/HttpEntity;
    :catch_435
    move-exception v10

    .line 589
    .local v10, "ex":Ljava/lang/RuntimeException;
    invoke-direct/range {p0 .. p0}, Lorg/apache/http/impl/client/DefaultRequestDirector;->abortConnection()V

    .line 590
    throw v10
.end method

.method protected handleResponse(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/impl/client/RoutedRequest;
    .registers 28
    .param p1, "roureq"    # Lorg/apache/http/impl/client/RoutedRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1015
    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v19

    .line 1016
    .local v19, "route":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRequest()Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v18

    .line 1018
    .local v18, "request":Lorg/apache/http/impl/client/RequestWrapper;
    invoke-virtual/range {v18 .. v18}, Lorg/apache/http/impl/client/RequestWrapper;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v16

    .line 1020
    .local v16, "params":Lorg/apache/http/params/HttpParams;
    invoke-static/range {v16 .. v16}, Lorg/apache/http/client/params/HttpClientParams;->isAuthenticating(Lorg/apache/http/params/HttpParams;)Z

    move-result v3

    if-eqz v3, :cond_ac

    .line 1021
    const-string v3, "http.target_host"

    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/HttpHost;

    .line 1022
    .local v4, "target":Lorg/apache/http/HttpHost;
    if-nez v4, :cond_22

    .line 1023
    invoke-virtual/range {v19 .. v19}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v4

    .line 1025
    :cond_22
    invoke-virtual {v4}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v3

    if-gez v3, :cond_49

    .line 1026
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    invoke-interface {v3}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v3

    invoke-virtual {v3, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Lorg/apache/http/HttpHost;)Lorg/apache/http/conn/scheme/Scheme;

    move-result-object v20

    .line 1027
    .local v20, "scheme":Lorg/apache/http/conn/scheme/Scheme;
    new-instance v21, Lorg/apache/http/HttpHost;

    invoke-virtual {v4}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {v20 .. v20}, Lorg/apache/http/conn/scheme/Scheme;->getDefaultPort()I

    move-result v5

    invoke-virtual {v4}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v21

    invoke-direct {v0, v3, v5, v7}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v4    # "target":Lorg/apache/http/HttpHost;
    .local v21, "target":Lorg/apache/http/HttpHost;
    move-object/from16 v4, v21

    .line 1029
    .end local v20    # "scheme":Lorg/apache/http/conn/scheme/Scheme;
    .end local v21    # "target":Lorg/apache/http/HttpHost;
    .restart local v4    # "target":Lorg/apache/http/HttpHost;
    :cond_49
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v5, p2

    move-object/from16 v8, p3

    invoke-virtual/range {v3 .. v8}, Lorg/apache/http/impl/client/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_76

    .line 1031
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v5, p2

    move-object/from16 v8, p3

    invoke-virtual/range {v3 .. v8}, Lorg/apache/http/impl/client/HttpAuthenticator;->authenticate(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_76

    .line 1099
    .end local v4    # "target":Lorg/apache/http/HttpHost;
    .end local p1    # "roureq":Lorg/apache/http/impl/client/RoutedRequest;
    :cond_75
    :goto_75
    return-object p1

    .line 1038
    .restart local v4    # "target":Lorg/apache/http/HttpHost;
    .restart local p1    # "roureq":Lorg/apache/http/impl/client/RoutedRequest;
    :cond_76
    invoke-virtual/range {v19 .. v19}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v6

    .line 1039
    .local v6, "proxy":Lorg/apache/http/HttpHost;
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v7, p2

    move-object/from16 v10, p3

    invoke-virtual/range {v5 .. v10}, Lorg/apache/http/impl/client/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_ac

    .line 1042
    if-nez v6, :cond_96

    .line 1043
    invoke-virtual/range {v19 .. v19}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v6

    .line 1045
    :cond_96
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v7, p2

    move-object/from16 v10, p3

    invoke-virtual/range {v5 .. v10}, Lorg/apache/http/impl/client/HttpAuthenticator;->authenticate(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-nez v3, :cond_75

    .line 1053
    .end local v4    # "target":Lorg/apache/http/HttpHost;
    .end local v6    # "proxy":Lorg/apache/http/HttpHost;
    :cond_ac
    invoke-static/range {v16 .. v16}, Lorg/apache/http/client/params/HttpClientParams;->isRedirecting(Lorg/apache/http/params/HttpParams;)Z

    move-result v3

    if-eqz v3, :cond_1cc

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v3, v0, v1, v2}, Lorg/apache/http/client/RedirectStrategy;->isRedirected(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_1cc

    .line 1056
    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectCount:I

    move-object/from16 v0, p0

    iget v5, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->maxRedirects:I

    if-lt v3, v5, :cond_ef

    .line 1057
    new-instance v3, Lorg/apache/http/client/RedirectException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Maximum redirects ("

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget v7, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->maxRedirects:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ") exceeded"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/apache/http/client/RedirectException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1060
    :cond_ef
    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectCount:I

    .line 1063
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    .line 1065
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v3, v0, v1, v2}, Lorg/apache/http/client/RedirectStrategy;->getRedirect(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v17

    .line 1066
    .local v17, "redirect":Lorg/apache/http/client/methods/HttpUriRequest;
    invoke-virtual/range {v18 .. v18}, Lorg/apache/http/impl/client/RequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v15

    .line 1067
    .local v15, "orig":Lorg/apache/http/HttpRequest;
    invoke-interface {v15}, Lorg/apache/http/HttpRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-interface {v0, v3}, Lorg/apache/http/client/methods/HttpUriRequest;->setHeaders([Lorg/apache/http/Header;)V

    .line 1069
    invoke-interface/range {v17 .. v17}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v22

    .line 1070
    .local v22, "uri":Ljava/net/URI;
    invoke-static/range {v22 .. v22}, Lorg/apache/http/client/utils/URIUtils;->extractHost(Ljava/net/URI;)Lorg/apache/http/HttpHost;

    move-result-object v14

    .line 1071
    .local v14, "newTarget":Lorg/apache/http/HttpHost;
    if-nez v14, :cond_13e

    .line 1072
    new-instance v3, Lorg/apache/http/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Redirect URI does not specify a valid host name: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1076
    :cond_13e
    invoke-virtual/range {v19 .. v19}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    invoke-virtual {v3, v14}, Lorg/apache/http/HttpHost;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_178

    .line 1077
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Resetting target auth state"

    invoke-interface {v3, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1078
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    invoke-virtual {v3}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 1079
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    invoke-virtual {v3}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v11

    .line 1080
    .local v11, "authScheme":Lorg/apache/http/auth/AuthScheme;
    if-eqz v11, :cond_178

    invoke-interface {v11}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v3

    if-eqz v3, :cond_178

    .line 1081
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Resetting proxy auth state"

    invoke-interface {v3, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1082
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    invoke-virtual {v3}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 1086
    .end local v11    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    :cond_178
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/DefaultRequestDirector;->wrapRequest(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v23

    .line 1087
    .local v23, "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/RequestWrapper;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 1089
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move-object/from16 v2, p3

    invoke-virtual {v0, v14, v1, v2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v13

    .line 1090
    .local v13, "newRoute":Lorg/apache/http/conn/routing/HttpRoute;
    new-instance v12, Lorg/apache/http/impl/client/RoutedRequest;

    move-object/from16 v0, v23

    invoke-direct {v12, v0, v13}, Lorg/apache/http/impl/client/RoutedRequest;-><init>(Lorg/apache/http/impl/client/RequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 1092
    .local v12, "newRequest":Lorg/apache/http/impl/client/RoutedRequest;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_1c8

    .line 1093
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Redirecting to \'"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "\' via "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_1c8
    move-object/from16 p1, v12

    .line 1096
    goto/16 :goto_75

    .line 1099
    .end local v12    # "newRequest":Lorg/apache/http/impl/client/RoutedRequest;
    .end local v13    # "newRoute":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v14    # "newTarget":Lorg/apache/http/HttpHost;
    .end local v15    # "orig":Lorg/apache/http/HttpRequest;
    .end local v17    # "redirect":Lorg/apache/http/client/methods/HttpUriRequest;
    .end local v22    # "uri":Ljava/net/URI;
    .end local v23    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :cond_1cc
    const/16 p1, 0x0

    goto/16 :goto_75
.end method

.method protected releaseConnection()V
    .registers 4

    .prologue
    .line 720
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v1}, Lorg/apache/http/conn/ManagedClientConnection;->releaseConnection()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_9

    .line 724
    :goto_5
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 725
    return-void

    .line 721
    :catch_9
    move-exception v0

    .line 722
    .local v0, "ignored":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "IOException releasing connection"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_5
.end method

.method protected rewriteRequestURI(Lorg/apache/http/impl/client/RequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V
    .registers 9
    .param p1, "request"    # Lorg/apache/http/impl/client/RequestWrapper;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 341
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v2

    .line 342
    .local v2, "uri":Ljava/net/URI;
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    if-eqz v3, :cond_28

    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v3

    if-nez v3, :cond_28

    .line 344
    invoke-virtual {v2}, Ljava/net/URI;->isAbsolute()Z

    move-result v3

    if-nez v3, :cond_23

    .line 345
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 346
    .local v1, "target":Lorg/apache/http/HttpHost;
    const/4 v3, 0x1

    invoke-static {v2, v1, v3}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;

    move-result-object v2

    .line 358
    .end local v1    # "target":Lorg/apache/http/HttpHost;
    :goto_1f
    invoke-virtual {p1, v2}, Lorg/apache/http/impl/client/RequestWrapper;->setURI(Ljava/net/URI;)V

    .line 364
    return-void

    .line 348
    :cond_23
    invoke-static {v2}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v2

    goto :goto_1f

    .line 352
    :cond_28
    invoke-virtual {v2}, Ljava/net/URI;->isAbsolute()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 353
    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;

    move-result-object v2

    goto :goto_1f

    .line 355
    :cond_35
    invoke-static {v2}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;
    :try_end_38
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_38} :catch_3a

    move-result-object v2

    goto :goto_1f

    .line 360
    .end local v2    # "uri":Ljava/net/URI;
    :catch_3a
    move-exception v0

    .line 361
    .local v0, "ex":Ljava/net/URISyntaxException;
    new-instance v3, Lorg/apache/http/ProtocolException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid URI: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/http/impl/client/RequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method
