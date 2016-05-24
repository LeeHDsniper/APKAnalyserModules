.class Lorg/apache/http/impl/conn/HttpPoolEntry;
.super Lorg/apache/http/pool/PoolEntry;
.source "HttpPoolEntry.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/http/pool/PoolEntry",
        "<",
        "Lorg/apache/http/conn/routing/HttpRoute;",
        "Lorg/apache/http/conn/OperatedClientConnection;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final tracker:Lorg/apache/http/conn/routing/RouteTracker;


# direct methods
.method public constructor <init>(Lorg/apache/commons/logging/Log;Ljava/lang/String;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/OperatedClientConnection;JLjava/util/concurrent/TimeUnit;)V
    .registers 15
    .param p1, "log"    # Lorg/apache/commons/logging/Log;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p4, "conn"    # Lorg/apache/http/conn/OperatedClientConnection;
    .param p5, "timeToLive"    # J
    .param p7, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 56
    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-wide v4, p5

    move-object v6, p7

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/pool/PoolEntry;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    .line 57
    iput-object p1, p0, Lorg/apache/http/impl/conn/HttpPoolEntry;->log:Lorg/apache/commons/logging/Log;

    .line 58
    new-instance v0, Lorg/apache/http/conn/routing/RouteTracker;

    invoke-direct {v0, p3}, Lorg/apache/http/conn/routing/RouteTracker;-><init>(Lorg/apache/http/conn/routing/HttpRoute;)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/HttpPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    .line 59
    return-void
.end method


# virtual methods
.method public close()V
    .registers 5

    .prologue
    .line 90
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/OperatedClientConnection;

    .line 92
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    :try_start_6
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_9} :catch_a

    .line 96
    :goto_9
    return-void

    .line 93
    :catch_a
    move-exception v1

    .line 94
    .local v1, "ex":Ljava/io/IOException;
    iget-object v2, p0, Lorg/apache/http/impl/conn/HttpPoolEntry;->log:Lorg/apache/commons/logging/Log;

    const-string v3, "I/O error closing connection"

    invoke-interface {v2, v3, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_9
.end method

.method getEffectiveRoute()Lorg/apache/http/conn/routing/HttpRoute;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/http/impl/conn/HttpPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    invoke-virtual {v0}, Lorg/apache/http/conn/routing/RouteTracker;->toRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v0

    return-object v0
.end method

.method getPlannedRoute()Lorg/apache/http/conn/routing/HttpRoute;
    .registers 2

    .prologue
    .line 75
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/routing/HttpRoute;

    return-object v0
.end method

.method getTracker()Lorg/apache/http/conn/routing/RouteTracker;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/http/impl/conn/HttpPoolEntry;->tracker:Lorg/apache/http/conn/routing/RouteTracker;

    return-object v0
.end method

.method public isClosed()Z
    .registers 3

    .prologue
    .line 84
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/OperatedClientConnection;

    .line 85
    .local v0, "conn":Lorg/apache/http/conn/OperatedClientConnection;
    invoke-interface {v0}, Lorg/apache/http/conn/OperatedClientConnection;->isOpen()Z

    move-result v1

    if-nez v1, :cond_e

    const/4 v1, 0x1

    :goto_d
    return v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public isExpired(J)Z
    .registers 10
    .param p1, "now"    # J

    .prologue
    .line 63
    invoke-super {p0, p1, p2}, Lorg/apache/http/pool/PoolEntry;->isExpired(J)Z

    move-result v0

    .line 64
    .local v0, "expired":Z
    if-eqz v0, :cond_39

    iget-object v1, p0, Lorg/apache/http/impl/conn/HttpPoolEntry;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_39

    .line 65
    iget-object v1, p0, Lorg/apache/http/impl/conn/HttpPoolEntry;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Connection "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " expired @ "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/util/Date;

    invoke-virtual {p0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getExpiry()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 67
    :cond_39
    return v0
.end method
