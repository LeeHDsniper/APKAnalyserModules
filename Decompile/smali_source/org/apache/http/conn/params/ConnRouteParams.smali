.class public Lorg/apache/http/conn/params/ConnRouteParams;
.super Ljava/lang/Object;
.source "ConnRouteParams.java"

# interfaces
.implements Lorg/apache/http/conn/params/ConnRoutePNames;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final NO_HOST:Lorg/apache/http/HttpHost;

.field public static final NO_ROUTE:Lorg/apache/http/conn/routing/HttpRoute;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 54
    new-instance v0, Lorg/apache/http/HttpHost;

    const-string v1, "127.0.0.255"

    const/4 v2, 0x0

    const-string v3, "no-host"

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/apache/http/conn/params/ConnRouteParams;->NO_HOST:Lorg/apache/http/HttpHost;

    .line 61
    new-instance v0, Lorg/apache/http/conn/routing/HttpRoute;

    sget-object v1, Lorg/apache/http/conn/params/ConnRouteParams;->NO_HOST:Lorg/apache/http/HttpHost;

    invoke-direct {v0, v1}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;)V

    sput-object v0, Lorg/apache/http/conn/params/ConnRouteParams;->NO_ROUTE:Lorg/apache/http/conn/routing/HttpRoute;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    return-void
.end method

.method public static getDefaultProxy(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/HttpHost;
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 80
    const-string v1, "Parameters"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    const-string v1, "http.route.default-proxy"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpHost;

    .line 83
    .local v0, "proxy":Lorg/apache/http/HttpHost;
    if-eqz v0, :cond_18

    sget-object v1, Lorg/apache/http/conn/params/ConnRouteParams;->NO_HOST:Lorg/apache/http/HttpHost;

    invoke-virtual {v1, v0}, Lorg/apache/http/HttpHost;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 85
    const/4 v0, 0x0

    .line 87
    :cond_18
    return-object v0
.end method

.method public static getForcedRoute(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/conn/routing/HttpRoute;
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 118
    const-string v1, "Parameters"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 119
    const-string v1, "http.route.forced-route"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/routing/HttpRoute;

    .line 121
    .local v0, "route":Lorg/apache/http/conn/routing/HttpRoute;
    if-eqz v0, :cond_18

    sget-object v1, Lorg/apache/http/conn/params/ConnRouteParams;->NO_ROUTE:Lorg/apache/http/conn/routing/HttpRoute;

    invoke-virtual {v1, v0}, Lorg/apache/http/conn/routing/HttpRoute;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 123
    const/4 v0, 0x0

    .line 125
    :cond_18
    return-object v0
.end method

.method public static getLocalAddress(Lorg/apache/http/params/HttpParams;)Ljava/net/InetAddress;
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 157
    const-string v1, "Parameters"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 158
    const-string v1, "http.route.local-address"

    invoke-interface {p0, v1}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/InetAddress;

    .line 161
    .local v0, "local":Ljava/net/InetAddress;
    return-object v0
.end method

.method public static setDefaultProxy(Lorg/apache/http/params/HttpParams;Lorg/apache/http/HttpHost;)V
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "proxy"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 102
    const-string v0, "Parameters"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 103
    const-string v0, "http.route.default-proxy"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 104
    return-void
.end method

.method public static setForcedRoute(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/routing/HttpRoute;)V
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 140
    const-string v0, "Parameters"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 141
    const-string v0, "http.route.forced-route"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 142
    return-void
.end method

.method public static setLocalAddress(Lorg/apache/http/params/HttpParams;Ljava/net/InetAddress;)V
    .registers 3
    .param p0, "params"    # Lorg/apache/http/params/HttpParams;
    .param p1, "local"    # Ljava/net/InetAddress;

    .prologue
    .line 173
    const-string v0, "Parameters"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 174
    const-string v0, "http.route.local-address"

    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 175
    return-void
.end method
