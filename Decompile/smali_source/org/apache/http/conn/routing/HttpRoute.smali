.class public final Lorg/apache/http/conn/routing/HttpRoute;
.super Ljava/lang/Object;
.source "HttpRoute.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Lorg/apache/http/conn/routing/RouteInfo;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

.field private final localAddress:Ljava/net/InetAddress;

.field private final proxyChain:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/HttpHost;",
            ">;"
        }
    .end annotation
.end field

.field private final secure:Z

.field private final targetHost:Lorg/apache/http/HttpHost;

.field private final tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpHost;)V
    .registers 9
    .param p1, "target"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 152
    const/4 v2, 0x0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x0

    sget-object v5, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    sget-object v6, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Ljava/util/List;ZLorg/apache/http/conn/routing/RouteInfo$TunnelType;Lorg/apache/http/conn/routing/RouteInfo$LayerType;)V

    .line 154
    return-void
.end method

.method private constructor <init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Ljava/util/List;ZLorg/apache/http/conn/routing/RouteInfo$TunnelType;Lorg/apache/http/conn/routing/RouteInfo$LayerType;)V
    .registers 9
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "local"    # Ljava/net/InetAddress;
    .param p4, "secure"    # Z
    .param p5, "tunnelled"    # Lorg/apache/http/conn/routing/RouteInfo$TunnelType;
    .param p6, "layered"    # Lorg/apache/http/conn/routing/RouteInfo$LayerType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpHost;",
            "Ljava/net/InetAddress;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/HttpHost;",
            ">;Z",
            "Lorg/apache/http/conn/routing/RouteInfo$TunnelType;",
            "Lorg/apache/http/conn/routing/RouteInfo$LayerType;",
            ")V"
        }
    .end annotation

    .prologue
    .line 72
    .local p3, "proxies":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/HttpHost;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const-string v0, "Target host"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 74
    iput-object p1, p0, Lorg/apache/http/conn/routing/HttpRoute;->targetHost:Lorg/apache/http/HttpHost;

    .line 75
    iput-object p2, p0, Lorg/apache/http/conn/routing/HttpRoute;->localAddress:Ljava/net/InetAddress;

    .line 76
    if-eqz p3, :cond_34

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_34

    .line 77
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    .line 81
    :goto_1b
    sget-object v0, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->TUNNELLED:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    if-ne p5, v0, :cond_29

    .line 82
    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    if-eqz v0, :cond_38

    const/4 v0, 0x1

    :goto_24
    const-string v1, "Proxy required if tunnelled"

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    .line 84
    :cond_29
    iput-boolean p4, p0, Lorg/apache/http/conn/routing/HttpRoute;->secure:Z

    .line 85
    if-eqz p5, :cond_3a

    .end local p5    # "tunnelled":Lorg/apache/http/conn/routing/RouteInfo$TunnelType;
    :goto_2d
    iput-object p5, p0, Lorg/apache/http/conn/routing/HttpRoute;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    .line 86
    if-eqz p6, :cond_3d

    .end local p6    # "layered":Lorg/apache/http/conn/routing/RouteInfo$LayerType;
    :goto_31
    iput-object p6, p0, Lorg/apache/http/conn/routing/HttpRoute;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    .line 87
    return-void

    .line 79
    .restart local p5    # "tunnelled":Lorg/apache/http/conn/routing/RouteInfo$TunnelType;
    .restart local p6    # "layered":Lorg/apache/http/conn/routing/RouteInfo$LayerType;
    :cond_34
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    goto :goto_1b

    .line 82
    :cond_38
    const/4 v0, 0x0

    goto :goto_24

    .line 85
    :cond_3a
    sget-object p5, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    goto :goto_2d

    .line 86
    .end local p5    # "tunnelled":Lorg/apache/http/conn/routing/RouteInfo$TunnelType;
    :cond_3d
    sget-object p6, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    goto :goto_31
.end method

.method public constructor <init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/HttpHost;Z)V
    .registers 12
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "local"    # Ljava/net/InetAddress;
    .param p3, "proxy"    # Lorg/apache/http/HttpHost;
    .param p4, "secure"    # Z

    .prologue
    .line 171
    const-string v0, "Proxy host"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    if-eqz p4, :cond_1a

    sget-object v5, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->TUNNELLED:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    :goto_e
    if-eqz p4, :cond_1d

    sget-object v6, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->LAYERED:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    :goto_12
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p4

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Ljava/util/List;ZLorg/apache/http/conn/routing/RouteInfo$TunnelType;Lorg/apache/http/conn/routing/RouteInfo$LayerType;)V

    .line 174
    return-void

    .line 171
    :cond_1a
    sget-object v5, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    goto :goto_e

    :cond_1d
    sget-object v6, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    goto :goto_12
