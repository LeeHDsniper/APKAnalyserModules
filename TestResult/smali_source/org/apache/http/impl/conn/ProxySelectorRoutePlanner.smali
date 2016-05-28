.class public Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;
.super Ljava/lang/Object;
.source "ProxySelectorRoutePlanner.java"

# interfaces
.implements Lorg/apache/http/conn/routing/HttpRoutePlanner;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner$1;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field protected proxySelector:Ljava/net/ProxySelector;

.field protected final schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;


# direct methods
.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;Ljava/net/ProxySelector;)V
    .registers 4
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;
    .param p2, "prosel"    # Ljava/net/ProxySelector;

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const-string v0, "SchemeRegistry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 94
    iput-object p1, p0, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 95
    iput-object p2, p0, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;->proxySelector:Ljava/net/ProxySelector;

    .line 96
    return-void
.end method


# virtual methods
.method protected chooseProxy(Ljava/util/List;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Ljava/net/Proxy;
    .registers 10
    .param p2, "target"    # Lorg/apache/http/HttpHost;
    .param p3, "request"    # Lorg/apache/http/HttpRequest;
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/net/Proxy;",
            ">;",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpRequest;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")",
            "Ljava/net/Proxy;"
        }
    .end annotation

    .prologue
    .line 246
    .local p1, "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    const-string v3, "List of proxies"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notEmpty(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/Collection;

    .line 248
    const/4 v2, 0x0

    .line 251
    .local v2, "result":Ljava/net/Proxy;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-nez v2, :cond_29

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_29

    .line 253
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/Proxy;

    .line 254
    .local v1, "p":Ljava/net/Proxy;
    sget-object v3, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner$1;->$SwitchMap$java$net$Proxy$Type:[I

    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Proxy$Type;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_2e

    .line 251
    :goto_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 258
    :pswitch_27
    move-object v2, v1

    .line 259
    goto :goto_24

    .line 268
    .end local v1    # "p":Ljava/net/Proxy;
    :cond_29
    if-nez v2, :cond_2d

    .line 272
    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 275
    :cond_2d
    return-object v2

    .line 254
    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_27
        :pswitch_27
    .end packed-switch
.end method

.method protected determineProxy(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpHost;
    .registers 14
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 172
    iget-object v3, p0, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;->proxySelector:Ljava/net/ProxySelector;

    .line 173
    .local v3, "psel":Ljava/net/ProxySelector;
    if-nez v3, :cond_8

    .line 174
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v3

    .line 176
    :cond_8
    if-nez v3, :cond_c

    .line 177
    const/4 v4, 0x0

    .line 203
    :cond_b
    :goto_b
    return-object v4

    .line 180
    :cond_c
    const/4 v5, 0x0

    .line 182
    .local v5, "targetURI":Ljava/net/URI;
    :try_start_d
    new-instance v5, Ljava/net/URI;

    .end local v5    # "targetURI":Ljava/net/URI;
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->toURI()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_16
    .catch Ljava/net/URISyntaxException; {:try_start_d .. :try_end_16} :catch_4c

    .line 187
    .restart local v5    # "targetURI":Ljava/net/URI;
    invoke-virtual {v3, v5}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object v2

    .line 189
    .local v2, "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    invoke-virtual {p0, v2, p1, p2, p3}, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;->chooseProxy(Ljava/util/List;Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Ljava/net/Proxy;

    move-result-object v1

    .line 191
    .local v1, "p":Ljava/net/Proxy;
    const/4 v4, 0x0

    .line 192
    .local v4, "result":Lorg/apache/http/HttpHost;
    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v7

    sget-object v8, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne v7, v8, :cond_b

    .line 194
    invoke-virtual {v1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v7

    instance-of v7, v7, Ljava/net/InetSocketAddress;

    if-nez v7, :cond_66

    .line 195
    new-instance v7, Lorg/apache/http/HttpException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unable to handle non-Inet proxy address: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 183
    .end local v1    # "p":Ljava/net/Proxy;
    .end local v2    # "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    .end local v4    # "result":Lorg/apache/http/HttpHost;
    .end local v5    # "targetURI":Ljava/net/URI;
    :catch_4c
    move-exception v6

    .line 184
    .local v6, "usx":Ljava/net/URISyntaxException;
    new-instance v7, Lorg/apache/http/HttpException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Cannot convert host to URI: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v6}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 198
    .end local v6    # "usx":Ljava/net/URISyntaxException;
    .restart local v1    # "p":Ljava/net/Proxy;
    .restart local v2    # "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    .restart local v4    # "result":Lorg/apache/http/HttpHost;
    .restart local v5    # "targetURI":Ljava/net/URI;
    :cond_66
    invoke-virtual {v1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    .line 200
    .local v0, "isa":Ljava/net/InetSocketAddress;
    new-instance v4, Lorg/apache/http/HttpHost;

    .end local v4    # "result":Lorg/apache/http/HttpHost;
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;->getHost(Ljava/net/InetSocketAddress;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v8

    invoke-direct {v4, v7, v8}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    .restart local v4    # "result":Lorg/apache/http/HttpHost;
    goto :goto_b
.end method

.method public determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;
    .registers 12
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 122
    const-string v6, "HTTP request"

    invoke-static {p2, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 125
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/conn/params/ConnRouteParams;->getForcedRoute(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v2

    .line 127
    .local v2, "route":Lorg/apache/http/conn/routing/HttpRoute;
    if-eqz v2, :cond_11

    move-object v3, v2

    .line 151
    .end local v2    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .local v3, "route":Lorg/apache/http/conn/routing/HttpRoute;
    :goto_10
    return-object v3

    .line 134
    .end local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v2    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :cond_11
    const-string v6, "Target host"

    invoke-static {p1, v6}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/conn/params/ConnRouteParams;->getLocalAddress(Lorg/apache/http/params/HttpParams;)Ljava/net/InetAddress;

    move-result-object v0

    .line 138
    .local v0, "local":Ljava/net/InetAddress;
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;->determineProxy(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 140
    .local v1, "proxy":Lorg/apache/http/HttpHost;
    iget-object v6, p0, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Ljava/lang/String;)Lorg/apache/http/conn/scheme/Scheme;

    move-result-object v4

    .line 144
    .local v4, "schm":Lorg/apache/http/conn/scheme/Scheme;
    invoke-virtual {v4}, Lorg/apache/http/conn/scheme/Scheme;->isLayered()Z

    move-result v5

    .line 146
    .local v5, "secure":Z
    if-nez v1, :cond_39

    .line 147
    new-instance v2, Lorg/apache/http/conn/routing/HttpRoute;

    .end local v2    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-direct {v2, p1, v0, v5}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Z)V

    .restart local v2    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :goto_37
    move-object v3, v2

    .line 151
    .end local v2    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    goto :goto_10

    .line 149
    .end local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v2    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :cond_39
    new-instance v2, Lorg/apache/http/conn/routing/HttpRoute;

    .end local v2    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-direct {v2, p1, v0, v1, v5}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/HttpHost;Z)V

    .restart local v2    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    goto :goto_37
.end method

.method protected getHost(Ljava/net/InetSocketAddress;)Ljava/lang/String;
    .registers 3
    .param p1, "isa"    # Ljava/net/InetSocketAddress;

    .prologue
    .line 221
    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->isUnresolved()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public getProxySelector()Ljava/net/ProxySelector;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;->proxySelector:Ljava/net/ProxySelector;

    return-object v0
.end method

.method public setProxySelector(Ljava/net/ProxySelector;)V
    .registers 2
    .param p1, "prosel"    # Ljava/net/ProxySelector;

    .prologue
    .line 114
    iput-object p1, p0, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;->proxySelector:Ljava/net/ProxySelector;

    .line 115
    return-void
.end method
