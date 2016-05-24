.class public final Lcom/squareup/okhttp/internal/http/RouteSelector;
.super Ljava/lang/Object;
.source "RouteSelector.java"


# instance fields
.field private final address:Lcom/squareup/okhttp/Address;

.field private final client:Lcom/squareup/okhttp/OkHttpClient;

.field private connectionSpecs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/ConnectionSpec;",
            ">;"
        }
    .end annotation
.end field

.field private inetSocketAddresses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/net/InetSocketAddress;",
            ">;"
        }
    .end annotation
.end field

.field private lastInetSocketAddress:Ljava/net/InetSocketAddress;

.field private lastProxy:Ljava/net/Proxy;

.field private lastSpec:Lcom/squareup/okhttp/ConnectionSpec;

.field private final network:Lcom/squareup/okhttp/internal/Network;

.field private nextInetSocketAddressIndex:I

.field private nextProxyIndex:I

.field private nextSpecIndex:I

.field private final pool:Lcom/squareup/okhttp/ConnectionPool;

.field private final postponedRoutes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Route;",
            ">;"
        }
    .end annotation
.end field

.field private proxies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation
.end field

.field private final proxySelector:Ljava/net/ProxySelector;

.field private final request:Lcom/squareup/okhttp/Request;

.field private final routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

