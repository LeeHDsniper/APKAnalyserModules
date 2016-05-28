.class public final Lcom/squareup/okhttp/Route;
.super Ljava/lang/Object;
.source "Route.java"


# instance fields
.field final address:Lcom/squareup/okhttp/Address;

.field final connectionSpec:Lcom/squareup/okhttp/ConnectionSpec;

.field final inetSocketAddress:Ljava/net/InetSocketAddress;

.field final proxy:Ljava/net/Proxy;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;Lcom/squareup/okhttp/ConnectionSpec;)V
    .registers 7
    .param p1, "address"    # Lcom/squareup/okhttp/Address;
    .param p2, "proxy"    # Ljava/net/Proxy;
    .param p3, "inetSocketAddress"    # Ljava/net/InetSocketAddress;
    .param p4, "connectionSpec"    # Lcom/squareup/okhttp/ConnectionSpec;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    if-nez p1, :cond_d

    .line 45
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "address == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_d
    if-nez p2, :cond_17

    .line 48
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "proxy == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_17
    if-nez p3, :cond_21

    .line 51
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "inetSocketAddress == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_21
    if-nez p4, :cond_2b

    .line 54
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "connectionConfiguration == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_2b
    iput-object p1, p0, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    .line 57
    iput-object p2, p0, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    .line 58
    iput-object p3, p0, Lcom/squareup/okhttp/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    .line 59
    iput-object p4, p0, Lcom/squareup/okhttp/Route;->connectionSpec:Lcom/squareup/okhttp/ConnectionSpec;

    .line 60
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 94
    instance-of v2, p1, Lcom/squareup/okhttp/Route;

    if-eqz v2, :cond_31

    move-object v0, p1

    .line 95
    check-cast v0, Lcom/squareup/okhttp/Route;

    .line 96
    .local v0, "other":Lcom/squareup/okhttp/Route;
    iget-object v2, p0, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v3, v0, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/Address;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    iget-object v2, p0, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    iget-object v3, v0, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    invoke-virtual {v2, v3}, Ljava/net/Proxy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    iget-object v2, p0, Lcom/squareup/okhttp/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    iget-object v3, v0, Lcom/squareup/okhttp/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v2, v3}, Ljava/net/InetSocketAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    iget-object v2, p0, Lcom/squareup/okhttp/Route;->connectionSpec:Lcom/squareup/okhttp/ConnectionSpec;

    iget-object v3, v0, Lcom/squareup/okhttp/Route;->connectionSpec:Lcom/squareup/okhttp/ConnectionSpec;

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/ConnectionSpec;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    const/4 v1, 0x1

    .line 101
    .end local v0    # "other":Lcom/squareup/okhttp/Route;
    :cond_31
    return v1
.end method

.method public getAddress()Lcom/squareup/okhttp/Address;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    return-object v0
.end method

.method public getProxy()Ljava/net/Proxy;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 105
    const/16 v0, 0x11

    .line 106
    .local v0, "result":I
    iget-object v1, p0, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Address;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x20f

    .line 107
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    invoke-virtual {v2}, Ljava/net/Proxy;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 108
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/squareup/okhttp/Route;->inetSocketAddress:Ljava/net/InetSocketAddress;

    invoke-virtual {v2}, Ljava/net/InetSocketAddress;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 109
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/squareup/okhttp/Route;->connectionSpec:Lcom/squareup/okhttp/ConnectionSpec;

    invoke-virtual {v2}, Lcom/squareup/okhttp/ConnectionSpec;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 110
    return v0
.end method

.method public requiresTunnel()Z
    .registers 3

    .prologue
    .line 90
    iget-object v0, p0, Lcom/squareup/okhttp/Route;->address:Lcom/squareup/okhttp/Address;

    iget-object v0, v0, Lcom/squareup/okhttp/Address;->sslSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/squareup/okhttp/Route;->proxy:Ljava/net/Proxy;

    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne v0, v1, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method