.end method

.method public constructor <init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/HttpHost;ZLorg/apache/http/conn/routing/RouteInfo$TunnelType;Lorg/apache/http/conn/routing/RouteInfo$LayerType;)V
    .registers 14
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "local"    # Ljava/net/InetAddress;
    .param p3, "proxy"    # Lorg/apache/http/HttpHost;
    .param p4, "secure"    # Z
    .param p5, "tunnelled"    # Lorg/apache/http/conn/routing/RouteInfo$TunnelType;
    .param p6, "layered"    # Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    .prologue
    .line 127
    if-eqz p3, :cond_10

    invoke-static {p3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    :goto_6
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Ljava/util/List;ZLorg/apache/http/conn/routing/RouteInfo$TunnelType;Lorg/apache/http/conn/routing/RouteInfo$LayerType;)V

    .line 129
    return-void

    .line 127
    :cond_10
    const/4 v3, 0x0

    goto :goto_6
.end method

.method public constructor <init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Z)V
    .registers 11
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "local"    # Ljava/net/InetAddress;
    .param p3, "secure"    # Z

    .prologue
    .line 142
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    sget-object v5, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    sget-object v6, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Ljava/util/List;ZLorg/apache/http/conn/routing/RouteInfo$TunnelType;Lorg/apache/http/conn/routing/RouteInfo$LayerType;)V

    .line 144
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;[Lorg/apache/http/HttpHost;ZLorg/apache/http/conn/routing/RouteInfo$TunnelType;Lorg/apache/http/conn/routing/RouteInfo$LayerType;)V
    .registers 14
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "local"    # Ljava/net/InetAddress;
    .param p3, "proxies"    # [Lorg/apache/http/HttpHost;
    .param p4, "secure"    # Z
    .param p5, "tunnelled"    # Lorg/apache/http/conn/routing/RouteInfo$TunnelType;
    .param p6, "layered"    # Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    .prologue
    .line 104
    if-eqz p3, :cond_10

    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    :goto_6
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Ljava/util/List;ZLorg/apache/http/conn/routing/RouteInfo$TunnelType;Lorg/apache/http/conn/routing/RouteInfo$LayerType;)V

    .line 106
    return-void

    .line 104
    :cond_10
    const/4 v3, 0x0

    goto :goto_6
.end method

.method public constructor <init>(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpHost;)V
    .registers 5
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "proxy"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 185
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, p2, v1}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/HttpHost;Z)V

    .line 186
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 325
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 249
    if-ne p0, p1, :cond_5

    .line 263
    :cond_4
    :goto_4
    return v1

    .line 252
    :cond_5
    instance-of v3, p1, Lorg/apache/http/conn/routing/HttpRoute;

    if-eqz v3, :cond_3e

    move-object v0, p1

    .line 253
    check-cast v0, Lorg/apache/http/conn/routing/HttpRoute;

    .line 254
    .local v0, "that":Lorg/apache/http/conn/routing/HttpRoute;
    iget-boolean v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->secure:Z

    iget-boolean v4, v0, Lorg/apache/http/conn/routing/HttpRoute;->secure:Z

    if-ne v3, v4, :cond_3c

    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    iget-object v4, v0, Lorg/apache/http/conn/routing/HttpRoute;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    if-ne v3, v4, :cond_3c

    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    iget-object v4, v0, Lorg/apache/http/conn/routing/HttpRoute;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    if-ne v3, v4, :cond_3c

    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->targetHost:Lorg/apache/http/HttpHost;

    iget-object v4, v0, Lorg/apache/http/conn/routing/HttpRoute;->targetHost:Lorg/apache/http/HttpHost;

    invoke-static {v3, v4}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->localAddress:Ljava/net/InetAddress;

    iget-object v4, v0, Lorg/apache/http/conn/routing/HttpRoute;->localAddress:Ljava/net/InetAddress;

    invoke-static {v3, v4}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    iget-object v4, v0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    invoke-static {v3, v4}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_3c
    move v1, v2

    goto :goto_4

    .end local v0    # "that":Lorg/apache/http/conn/routing/HttpRoute;
    :cond_3e
    move v1, v2

    .line 263
    goto :goto_4
.end method

.method public final getHopCount()I
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x1

    goto :goto_c
.end method

