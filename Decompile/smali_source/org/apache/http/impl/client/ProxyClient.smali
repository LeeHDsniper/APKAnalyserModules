.class public Lorg/apache/http/impl/client/ProxyClient;
.super Ljava/lang/Object;
.source "ProxyClient.java"


# instance fields
.field private final authSchemeRegistry:Lorg/apache/http/auth/AuthSchemeRegistry;

.field private final authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

.field private final connFactory:Lorg/apache/http/conn/HttpConnectionFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/conn/HttpConnectionFactory",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;"
        }
    .end annotation
.end field

.field private final connectionConfig:Lorg/apache/http/config/ConnectionConfig;

.field private final httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

.field private final proxyAuthState:Lorg/apache/http/auth/AuthState;

.field private final proxyAuthStrategy:Lorg/apache/http/impl/client/ProxyAuthenticationStrategy;

.field private final requestConfig:Lorg/apache/http/client/config/RequestConfig;

.field private final requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

.field private final reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 142
    invoke-direct {p0, v0, v0, v0}, Lorg/apache/http/impl/client/ProxyClient;-><init>(Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/config/ConnectionConfig;Lorg/apache/http/client/config/RequestConfig;)V

    .line 143
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/config/RequestConfig;)V
    .registers 3
    .param p1, "requestConfig"    # Lorg/apache/http/client/config/RequestConfig;

    .prologue
    const/4 v0, 0x0

    .line 138
    invoke-direct {p0, v0, v0, p1}, Lorg/apache/http/impl/client/ProxyClient;-><init>(Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/config/ConnectionConfig;Lorg/apache/http/client/config/RequestConfig;)V

    .line 139
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/config/ConnectionConfig;Lorg/apache/http/client/config/RequestConfig;)V
    .registers 8
    .param p2, "connectionConfig"    # Lorg/apache/http/config/ConnectionConfig;
    .param p3, "requestConfig"    # Lorg/apache/http/client/config/RequestConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/conn/HttpConnectionFactory",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;",
            "Lorg/apache/http/config/ConnectionConfig;",
            "Lorg/apache/http/client/config/RequestConfig;",
            ")V"
        }
    .end annotation

    .prologue
    .line 105
    .local p1, "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    if-eqz p1, :cond_98

    .end local p1    # "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    :goto_5
    iput-object p1, p0, Lorg/apache/http/impl/client/ProxyClient;->connFactory:Lorg/apache/http/conn/HttpConnectionFactory;

    .line 107
    if-eqz p2, :cond_9c

    .end local p2    # "connectionConfig":Lorg/apache/http/config/ConnectionConfig;
    :goto_9
    iput-object p2, p0, Lorg/apache/http/impl/client/ProxyClient;->connectionConfig:Lorg/apache/http/config/ConnectionConfig;

    .line 108
    if-eqz p3, :cond_a0

    .end local p3    # "requestConfig":Lorg/apache/http/client/config/RequestConfig;
    :goto_d
    iput-object p3, p0, Lorg/apache/http/impl/client/ProxyClient;->requestConfig:Lorg/apache/http/client/config/RequestConfig;

    .line 109
    new-instance v0, Lorg/apache/http/protocol/ImmutableHttpProcessor;

    const/4 v1, 0x3

    new-array v1, v1, [Lorg/apache/http/HttpRequestInterceptor;

    const/4 v2, 0x0

    new-instance v3, Lorg/apache/http/protocol/RequestTargetHost;

    invoke-direct {v3}, Lorg/apache/http/protocol/RequestTargetHost;-><init>()V

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Lorg/apache/http/client/protocol/RequestClientConnControl;

    invoke-direct {v3}, Lorg/apache/http/client/protocol/RequestClientConnControl;-><init>()V

    aput-object v3, v1, v2

    const/4 v2, 0x2

    new-instance v3, Lorg/apache/http/protocol/RequestUserAgent;

    invoke-direct {v3}, Lorg/apache/http/protocol/RequestUserAgent;-><init>()V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lorg/apache/http/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/http/HttpRequestInterceptor;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    .line 111
    new-instance v0, Lorg/apache/http/protocol/HttpRequestExecutor;

    invoke-direct {v0}, Lorg/apache/http/protocol/HttpRequestExecutor;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    .line 112
    new-instance v0, Lorg/apache/http/impl/client/ProxyAuthenticationStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/ProxyAuthenticationStrategy;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->proxyAuthStrategy:Lorg/apache/http/impl/client/ProxyAuthenticationStrategy;

    .line 113
    new-instance v0, Lorg/apache/http/impl/auth/HttpAuthenticator;

    invoke-direct {v0}, Lorg/apache/http/impl/auth/HttpAuthenticator;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    .line 114
    new-instance v0, Lorg/apache/http/auth/AuthState;

    invoke-direct {v0}, Lorg/apache/http/auth/AuthState;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    .line 115
    new-instance v0, Lorg/apache/http/auth/AuthSchemeRegistry;

    invoke-direct {v0}, Lorg/apache/http/auth/AuthSchemeRegistry;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->authSchemeRegistry:Lorg/apache/http/auth/AuthSchemeRegistry;

    .line 116
    iget-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->authSchemeRegistry:Lorg/apache/http/auth/AuthSchemeRegistry;

    const-string v1, "Basic"

    new-instance v2, Lorg/apache/http/impl/auth/BasicSchemeFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/auth/BasicSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lorg/apache/http/auth/AuthSchemeFactory;)V

    .line 117
    iget-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->authSchemeRegistry:Lorg/apache/http/auth/AuthSchemeRegistry;

    const-string v1, "Digest"

    new-instance v2, Lorg/apache/http/impl/auth/DigestSchemeFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/auth/DigestSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lorg/apache/http/auth/AuthSchemeFactory;)V

    .line 118
    iget-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->authSchemeRegistry:Lorg/apache/http/auth/AuthSchemeRegistry;

    const-string v1, "NTLM"

    new-instance v2, Lorg/apache/http/impl/auth/NTLMSchemeFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/auth/NTLMSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lorg/apache/http/auth/AuthSchemeFactory;)V

    .line 119
    iget-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->authSchemeRegistry:Lorg/apache/http/auth/AuthSchemeRegistry;

    const-string v1, "negotiate"

    new-instance v2, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/auth/SPNegoSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lorg/apache/http/auth/AuthSchemeFactory;)V

    .line 120
    iget-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->authSchemeRegistry:Lorg/apache/http/auth/AuthSchemeRegistry;

    const-string v1, "Kerberos"

    new-instance v2, Lorg/apache/http/impl/auth/KerberosSchemeFactory;

    invoke-direct {v2}, Lorg/apache/http/impl/auth/KerberosSchemeFactory;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/auth/AuthSchemeRegistry;->register(Ljava/lang/String;Lorg/apache/http/auth/AuthSchemeFactory;)V

    .line 121
    new-instance v0, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 122
    return-void

    .line 106
    .restart local p1    # "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    .restart local p2    # "connectionConfig":Lorg/apache/http/config/ConnectionConfig;
    .restart local p3    # "requestConfig":Lorg/apache/http/client/config/RequestConfig;
    :cond_98
    sget-object p1, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->INSTANCE:Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;

    goto/16 :goto_5

    .line 107
    .end local p1    # "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    :cond_9c
    sget-object p2, Lorg/apache/http/config/ConnectionConfig;->DEFAULT:Lorg/apache/http/config/ConnectionConfig;

    goto/16 :goto_9

    .line 108
    .end local p2    # "connectionConfig":Lorg/apache/http/config/ConnectionConfig;
    :cond_a0
    sget-object p3, Lorg/apache/http/client/config/RequestConfig;->DEFAULT:Lorg/apache/http/client/config/RequestConfig;

    goto/16 :goto_d
