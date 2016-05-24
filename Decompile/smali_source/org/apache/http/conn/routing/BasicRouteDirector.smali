.class public Lorg/apache/http/conn/routing/BasicRouteDirector;
.super Ljava/lang/Object;
.source "BasicRouteDirector.java"

# interfaces
.implements Lorg/apache/http/conn/routing/HttpRouteDirector;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected directStep(Lorg/apache/http/conn/routing/RouteInfo;Lorg/apache/http/conn/routing/RouteInfo;)I
    .registers 6
    .param p1, "plan"    # Lorg/apache/http/conn/routing/RouteInfo;
    .param p2, "fact"    # Lorg/apache/http/conn/routing/RouteInfo;

    .prologue
    const/4 v0, -0x1

    .line 95
    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->getHopCount()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_9

    .line 120
    :cond_8
    :goto_8
    return v0

    .line 98
    :cond_9
    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/http/HttpHost;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 109
    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->isSecure()Z

    move-result v1

    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->isSecure()Z

    move-result v2

    if-ne v1, v2, :cond_8

    .line 114
    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    if-eqz v1, :cond_35

    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 120
    :cond_35
    const/4 v0, 0x0

    goto :goto_8
.end method

.method protected firstStep(Lorg/apache/http/conn/routing/RouteInfo;)I
    .registers 4
    .param p1, "plan"    # Lorg/apache/http/conn/routing/RouteInfo;

    .prologue
    const/4 v0, 0x1

    .line 79
    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->getHopCount()I

    move-result v1

    if-le v1, v0, :cond_8

    const/4 v0, 0x2

    :cond_8
    return v0
.end method

.method public nextStep(Lorg/apache/http/conn/routing/RouteInfo;Lorg/apache/http/conn/routing/RouteInfo;)I
    .registers 6
    .param p1, "plan"    # Lorg/apache/http/conn/routing/RouteInfo;
    .param p2, "fact"    # Lorg/apache/http/conn/routing/RouteInfo;

    .prologue
    const/4 v2, 0x1

    .line 53
    const-string v1, "Planned route"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 55
    const/4 v0, -0x1

    .line 57
    .local v0, "step":I
    if-eqz p2, :cond_f

    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->getHopCount()I

    move-result v1

    if-ge v1, v2, :cond_14

    .line 58
    :cond_f
    invoke-virtual {p0, p1}, Lorg/apache/http/conn/routing/BasicRouteDirector;->firstStep(Lorg/apache/http/conn/routing/RouteInfo;)I

    move-result v0

    .line 65
    :goto_13
    return v0

    .line 59
    :cond_14
    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->getHopCount()I

    move-result v1

    if-le v1, v2, :cond_1f

    .line 60
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/conn/routing/BasicRouteDirector;->proxiedStep(Lorg/apache/http/conn/routing/RouteInfo;Lorg/apache/http/conn/routing/RouteInfo;)I

    move-result v0

    goto :goto_13

    .line 62
    :cond_1f
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/conn/routing/BasicRouteDirector;->directStep(Lorg/apache/http/conn/routing/RouteInfo;Lorg/apache/http/conn/routing/RouteInfo;)I

    move-result v0

    goto :goto_13
.end method

.method protected proxiedStep(Lorg/apache/http/conn/routing/RouteInfo;Lorg/apache/http/conn/routing/RouteInfo;)I
    .registers 9
    .param p1, "plan"    # Lorg/apache/http/conn/routing/RouteInfo;
    .param p2, "fact"    # Lorg/apache/http/conn/routing/RouteInfo;

    .prologue
    const/4 v3, -0x1

    .line 135
    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->getHopCount()I

    move-result v4

    const/4 v5, 0x1

    if-gt v4, v5, :cond_9

    .line 178
    :cond_8
    :goto_8
    return v3

    .line 138
    :cond_9
    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v4

    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/http/HttpHost;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 141
    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->getHopCount()I

    move-result v2

    .line 142
    .local v2, "phc":I
    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->getHopCount()I

    move-result v0

    .line 143
    .local v0, "fhc":I
    if-lt v2, v0, :cond_8

    .line 147
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_22
    add-int/lit8 v4, v0, -0x1

    if-ge v1, v4, :cond_37

    .line 148
    invoke-interface {p1, v1}, Lorg/apache/http/conn/routing/RouteInfo;->getHopTarget(I)Lorg/apache/http/HttpHost;

    move-result-object v4

    invoke-interface {p2, v1}, Lorg/apache/http/conn/routing/RouteInfo;->getHopTarget(I)Lorg/apache/http/HttpHost;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/http/HttpHost;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 147
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 153
    :cond_37
    if-le v2, v0, :cond_3b

    .line 155
    const/4 v3, 0x4

    goto :goto_8

    .line 159
    :cond_3b
    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v4

    if-eqz v4, :cond_47

    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v4

    if-eqz v4, :cond_8

    :cond_47
    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->isLayered()Z

    move-result v4

    if-eqz v4, :cond_53

    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->isLayered()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 164
    :cond_53
    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v4

    if-eqz v4, :cond_61

    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v4

    if-nez v4, :cond_61

    .line 165
    const/4 v3, 0x3

    goto :goto_8

    .line 167
    :cond_61
    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->isLayered()Z

    move-result v4

    if-eqz v4, :cond_6f

    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->isLayered()Z

    move-result v4

    if-nez v4, :cond_6f

    .line 168
    const/4 v3, 0x5

    goto :goto_8

    .line 174
    :cond_6f
    invoke-interface {p1}, Lorg/apache/http/conn/routing/RouteInfo;->isSecure()Z

    move-result v4

    invoke-interface {p2}, Lorg/apache/http/conn/routing/RouteInfo;->isSecure()Z

    move-result v5

    if-ne v4, v5, :cond_8

    .line 178
    const/4 v3, 0x0

    goto :goto_8
.end method