.method public final getHopTarget(I)Lorg/apache/http/HttpHost;
    .registers 5
    .param p1, "hop"    # I

    .prologue
    .line 205
    const-string v1, "Hop index"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    .line 206
    invoke-virtual {p0}, Lorg/apache/http/conn/routing/HttpRoute;->getHopCount()I

    move-result v0

    .line 207
    .local v0, "hopcount":I
    if-ge p1, v0, :cond_1e

    const/4 v1, 0x1

    :goto_c
    const-string v2, "Hop index exceeds tracked route length"

    invoke-static {v1, v2}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    .line 208
    add-int/lit8 v1, v0, -0x1

    if-ge p1, v1, :cond_20

    .line 209
    iget-object v1, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/HttpHost;

    .line 211
    :goto_1d
    return-object v1

    .line 207
    :cond_1e
    const/4 v1, 0x0

    goto :goto_c

    .line 211
    :cond_20
    iget-object v1, p0, Lorg/apache/http/conn/routing/HttpRoute;->targetHost:Lorg/apache/http/HttpHost;

    goto :goto_1d
.end method

.method public final getLayerType()Lorg/apache/http/conn/routing/RouteInfo$LayerType;
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    return-object v0
.end method

.method public final getLocalAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->localAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public final getLocalSocketAddress()Ljava/net/InetSocketAddress;
    .registers 4

    .prologue
    .line 197
    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->localAddress:Ljava/net/InetAddress;

    if-eqz v0, :cond_d

    new-instance v0, Ljava/net/InetSocketAddress;

    iget-object v1, p0, Lorg/apache/http/conn/routing/HttpRoute;->localAddress:Ljava/net/InetAddress;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public final getProxyHost()Lorg/apache/http/HttpHost;
    .registers 3

    .prologue
    .line 216
    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpHost;

    :goto_15
    return-object v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public final getTargetHost()Lorg/apache/http/HttpHost;
    .registers 2

    .prologue
    .line 189
    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->targetHost:Lorg/apache/http/HttpHost;

    return-object v0
.end method

.method public final getTunnelType()Lorg/apache/http/conn/routing/RouteInfo$TunnelType;
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    return-object v0
.end method

.method public final hashCode()I
    .registers 5

    .prologue
    .line 275
    const/16 v1, 0x11

    .line 276
    .local v1, "hash":I
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->targetHost:Lorg/apache/http/HttpHost;

    invoke-static {v1, v3}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v1

    .line 277
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->localAddress:Ljava/net/InetAddress;

    invoke-static {v1, v3}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v1

    .line 278
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    if-eqz v3, :cond_29

    .line 279
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpHost;

    .line 280
    .local v0, "element":Lorg/apache/http/HttpHost;
    invoke-static {v1, v0}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v1

    .line 281
    goto :goto_18

    .line 283
    .end local v0    # "element":Lorg/apache/http/HttpHost;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_29
    iget-boolean v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->secure:Z

    invoke-static {v1, v3}, Lorg/apache/http/util/LangUtils;->hashCode(IZ)I

    move-result v1

    .line 284
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    invoke-static {v1, v3}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v1

    .line 285
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    invoke-static {v1, v3}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v1

    .line 286
    return v1
.end method

.method public final isLayered()Z
    .registers 3

    .prologue
    .line 232
    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    sget-object v1, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->LAYERED:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public final isSecure()Z
    .registers 2

    .prologue
    .line 236
    iget-boolean v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->secure:Z

    return v0
.end method

.method public final isTunnelled()Z
    .registers 3

    .prologue
    .line 224
    iget-object v0, p0, Lorg/apache/http/conn/routing/HttpRoute;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    sget-object v1, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->TUNNELLED:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 296
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/apache/http/conn/routing/HttpRoute;->getHopCount()I

    move-result v3

    mul-int/lit8 v3, v3, 0x1e

    add-int/lit8 v3, v3, 0x32

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 297
    .local v1, "cab":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->localAddress:Ljava/net/InetAddress;

    if-eqz v3, :cond_1b

    .line 298
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->localAddress:Ljava/net/InetAddress;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 299
    const-string v3, "->"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    :cond_1b
    const/16 v3, 0x7b

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 302
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    sget-object v4, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->TUNNELLED:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    if-ne v3, v4, :cond_2b

    .line 303
    const/16 v3, 0x74

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 305
    :cond_2b
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    sget-object v4, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->LAYERED:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    if-ne v3, v4, :cond_36

    .line 306
    const/16 v3, 0x6c

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 308
    :cond_36
    iget-boolean v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->secure:Z

    if-eqz v3, :cond_3f

    .line 309
    const/16 v3, 0x73

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 311
    :cond_3f
    const-string v3, "}->"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 312
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    if-eqz v3, :cond_63

    .line 313
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->proxyChain:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_4e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_63

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpHost;

    .line 314
    .local v0, "aProxyChain":Lorg/apache/http/HttpHost;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 315
    const-string v3, "->"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4e

    .line 318
    .end local v0    # "aProxyChain":Lorg/apache/http/HttpHost;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_63
    iget-object v3, p0, Lorg/apache/http/conn/routing/HttpRoute;->targetHost:Lorg/apache/http/HttpHost;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 319
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
