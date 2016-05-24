.class public Lorg/apache/http/impl/conn/SystemDefaultRoutePlanner;
.super Lorg/apache/http/impl/conn/DefaultRoutePlanner;
.source "SystemDefaultRoutePlanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/conn/SystemDefaultRoutePlanner$1;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final proxySelector:Ljava/net/ProxySelector;


# direct methods
.method public constructor <init>(Ljava/net/ProxySelector;)V
    .registers 3
    .param p1, "proxySelector"    # Ljava/net/ProxySelector;

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/http/impl/conn/SystemDefaultRoutePlanner;-><init>(Lorg/apache/http/conn/SchemePortResolver;Ljava/net/ProxySelector;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/SchemePortResolver;Ljava/net/ProxySelector;)V
    .registers 3
    .param p1, "schemePortResolver"    # Lorg/apache/http/conn/SchemePortResolver;
    .param p2, "proxySelector"    # Ljava/net/ProxySelector;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lorg/apache/http/impl/conn/DefaultRoutePlanner;-><init>(Lorg/apache/http/conn/SchemePortResolver;)V

    .line 61
    if-eqz p2, :cond_8

    .end local p2    # "proxySelector":Ljava/net/ProxySelector;
    :goto_5
    iput-object p2, p0, Lorg/apache/http/impl/conn/SystemDefaultRoutePlanner;->proxySelector:Ljava/net/ProxySelector;

    .line 62
    return-void

    .line 61
    .restart local p2    # "proxySelector":Ljava/net/ProxySelector;
    :cond_8
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object p2

    goto :goto_5
.end method

.method private chooseProxy(Ljava/util/List;)Ljava/net/Proxy;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/net/Proxy;",
            ">;)",
            "Ljava/net/Proxy;"
        }
    .end annotation

    .prologue
    .line 106
    .local p1, "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    const/4 v2, 0x0

    .line 108
    .local v2, "result":Ljava/net/Proxy;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-nez v2, :cond_24

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_24

    .line 109
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/Proxy;

    .line 110
    .local v1, "p":Ljava/net/Proxy;
    sget-object v3, Lorg/apache/http/impl/conn/SystemDefaultRoutePlanner$1;->$SwitchMap$java$net$Proxy$Type:[I

    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Proxy$Type;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_2a

    .line 108
    :goto_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 114
    :pswitch_22
    move-object v2, v1

    .line 115
    goto :goto_1f

    .line 123
    .end local v1    # "p":Ljava/net/Proxy;
    :cond_24
    if-nez v2, :cond_28

    .line 127
    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 129
    :cond_28
    return-object v2

    .line 110
    nop

    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_22
        :pswitch_22
    .end packed-switch
.end method

.method private getHost(Ljava/net/InetSocketAddress;)Ljava/lang/String;
    .registers 3
    .param p1, "isa"    # Ljava/net/InetSocketAddress;

    .prologue
    .line 100
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


# virtual methods
.method protected determineProxy(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpHost;
    .registers 13
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 75
    :try_start_0
    new-instance v5, Ljava/net/URI;

    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->toURI()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_9} :catch_41

    .line 79
    .local v5, "targetURI":Ljava/net/URI;
    iget-object v6, p0, Lorg/apache/http/impl/conn/SystemDefaultRoutePlanner;->proxySelector:Ljava/net/ProxySelector;

    invoke-virtual {v6, v5}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object v3

    .line 80
    .local v3, "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    invoke-direct {p0, v3}, Lorg/apache/http/impl/conn/SystemDefaultRoutePlanner;->chooseProxy(Ljava/util/List;)Ljava/net/Proxy;

    move-result-object v2

    .line 81
    .local v2, "p":Ljava/net/Proxy;
    const/4 v4, 0x0

    .line 82
    .local v4, "result":Lorg/apache/http/HttpHost;
    invoke-virtual {v2}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v6

    sget-object v7, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne v6, v7, :cond_6e

    .line 84
    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v6

    instance-of v6, v6, Ljava/net/InetSocketAddress;

    if-nez v6, :cond_5b

    .line 85
    new-instance v6, Lorg/apache/http/HttpException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to handle non-Inet proxy address: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 76
    .end local v2    # "p":Ljava/net/Proxy;
    .end local v3    # "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    .end local v4    # "result":Lorg/apache/http/HttpHost;
    .end local v5    # "targetURI":Ljava/net/URI;
    :catch_41
    move-exception v0

    .line 77
    .local v0, "ex":Ljava/net/URISyntaxException;
    new-instance v6, Lorg/apache/http/HttpException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Cannot convert host to URI: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 87
    .end local v0    # "ex":Ljava/net/URISyntaxException;
    .restart local v2    # "p":Ljava/net/Proxy;
    .restart local v3    # "proxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    .restart local v4    # "result":Lorg/apache/http/HttpHost;
    .restart local v5    # "targetURI":Ljava/net/URI;
    :cond_5b
    invoke-virtual {v2}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v1

    check-cast v1, Ljava/net/InetSocketAddress;

    .line 89
    .local v1, "isa":Ljava/net/InetSocketAddress;
    new-instance v4, Lorg/apache/http/HttpHost;

    .end local v4    # "result":Lorg/apache/http/HttpHost;
    invoke-direct {p0, v1}, Lorg/apache/http/impl/conn/SystemDefaultRoutePlanner;->getHost(Ljava/net/InetSocketAddress;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v7

    invoke-direct {v4, v6, v7}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    .line 92
    .end local v1    # "isa":Ljava/net/InetSocketAddress;
    .restart local v4    # "result":Lorg/apache/http/HttpHost;
    :cond_6e
    return-object v4
.end method
