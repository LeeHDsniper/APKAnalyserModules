.class public final Lorg/apache/http/conn/params/ConnPerRouteBean;
.super Ljava/lang/Object;
.source "ConnPerRouteBean.java"

# interfaces
.implements Lorg/apache/http/conn/params/ConnPerRoute;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# static fields
.field public static final DEFAULT_MAX_CONNECTIONS_PER_ROUTE:I = 0x2


# instance fields
.field private volatile defaultMax:I

.field private final maxPerHostMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 64
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/apache/http/conn/params/ConnPerRouteBean;-><init>(I)V

    .line 65
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "defaultMax"    # I

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/conn/params/ConnPerRouteBean;->maxPerHostMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 60
    invoke-virtual {p0, p1}, Lorg/apache/http/conn/params/ConnPerRouteBean;->setDefaultMaxPerRoute(I)V

    .line 61
    return-void
.end method


# virtual methods
.method public getDefaultMax()I
    .registers 2

    .prologue
    .line 68
    iget v0, p0, Lorg/apache/http/conn/params/ConnPerRouteBean;->defaultMax:I

    return v0
.end method

.method public getDefaultMaxPerRoute()I
    .registers 2

    .prologue
    .line 75
    iget v0, p0, Lorg/apache/http/conn/params/ConnPerRouteBean;->defaultMax:I

    return v0
.end method

.method public getMaxForRoute(Lorg/apache/http/conn/routing/HttpRoute;)I
    .registers 4
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 90
    const-string v1, "HTTP route"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    iget-object v1, p0, Lorg/apache/http/conn/params/ConnPerRouteBean;->maxPerHostMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 92
    .local v0, "max":Ljava/lang/Integer;
    if-eqz v0, :cond_14

    .line 93
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 95
    :goto_13
    return v1

    :cond_14
    iget v1, p0, Lorg/apache/http/conn/params/ConnPerRouteBean;->defaultMax:I

    goto :goto_13
.end method

.method public setDefaultMaxPerRoute(I)V
    .registers 3
    .param p1, "max"    # I

    .prologue
    .line 79
    const-string v0, "Defautl max per route"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->positive(ILjava/lang/String;)I

    .line 80
    iput p1, p0, Lorg/apache/http/conn/params/ConnPerRouteBean;->defaultMax:I

    .line 81
    return-void
.end method

.method public setMaxForRoute(Lorg/apache/http/conn/routing/HttpRoute;I)V
    .registers 5
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "max"    # I

    .prologue
    .line 84
    const-string v0, "HTTP route"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 85
    const-string v0, "Max per route"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->positive(ILjava/lang/String;)I

    .line 86
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnPerRouteBean;->maxPerHostMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    return-void
.end method

.method public setMaxForRoutes(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Integer;>;"
    if-nez p1, :cond_3

    .line 105
    :goto_2
    return-void

    .line 103
    :cond_3
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnPerRouteBean;->maxPerHostMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 104
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnPerRouteBean;->maxPerHostMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->putAll(Ljava/util/Map;)V

    goto :goto_2
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/http/conn/params/ConnPerRouteBean;->maxPerHostMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
