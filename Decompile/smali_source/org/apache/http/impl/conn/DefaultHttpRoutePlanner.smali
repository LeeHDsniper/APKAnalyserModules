.class public Lorg/apache/http/impl/conn/DefaultHttpRoutePlanner;
.super Ljava/lang/Object;
.source "DefaultHttpRoutePlanner.java"

# interfaces
.implements Lorg/apache/http/conn/routing/HttpRoutePlanner;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field protected final schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;


# direct methods
.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V
    .registers 3
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    const-string v0, "Scheme registry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 78
    iput-object p1, p0, Lorg/apache/http/impl/conn/DefaultHttpRoutePlanner;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 79
    return-void
.end method


# virtual methods
.method public determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;
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
    .line 86
    const-string v7, "HTTP request"

    invoke-static {p2, v7}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 89
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/http/conn/params/ConnRouteParams;->getForcedRoute(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v3

    .line 91
    .local v3, "route":Lorg/apache/http/conn/routing/HttpRoute;
    if-eqz v3, :cond_11

    move-object v4, v3

    .line 120
    .end local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .local v4, "route":Lorg/apache/http/conn/routing/HttpRoute;
    :goto_10
    return-object v4

    .line 98
    .end local v4    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :cond_11
    const-string v7, "Target host"

    invoke-static {p1, v7}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/http/conn/params/ConnRouteParams;->getLocalAddress(Lorg/apache/http/params/HttpParams;)Ljava/net/InetAddress;

    move-result-object v1

    .line 102
    .local v1, "local":Ljava/net/InetAddress;
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/http/conn/params/ConnRouteParams;->getDefaultProxy(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/HttpHost;

    move-result-object v2

    .line 107
    .local v2, "proxy":Lorg/apache/http/HttpHost;
    :try_start_26
    iget-object v7, p0, Lorg/apache/http/impl/conn/DefaultHttpRoutePlanner;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Ljava/lang/String;)Lorg/apache/http/conn/scheme/Scheme;
    :try_end_2f
    .catch Ljava/lang/IllegalStateException; {:try_start_26 .. :try_end_2f} :catch_3d

    move-result-object v5

    .line 113
    .local v5, "schm":Lorg/apache/http/conn/scheme/Scheme;
    invoke-virtual {v5}, Lorg/apache/http/conn/scheme/Scheme;->isLayered()Z

    move-result v6

    .line 115
    .local v6, "secure":Z
    if-nez v2, :cond_48

    .line 116
    new-instance v3, Lorg/apache/http/conn/routing/HttpRoute;

    .end local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-direct {v3, p1, v1, v6}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Z)V

    .restart local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :goto_3b
    move-object v4, v3

    .line 120
    .end local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v4    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    goto :goto_10

    .line 108
    .end local v4    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v5    # "schm":Lorg/apache/http/conn/scheme/Scheme;
    .end local v6    # "secure":Z
    .restart local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :catch_3d
    move-exception v0

    .line 109
    .local v0, "ex":Ljava/lang/IllegalStateException;
    new-instance v7, Lorg/apache/http/HttpException;

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 118
    .end local v0    # "ex":Ljava/lang/IllegalStateException;
    .restart local v5    # "schm":Lorg/apache/http/conn/scheme/Scheme;
    .restart local v6    # "secure":Z
    :cond_48
    new-instance v3, Lorg/apache/http/conn/routing/HttpRoute;

    .end local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-direct {v3, p1, v1, v2, v6}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/HttpHost;Z)V

    .restart local v3    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    goto :goto_3b
.end method
