.class public Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;
.super Ljava/lang/Object;
.source "PoolingHttpClientConnectionManager.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Lorg/apache/http/conn/HttpClientConnectionManager;
.implements Lorg/apache/http/pool/ConnPoolControl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$InternalConnectionFactory;,
        Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Closeable;",
        "Lorg/apache/http/conn/HttpClientConnectionManager;",
        "Lorg/apache/http/pool/ConnPoolControl",
        "<",
        "Lorg/apache/http/conn/routing/HttpRoute;",
        ">;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

.field private final connectionOperator:Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final pool:Lorg/apache/http/impl/conn/CPool;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 103
    invoke-static {}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->getDefaultRegistry()Lorg/apache/http/config/Registry;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Registry;)V

    .line 104
    return-void
.end method

.method public constructor <init>(JLjava/util/concurrent/TimeUnit;)V
    .registers 13
    .param p1, "timeToLive"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    const/4 v3, 0x0

    .line 107
    invoke-static {}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->getDefaultRegistry()Lorg/apache/http/config/Registry;

    move-result-object v2

    move-object v1, p0

    move-object v4, v3

    move-object v5, v3

    move-wide v6, p1

    move-object v8, p3

    invoke-direct/range {v1 .. v8}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Registry;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;JLjava/util/concurrent/TimeUnit;)V

    .line 108
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/config/Registry;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Registry",
            "<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "socketFactoryRegistry":Lorg/apache/http/config/Registry;, "Lorg/apache/http/config/Registry<Lorg/apache/http/conn/socket/ConnectionSocketFactory;>;"
    const/4 v0, 0x0

    .line 112
    invoke-direct {p0, p1, v0, v0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Registry;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/DnsResolver;)V

    .line 113
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/config/Registry;Lorg/apache/http/conn/DnsResolver;)V
    .registers 4
    .param p2, "dnsResolver"    # Lorg/apache/http/conn/DnsResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Registry",
            "<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;",
            "Lorg/apache/http/conn/DnsResolver;",
            ")V"
        }
    .end annotation

    .prologue
    .line 118
    .local p1, "socketFactoryRegistry":Lorg/apache/http/config/Registry;, "Lorg/apache/http/config/Registry<Lorg/apache/http/conn/socket/ConnectionSocketFactory;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Registry;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/DnsResolver;)V

    .line 119
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/config/Registry;Lorg/apache/http/conn/HttpConnectionFactory;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Registry",
            "<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;",
            "Lorg/apache/http/conn/HttpConnectionFactory",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 124
    .local p1, "socketFactoryRegistry":Lorg/apache/http/config/Registry;, "Lorg/apache/http/config/Registry<Lorg/apache/http/conn/socket/ConnectionSocketFactory;>;"
    .local p2, "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Registry;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/DnsResolver;)V

    .line 125
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/config/Registry;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/DnsResolver;)V
    .registers 13
    .param p3, "dnsResolver"    # Lorg/apache/http/conn/DnsResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Registry",
            "<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;",
            "Lorg/apache/http/conn/HttpConnectionFactory",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;",
            "Lorg/apache/http/conn/DnsResolver;",
            ")V"
        }
    .end annotation

    .prologue
    .line 136
    .local p1, "socketFactoryRegistry":Lorg/apache/http/config/Registry;, "Lorg/apache/http/config/Registry<Lorg/apache/http/conn/socket/ConnectionSocketFactory;>;"
    .local p2, "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    const/4 v4, 0x0

    const-wide/16 v6, -0x1

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v1 .. v8}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Registry;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;JLjava/util/concurrent/TimeUnit;)V

    .line 137
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/config/Registry;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;JLjava/util/concurrent/TimeUnit;)V
    .registers 15
    .param p3, "schemePortResolver"    # Lorg/apache/http/conn/SchemePortResolver;
    .param p4, "dnsResolver"    # Lorg/apache/http/conn/DnsResolver;
    .param p5, "timeToLive"    # J
    .param p7, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Registry",
            "<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;",
            "Lorg/apache/http/conn/HttpConnectionFactory",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;",
            "Lorg/apache/http/conn/SchemePortResolver;",
            "Lorg/apache/http/conn/DnsResolver;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")V"
        }
    .end annotation

    .prologue
    .line 145
    .local p1, "socketFactoryRegistry":Lorg/apache/http/config/Registry;, "Lorg/apache/http/config/Registry<Lorg/apache/http/conn/socket/ConnectionSocketFactory;>;"
    .local p2, "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    .line 146
    new-instance v0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    .line 147
    new-instance v0, Lorg/apache/http/impl/conn/CPool;

    new-instance v1, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$InternalConnectionFactory;

    iget-object v2, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-direct {v1, v2, p2}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$InternalConnectionFactory;-><init>(Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;Lorg/apache/http/conn/HttpConnectionFactory;)V

    const/4 v2, 0x2

    const/16 v3, 0x14

    move-wide v4, p5

    move-object v6, p7

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/impl/conn/CPool;-><init>(Lorg/apache/http/pool/ConnFactory;IIJLjava/util/concurrent/TimeUnit;)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    .line 149
    new-instance v0, Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

    invoke-direct {v0, p1, p3, p4}, Lorg/apache/http/impl/conn/HttpClientConnectionOperator;-><init>(Lorg/apache/http/config/Lookup;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->connectionOperator:Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

    .line 151
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/HttpConnectionFactory;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/conn/HttpConnectionFactory",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 129
    .local p1, "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    invoke-static {}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->getDefaultRegistry()Lorg/apache/http/config/Registry;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Registry;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/DnsResolver;)V

    .line 130
    return-void
.end method

.method constructor <init>(Lorg/apache/http/impl/conn/CPool;Lorg/apache/http/config/Lookup;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;)V
    .registers 6
    .param p1, "pool"    # Lorg/apache/http/impl/conn/CPool;
    .param p3, "schemePortResolver"    # Lorg/apache/http/conn/SchemePortResolver;
    .param p4, "dnsResolver"    # Lorg/apache/http/conn/DnsResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/impl/conn/CPool;",
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;",
            "Lorg/apache/http/conn/SchemePortResolver;",
            "Lorg/apache/http/conn/DnsResolver;",
            ")V"
        }
    .end annotation

    .prologue
    .line 158
    .local p2, "socketFactoryRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/conn/socket/ConnectionSocketFactory;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    .line 159
    new-instance v0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    .line 160
    iput-object p1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    .line 161
    new-instance v0, Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

    invoke-direct {v0, p2, p3, p4}, Lorg/apache/http/impl/conn/HttpClientConnectionOperator;-><init>(Lorg/apache/http/config/Lookup;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->connectionOperator:Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

    .line 163
    return-void
.end method

.method private format(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Ljava/lang/String;
    .registers 6
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v1, "[route: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    if-eqz p2, :cond_25

    .line 182
    const-string v1, "[state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    :cond_25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private format(Lorg/apache/http/impl/conn/CPoolEntry;)Ljava/lang/String;
    .registers 6
    .param p1, "entry"    # Lorg/apache/http/impl/conn/CPoolEntry;

    .prologue
    .line 200
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 201
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v2, "[id: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/http/impl/conn/CPoolEntry;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    const-string v2, "[route: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/http/impl/conn/CPoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    invoke-virtual {p1}, Lorg/apache/http/impl/conn/CPoolEntry;->getState()Ljava/lang/Object;

    move-result-object v1

    .line 204
    .local v1, "state":Ljava/lang/Object;
    if-eqz v1, :cond_40

    .line 205
    const-string v2, "[state: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    :cond_40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private formatStats(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;
    .registers 8
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v3}, Lorg/apache/http/impl/conn/CPool;->getTotalStats()Lorg/apache/http/pool/PoolStats;

    move-result-object v2

    .line 190
    .local v2, "totals":Lorg/apache/http/pool/PoolStats;
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v3, p1}, Lorg/apache/http/impl/conn/CPool;->getStats(Ljava/lang/Object;)Lorg/apache/http/pool/PoolStats;

    move-result-object v1

    .line 191
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

    .line 192
    const-string v3, "route allocated: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lorg/apache/http/pool/PoolStats;->getLeased()I

    move-result v4

    invoke-virtual {v1}, Lorg/apache/http/pool/PoolStats;->getAvailable()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 193
    const-string v3, " of "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lorg/apache/http/pool/PoolStats;->getMax()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    const-string v3, "total allocated: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/apache/http/pool/PoolStats;->getLeased()I

    move-result v4

    invoke-virtual {v2}, Lorg/apache/http/pool/PoolStats;->getAvailable()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    const-string v3, " of "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/apache/http/pool/PoolStats;->getMax()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getDefaultRegistry()Lorg/apache/http/config/Registry;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/http/config/Registry",
            "<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    invoke-static {}, Lorg/apache/http/config/RegistryBuilder;->create()Lorg/apache/http/config/RegistryBuilder;

    move-result-object v0

    const-string v1, "http"

    invoke-static {}, Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;->getSocketFactory()Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v0

    const-string v1, "https"

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLConnectionSocketFactory;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/config/RegistryBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/config/RegistryBuilder;->build()Lorg/apache/http/config/Registry;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 175
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->shutdown()V

    .line 176
    return-void
.end method

.method public closeExpiredConnections()V
    .registers 3

    .prologue
    .line 362
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v1, "Closing expired connections"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 363
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPool;->closeExpired()V

    .line 364
    return-void
.end method

.method public closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 7
    .param p1, "idleTimeout"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 355
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 356
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

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

    .line 358
    :cond_2a
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/http/impl/conn/CPool;->closeIdle(JLjava/util/concurrent/TimeUnit;)V

    .line 359
    return-void
.end method

.method public connect(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)V
    .registers 13
    .param p1, "managedConn"    # Lorg/apache/http/HttpClientConnection;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p3, "connectTimeout"    # I
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 293
    const-string v0, "Managed Connection"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 294
    const-string v0, "HTTP route"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 296
    monitor-enter p1

    .line 297
    :try_start_b
    invoke-static {p1}, Lorg/apache/http/impl/conn/CPoolProxy;->getPoolEntry(Lorg/apache/http/HttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;

    move-result-object v7

    .line 298
    .local v7, "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    invoke-virtual {v7}, Lorg/apache/http/impl/conn/CPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/conn/ManagedHttpClientConnection;

    .line 299
    .local v1, "conn":Lorg/apache/http/conn/ManagedHttpClientConnection;
    monitor-exit p1
    :try_end_16
    .catchall {:try_start_b .. :try_end_16} :catchall_3e

    .line 301
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v0

    if-eqz v0, :cond_41

    .line 302
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    .line 306
    .local v2, "host":Lorg/apache/http/HttpHost;
    :goto_20
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getLocalSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v3

    .line 307
    .local v3, "localAddress":Ljava/net/InetSocketAddress;
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-virtual {v0, v2}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->getSocketConfig(Lorg/apache/http/HttpHost;)Lorg/apache/http/config/SocketConfig;

    move-result-object v5

    .line 308
    .local v5, "socketConfig":Lorg/apache/http/config/SocketConfig;
    if-nez v5, :cond_32

    .line 309
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->getDefaultSocketConfig()Lorg/apache/http/config/SocketConfig;

    move-result-object v5

    .line 311
    :cond_32
    if-nez v5, :cond_36

    .line 312
    sget-object v5, Lorg/apache/http/config/SocketConfig;->DEFAULT:Lorg/apache/http/config/SocketConfig;

    .line 314
    :cond_36
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->connectionOperator:Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

    move v4, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lorg/apache/http/impl/conn/HttpClientConnectionOperator;->connect(Lorg/apache/http/conn/ManagedHttpClientConnection;Lorg/apache/http/HttpHost;Ljava/net/InetSocketAddress;ILorg/apache/http/config/SocketConfig;Lorg/apache/http/protocol/HttpContext;)V

    .line 316
    return-void

    .line 299
    .end local v1    # "conn":Lorg/apache/http/conn/ManagedHttpClientConnection;
    .end local v2    # "host":Lorg/apache/http/HttpHost;
    .end local v3    # "localAddress":Ljava/net/InetSocketAddress;
    .end local v5    # "socketConfig":Lorg/apache/http/config/SocketConfig;
    .end local v7    # "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    :catchall_3e
    move-exception v0

    :try_start_3f
    monitor-exit p1
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_3e

    throw v0

    .line 304
    .restart local v1    # "conn":Lorg/apache/http/conn/ManagedHttpClientConnection;
    .restart local v7    # "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    :cond_41
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    .restart local v2    # "host":Lorg/apache/http/HttpHost;
    goto :goto_20
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 168
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->shutdown()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_7

    .line 170
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 172
    return-void

    .line 170
    :catchall_7
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method public getConnectionConfig(Lorg/apache/http/HttpHost;)Lorg/apache/http/config/ConnectionConfig;
    .registers 3
    .param p1, "host"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 423
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->getConnectionConfig(Lorg/apache/http/HttpHost;)Lorg/apache/http/config/ConnectionConfig;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultConnectionConfig()Lorg/apache/http/config/ConnectionConfig;
    .registers 2

    .prologue
    .line 407
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->getDefaultConnectionConfig()Lorg/apache/http/config/ConnectionConfig;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultMaxPerRoute()I
    .registers 2

    .prologue
    .line 375
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPool;->getDefaultMaxPerRoute()I

    move-result v0

    return v0
.end method

.method public getDefaultSocketConfig()Lorg/apache/http/config/SocketConfig;
    .registers 2

    .prologue
    .line 399
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->getDefaultSocketConfig()Lorg/apache/http/config/SocketConfig;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getMaxPerRoute(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 85
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->getMaxPerRoute(Lorg/apache/http/conn/routing/HttpRoute;)I

    move-result v0

    return v0
.end method

.method public getMaxPerRoute(Lorg/apache/http/conn/routing/HttpRoute;)I
    .registers 3
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 383
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/CPool;->getMaxPerRoute(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public getMaxTotal()I
    .registers 2

    .prologue
    .line 367
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPool;->getMaxTotal()I

    move-result v0

    return v0
.end method

.method public getSocketConfig(Lorg/apache/http/HttpHost;)Lorg/apache/http/config/SocketConfig;
    .registers 3
    .param p1, "host"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 415
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->getSocketConfig(Lorg/apache/http/HttpHost;)Lorg/apache/http/config/SocketConfig;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getStats(Ljava/lang/Object;)Lorg/apache/http/pool/PoolStats;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 85
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->getStats(Lorg/apache/http/conn/routing/HttpRoute;)Lorg/apache/http/pool/PoolStats;

    move-result-object v0

    return-object v0
.end method

.method public getStats(Lorg/apache/http/conn/routing/HttpRoute;)Lorg/apache/http/pool/PoolStats;
    .registers 3
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 395
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/CPool;->getStats(Ljava/lang/Object;)Lorg/apache/http/pool/PoolStats;

    move-result-object v0

    return-object v0
.end method

.method public getTotalStats()Lorg/apache/http/pool/PoolStats;
    .registers 2

    .prologue
    .line 391
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPool;->getTotalStats()Lorg/apache/http/pool/PoolStats;

    move-result-object v0

    return-object v0
.end method

.method protected leaseConnection(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/HttpClientConnection;
    .registers 11
    .param p2, "timeout"    # J
    .param p4, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<",
            "Lorg/apache/http/impl/conn/CPoolEntry;",
            ">;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lorg/apache/http/HttpClientConnection;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Lorg/apache/http/conn/ConnectionPoolTimeoutException;
        }
    .end annotation

    .prologue
    .line 240
    .local p1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lorg/apache/http/impl/conn/CPoolEntry;>;"
    :try_start_0
    invoke-interface {p1, p2, p3, p4}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/impl/conn/CPoolEntry;

    .line 241
    .local v0, "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    if-eqz v0, :cond_e

    invoke-interface {p1}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 242
    :cond_e
    new-instance v2, Ljava/lang/InterruptedException;

    invoke-direct {v2}, Ljava/lang/InterruptedException;-><init>()V

    throw v2
    :try_end_14
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_14} :catch_14

    .line 249
    .end local v0    # "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    :catch_14
    move-exception v1

    .line 250
    .local v1, "ex":Ljava/util/concurrent/TimeoutException;
    new-instance v2, Lorg/apache/http/conn/ConnectionPoolTimeoutException;

    const-string v3, "Timeout waiting for connection from pool"

    invoke-direct {v2, v3}, Lorg/apache/http/conn/ConnectionPoolTimeoutException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 244
    .end local v1    # "ex":Ljava/util/concurrent/TimeoutException;
    .restart local v0    # "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    :cond_1d
    :try_start_1d
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_60

    const/4 v2, 0x1

    :goto_24
    const-string v3, "Pool entry with no connection"

    invoke-static {v2, v3}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 245
    iget-object v2, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_5b

    .line 246
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Connection leased: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, v0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->format(Lorg/apache/http/impl/conn/CPoolEntry;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/conn/routing/HttpRoute;

    invoke-direct {p0, v2}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->formatStats(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 248
    :cond_5b
    invoke-static {v0}, Lorg/apache/http/impl/conn/CPoolProxy;->newProxy(Lorg/apache/http/impl/conn/CPoolEntry;)Lorg/apache/http/HttpClientConnection;
    :try_end_5e
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1d .. :try_end_5e} :catch_14

    move-result-object v2

    return-object v2

    .line 244
    :cond_60
    const/4 v2, 0x0

    goto :goto_24
.end method

.method public releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V
    .registers 15
    .param p1, "managedConn"    # Lorg/apache/http/HttpClientConnection;
    .param p2, "state"    # Ljava/lang/Object;
    .param p3, "keepalive"    # J
    .param p5, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 258
    const-string v3, "Managed connection"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 259
    monitor-enter p1

    .line 260
    :try_start_6
    invoke-static {p1}, Lorg/apache/http/impl/conn/CPoolProxy;->detach(Lorg/apache/http/HttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;

    move-result-object v1

    .line 261
    .local v1, "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    if-nez v1, :cond_e

    .line 262
    monitor-exit p1

    .line 286
    .end local p5    # "tunit":Ljava/util/concurrent/TimeUnit;
    :goto_d
    return-void

    .line 264
    .restart local p5    # "tunit":Ljava/util/concurrent/TimeUnit;
    :cond_e
    invoke-virtual {v1}, Lorg/apache/http/impl/conn/CPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/ManagedHttpClientConnection;
    :try_end_14
    .catchall {:try_start_6 .. :try_end_14} :catchall_bd

    .line 266
    .local v0, "conn":Lorg/apache/http/conn/ManagedHttpClientConnection;
    :try_start_14
    invoke-interface {v0}, Lorg/apache/http/conn/ManagedHttpClientConnection;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_76

    .line 267
    invoke-virtual {v1, p2}, Lorg/apache/http/impl/conn/CPoolEntry;->setState(Ljava/lang/Object;)V

    .line 268
    if-eqz p5, :cond_c0

    .end local p5    # "tunit":Ljava/util/concurrent/TimeUnit;
    :goto_1f
    invoke-virtual {v1, p3, p4, p5}, Lorg/apache/http/impl/conn/CPoolEntry;->updateExpiry(JLjava/util/concurrent/TimeUnit;)V

    .line 269
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_76

    .line 271
    const-wide/16 v4, 0x0

    cmp-long v3, p3, v4

    if-lez v3, :cond_c4

    .line 272
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    long-to-double v4, p3

    const-wide v6, 0x408f400000000000L

    div-double/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " seconds"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 276
    .local v2, "s":Ljava/lang/String;
    :goto_50
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Connection "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0, v1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->format(Lorg/apache/http/impl/conn/CPoolEntry;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " can be kept alive "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_76
    .catchall {:try_start_14 .. :try_end_76} :catchall_c9

    .line 280
    .end local v2    # "s":Ljava/lang/String;
    :cond_76
    :try_start_76
    iget-object v4, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedHttpClientConnection;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_c7

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/CPoolEntry;->isRouteComplete()Z

    move-result v3

    if-eqz v3, :cond_c7

    const/4 v3, 0x1

    :goto_85
    invoke-virtual {v4, v1, v3}, Lorg/apache/http/impl/conn/CPool;->release(Lorg/apache/http/pool/PoolEntry;Z)V

    .line 281
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_ba

    .line 282
    iget-object v4, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Connection released: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0, v1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->format(Lorg/apache/http/impl/conn/CPoolEntry;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/CPoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/conn/routing/HttpRoute;

    invoke-direct {p0, v3}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->formatStats(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 285
    :cond_ba
    monitor-exit p1

    goto/16 :goto_d

    .end local v0    # "conn":Lorg/apache/http/conn/ManagedHttpClientConnection;
    .end local v1    # "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    :catchall_bd
    move-exception v3

    monitor-exit p1
    :try_end_bf
    .catchall {:try_start_76 .. :try_end_bf} :catchall_bd

    throw v3

    .line 268
    .restart local v0    # "conn":Lorg/apache/http/conn/ManagedHttpClientConnection;
    .restart local v1    # "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    .restart local p5    # "tunit":Ljava/util/concurrent/TimeUnit;
    :cond_c0
    :try_start_c0
    sget-object p5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    goto/16 :goto_1f

    .line 274
    .end local p5    # "tunit":Ljava/util/concurrent/TimeUnit;
    :cond_c4
    const-string v2, "indefinitely"
    :try_end_c6
    .catchall {:try_start_c0 .. :try_end_c6} :catchall_c9

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_50

    .line 280
    .end local v2    # "s":Ljava/lang/String;
    :cond_c7
    const/4 v3, 0x0

    goto :goto_85

    :catchall_c9
    move-exception v3

    move-object v4, v3

    :try_start_cb
    iget-object v5, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedHttpClientConnection;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_110

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/CPoolEntry;->isRouteComplete()Z

    move-result v3

    if-eqz v3, :cond_110

    const/4 v3, 0x1

    :goto_da
    invoke-virtual {v5, v1, v3}, Lorg/apache/http/impl/conn/CPool;->release(Lorg/apache/http/pool/PoolEntry;Z)V

    .line 281
    iget-object v3, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_10f

    .line 282
    iget-object v5, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Connection released: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0, v1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->format(Lorg/apache/http/impl/conn/CPoolEntry;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/CPoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/conn/routing/HttpRoute;

    invoke-direct {p0, v3}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->formatStats(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_10f
    throw v4
    :try_end_110
    .catchall {:try_start_cb .. :try_end_110} :catchall_bd

    .line 280
    :cond_110
    const/4 v3, 0x0

    goto :goto_da
.end method

.method public requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ConnectionRequest;
    .registers 7
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 213
    const-string v1, "HTTP route"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 214
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 215
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Connection request: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->format(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, p1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->formatStats(Lorg/apache/http/conn/routing/HttpRoute;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 217
    :cond_31
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, p2, v2}, Lorg/apache/http/impl/conn/CPool;->lease(Ljava/lang/Object;Ljava/lang/Object;Lorg/apache/http/concurrent/FutureCallback;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 218
    .local v0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lorg/apache/http/impl/conn/CPoolEntry;>;"
    new-instance v1, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;

    invoke-direct {v1, p0, v0}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$1;-><init>(Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;Ljava/util/concurrent/Future;)V

    return-object v1
.end method

.method public routeComplete(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V
    .registers 6
    .param p1, "managedConn"    # Lorg/apache/http/HttpClientConnection;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    const-string v1, "Managed Connection"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 337
    const-string v1, "HTTP route"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 338
    monitor-enter p1

    .line 339
    :try_start_b
    invoke-static {p1}, Lorg/apache/http/impl/conn/CPoolProxy;->getPoolEntry(Lorg/apache/http/HttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;

    move-result-object v0

    .line 340
    .local v0, "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    invoke-virtual {v0}, Lorg/apache/http/impl/conn/CPoolEntry;->markRouteComplete()V

    .line 341
    monitor-exit p1

    .line 342
    return-void

    .line 341
    .end local v0    # "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    :catchall_14
    move-exception v1

    monitor-exit p1
    :try_end_16
    .catchall {:try_start_b .. :try_end_16} :catchall_14

    throw v1
.end method

.method public setConnectionConfig(Lorg/apache/http/HttpHost;Lorg/apache/http/config/ConnectionConfig;)V
    .registers 4
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "connectionConfig"    # Lorg/apache/http/config/ConnectionConfig;

    .prologue
    .line 427
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->setConnectionConfig(Lorg/apache/http/HttpHost;Lorg/apache/http/config/ConnectionConfig;)V

    .line 428
    return-void
.end method

.method public setDefaultConnectionConfig(Lorg/apache/http/config/ConnectionConfig;)V
    .registers 3
    .param p1, "defaultConnectionConfig"    # Lorg/apache/http/config/ConnectionConfig;

    .prologue
    .line 411
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->setDefaultConnectionConfig(Lorg/apache/http/config/ConnectionConfig;)V

    .line 412
    return-void
.end method

.method public setDefaultMaxPerRoute(I)V
    .registers 3
    .param p1, "max"    # I

    .prologue
    .line 379
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/CPool;->setDefaultMaxPerRoute(I)V

    .line 380
    return-void
.end method

.method public setDefaultSocketConfig(Lorg/apache/http/config/SocketConfig;)V
    .registers 3
    .param p1, "defaultSocketConfig"    # Lorg/apache/http/config/SocketConfig;

    .prologue
    .line 403
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->setDefaultSocketConfig(Lorg/apache/http/config/SocketConfig;)V

    .line 404
    return-void
.end method

.method public bridge synthetic setMaxPerRoute(Ljava/lang/Object;I)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # I

    .prologue
    .line 85
    check-cast p1, Lorg/apache/http/conn/routing/HttpRoute;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->setMaxPerRoute(Lorg/apache/http/conn/routing/HttpRoute;I)V

    return-void
.end method

.method public setMaxPerRoute(Lorg/apache/http/conn/routing/HttpRoute;I)V
    .registers 4
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "max"    # I

    .prologue
    .line 387
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/conn/CPool;->setMaxPerRoute(Ljava/lang/Object;I)V

    .line 388
    return-void
.end method

.method public setMaxTotal(I)V
    .registers 3
    .param p1, "max"    # I

    .prologue
    .line 371
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/conn/CPool;->setMaxTotal(I)V

    .line 372
    return-void
.end method

.method public setSocketConfig(Lorg/apache/http/HttpHost;Lorg/apache/http/config/SocketConfig;)V
    .registers 4
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "socketConfig"    # Lorg/apache/http/config/SocketConfig;

    .prologue
    .line 419
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->configData:Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->setSocketConfig(Lorg/apache/http/HttpHost;Lorg/apache/http/config/SocketConfig;)V

    .line 420
    return-void
.end method

.method public shutdown()V
    .registers 4

    .prologue
    .line 345
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Connection manager is shutting down"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 347
    :try_start_7
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->pool:Lorg/apache/http/impl/conn/CPool;

    invoke-virtual {v1}, Lorg/apache/http/impl/conn/CPool;->shutdown()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_14

    .line 351
    :goto_c
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Connection manager shut down"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 352
    return-void

    .line 348
    :catch_14
    move-exception v0

    .line 349
    .local v0, "ex":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "I/O exception shutting down connection manager"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_c
.end method

.method public upgrade(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V
    .registers 8
    .param p1, "managedConn"    # Lorg/apache/http/HttpClientConnection;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 322
    const-string v2, "Managed Connection"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 323
    const-string v2, "HTTP route"

    invoke-static {p2, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 325
    monitor-enter p1

    .line 326
    :try_start_b
    invoke-static {p1}, Lorg/apache/http/impl/conn/CPoolProxy;->getPoolEntry(Lorg/apache/http/HttpClientConnection;)Lorg/apache/http/impl/conn/CPoolEntry;

    move-result-object v1

    .line 327
    .local v1, "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    invoke-virtual {v1}, Lorg/apache/http/impl/conn/CPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/ManagedHttpClientConnection;

    .line 328
    .local v0, "conn":Lorg/apache/http/conn/ManagedHttpClientConnection;
    monitor-exit p1
    :try_end_16
    .catchall {:try_start_b .. :try_end_16} :catchall_20

    .line 329
    iget-object v2, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;->connectionOperator:Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    invoke-virtual {v2, v0, v3, p3}, Lorg/apache/http/impl/conn/HttpClientConnectionOperator;->upgrade(Lorg/apache/http/conn/ManagedHttpClientConnection;Lorg/apache/http/HttpHost;Lorg/apache/http/protocol/HttpContext;)V

    .line 330
    return-void

    .line 328
    .end local v0    # "conn":Lorg/apache/http/conn/ManagedHttpClientConnection;
    .end local v1    # "entry":Lorg/apache/http/impl/conn/CPoolEntry;
    :catchall_20
    move-exception v2

    :try_start_21
    monitor-exit p1
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_20

    throw v2
.end method
