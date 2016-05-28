.class public Lorg/apache/http/client/protocol/ResponseAuthCache;
.super Ljava/lang/Object;
.source "ResponseAuthCache.java"

# interfaces
.implements Lorg/apache/http/HttpResponseInterceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/client/protocol/ResponseAuthCache$1;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/protocol/ResponseAuthCache;->log:Lorg/apache/commons/logging/Log;

    .line 68
    return-void
.end method

.method private cache(Lorg/apache/http/client/AuthCache;Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;)V
    .registers 7
    .param p1, "authCache"    # Lorg/apache/http/client/AuthCache;
    .param p2, "host"    # Lorg/apache/http/HttpHost;
    .param p3, "authScheme"    # Lorg/apache/http/auth/AuthScheme;

    .prologue
    .line 137
    iget-object v0, p0, Lorg/apache/http/client/protocol/ResponseAuthCache;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 138
    iget-object v0, p0, Lorg/apache/http/client/protocol/ResponseAuthCache;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Caching \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p3}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' auth scheme for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 141
    :cond_2e
    invoke-interface {p1, p2, p3}, Lorg/apache/http/client/AuthCache;->put(Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;)V

    .line 142
    return-void
.end method

.method private isCachable(Lorg/apache/http/auth/AuthState;)Z
    .registers 6
    .param p1, "authState"    # Lorg/apache/http/auth/AuthState;

    .prologue
    const/4 v2, 0x0

    .line 127
    invoke-virtual {p1}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v0

    .line 128
    .local v0, "authScheme":Lorg/apache/http/auth/AuthScheme;
    if-eqz v0, :cond_d

    invoke-interface {v0}, Lorg/apache/http/auth/AuthScheme;->isComplete()Z

    move-result v3

    if-nez v3, :cond_e

    .line 132
    :cond_d
    :goto_d
    return v2

    .line 131
    :cond_e
    invoke-interface {v0}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v1

    .line 132
    .local v1, "schemeName":Ljava/lang/String;
    const-string v3, "Basic"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_22

    const-string v3, "Digest"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d

    :cond_22
    const/4 v2, 0x1

    goto :goto_d
.end method

