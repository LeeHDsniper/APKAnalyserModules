.class public Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;
.super Lorg/apache/http/impl/conn/AbstractPoolEntry;
.source "BasicPoolEntry.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final created:J

.field private expiry:J

.field private updated:J

.field private final validUntil:J


# direct methods
.method public constructor <init>(Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/conn/routing/HttpRoute;)V
    .registers 10
    .param p1, "op"    # Lorg/apache/http/conn/ClientConnectionOperator;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 72
    const-wide/16 v4, -0x1

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;-><init>(Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/conn/routing/HttpRoute;JLjava/util/concurrent/TimeUnit;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/conn/routing/HttpRoute;JLjava/util/concurrent/TimeUnit;)V
    .registers 11
    .param p1, "op"    # Lorg/apache/http/conn/ClientConnectionOperator;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p3, "connTTL"    # J
    .param p5, "timeunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 87
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/conn/AbstractPoolEntry;-><init>(Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 88
    const-string v0, "HTTP route"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 89
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->created:J

    .line 90
    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-lez v0, :cond_22

    .line 91
    iget-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->created:J

    invoke-virtual {p5, p3, p4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->validUntil:J

    .line 95
    :goto_1d
    iget-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->validUntil:J

    iput-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->expiry:J

    .line 96
    return-void

    .line 93
    :cond_22
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->validUntil:J

    goto :goto_1d
.end method

.method public constructor <init>(Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/ref/ReferenceQueue;)V
    .registers 6
    .param p1, "op"    # Lorg/apache/http/conn/ClientConnectionOperator;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/conn/ClientConnectionOperator;",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p3, "queue":Ljava/lang/ref/ReferenceQueue;, "Ljava/lang/ref/ReferenceQueue<Ljava/lang/Object;>;"
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/conn/AbstractPoolEntry;-><init>(Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 58
    const-string v0, "HTTP route"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 59
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->created:J

    .line 60
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->validUntil:J

    .line 61
    iget-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->validUntil:J

    iput-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->expiry:J

    .line 62
    return-void
.end method


# virtual methods
.method protected final getConnection()Lorg/apache/http/conn/OperatedClientConnection;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->connection:Lorg/apache/http/conn/OperatedClientConnection;

    return-object v0
.end method

.method public getCreated()J
    .registers 3

    .prologue
    .line 119
    iget-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->created:J

    return-wide v0
.end method

.method public getExpiry()J
    .registers 3

    .prologue
    .line 133
    iget-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->expiry:J

    return-wide v0
.end method

.method protected final getPlannedRoute()Lorg/apache/http/conn/routing/HttpRoute;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lorg/apache/http/impl/conn/AbstractPoolEntry;->route:Lorg/apache/http/conn/routing/HttpRoute;

    return-object v0
.end method

.method public getUpdated()J
    .registers 3

    .prologue
    .line 126
    iget-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->updated:J

    return-wide v0
.end method

.method public getValidUntil()J
    .registers 3

    .prologue
    .line 137
    iget-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->validUntil:J

    return-wide v0
.end method

.method protected final getWeakRef()Lorg/apache/http/impl/conn/tsccm/BasicPoolEntryRef;
    .registers 2

    .prologue
    .line 107
    const/4 v0, 0x0

    return-object v0
.end method

.method public isExpired(J)Z
    .registers 6
    .param p1, "now"    # J

    .prologue
    .line 158
    iget-wide v0, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->expiry:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method protected shutdownEntry()V
    .registers 1

    .prologue
    .line 112
    invoke-super {p0}, Lorg/apache/http/impl/conn/AbstractPoolEntry;->shutdownEntry()V

    .line 113
    return-void
.end method

.method public updateExpiry(JLjava/util/concurrent/TimeUnit;)V
    .registers 11
    .param p1, "time"    # J
    .param p3, "timeunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 144
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->updated:J

    .line 146
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-lez v2, :cond_1d

    .line 147
    iget-wide v2, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->updated:J

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    add-long v0, v2, v4

    .line 151
    .local v0, "newExpiry":J
    :goto_14
    iget-wide v2, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->validUntil:J

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/http/impl/conn/tsccm/BasicPoolEntry;->expiry:J

    .line 152
    return-void

    .line 149
    .end local v0    # "newExpiry":J
    :cond_1d
    const-wide v0, 0x7fffffffffffffffL

    .restart local v0    # "newExpiry":J
    goto :goto_14
.end method
