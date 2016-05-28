.class public Lorg/apache/http/impl/conn/PoolingClientConnectionManager;
.super Ljava/lang/Object;
.source "PoolingClientConnectionManager.java"

# interfaces
.implements Lorg/apache/http/conn/ClientConnectionManager;
.implements Lorg/apache/http/pool/ConnPoolControl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/conn/ClientConnectionManager;",
        "Lorg/apache/http/pool/ConnPoolControl",
        "<",
        "Lorg/apache/http/conn/routing/HttpRoute;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final dnsResolver:Lorg/apache/http/conn/DnsResolver;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final operator:Lorg/apache/http/conn/ClientConnectionOperator;

.field private final pool:Lorg/apache/http/impl/conn/HttpConnPool;

.field private final schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 95
    invoke-static {}, Lorg/apache/http/impl/conn/SchemeRegistryFactory;->createDefault()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V
    .registers 5
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    .line 87
    const-wide/16 v0, -0x1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;JLjava/util/concurrent/TimeUnit;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;JLjava/util/concurrent/TimeUnit;)V
    .registers 11
    .param p1, "schemeRegistry"    # Lorg/apache/http/conn/scheme/SchemeRegistry;
    .param p2, "timeToLive"    # J
    .param p4, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 101
    new-instance v5, Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;

    invoke-direct {v5}, Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/conn/DnsResolver;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/conn/DnsResolver;)V
    .registers 16
    .param p1, "schemeRegistry"    # Lorg/apache/http/conn/scheme/SchemeRegistry;
    .param p2, "timeToLive"    # J
    .param p4, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "dnsResolver"    # Lorg/apache/http/conn/DnsResolver;

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    .line 108
    const-string v0, "Scheme registry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 109
    const-string v0, "DNS resolver"

    invoke-static {p5, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 110
    iput-object p1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 111
    iput-object p5, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->dnsResolver:Lorg/apache/http/conn/DnsResolver;

    .line 112
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->createConnectionOperator(Lorg/apache/http/conn/scheme/SchemeRegistry;)Lorg/apache/http/conn/ClientConnectionOperator;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->operator:Lorg/apache/http/conn/ClientConnectionOperator;

    .line 113
    new-instance v1, Lorg/apache/http/impl/conn/HttpConnPool;

    iget-object v2, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->operator:Lorg/apache/http/conn/ClientConnectionOperator;

    const/4 v4, 0x2

    const/16 v5, 0x14

    move-wide v6, p2

    move-object v8, p4

    invoke-direct/range {v1 .. v8}, Lorg/apache/http/impl/conn/HttpConnPool;-><init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/conn/ClientConnectionOperator;IIJLjava/util/concurrent/TimeUnit;)V

    iput-object v1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    .line 114
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;Lorg/apache/http/conn/DnsResolver;)V
    .registers 9
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;
    .param p2, "dnsResolver"    # Lorg/apache/http/conn/DnsResolver;

    .prologue
    .line 91
    const-wide/16 v2, -0x1

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;JLjava/util/concurrent/TimeUnit;Lorg/apache/http/conn/DnsResolver;)V

    .line 92
    return-void
.end method

