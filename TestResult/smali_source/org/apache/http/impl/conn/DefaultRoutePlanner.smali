.class public Lorg/apache/http/impl/conn/DefaultRoutePlanner;
.super Ljava/lang/Object;
.source "DefaultRoutePlanner.java"

# interfaces
.implements Lorg/apache/http/conn/routing/HttpRoutePlanner;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final schemePortResolver:Lorg/apache/http/conn/SchemePortResolver;


# direct methods
.method public constructor <init>(Lorg/apache/http/conn/SchemePortResolver;)V
    .registers 2
    .param p1, "schemePortResolver"    # Lorg/apache/http/conn/SchemePortResolver;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    if-eqz p1, :cond_8

    .end local p1    # "schemePortResolver":Lorg/apache/http/conn/SchemePortResolver;
    :goto_5
    iput-object p1, p0, Lorg/apache/http/impl/conn/DefaultRoutePlanner;->schemePortResolver:Lorg/apache/http/conn/SchemePortResolver;

    .line 60
    return-void

    .line 58
    .restart local p1    # "schemePortResolver":Lorg/apache/http/conn/SchemePortResolver;
    :cond_8
    sget-object p1, Lorg/apache/http/impl/conn/DefaultSchemePortResolver;->INSTANCE:Lorg/apache/http/impl/conn/DefaultSchemePortResolver;

    goto :goto_5
.end method


# virtual methods
.method protected determineProxy(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpHost;
    .registers 5
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 101
    const/4 v0, 0x0

    return-object v0
.end method

.method public determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;
    .registers 14
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 66
    const-string v7, "Target host"

    invoke-static {p1, v7}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 67
    const-string v7, "Request"

    invoke-static {p2, v7}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    invoke-static {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v0

    .line 69
    .local v0, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v1

    .line 70
    .local v1, "config":Lorg/apache/http/client/config/RequestConfig;
    invoke-virtual {v1}, Lorg/apache/http/client/config/RequestConfig;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v3

    .line 71
    .local v3, "local":Ljava/net/InetAddress;
    invoke-virtual {v1}, Lorg/apache/http/client/config/RequestConfig;->getProxy()Lorg/apache/http/HttpHost;

    move-result-object v4

    .line 72
    .local v4, "proxy":Lorg/apache/http/HttpHost;
    if-nez v4, :cond_20

    .line 73
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/http/impl/conn/DefaultRoutePlanner;->determineProxy(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpHost;

    move-result-object v4

    .line 77
    :cond_20
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v7

    if-gtz v7, :cond_56

    .line 79
    :try_start_26
    new-instance v6, Lorg/apache/http/HttpHost;

    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/http/impl/conn/DefaultRoutePlanner;->schemePortResolver:Lorg/apache/http/conn/SchemePortResolver;

    invoke-interface {v8, p1}, Lorg/apache/http/conn/SchemePortResolver;->resolve(Lorg/apache/http/HttpHost;)I

    move-result v8

    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, v7, v8, v9}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_39
    .catch Lorg/apache/http/conn/UnsupportedSchemeException; {:try_start_26 .. :try_end_39} :catch_4b

    .line 89
    .local v6, "target":Lorg/apache/http/HttpHost;
    :goto_39
    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "https"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    .line 90
    .local v5, "secure":Z
    if-nez v4, :cond_58

    .line 91
    new-instance v7, Lorg/apache/http/conn/routing/HttpRoute;

    invoke-direct {v7, v6, v3, v5}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Z)V

    .line 93
    :goto_4a
    return-object v7

    .line 83
    .end local v5    # "secure":Z
    .end local v6    # "target":Lorg/apache/http/HttpHost;
    :catch_4b
    move-exception v2

    .line 84
    .local v2, "ex":Lorg/apache/http/conn/UnsupportedSchemeException;
    new-instance v7, Lorg/apache/http/HttpException;

    invoke-virtual {v2}, Lorg/apache/http/conn/UnsupportedSchemeException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 87
    .end local v2    # "ex":Lorg/apache/http/conn/UnsupportedSchemeException;
    :cond_56
    move-object v6, p1

    .restart local v6    # "target":Lorg/apache/http/HttpHost;
    goto :goto_39

    .line 93
    .restart local v5    # "secure":Z
    :cond_58
    new-instance v7, Lorg/apache/http/conn/routing/HttpRoute;

    invoke-direct {v7, v6, v3, v4, v5}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/HttpHost;Z)V

    goto :goto_4a
.end method