.method private uncache(Lorg/apache/http/client/AuthCache;Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;)V
    .registers 7
    .param p1, "authCache"    # Lorg/apache/http/client/AuthCache;
    .param p2, "host"    # Lorg/apache/http/HttpHost;
    .param p3, "authScheme"    # Lorg/apache/http/auth/AuthScheme;

    .prologue
    .line 145
    iget-object v0, p0, Lorg/apache/http/client/protocol/ResponseAuthCache;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 146
    iget-object v0, p0, Lorg/apache/http/client/protocol/ResponseAuthCache;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Removing from cache \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p3}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' auth scheme for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 149
    :cond_2e
    invoke-interface {p1, p2}, Lorg/apache/http/client/AuthCache;->remove(Lorg/apache/http/HttpHost;)V

    .line 150
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    .registers 14
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    const-string v8, "HTTP request"

    invoke-static {p1, v8}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 73
    const-string v8, "HTTP context"

    invoke-static {p2, v8}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 74
    const-string v8, "http.auth.auth-cache"

    invoke-interface {p2, v8}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/AuthCache;

    .line 76
    .local v0, "authCache":Lorg/apache/http/client/AuthCache;
    const-string v8, "http.target_host"

    invoke-interface {p2, v8}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/http/HttpHost;

    .line 77
    .local v5, "target":Lorg/apache/http/HttpHost;
    const-string v8, "http.auth.target-scope"

    invoke-interface {p2, v8}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/http/auth/AuthState;

    .line 78
    .local v7, "targetState":Lorg/apache/http/auth/AuthState;
    if-eqz v5, :cond_93

    if-eqz v7, :cond_93

    .line 79
    iget-object v8, p0, Lorg/apache/http/client/protocol/ResponseAuthCache;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v8}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v8

    if-eqz v8, :cond_4a

    .line 80
    iget-object v8, p0, Lorg/apache/http/client/protocol/ResponseAuthCache;->log:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Target auth state: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v7}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 82
    :cond_4a
    invoke-direct {p0, v7}, Lorg/apache/http/client/protocol/ResponseAuthCache;->isCachable(Lorg/apache/http/auth/AuthState;)Z

    move-result v8

    if-eqz v8, :cond_93

    .line 83
    const-string v8, "http.scheme-registry"

    invoke-interface {p2, v8}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 85
    .local v4, "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    invoke-virtual {v5}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v8

    if-gez v8, :cond_78

    .line 86
    invoke-virtual {v4, v5}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Lorg/apache/http/HttpHost;)Lorg/apache/http/conn/scheme/Scheme;

    move-result-object v3

    .line 87
    .local v3, "scheme":Lorg/apache/http/conn/scheme/Scheme;
    new-instance v6, Lorg/apache/http/HttpHost;

    invoke-virtual {v5}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v9

    invoke-virtual {v3, v9}, Lorg/apache/http/conn/scheme/Scheme;->resolvePort(I)I

    move-result v9

    invoke-virtual {v5}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v6, v8, v9, v10}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v5    # "target":Lorg/apache/http/HttpHost;
    .local v6, "target":Lorg/apache/http/HttpHost;
    move-object v5, v6

    .line 90
    .end local v3    # "scheme":Lorg/apache/http/conn/scheme/Scheme;
    .end local v6    # "target":Lorg/apache/http/HttpHost;
    .restart local v5    # "target":Lorg/apache/http/HttpHost;
    :cond_78
    if-nez v0, :cond_84

    .line 91
    new-instance v0, Lorg/apache/http/impl/client/BasicAuthCache;

    .end local v0    # "authCache":Lorg/apache/http/client/AuthCache;
    invoke-direct {v0}, Lorg/apache/http/impl/client/BasicAuthCache;-><init>()V

    .line 92
    .restart local v0    # "authCache":Lorg/apache/http/client/AuthCache;
    const-string v8, "http.auth.auth-cache"

    invoke-interface {p2, v8, v0}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    :cond_84
    sget-object v8, Lorg/apache/http/client/protocol/ResponseAuthCache$1;->$SwitchMap$org$apache$http$auth$AuthProtocolState:[I

    invoke-virtual {v7}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v9

    invoke-virtual {v9}, Lorg/apache/http/auth/AuthProtocolState;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_10e

    .line 104
    .end local v4    # "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    :cond_93
    :goto_93
    const-string v8, "http.proxy_host"

    invoke-interface {p2, v8}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/HttpHost;

    .line 105
    .local v1, "proxy":Lorg/apache/http/HttpHost;
    const-string v8, "http.auth.proxy-scope"

    invoke-interface {p2, v8}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/auth/AuthState;

    .line 106
    .local v2, "proxyState":Lorg/apache/http/auth/AuthState;
    if-eqz v1, :cond_ec

    if-eqz v2, :cond_ec

    .line 107
    iget-object v8, p0, Lorg/apache/http/client/protocol/ResponseAuthCache;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v8}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v8

    if-eqz v8, :cond_cb

    .line 108
    iget-object v8, p0, Lorg/apache/http/client/protocol/ResponseAuthCache;->log:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Proxy auth state: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 110
    :cond_cb
    invoke-direct {p0, v2}, Lorg/apache/http/client/protocol/ResponseAuthCache;->isCachable(Lorg/apache/http/auth/AuthState;)Z

    move-result v8

    if-eqz v8, :cond_ec

    .line 111
    if-nez v0, :cond_dd

    .line 112
    new-instance v0, Lorg/apache/http/impl/client/BasicAuthCache;

    .end local v0    # "authCache":Lorg/apache/http/client/AuthCache;
    invoke-direct {v0}, Lorg/apache/http/impl/client/BasicAuthCache;-><init>()V

    .line 113
    .restart local v0    # "authCache":Lorg/apache/http/client/AuthCache;
    const-string v8, "http.auth.auth-cache"

    invoke-interface {p2, v8, v0}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 115
    :cond_dd
    sget-object v8, Lorg/apache/http/client/protocol/ResponseAuthCache$1;->$SwitchMap$org$apache$http$auth$AuthProtocolState:[I

    invoke-virtual {v2}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v9

    invoke-virtual {v9}, Lorg/apache/http/auth/AuthProtocolState;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_116

    .line 124
    :cond_ec
    :goto_ec
    return-void

    .line 96
    .end local v1    # "proxy":Lorg/apache/http/HttpHost;
    .end local v2    # "proxyState":Lorg/apache/http/auth/AuthState;
    .restart local v4    # "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    :pswitch_ed
    invoke-virtual {v7}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v8

    invoke-direct {p0, v0, v5, v8}, Lorg/apache/http/client/protocol/ResponseAuthCache;->cache(Lorg/apache/http/client/AuthCache;Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;)V

    goto :goto_93

    .line 99
    :pswitch_f5
    invoke-virtual {v7}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v8

    invoke-direct {p0, v0, v5, v8}, Lorg/apache/http/client/protocol/ResponseAuthCache;->uncache(Lorg/apache/http/client/AuthCache;Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;)V

    goto :goto_93

    .line 117
    .end local v4    # "schemeRegistry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .restart local v1    # "proxy":Lorg/apache/http/HttpHost;
    .restart local v2    # "proxyState":Lorg/apache/http/auth/AuthState;
    :pswitch_fd
    invoke-virtual {v2}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v8

    invoke-direct {p0, v0, v1, v8}, Lorg/apache/http/client/protocol/ResponseAuthCache;->cache(Lorg/apache/http/client/AuthCache;Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;)V

    goto :goto_ec

    .line 120
    :pswitch_105
    invoke-virtual {v2}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v8

    invoke-direct {p0, v0, v1, v8}, Lorg/apache/http/client/protocol/ResponseAuthCache;->uncache(Lorg/apache/http/client/AuthCache;Lorg/apache/http/HttpHost;Lorg/apache/http/auth/AuthScheme;)V

    goto :goto_ec

    .line 94
    nop

    :pswitch_data_10e
    .packed-switch 0x1
        :pswitch_ed
        :pswitch_f5
    .end packed-switch

    .line 115
    :pswitch_data_116
    .packed-switch 0x1
        :pswitch_fd
        :pswitch_105
    .end packed-switch
.end method