.method private format(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Ljava/lang/String;
    .registers 6
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 146
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v1, "[route: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    if-eqz p2, :cond_25

    .line 149
    const-string v1, "[state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    :cond_25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private format(Lorg/apache/http/impl/conn/HttpPoolEntry;)Ljava/lang/String;
    .registers 6
    .param p1, "entry"    # Lorg/apache/http/impl/conn/HttpPoolEntry;

    .prologue
    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v2, "[id: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    const-string v2, "[route: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    invoke-virtual {p1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getState()Ljava/lang/Object;

    move-result-object v1

    .line 171
    .local v1, "state":Ljava/lang/Object;
    if-eqz v1, :cond_40

    .line 172
    const-string v2, "[state: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    :cond_40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private formatStats(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;
    .registers 8
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v3}, Lorg/apache/http/impl/conn/HttpConnPool;->getTotalStats()Lorg/apache/http/pool/PoolStats;

    move-result-object v2

    .line 157
    .local v2, "totals":Lorg/apache/http/pool/PoolStats;
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v3, p1}, Lorg/apache/http/impl/conn/HttpConnPool;->getStats(Ljava/lang/Object;)Lorg/apache/http/pool/PoolStats;

    move-result-object v1

    .line 158
    .local v1, "stats":Lorg/apache/http/pool/PoolStats;
    const-string v3, "[total kept alive: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/apache/http/pool/PoolStats;->getAvailable()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    const-string v3, "route allocated: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lorg/apache/http/pool/PoolStats;->getLeased()I

    move-result v4

    invoke-virtual {v1}, Lorg/apache/http/pool/PoolStats;->getAvailable()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    const-string v3, " of "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lorg/apache/http/pool/PoolStats;->getMax()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    const-string v3, "total allocated: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/apache/http/pool/PoolStats;->getLeased()I

    move-result v4

    invoke-virtual {v2}, Lorg/apache/http/pool/PoolStats;->getAvailable()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 162
    const-string v3, " of "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/apache/http/pool/PoolStats;->getMax()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public closeExpiredConnections()V
    .registers 3

    .prologue
    .line 292
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v1, "Closing expired connections"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 293
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpConnPool;->closeExpired()V

    .line 294
    return-void
.end method

.method public closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 7
    .param p1, "idleTimeout"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 285
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 286
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Closing connections idle longer than "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 288
    :cond_2a
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/http/impl/conn/HttpConnPool;->closeIdle(JLjava/util/concurrent/TimeUnit;)V

    .line 289
    return-void
.end method

.method protected createConnectionOperator(Lorg/apache/http/conn/scheme/SchemeRegistry;)Lorg/apache/http/conn/ClientConnectionOperator;
    .registers 4
    .param p1, "schreg"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    .line 138
    new-instance v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;

    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->dnsResolver:Lorg/apache/http/conn/DnsResolver;

    invoke-direct {v0, p1, v1}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;Lorg/apache/http/conn/DnsResolver;)V

    return-object v0
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 119
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->shutdown()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_7

    .line 121
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 123
    return-void

    .line 121
    :catchall_7
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getDefaultMaxPerRoute()I
    .registers 2

    .prologue
    .line 305
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpConnPool;->getDefaultMaxPerRoute()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getMaxPerRoute(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 71
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->getMaxPerRoute(Lorg/apache/http/conn/routing/HttpRoute;)I

    move-result v0

    return v0
.end method

.method public getMaxPerRoute(Lorg/apache/http/conn/routing/HttpRoute;)I
    .registers 3
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 313
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/HttpConnPool;->getMaxPerRoute(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getMaxTotal()I
    .registers 2

    .prologue
    .line 297
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpConnPool;->getMaxTotal()I

    move-result v0

    return v0
.end method

.method public getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    return-object v0
.end method

.method public bridge synthetic getStats(Ljava/lang/Object;)Lorg/apache/http/pool/PoolStats;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 71
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->getStats(Lorg/apache/http/conn/routing/HttpRoute;)Lorg/apache/http/pool/PoolStats;

    move-result-object v0

    return-object v0
.end method

.method public getStats(Lorg/apache/http/conn/routing/HttpRoute;)Lorg/apache/http/pool/PoolStats;
    .registers 3
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 325
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/HttpConnPool;->getStats(Ljava/lang/Object;)Lorg/apache/http/pool/PoolStats;

    move-result-object v0

    return-object v0
.end method

.method public getTotalStats()Lorg/apache/http/pool/PoolStats;
    .registers 2

    .prologue
    .line 321
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpConnPool;->getTotalStats()Lorg/apache/http/pool/PoolStats;

    move-result-object v0

    return-object v0
.end method

.method leaseConnection(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/conn/ManagedClientConnection;
    .registers 11
    .param p2, "timeout"    # J
    .param p4, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<",
            "Lorg/apache/http/impl/conn/HttpPoolEntry;",
            ">;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lorg/apache/http/conn/ManagedClientConnection;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Lorg/apache/http/conn/ConnectionPoolTimeoutException;
        }
    .end annotation

    .prologue
    .line 208
    .local p1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lorg/apache/http/impl/conn/HttpPoolEntry;>;"
    :try_start_0
    invoke-interface {p1, p2, p3, p4}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/impl/conn/HttpPoolEntry;

    .line 209
    .local v1, "entry":Lorg/apache/http/impl/conn/HttpPoolEntry;
    if-eqz v1, :cond_e

    invoke-interface {p1}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_29

    .line 210
    :cond_e
    new-instance v3, Ljava/lang/InterruptedException;

    invoke-direct {v3}, Ljava/lang/InterruptedException;-><init>()V

    throw v3
    :try_end_14
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_14} :catch_14
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_14} :catch_71

    .line 217
    .end local v1    # "entry":Lorg/apache/http/impl/conn/HttpPoolEntry;
    :catch_14
    move-exception v2

    .line 218
    .local v2, "ex":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v2}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 219
    .local v0, "cause":Ljava/lang/Throwable;
    if-nez v0, :cond_1c

    .line 220
    move-object v0, v2

    .line 222
    :cond_1c
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Unexpected exception leasing connection from pool"

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 224
    new-instance v3, Ljava/lang/InterruptedException;

    invoke-direct {v3}, Ljava/lang/InterruptedException;-><init>()V

    throw v3

    .line 212
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v2    # "ex":Ljava/util/concurrent/ExecutionException;
    .restart local v1    # "entry":Lorg/apache/http/impl/conn/HttpPoolEntry;
    :cond_29
    :try_start_29
    invoke-virtual {v1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_6f

    const/4 v3, 0x1

    :goto_30
    const-string v4, "Pool entry with no connection"

    invoke-static {v3, v4}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 213
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_67

    .line 214
    iget-object v4, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Connection leased: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0, v1}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->format(Lorg/apache/http/impl/conn/HttpPoolEntry;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/conn/routing/HttpRoute;

    invoke-direct {p0, v3}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->formatStats(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 216
    :cond_67
    new-instance v3, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    iget-object v4, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->operator:Lorg/apache/http/conn/ClientConnectionOperator;

    invoke-direct {v3, p0, v4, v1}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/conn/ClientConnectionOperator;Lorg/apache/http/impl/conn/HttpPoolEntry;)V
    :try_end_6e
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_29 .. :try_end_6e} :catch_14
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_29 .. :try_end_6e} :catch_71

    return-object v3

    .line 212
    :cond_6f
    const/4 v3, 0x0

    goto :goto_30

    .line 225
    .end local v1    # "entry":Lorg/apache/http/impl/conn/HttpPoolEntry;
    :catch_71
    move-exception v2

    .line 226
    .local v2, "ex":Ljava/util/concurrent/TimeoutException;
    new-instance v3, Lorg/apache/http/conn/ConnectionPoolTimeoutException;

    const-string v4, "Timeout waiting for connection from pool"

    invoke-direct {v3, v4}, Lorg/apache/http/conn/ConnectionPoolTimeoutException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public releaseConnection(Lorg/apache/http/conn/ManagedClientConnection;JLjava/util/concurrent/TimeUnit;)V
    .registers 13
    .param p1, "conn"    # Lorg/apache/http/conn/ManagedClientConnection;
    .param p2, "keepalive"    # J
    .param p4, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 233
    instance-of v4, p1, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    const-string v5, "Connection class mismatch, connection not obtained from this manager"

    invoke-static {v4, v5}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    move-object v2, p1

    .line 235
    check-cast v2, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;

    .line 236
    .local v2, "managedConn":Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->getManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v4

    if-ne v4, p0, :cond_1f

    const/4 v4, 0x1

    :goto_11
    const-string v5, "Connection not obtained from this manager"

    invoke-static {v4, v5}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 237
    monitor-enter v2

    .line 238
    :try_start_17
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->detach()Lorg/apache/http/impl/conn/HttpPoolEntry;

    move-result-object v0

    .line 239
    .local v0, "entry":Lorg/apache/http/impl/conn/HttpPoolEntry;
    if-nez v0, :cond_21

    .line 240
    monitor-exit v2
    :try_end_1e
    .catchall {:try_start_17 .. :try_end_1e} :catchall_cb

    .line 272
    :goto_1e
    return-void

    .line 236
    .end local v0    # "entry":Lorg/apache/http/impl/conn/HttpPoolEntry;
    :cond_1f
    const/4 v4, 0x0

    goto :goto_11

    .line 243
    .restart local v0    # "entry":Lorg/apache/http/impl/conn/HttpPoolEntry;
    :cond_21
    :try_start_21
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->isOpen()Z

    move-result v4

    if-eqz v4, :cond_30

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->isMarkedReusable()Z
    :try_end_2a
    .catchall {:try_start_21 .. :try_end_2a} :catchall_e0

    move-result v4

    if-nez v4, :cond_30

    .line 245
    :try_start_2d
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->shutdown()V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_30} :catch_ce
    .catchall {:try_start_2d .. :try_end_30} :catchall_e0

    .line 253
    :cond_30
    :goto_30
    :try_start_30
    invoke-virtual {v2}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->isMarkedReusable()Z

    move-result v4

    if-eqz v4, :cond_8d

    .line 254
    if-eqz p4, :cond_eb

    move-object v4, p4

    :goto_39
    invoke-virtual {v0, p2, p3, v4}, Lorg/apache/http/impl/conn/HttpPoolEntry;->updateExpiry(JLjava/util/concurrent/TimeUnit;)V

    .line 255
    iget-object v4, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_8d

    .line 257
    const-wide/16 v4, 0x0

    cmp-long v4, p2, v4

    if-lez v4, :cond_ef

    .line 258
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 262
    .local v3, "s":Ljava/lang/String;
    :goto_67
    iget-object v4, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Connection "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->format(Lorg/apache/http/impl/conn/HttpPoolEntry;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " can be kept alive "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_8d
    .catchall {:try_start_30 .. :try_end_8d} :catchall_e0

    .line 266
    .end local v3    # "s":Ljava/lang/String;
    :cond_8d
    :try_start_8d
    iget-object v4, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->isMarkedReusable()Z

    move-result v5

    invoke-virtual {v4, v0, v5}, Lorg/apache/http/impl/conn/HttpConnPool;->release(Lorg/apache/http/pool/PoolEntry;Z)V

    .line 268
    iget-object v4, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_c8

    .line 269
    iget-object v5, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Connection released: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->format(Lorg/apache/http/impl/conn/HttpPoolEntry;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/HttpPoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/conn/routing/HttpRoute;

    invoke-direct {p0, v4}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->formatStats(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v5, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 271
    :cond_c8
    monitor-exit v2

    goto/16 :goto_1e

    .end local v0    # "entry":Lorg/apache/http/impl/conn/HttpPoolEntry;
    :catchall_cb
    move-exception v4

    monitor-exit v2
    :try_end_cd
    .catchall {:try_start_8d .. :try_end_cd} :catchall_cb

    throw v4

    .line 246
    .restart local v0    # "entry":Lorg/apache/http/impl/conn/HttpPoolEntry;
    :catch_ce
    move-exception v1

    .line 247
    .local v1, "iox":Ljava/io/IOException;
    :try_start_cf
    iget-object v4, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_30

    .line 248
    iget-object v4, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "I/O exception shutting down released connection"

    invoke-interface {v4, v5, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_de
    .catchall {:try_start_cf .. :try_end_de} :catchall_e0

    goto/16 :goto_30

    .line 266
    .end local v1    # "iox":Ljava/io/IOException;
    :catchall_e0
    move-exception v4

    :try_start_e1
    iget-object v5, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v2}, Lorg/apache/http/impl/conn/ManagedClientConnectionImpl;->isMarkedReusable()Z

    move-result v6

    invoke-virtual {v5, v0, v6}, Lorg/apache/http/impl/conn/HttpConnPool;->release(Lorg/apache/http/pool/PoolEntry;Z)V

    throw v4
    :try_end_eb
    .catchall {:try_start_e1 .. :try_end_eb} :catchall_cb

    .line 254
    :cond_eb
    :try_start_eb
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    goto/16 :goto_39

    .line 260
    :cond_ef
    const-string v3, "indefinitely"
    :try_end_f1
    .catchall {:try_start_eb .. :try_end_f1} :catchall_e0

    .restart local v3    # "s":Ljava/lang/String;
    goto/16 :goto_67
.end method

.method public requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ClientConnectionRequest;
    .registers 7
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 180
    const-string v1, "HTTP route"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 181
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 182
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Connection request: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->format(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p1}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->formatStats(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 184
    :cond_31
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v1, p1, p2}, Lorg/apache/http/impl/conn/HttpConnPool;->lease(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 186
    .local v0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lorg/apache/http/impl/conn/HttpPoolEntry;>;"
    new-instance v1, Lorg/apache/http/impl/conn/PoolingClientConnectionManager$1;

    invoke-direct {v1, p0, v0}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager$1;-><init>(Lorg/apache/http/impl/conn/PoolingClientConnectionManager;Ljava/util/concurrent/Future;)V

    return-object v1
.end method

.method public setDefaultMaxPerRoute(I)V
    .registers 3
    .param p1, "max"    # I

    .prologue
    .line 309
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/HttpConnPool;->setDefaultMaxPerRoute(I)V

    .line 310
    return-void
.end method

.method public bridge synthetic setMaxPerRoute(Ljava/lang/Object;I)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # I

    .prologue
    .line 71
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->setMaxPerRoute(Lorg/apache/http/conn/routing/HttpRoute;I)V

    return-void
.end method

.method public setMaxPerRoute(Lorg/apache/http/conn/routing/HttpRoute;I)V
    .registers 4
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "max"    # I

    .prologue
    .line 317
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/conn/HttpConnPool;->setMaxPerRoute(Ljava/lang/Object;I)V

    .line 318
    return-void
.end method

.method public setMaxTotal(I)V
    .registers 3
    .param p1, "max"    # I

    .prologue
    .line 301
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/HttpConnPool;->setMaxTotal(I)V

    .line 302
    return-void
.end method

.method public shutdown()V
    .registers 4

    .prologue
    .line 275
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Connection manager is shutting down"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 277
    :try_start_7
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->pool:Lorg/apache/http/impl/conn/HttpConnPool;

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/HttpConnPool;->shutdown()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_14

    .line 281
    :goto_c
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Connection manager shut down"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 282
    return-void

    .line 278
    :catch_14
    move-exception v0

    .line 279
    .local v0, "ex":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "I/O exception shutting down connection manager"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_c
.end method