.field private final uri:Ljava/net/URI;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Address;Ljava/net/URI;Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;)V
    .registers 6
    .param p1, "address"    # Lcom/squareup/okhttp/Address;
    .param p2, "uri"    # Ljava/net/URI;
    .param p3, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p4, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    .line 74
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    .line 78
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->postponedRoutes:Ljava/util/List;

    .line 85
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    .line 86
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->uri:Ljava/net/URI;

    .line 87
    iput-object p3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 88
    invoke-virtual {p3}, Lcom/squareup/okhttp/OkHttpClient;->getProxySelector()Ljava/net/ProxySelector;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxySelector:Ljava/net/ProxySelector;

    .line 89
    invoke-virtual {p3}, Lcom/squareup/okhttp/OkHttpClient;->getConnectionPool()Lcom/squareup/okhttp/ConnectionPool;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->pool:Lcom/squareup/okhttp/ConnectionPool;

    .line 90
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v0, p3}, Lcom/squareup/okhttp/internal/Internal;->routeDatabase(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/RouteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    .line 91
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v0, p3}, Lcom/squareup/okhttp/internal/Internal;->network(Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/Network;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->network:Lcom/squareup/okhttp/internal/Network;

    .line 92
    iput-object p4, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->request:Lcom/squareup/okhttp/Request;

    .line 94
    invoke-virtual {p1}, Lcom/squareup/okhttp/Address;->getProxy()Ljava/net/Proxy;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->resetNextProxy(Ljava/net/URI;Ljava/net/Proxy;)V

    .line 95
    return-void
.end method

.method public static get(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/OkHttpClient;)Lcom/squareup/okhttp/internal/http/RouteSelector;
    .registers 13
    .param p0, "request"    # Lcom/squareup/okhttp/Request;
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 99
    .local v1, "uriHost":Ljava/lang/String;
    if-eqz v1, :cond_10

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1e

    .line 100
    :cond_10
    new-instance v2, Ljava/net/UnknownHostException;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 103
    :cond_1e
    const/4 v4, 0x0

    .line 104
    .local v4, "sslSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    const/4 v5, 0x0

    .line 105
    .local v5, "hostnameVerifier":Ljavax/net/ssl/HostnameVerifier;
    const/4 v6, 0x0

    .line 106
    .local v6, "certificatePinner":Lcom/squareup/okhttp/CertificatePinner;
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->isHttps()Z

    move-result v2

    if-eqz v2, :cond_33

    .line 107
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getSslSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v4

    .line 108
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v5

    .line 109
    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getCertificatePinner()Lcom/squareup/okhttp/CertificatePinner;

    move-result-object v6

    .line 112
    :cond_33
    new-instance v0, Lcom/squareup/okhttp/Address;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URL;)I

    move-result v2

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v3

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getAuthenticator()Lcom/squareup/okhttp/Authenticator;

    move-result-object v7

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getProxy()Ljava/net/Proxy;

    move-result-object v8

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getProtocols()Ljava/util/List;

    move-result-object v9

    invoke-virtual {p1}, Lcom/squareup/okhttp/OkHttpClient;->getConnectionSpecs()Ljava/util/List;

    move-result-object v10

    invoke-direct/range {v0 .. v10}, Lcom/squareup/okhttp/Address;-><init>(Ljava/lang/String;ILjavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Lcom/squareup/okhttp/CertificatePinner;Lcom/squareup/okhttp/Authenticator;Ljava/net/Proxy;Ljava/util/List;Ljava/util/List;)V

    .line 117
    .local v0, "address":Lcom/squareup/okhttp/Address;
    new-instance v2, Lcom/squareup/okhttp/internal/http/RouteSelector;

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->uri()Ljava/net/URI;

    move-result-object v3

    invoke-direct {v2, v0, v3, p1, p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;-><init>(Lcom/squareup/okhttp/Address;Ljava/net/URI;Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;)V

    return-object v2
.end method

.method private hasNextConnectionSpec()Z
    .registers 3

    .prologue
    .line 294
    iget v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private hasNextInetSocketAddress()Z
    .registers 3

    .prologue
    .line 267
    iget v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private hasNextPostponed()Z
    .registers 2

    .prologue
    .line 308
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private hasNextProxy()Z
    .registers 3

    .prologue
    .line 223
    iget v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private nextConnectionSpec()Lcom/squareup/okhttp/ConnectionSpec;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 299
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextConnectionSpec()Z

    move-result v0

    if-nez v0, :cond_31

    .line 300
    new-instance v0, Ljava/net/SocketException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No route to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; exhausted connection specs: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 303
    :cond_31
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    iget v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/ConnectionSpec;

    return-object v0
.end method

.method private nextInetSocketAddress()Ljava/net/InetSocketAddress;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextInetSocketAddress()Z

    move-result v1

    if-nez v1, :cond_31

    .line 273
    new-instance v1, Ljava/net/SocketException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No route to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; exhausted inet socket addresses: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 276
    :cond_31
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    iget v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetSocketAddress;

    .line 277
    .local v0, "result":Ljava/net/InetSocketAddress;
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->resetConnectionSpecs()V

    .line 278
    return-object v0
.end method

.method private nextPostponed()Lcom/squareup/okhttp/Route;
    .registers 3

    .prologue
    .line 313
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->postponedRoutes:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/okhttp/Route;

    return-object v0
.end method

.method private nextProxy()Ljava/net/Proxy;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextProxy()Z

    move-result v1

    if-nez v1, :cond_31

    .line 229
    new-instance v1, Ljava/net/SocketException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No route to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v3}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; exhausted proxy configurations: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 232
    :cond_31
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    iget v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Proxy;

    .line 233
    .local v0, "result":Ljava/net/Proxy;
    invoke-direct {p0, v0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->resetNextInetSocketAddress(Ljava/net/Proxy;)V

    .line 234
    return-object v0
.end method

.method private resetConnectionSpecs()V
    .registers 5

    .prologue
    .line 283
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    .line 284
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Address;->getConnectionSpecs()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_11
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/squareup/okhttp/ConnectionSpec;

    .line 285
    .local v1, "spec":Lcom/squareup/okhttp/ConnectionSpec;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Request;->isHttps()Z

    move-result v2

    invoke-virtual {v1}, Lcom/squareup/okhttp/ConnectionSpec;->isTls()Z

    move-result v3

    if-ne v2, v3, :cond_11

    .line 286
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 289
    .end local v1    # "spec":Lcom/squareup/okhttp/ConnectionSpec;
    :cond_2f
    const/4 v2, 0x0

    iput v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    .line 290
    return-void
.end method

.method private resetNextInetSocketAddress(Ljava/net/Proxy;)V
    .registers 13
    .param p1, "proxy"    # Ljava/net/Proxy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 240
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    .line 244
    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v8

    sget-object v9, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-ne v8, v9, :cond_34

    .line 245
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v8}, Lcom/squareup/okhttp/Address;->getUriHost()Ljava/lang/String;

    move-result-object v6

    .line 246
    .local v6, "socketHost":Ljava/lang/String;
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->uri:Ljava/net/URI;

    invoke-static {v8}, Lcom/squareup/okhttp/internal/Util;->getEffectivePort(Ljava/net/URI;)I

    move-result v7

    .line 259
    .local v7, "socketPort":I
    :goto_1b
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->network:Lcom/squareup/okhttp/internal/Network;

    invoke-interface {v8, v6}, Lcom/squareup/okhttp/internal/Network;->resolveInetAddresses(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v0

    .local v0, "arr$":[Ljava/net/InetAddress;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_23
    if-ge v1, v3, :cond_65

    aget-object v2, v0, v1

    .line 260
    .local v2, "inetAddress":Ljava/net/InetAddress;
    iget-object v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->inetSocketAddresses:Ljava/util/List;

    new-instance v9, Ljava/net/InetSocketAddress;

    invoke-direct {v9, v2, v7}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    .line 248
    .end local v0    # "arr$":[Ljava/net/InetAddress;
    .end local v1    # "i$":I
    .end local v2    # "inetAddress":Ljava/net/InetAddress;
    .end local v3    # "len$":I
    .end local v6    # "socketHost":Ljava/lang/String;
    .end local v7    # "socketPort":I
    :cond_34
    invoke-virtual {p1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v4

    .line 249
    .local v4, "proxyAddress":Ljava/net/SocketAddress;
    instance-of v8, v4, Ljava/net/InetSocketAddress;

    if-nez v8, :cond_59

    .line 250
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Proxy.address() is not an InetSocketAddress: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_59
    move-object v5, v4

    .line 253
    check-cast v5, Ljava/net/InetSocketAddress;

    .line 254
    .local v5, "proxySocketAddress":Ljava/net/InetSocketAddress;
    invoke-virtual {v5}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v6

    .line 255
    .restart local v6    # "socketHost":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v7

    .restart local v7    # "socketPort":I
    goto :goto_1b

    .line 262
    .end local v4    # "proxyAddress":Ljava/net/SocketAddress;
    .end local v5    # "proxySocketAddress":Ljava/net/InetSocketAddress;
    .restart local v0    # "arr$":[Ljava/net/InetAddress;
    .restart local v1    # "i$":I
    .restart local v3    # "len$":I
    :cond_65
    const/4 v8, 0x0

    iput v8, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddressIndex:I

    .line 263
    return-void
.end method

.method private resetNextProxy(Ljava/net/URI;Ljava/net/Proxy;)V
    .registers 6
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "proxy"    # Ljava/net/Proxy;

    .prologue
    .line 205
    if-eqz p2, :cond_c

    .line 207
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    .line 218
    :goto_8
    const/4 v1, 0x0

    iput v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxyIndex:I

    .line 219
    return-void

    .line 211
    :cond_c
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    .line 212
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxySelector:Ljava/net/ProxySelector;

    invoke-virtual {v1, p1}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object v0

    .line 213
    .local v0, "selectedProxies":Ljava/util/List;, "Ljava/util/List<Ljava/net/Proxy;>;"
    if-eqz v0, :cond_20

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 215
    :cond_20
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 216
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxies:Ljava/util/List;

    sget-object v2, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8
.end method


# virtual methods
.method public connectFailed(Lcom/squareup/okhttp/Connection;Ljava/io/IOException;)V
    .registers 11
    .param p1, "connection"    # Lcom/squareup/okhttp/Connection;
    .param p2, "failure"    # Ljava/io/IOException;

    .prologue
    .line 181
    sget-object v2, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v2, p1}, Lcom/squareup/okhttp/internal/Internal;->recycleCount(Lcom/squareup/okhttp/Connection;)I

    move-result v2

    if-lez v2, :cond_9

    .line 201
    :cond_8
    return-void

    .line 183
    :cond_9
    invoke-virtual {p1}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v0

    .line 184
    .local v0, "failedRoute":Lcom/squareup/okhttp/Route;
    invoke-virtual {v0}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v2

    sget-object v3, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v2, v3, :cond_2c

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxySelector:Ljava/net/ProxySelector;

    if-eqz v2, :cond_2c

    .line 186
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->proxySelector:Ljava/net/ProxySelector;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->uri:Ljava/net/URI;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v4

    invoke-virtual {v2, v3, v4, p2}, Ljava/net/ProxySelector;->connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V

    .line 189
    :cond_2c
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    invoke-virtual {v2, v0}, Lcom/squareup/okhttp/internal/RouteDatabase;->failed(Lcom/squareup/okhttp/Route;)V

    .line 194
    instance-of v2, p2, Ljavax/net/ssl/SSLHandshakeException;

    if-nez v2, :cond_8

    instance-of v2, p2, Ljavax/net/ssl/SSLProtocolException;

    if-nez v2, :cond_8

    .line 195
    :goto_39
    iget v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_8

    .line 196
    new-instance v1, Lcom/squareup/okhttp/Route;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastProxy:Ljava/net/Proxy;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastInetSocketAddress:Ljava/net/InetSocketAddress;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->connectionSpecs:Ljava/util/List;

    iget v6, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextSpecIndex:I

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/squareup/okhttp/ConnectionSpec;

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/squareup/okhttp/Route;-><init>(Lcom/squareup/okhttp/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;Lcom/squareup/okhttp/ConnectionSpec;)V

    .line 198
    .local v1, "toSuppress":Lcom/squareup/okhttp/Route;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    invoke-virtual {v2, v1}, Lcom/squareup/okhttp/internal/RouteDatabase;->failed(Lcom/squareup/okhttp/Route;)V

    goto :goto_39
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 125
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextConnectionSpec()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextInetSocketAddress()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextProxy()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextPostponed()Z

    move-result v0

    if-eqz v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public next(Lcom/squareup/okhttp/internal/http/HttpEngine;)Lcom/squareup/okhttp/Connection;
    .registers 6
    .param p1, "owner"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextUnconnected()Lcom/squareup/okhttp/Connection;

    move-result-object v0

    .line 134
    .local v0, "connection":Lcom/squareup/okhttp/Connection;
    sget-object v1, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->client:Lcom/squareup/okhttp/OkHttpClient;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1, v2, v0, p1, v3}, Lcom/squareup/okhttp/internal/Internal;->connectAndSetOwner(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Connection;Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/Request;)V

    .line 135
    return-object v0
.end method

.method nextUnconnected()Lcom/squareup/okhttp/Connection;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    :goto_0
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->pool:Lcom/squareup/okhttp/ConnectionPool;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/ConnectionPool;->get(Lcom/squareup/okhttp/Address;)Lcom/squareup/okhttp/Connection;

    move-result-object v0

    .local v0, "pooled":Lcom/squareup/okhttp/Connection;
    if-eqz v0, :cond_29

    .line 146
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v2}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v2

    const-string v3, "GET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_20

    sget-object v2, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v2, v0}, Lcom/squareup/okhttp/internal/Internal;->isReadable(Lcom/squareup/okhttp/Connection;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 172
    .end local v0    # "pooled":Lcom/squareup/okhttp/Connection;
    :cond_20
    :goto_20
    return-object v0

    .line 147
    .restart local v0    # "pooled":Lcom/squareup/okhttp/Connection;
    :cond_21
    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/Socket;->close()V

    goto :goto_0

    .line 151
    :cond_29
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextConnectionSpec()Z

    move-result v2

    if-nez v2, :cond_5f

    .line 152
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextInetSocketAddress()Z

    move-result v2

    if-nez v2, :cond_59

    .line 153
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextProxy()Z

    move-result v2

    if-nez v2, :cond_53

    .line 154
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->hasNextPostponed()Z

    move-result v2

    if-nez v2, :cond_47

    .line 155
    new-instance v2, Ljava/util/NoSuchElementException;

    invoke-direct {v2}, Ljava/util/NoSuchElementException;-><init>()V

    throw v2

    .line 157
    :cond_47
    new-instance v0, Lcom/squareup/okhttp/Connection;

    .end local v0    # "pooled":Lcom/squareup/okhttp/Connection;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->pool:Lcom/squareup/okhttp/ConnectionPool;

    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextPostponed()Lcom/squareup/okhttp/Route;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/squareup/okhttp/Connection;-><init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Route;)V

    goto :goto_20

    .line 159
    .restart local v0    # "pooled":Lcom/squareup/okhttp/Connection;
    :cond_53
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextProxy()Ljava/net/Proxy;

    move-result-object v2

    iput-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastProxy:Ljava/net/Proxy;

    .line 161
    :cond_59
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextInetSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v2

    iput-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastInetSocketAddress:Ljava/net/InetSocketAddress;

    .line 163
    :cond_5f
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextConnectionSpec()Lcom/squareup/okhttp/ConnectionSpec;

    move-result-object v2

    iput-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastSpec:Lcom/squareup/okhttp/ConnectionSpec;

    .line 165
    new-instance v1, Lcom/squareup/okhttp/Route;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->address:Lcom/squareup/okhttp/Address;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastProxy:Ljava/net/Proxy;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastInetSocketAddress:Ljava/net/InetSocketAddress;

    iget-object v5, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->lastSpec:Lcom/squareup/okhttp/ConnectionSpec;

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/squareup/okhttp/Route;-><init>(Lcom/squareup/okhttp/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;Lcom/squareup/okhttp/ConnectionSpec;)V

    .line 166
    .local v1, "route":Lcom/squareup/okhttp/Route;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->routeDatabase:Lcom/squareup/okhttp/internal/RouteDatabase;

    invoke-virtual {v2, v1}, Lcom/squareup/okhttp/internal/RouteDatabase;->shouldPostpone(Lcom/squareup/okhttp/Route;)Z

    move-result v2

    if-eqz v2, :cond_84

    .line 167
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/RouteSelector;->nextUnconnected()Lcom/squareup/okhttp/Connection;

    move-result-object v0

    goto :goto_20

    .line 172
    :cond_84
    new-instance v0, Lcom/squareup/okhttp/Connection;

    .end local v0    # "pooled":Lcom/squareup/okhttp/Connection;
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/RouteSelector;->pool:Lcom/squareup/okhttp/ConnectionPool;

    invoke-direct {v0, v2, v1}, Lcom/squareup/okhttp/Connection;-><init>(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Route;)V

    goto :goto_20
.end method
