.class public Lorg/apache/http/client/protocol/RequestAuthCache;
.super Ljava/lang/Object;
.source "RequestAuthCache.java"

# interfaces
.implements Lorg/apache/http/HttpRequestInterceptor;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/protocol/RequestAuthCache;->log:Lorg/apache/commons/logging/Log;

    .line 64
    return-void
.end method

.method private doPreemptiveAuth(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/AuthState;Lorg/apache/http/client/CredentialsProvider;)V
    .registers 11
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "authScheme"    # Lorg/apache/http/auth/AuthScheme;
    .param p3, "authState"    # Lorg/apache/http/auth/AuthState;
    .param p4, "credsProvider"    # Lorg/apache/http/client/CredentialsProvider;

    .prologue
    .line 117
    invoke-interface {p2}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v2

    .line 118
    .local v2, "schemeName":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/http/client/protocol/RequestAuthCache;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 119
    iget-object v3, p0, Lorg/apache/http/client/protocol/RequestAuthCache;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Re-using cached \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' auth scheme for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 122
    :cond_2e
    new-instance v0, Lorg/apache/http/auth/AuthScope;

    sget-object v3, Lorg/apache/http/auth/AuthScope;->ANY_REALM:Ljava/lang/String;

    invoke-direct {v0, p1, v3, v2}, Lorg/apache/http/auth/AuthScope;-><init>(Lorg/apache/http/HttpHost;Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .local v0, "authScope":Lorg/apache/http/auth/AuthScope;
    invoke-interface {p4, v0}, Lorg/apache/http/client/CredentialsProvider;->getCredentials(Lorg/apache/http/auth/AuthScope;)Lorg/apache/http/auth/Credentials;

    move-result-object v1

    .line 125
    .local v1, "creds":Lorg/apache/http/auth/Credentials;
    if-eqz v1, :cond_56

    .line 126
    const-string v3, "BASIC"

    invoke-interface {p2}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_50

    .line 127
    sget-object v3, Lorg/apache/http/auth/AuthProtocolState;->CHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual {p3, v3}, Lorg/apache/http/auth/AuthState;->setState(Lorg/apache/http/auth/AuthProtocolState;)V

    .line 131
    :goto_4c
    invoke-virtual {p3, p2, v1}, Lorg/apache/http/auth/AuthState;->update(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;)V

    .line 135
    :goto_4f
    return-void

    .line 129
    :cond_50
    sget-object v3, Lorg/apache/http/auth/AuthProtocolState;->SUCCESS:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual {p3, v3}, Lorg/apache/http/auth/AuthState;->setState(Lorg/apache/http/auth/AuthProtocolState;)V

    goto :goto_4c

    .line 133
    :cond_56
    iget-object v3, p0, Lorg/apache/http/client/protocol/RequestAuthCache;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "No credentials for preemptive authentication"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_4f
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .registers 16
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    const-string v10, "HTTP request"

    invoke-static {p1, v10}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    const-string v10, "HTTP context"

    invoke-static {p2, v10}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    invoke-static {p2}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v2

    .line 73
    .local v2, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    invoke-virtual {v2}, Lorg/apache/http/client/protocol/HttpClientContext;->getAuthCache()Lorg/apache/http/client/AuthCache;

    move-result-object v0

    .line 74
    .local v0, "authCache":Lorg/apache/http/client/AuthCache;
    if-nez v0, :cond_1c

    .line 75
    iget-object v10, p0, Lorg/apache/http/client/protocol/RequestAuthCache;->log:Lorg/apache/commons/logging/Log;

    const-string v11, "Auth cache not set in the context"

    invoke-interface {v10, v11}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 110
    :cond_1b
    :goto_1b
    return-void

    .line 79
    :cond_1c
    invoke-virtual {v2}, Lorg/apache/http/client/protocol/HttpClientContext;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v3

    .line 80
    .local v3, "credsProvider":Lorg/apache/http/client/CredentialsProvider;
    if-nez v3, :cond_2a

    .line 81
    iget-object v10, p0, Lorg/apache/http/client/protocol/RequestAuthCache;->log:Lorg/apache/commons/logging/Log;

    const-string v11, "Credentials provider not set in the context"

    invoke-interface {v10, v11}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_1b

    .line 85
    :cond_2a
    invoke-virtual {v2}, Lorg/apache/http/client/protocol/HttpClientContext;->getHttpRoute()Lorg/apache/http/conn/routing/RouteInfo;

    move-result-object v6

    .line 86
    .local v6, "route":Lorg/apache/http/conn/routing/RouteInfo;
    invoke-virtual {v2}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v7

    .line 87
    .local v7, "target":Lorg/apache/http/HttpHost;
    invoke-virtual {v7}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v10

    if-gez v10, :cond_4e

    .line 88
    new-instance v8, Lorg/apache/http/HttpHost;

    invoke-virtual {v7}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v6}, Lorg/apache/http/conn/routing/RouteInfo;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v11

    invoke-virtual {v11}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v11

    invoke-virtual {v7}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v8, v10, v11, v12}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v7    # "target":Lorg/apache/http/HttpHost;
    .local v8, "target":Lorg/apache/http/HttpHost;
    move-object v7, v8

    .line 94
    .end local v8    # "target":Lorg/apache/http/HttpHost;
    .restart local v7    # "target":Lorg/apache/http/HttpHost;
    :cond_4e
    invoke-virtual {v2}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetAuthState()Lorg/apache/http/auth/AuthState;

    move-result-object v9

    .line 95
    .local v9, "targetState":Lorg/apache/http/auth/AuthState;
    if-eqz v9, :cond_65

    invoke-virtual {v9}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v10

    sget-object v11, Lorg/apache/http/auth/AuthProtocolState;->UNCHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    if-ne v10, v11, :cond_65

    .line 96
    invoke-interface {v0, v7}, Lorg/apache/http/client/AuthCache;->get(Lorg/apache/http/HttpHost;)Lorg/apache/http/auth/AuthScheme;

    move-result-object v1

    .line 97
    .local v1, "authScheme":Lorg/apache/http/auth/AuthScheme;
    if-eqz v1, :cond_65

    .line 98
    invoke-direct {p0, v7, v1, v9, v3}, Lorg/apache/http/client/protocol/RequestAuthCache;->doPreemptiveAuth(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/AuthState;Lorg/apache/http/client/CredentialsProvider;)V

    .line 102
    .end local v1    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    :cond_65
    invoke-interface {v6}, Lorg/apache/http/conn/routing/RouteInfo;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v4

    .line 103
    .local v4, "proxy":Lorg/apache/http/HttpHost;
    invoke-virtual {v2}, Lorg/apache/http/client/protocol/HttpClientContext;->getProxyAuthState()Lorg/apache/http/auth/AuthState;

    move-result-object v5

    .line 104
    .local v5, "proxyState":Lorg/apache/http/auth/AuthState;
    if-eqz v4, :cond_1b

    if-eqz v5, :cond_1b

    invoke-virtual {v5}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v10

    sget-object v11, Lorg/apache/http/auth/AuthProtocolState;->UNCHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    if-ne v10, v11, :cond_1b

    .line 105
    invoke-interface {v0, v4}, Lorg/apache/http/client/AuthCache;->get(Lorg/apache/http/HttpHost;)Lorg/apache/http/auth/AuthScheme;

    move-result-object v1

    .line 106
    .restart local v1    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    if-eqz v1, :cond_1b

    .line 107
    invoke-direct {p0, v4, v1, v5, v3}, Lorg/apache/http/client/protocol/RequestAuthCache;->doPreemptiveAuth(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/AuthState;Lorg/apache/http/client/CredentialsProvider;)V

    goto :goto_1b
.end method
