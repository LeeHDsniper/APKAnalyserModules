.class public Lorg/apache/http/impl/client/AIMDBackoffManager;
.super Ljava/lang/Object;
.source "AIMDBackoffManager.java"

# interfaces
.implements Lorg/apache/http/client/BackoffManager;


# instance fields
.field private backoffFactor:D

.field private cap:I

.field private final clock:Lorg/apache/http/impl/client/Clock;

.field private final connPerRoute:Lorg/apache/http/pool/ConnPoolControl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/pool/ConnPoolControl",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            ">;"
        }
    .end annotation
.end field

.field private coolDown:J

.field private final lastRouteBackoffs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final lastRouteProbes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/apache/http/pool/ConnPoolControl;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/ConnPoolControl",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p1, "connPerRoute":Lorg/apache/http/pool/ConnPoolControl;, "Lorg/apache/http/pool/ConnPoolControl<Lorg/apache/http/conn/routing/HttpRoute;>;"
    new-instance v0, Lorg/apache/http/impl/client/SystemClock;

    invoke-direct {v0}, Lorg/apache/http/impl/client/SystemClock;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/client/AIMDBackoffManager;-><init>(Lorg/apache/http/pool/ConnPoolControl;Lorg/apache/http/impl/client/Clock;)V

    .line 76
    return-void
.end method

.method constructor <init>(Lorg/apache/http/pool/ConnPoolControl;Lorg/apache/http/impl/client/Clock;)V
    .registers 5
    .param p2, "clock"    # Lorg/apache/http/impl/client/Clock;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/ConnPoolControl",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            ">;",
            "Lorg/apache/http/impl/client/Clock;",
            ")V"
        }
    .end annotation

    .prologue
    .line 78
    .local p1, "connPerRoute":Lorg/apache/http/pool/ConnPoolControl;, "Lorg/apache/http/pool/ConnPoolControl<Lorg/apache/http/conn/routing/HttpRoute;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    const-wide/16 v0, 0x1388

    iput-wide v0, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->coolDown:J

    .line 64
    const-wide/high16 v0, 0x3fe0000000000000L

    iput-wide v0, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->backoffFactor:D

    .line 65
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->cap:I

    .line 79
    iput-object p2, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->clock:Lorg/apache/http/impl/client/Clock;

    .line 80
    iput-object p1, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->connPerRoute:Lorg/apache/http/pool/ConnPoolControl;

    .line 81
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->lastRouteProbes:Ljava/util/Map;

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->lastRouteBackoffs:Ljava/util/Map;

    .line 83
    return-void
.end method

.method private getBackedOffPoolSize(I)I
    .registers 6
    .param p1, "curr"    # I

    .prologue
    const/4 v0, 0x1

    .line 99
    if-gt p1, v0, :cond_4

    .line 102
    :goto_3
    return v0

    :cond_4
    iget-wide v0, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->backoffFactor:D

    int-to-double v2, p1

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    goto :goto_3
.end method

.method private getLastUpdate(Ljava/util/Map;Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/Long;
    .registers 7
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Ljava/lang/Long;",
            ">;",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            ")",
            "Ljava/lang/Long;"
        }
    .end annotation

    .prologue
    .line 121
    .local p1, "updates":Ljava/util/Map;, "Ljava/util/Map<Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Long;>;"
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 122
    .local v0, "lastUpdate":Ljava/lang/Long;
    if-nez v0, :cond_e

    .line 123
    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 125
    :cond_e
    return-object v0
.end method