.end method

.method public constructor <init>(Lorg/apache/http/params/HttpParams;)V
    .registers 5
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 129
    const/4 v0, 0x0

    invoke-static {p1}, Lorg/apache/http/params/HttpParamConfig;->getConnectionConfig(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/config/ConnectionConfig;

    move-result-object v1

    invoke-static {p1}, Lorg/apache/http/client/params/HttpClientParamConfig;->getRequestConfig(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/client/config/RequestConfig;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/http/impl/client/ProxyClient;-><init>(Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/config/ConnectionConfig;Lorg/apache/http/client/config/RequestConfig;)V

    .line 132
    return-void
.end method


# virtual methods
.method public getAuthSchemeRegistry()Lorg/apache/http/auth/AuthSchemeRegistry;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 158
    iget-object v0, p0, Lorg/apache/http/impl/client/ProxyClient;->authSchemeRegistry:Lorg/apache/http/auth/AuthSchemeRegistry;

    return-object v0
.end method

.method public getParams()Lorg/apache/http/params/HttpParams;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 150
    new-instance v0, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v0}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    return-object v0
.end method

.method public tunnel(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpHost;Lorg/apache/http/auth/Credentials;)Ljava/net/Socket;
    .registers 20
    .param p1, "proxy"    # Lorg/apache/http/HttpHost;
    .param p2, "target"    # Lorg/apache/http/HttpHost;
    .param p3, "credentials"    # Lorg/apache/http/auth/Credentials;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 165
    const-string v3, "Proxy host"

    move-object/from16 v0, p1

    invoke-static {v0, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 166
    const-string v3, "Target host"

    move-object/from16 v0, p2

    invoke-static {v0, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 167
    const-string v3, "Credentials"

    move-object/from16 v0, p3

    invoke-static {v0, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 168
    move-object/from16 v2, p2

    .line 169
    .local v2, "host":Lorg/apache/http/HttpHost;
    invoke-virtual {v2}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v3

    if-gtz v3, :cond_2d

    .line 170
    new-instance v13, Lorg/apache/http/HttpHost;

    invoke-virtual {v2}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x50

    invoke-virtual {v2}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v13, v3, v4, v6}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v2    # "host":Lorg/apache/http/HttpHost;
    .local v13, "host":Lorg/apache/http/HttpHost;
    move-object v2, v13

    .line 172
    .end local v13    # "host":Lorg/apache/http/HttpHost;
    .restart local v2    # "host":Lorg/apache/http/HttpHost;
    :cond_2d
    new-instance v1, Lorg/apache/http/conn/routing/HttpRoute;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/ProxyClient;->requestConfig:Lorg/apache/http/client/config/RequestConfig;

    invoke-virtual {v3}, Lorg/apache/http/client/config/RequestConfig;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v3

    const/4 v5, 0x0

    sget-object v6, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->TUNNELLED:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    sget-object v7, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    move-object/from16 v4, p1

    invoke-direct/range {v1 .. v7}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/HttpHost;ZLorg/apache/http/conn/routing/RouteInfo$TunnelType;Lorg/apache/http/conn/routing/RouteInfo$LayerType;)V

    .line 177
    .local v1, "route":Lorg/apache/http/conn/routing/HttpRoute;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/ProxyClient;->connFactory:Lorg/apache/http/conn/HttpConnectionFactory;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/ProxyClient;->connectionConfig:Lorg/apache/http/config/ConnectionConfig;

    invoke-interface {v3, v1, v4}, Lorg/apache/http/conn/HttpConnectionFactory;->create(Ljava/lang/Object;Lorg/apache/http/config/ConnectionConfig;)Lorg/apache/http/HttpConnection;

    move-result-object v9

    check-cast v9, Lorg/apache/http/conn/ManagedHttpClientConnection;

    .line 179
    .local v9, "conn":Lorg/apache/http/conn/ManagedHttpClientConnection;
    new-instance v8, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v8}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 182
    .local v8, "context":Lorg/apache/http/protocol/HttpContext;
    new-instance v10, Lorg/apache/http/message/BasicHttpRequest;

    const-string v3, "CONNECT"

    invoke-virtual {v2}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v4

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-direct {v10, v3, v4, v6}, Lorg/apache/http/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/ProtocolVersion;)V

    .line 185
    .local v10, "connect":Lorg/apache/http/HttpRequest;
    new-instance v11, Lorg/apache/http/impl/client/BasicCredentialsProvider;

    invoke-direct {v11}, Lorg/apache/http/impl/client/BasicCredentialsProvider;-><init>()V

    .line 186
    .local v11, "credsProvider":Lorg/apache/http/impl/client/BasicCredentialsProvider;
    new-instance v3, Lorg/apache/http/auth/AuthScope;

    move-object/from16 v0, p1

    invoke-direct {v3, v0}, Lorg/apache/http/auth/AuthScope;-><init>(Lorg/apache/http/HttpHost;)V

    move-object/from16 v0, p3

    invoke-virtual {v11, v3, v0}, Lorg/apache/http/impl/client/BasicCredentialsProvider;->setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V

    .line 189
    const-string v3, "http.target_host"

    move-object/from16 v0, p2

    invoke-interface {v8, v3, v0}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 190
    const-string v3, "http.connection"

    invoke-interface {v8, v3, v9}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 191
    const-string v3, "http.request"

    invoke-interface {v8, v3, v10}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 192
    const-string v3, "http.route"

    invoke-interface {v8, v3, v1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 193
    const-string v3, "http.auth.proxy-scope"

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/ProxyClient;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    invoke-interface {v8, v3, v4}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 194
    const-string v3, "http.auth.credentials-provider"

    invoke-interface {v8, v3, v11}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 195
    const-string v3, "http.authscheme-registry"

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/ProxyClient;->authSchemeRegistry:Lorg/apache/http/auth/AuthSchemeRegistry;

    invoke-interface {v8, v3, v4}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 196
    const-string v3, "http.request-config"

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/ProxyClient;->requestConfig:Lorg/apache/http/client/config/RequestConfig;

    invoke-interface {v8, v3, v4}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 198
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/ProxyClient;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/ProxyClient;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-virtual {v3, v10, v4, v8}, Lorg/apache/http/protocol/HttpRequestExecutor;->preProcess(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 201
    :goto_b3
    invoke-interface {v9}, Lorg/apache/http/conn/ManagedHttpClientConnection;->isOpen()Z

    move-result v3

    if-nez v3, :cond_c9

    .line 202
    new-instance v14, Ljava/net/Socket;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v4

    invoke-direct {v14, v3, v4}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    .line 203
    .local v14, "socket":Ljava/net/Socket;
    invoke-interface {v9, v14}, Lorg/apache/http/conn/ManagedHttpClientConnection;->bind(Ljava/net/Socket;)V

    .line 206
    .end local v14    # "socket":Ljava/net/Socket;
    :cond_c9
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/ProxyClient;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/ProxyClient;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    invoke-virtual {v3, v10, v4, v8}, Lorg/apache/http/impl/auth/HttpAuthenticator;->generateAuthResponse(Lorg/apache/http/HttpRequest;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)V

    .line 208
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/ProxyClient;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    invoke-virtual {v3, v10, v9, v8}, Lorg/apache/http/protocol/HttpRequestExecutor;->execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 210
    .local v5, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v15

    .line 211
    .local v15, "status":I
    const/16 v3, 0xc8

    if-ge v15, v3, :cond_105

    .line 212
    new-instance v3, Lorg/apache/http/HttpException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected response to CONNECT request: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 215
    :cond_105
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/ProxyClient;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/client/ProxyClient;->proxyAuthStrategy:Lorg/apache/http/impl/client/ProxyAuthenticationStrategy;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/http/impl/client/ProxyClient;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v4, p1

    invoke-virtual/range {v3 .. v8}, Lorg/apache/http/impl/auth/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_149

    .line 217
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/ProxyClient;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/client/ProxyClient;->proxyAuthStrategy:Lorg/apache/http/impl/client/ProxyAuthenticationStrategy;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/http/impl/client/ProxyClient;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v4, p1

    invoke-virtual/range {v3 .. v8}, Lorg/apache/http/impl/auth/HttpAuthenticator;->handleAuthChallenge(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_149

    .line 220
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/ProxyClient;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    invoke-interface {v3, v5, v8}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_145

    .line 222
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v12

    .line 223
    .local v12, "entity":Lorg/apache/http/HttpEntity;
    invoke-static {v12}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 228
    .end local v12    # "entity":Lorg/apache/http/HttpEntity;
    :goto_13e
    const-string v3, "Proxy-Authorization"

    invoke-interface {v10, v3}, Lorg/apache/http/HttpRequest;->removeHeaders(Ljava/lang/String;)V

    goto/16 :goto_b3

    .line 225
    :cond_145
    invoke-interface {v9}, Lorg/apache/http/conn/ManagedHttpClientConnection;->close()V

    goto :goto_13e

    .line 237
    :cond_149
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v15

    .line 239
    const/16 v3, 0x12b

    if-le v15, v3, :cond_183

    .line 242
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v12

    .line 243
    .restart local v12    # "entity":Lorg/apache/http/HttpEntity;
    if-eqz v12, :cond_163

    .line 244
    new-instance v3, Lorg/apache/http/entity/BufferedHttpEntity;

    invoke-direct {v3, v12}, Lorg/apache/http/entity/BufferedHttpEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    invoke-interface {v5, v3}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 247
    :cond_163
    invoke-interface {v9}, Lorg/apache/http/conn/ManagedHttpClientConnection;->close()V

    .line 248
    new-instance v3, Lorg/apache/http/impl/execchain/TunnelRefusedException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "CONNECT refused by proxy: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v5}, Lorg/apache/http/impl/execchain/TunnelRefusedException;-><init>(Ljava/lang/String;Lorg/apache/http/HttpResponse;)V

    throw v3

    .line 251
    .end local v12    # "entity":Lorg/apache/http/HttpEntity;
    :cond_183
    invoke-interface {v9}, Lorg/apache/http/conn/ManagedHttpClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v3

    return-object v3
.end method