# virtual methods
.method public backOff(Lorg/apache/http/conn/routing/HttpRoute;)V
    .registers 12
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 86
    iget-object v5, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->connPerRoute:Lorg/apache/http/pool/ConnPoolControl;

    monitor-enter v5

    .line 87
    :try_start_3
    iget-object v4, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->connPerRoute:Lorg/apache/http/pool/ConnPoolControl;

    invoke-interface {v4, p1}, Lorg/apache/http/pool/ConnPoolControl;->getMaxPerRoute(Ljava/lang/Object;)I

    move-result v0

    .line 88
    .local v0, "curr":I
    iget-object v4, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->lastRouteBackoffs:Ljava/util/Map;

    invoke-direct {p0, v4, p1}, Lorg/apache/http/impl/client/AIMDBackoffManager;->getLastUpdate(Ljava/util/Map;Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/Long;

    move-result-object v1

    .line 89
    .local v1, "lastUpdate":Ljava/lang/Long;
    iget-object v4, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->clock:Lorg/apache/http/impl/client/Clock;

    invoke-interface {v4}, Lorg/apache/http/impl/client/Clock;->getCurrentTime()J

    move-result-wide v2

    .line 90
    .local v2, "now":J
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    sub-long v6, v2, v6

    iget-wide v8, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->coolDown:J

    cmp-long v4, v6, v8

    if-gez v4, :cond_23

    .line 91
    monitor-exit v5

    .line 96
    :goto_22
    return-void

    .line 93
    :cond_23
    iget-object v4, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->connPerRoute:Lorg/apache/http/pool/ConnPoolControl;

    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/AIMDBackoffManager;->getBackedOffPoolSize(I)I

    move-result v6

    invoke-interface {v4, p1, v6}, Lorg/apache/http/pool/ConnPoolControl;->setMaxPerRoute(Ljava/lang/Object;I)V

    .line 94
    iget-object v4, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->lastRouteBackoffs:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v4, p1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    monitor-exit v5

    goto :goto_22

    .end local v0    # "curr":I
    .end local v1    # "lastUpdate":Ljava/lang/Long;
    .end local v2    # "now":J
    :catchall_37
    move-exception v4

    monitor-exit v5
    :try_end_39
    .catchall {:try_start_3 .. :try_end_39} :catchall_37

    throw v4
.end method

.method public probe(Lorg/apache/http/conn/routing/HttpRoute;)V
    .registers 14
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 106
    iget-object v7, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->connPerRoute:Lorg/apache/http/pool/ConnPoolControl;

    monitor-enter v7

    .line 107
    :try_start_3
    iget-object v6, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->connPerRoute:Lorg/apache/http/pool/ConnPoolControl;

    invoke-interface {v6, p1}, Lorg/apache/http/pool/ConnPoolControl;->getMaxPerRoute(Ljava/lang/Object;)I

    move-result v0

    .line 108
    .local v0, "curr":I
    iget v6, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->cap:I

    if-lt v0, v6, :cond_3b

    iget v3, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->cap:I

    .line 109
    .local v3, "max":I
    :goto_f
    iget-object v6, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->lastRouteProbes:Ljava/util/Map;

    invoke-direct {p0, v6, p1}, Lorg/apache/http/impl/client/AIMDBackoffManager;->getLastUpdate(Ljava/util/Map;Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/Long;

    move-result-object v2

    .line 110
    .local v2, "lastProbe":Ljava/lang/Long;
    iget-object v6, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->lastRouteBackoffs:Ljava/util/Map;

    invoke-direct {p0, v6, p1}, Lorg/apache/http/impl/client/AIMDBackoffManager;->getLastUpdate(Ljava/util/Map;Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/Long;

    move-result-object v1

    .line 111
    .local v1, "lastBackoff":Ljava/lang/Long;
    iget-object v6, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->clock:Lorg/apache/http/impl/client/Clock;

    invoke-interface {v6}, Lorg/apache/http/impl/client/Clock;->getCurrentTime()J

    move-result-wide v4

    .line 112
    .local v4, "now":J
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    sub-long v8, v4, v8

    iget-wide v10, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->coolDown:J

    cmp-long v6, v8, v10

    if-ltz v6, :cond_39

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    sub-long v8, v4, v8

    iget-wide v10, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->coolDown:J

    cmp-long v6, v8, v10

    if-gez v6, :cond_3e

    .line 113
    :cond_39
    monitor-exit v7

    .line 118
    :goto_3a
    return-void

    .line 108
    .end local v1    # "lastBackoff":Ljava/lang/Long;
    .end local v2    # "lastProbe":Ljava/lang/Long;
    .end local v3    # "max":I
    .end local v4    # "now":J
    :cond_3b
    add-int/lit8 v3, v0, 0x1

    goto :goto_f

    .line 115
    .restart local v1    # "lastBackoff":Ljava/lang/Long;
    .restart local v2    # "lastProbe":Ljava/lang/Long;
    .restart local v3    # "max":I
    .restart local v4    # "now":J
    :cond_3e
    iget-object v6, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->connPerRoute:Lorg/apache/http/pool/ConnPoolControl;

    invoke-interface {v6, p1, v3}, Lorg/apache/http/pool/ConnPoolControl;->setMaxPerRoute(Ljava/lang/Object;I)V

    .line 116
    iget-object v6, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->lastRouteProbes:Ljava/util/Map;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v6, p1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    monitor-exit v7

    goto :goto_3a

    .end local v0    # "curr":I
    .end local v1    # "lastBackoff":Ljava/lang/Long;
    .end local v2    # "lastProbe":Ljava/lang/Long;
    .end local v3    # "max":I
    .end local v4    # "now":J
    :catchall_4e
    move-exception v6

    monitor-exit v7
    :try_end_50
    .catchall {:try_start_3 .. :try_end_50} :catchall_4e

    throw v6
.end method

.method public setBackoffFactor(D)V
    .registers 6
    .param p1, "d"    # D

    .prologue
    .line 138
    const-wide/16 v0, 0x0

    cmpl-double v0, p1, v0

    if-lez v0, :cond_15

    const-wide/high16 v0, 0x3ff0000000000000L

    cmpg-double v0, p1, v0

    if-gez v0, :cond_15

    const/4 v0, 0x1

    :goto_d
    const-string v1, "Backoff factor must be 0.0 < f < 1.0"

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    .line 139
    iput-wide p1, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->backoffFactor:D

    .line 140
    return-void

    .line 138
    :cond_15
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setCooldownMillis(J)V
    .registers 6
    .param p1, "l"    # J

    .prologue
    .line 150
    iget-wide v0, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->coolDown:J

    const-string v2, "Cool down"

    invoke-static {v0, v1, v2}, Lorg/apache/http/util/Args;->positive(JLjava/lang/String;)J

    .line 151
    iput-wide p1, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->coolDown:J

    .line 152
    return-void
.end method

.method public setPerHostConnectionCap(I)V
    .registers 3
    .param p1, "cap"    # I

    .prologue
    .line 160
    const-string v0, "Per host connection cap"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->positive(ILjava/lang/String;)I

    .line 161
    iput p1, p0, Lorg/apache/http/impl/client/AIMDBackoffManager;->cap:I

    .line 162
    return-void
.end method
