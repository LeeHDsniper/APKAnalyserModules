.class public Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;
.super Ljava/lang/Object;
.source "BasicHttpClientConnectionManager.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Lorg/apache/http/conn/HttpClientConnectionManager;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private conn:Lorg/apache/http/conn/ManagedHttpClientConnection;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private connConfig:Lorg/apache/http/config/ConnectionConfig;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final connFactory:Lorg/apache/http/conn/HttpConnectionFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/conn/HttpConnectionFactory",
            "<",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/conn/ManagedHttpClientConnection;",
            ">;"
        }
    .end annotation
.end field

.field private final connectionOperator:Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

.field private expiry:J
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private leased:Z
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final log:Lorg/apache/commons/logging/Log;

.field private route:Lorg/apache/http/conn/routing/HttpRoute;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private volatile shutdown:Z
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private socketConfig:Lorg/apache/http/config/SocketConfig;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private state:Ljava/lang/Object;
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private updated:J
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 146
    invoke-static {}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->getDefaultRegistry()Lorg/apache/http/config/Registry;

    move-result-object v0

    invoke-direct {p0, v0, v1, v1, v1}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Lookup;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;)V

    .line 147
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/config/Lookup;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Lookup",
            "<",
            "Lorg/apache/http/conn/socket/ConnectionSocketFactory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "socketFactoryRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/conn/socket/ConnectionSocketFactory;>;"
    const/4 v0, 0x0

    .line 142
    invoke-direct {p0, p1, v0, v0, v0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Lookup;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;)V

    .line 143
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/config/Lookup;Lorg/apache/http/conn/HttpConnectionFactory;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Lookup",
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
    .local p1, "socketFactoryRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/conn/socket/ConnectionSocketFactory;>;"
    .local p2, "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    const/4 v0, 0x0

    .line 137
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;-><init>(Lorg/apache/http/config/Lookup;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;)V

    .line 138
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/config/Lookup;Lorg/apache/http/conn/HttpConnectionFactory;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;)V
    .registers 7
    .param p3, "schemePortResolver"    # Lorg/apache/http/conn/SchemePortResolver;
    .param p4, "dnsResolver"    # Lorg/apache/http/conn/DnsResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/config/Lookup",
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
            ")V"
        }
    .end annotation

    .prologue
    .line 125
    .local p1, "socketFactoryRegistry":Lorg/apache/http/config/Lookup;, "Lorg/apache/http/config/Lookup<Lorg/apache/http/conn/socket/ConnectionSocketFactory;>;"
    .local p2, "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    .line 126
    new-instance v0, Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

    invoke-direct {v0, p1, p3, p4}, Lorg/apache/http/impl/conn/HttpClientConnectionOperator;-><init>(Lorg/apache/http/config/Lookup;Lorg/apache/http/conn/SchemePortResolver;Lorg/apache/http/conn/DnsResolver;)V

    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->connectionOperator:Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

    .line 128
    if-eqz p2, :cond_28

    .end local p2    # "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    :goto_16
    iput-object p2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->connFactory:Lorg/apache/http/conn/HttpConnectionFactory;

    .line 129
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->expiry:J

    .line 130
    sget-object v0, Lorg/apache/http/config/SocketConfig;->DEFAULT:Lorg/apache/http/config/SocketConfig;

    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->socketConfig:Lorg/apache/http/config/SocketConfig;

    .line 131
    sget-object v0, Lorg/apache/http/config/ConnectionConfig;->DEFAULT:Lorg/apache/http/config/ConnectionConfig;

    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->connConfig:Lorg/apache/http/config/ConnectionConfig;

    .line 132
    return-void

    .line 128
    .restart local p2    # "connFactory":Lorg/apache/http/conn/HttpConnectionFactory;, "Lorg/apache/http/conn/HttpConnectionFactory<Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/conn/ManagedHttpClientConnection;>;"
    :cond_28
    sget-object p2, Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;->INSTANCE:Lorg/apache/http/impl/conn/ManagedHttpClientConnectionFactory;

    goto :goto_16
.end method

.method private checkExpiry()V
    .registers 7

    .prologue
    .line 234
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    if-eqz v0, :cond_38

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->expiry:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_38

    .line 235
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 236
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Connection expired @ "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    iget-wide v4, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->expiry:J

    invoke-direct {v2, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 238
    :cond_35
    invoke-direct {p0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->closeConnection()V

    .line 240
    :cond_38
    return-void
.end method

.method private closeConnection()V
    .registers 4

    .prologue
    .line 206
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    if-eqz v1, :cond_13

    .line 207
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Closing connection"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 209
    :try_start_b
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    invoke-interface {v1}, Lorg/apache/http/conn/ManagedHttpClientConnection;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_14

    .line 215
    :cond_10
    :goto_10
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    .line 217
    :cond_13
    return-void

    .line 210
    :catch_14
    move-exception v0

    .line 211
    .local v0, "iox":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 212
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "I/O exception closing connection"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_10
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
    .line 114
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

.method private shutdownConnection()V
    .registers 4

    .prologue
    .line 220
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    if-eqz v1, :cond_13

    .line 221
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Shutting down connection"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 223
    :try_start_b
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    invoke-interface {v1}, Lorg/apache/http/conn/ManagedHttpClientConnection;->shutdown()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_14

    .line 229
    :cond_10
    :goto_10
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    .line 231
    :cond_13
    return-void

    .line 224
    :catch_14
    move-exception v0

    .line 225
    .local v0, "iox":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 226
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "I/O exception shutting down connection"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_10
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 159
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->shutdown()V

    .line 160
    return-void
.end method

.method public declared-synchronized closeExpiredConnections()V
    .registers 2

    .prologue
    .line 339
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->shutdown:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_f

    if-eqz v0, :cond_7

    .line 345
    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    .line 342
    :cond_7
    :try_start_7
    iget-boolean v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->leased:Z

    if-nez v0, :cond_5

    .line 343
    invoke-direct {p0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->checkExpiry()V
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_f

    goto :goto_5

    .line 339
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 11
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 348
    monitor-enter p0

    :try_start_1
    const-string v4, "Time unit"

    invoke-static {p3, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 349
    iget-boolean v4, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->shutdown:Z
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_2c

    if-eqz v4, :cond_c

    .line 362
    :cond_a
    :goto_a
    monitor-exit p0

    return-void

    .line 352
    :cond_c
    :try_start_c
    iget-boolean v4, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->leased:Z

    if-nez v4, :cond_a

    .line 353
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    .line 354
    .local v2, "time":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_1c

    .line 355
    const-wide/16 v2, 0x0

    .line 357
    :cond_1c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v4, v2

    .line 358
    .local v0, "deadline":J
    iget-wide v4, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->updated:J

    cmp-long v4, v4, v0

    if-gtz v4, :cond_a

    .line 359
    invoke-direct {p0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->closeConnection()V
    :try_end_2b
    .catchall {:try_start_c .. :try_end_2b} :catchall_2c

    goto :goto_a

    .line 348
    .end local v0    # "deadline":J
    .end local v2    # "time":J
    :catchall_2c
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public connect(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)V
    .registers 12
    .param p1, "conn"    # Lorg/apache/http/HttpClientConnection;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p3, "connectTimeout"    # I
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    const-string v0, "Connection"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 309
    const-string v0, "HTTP route"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 310
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    if-ne p1, v0, :cond_2e

    const/4 v0, 0x1

    :goto_f
    const-string v1, "Connection not obtained from this manager"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 312
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v0

    if-eqz v0, :cond_30

    .line 313
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    .line 317
    .local v2, "host":Lorg/apache/http/HttpHost;
    :goto_1e
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getLocalSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v3

    .line 318
    .local v3, "localAddress":Ljava/net/InetSocketAddress;
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->connectionOperator:Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    iget-object v5, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->socketConfig:Lorg/apache/http/config/SocketConfig;

    move v4, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lorg/apache/http/impl/conn/HttpClientConnectionOperator;->connect(Lorg/apache/http/conn/ManagedHttpClientConnection;Lorg/apache/http/HttpHost;Ljava/net/InetSocketAddress;ILorg/apache/http/config/SocketConfig;Lorg/apache/http/protocol/HttpContext;)V

    .line 320
    return-void

    .line 310
    .end local v2    # "host":Lorg/apache/http/HttpHost;
    .end local v3    # "localAddress":Ljava/net/InetSocketAddress;
    :cond_2e
    const/4 v0, 0x0

    goto :goto_f

    .line 315
    :cond_30
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    .restart local v2    # "host":Lorg/apache/http/HttpHost;
    goto :goto_1e
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 152
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->shutdown()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_7

    .line 154
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 156
    return-void

    .line 154
    :catchall_7
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method declared-synchronized getConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/HttpClientConnection;
    .registers 8
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 243
    monitor-enter p0

    :try_start_3
    iget-boolean v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->shutdown:Z

    if-nez v2, :cond_67

    move v2, v0

    :goto_8
    const-string v3, "Connection manager has been shut down"

    invoke-static {v2, v3}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 244
    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 245
    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Get connection for route "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 247
    :cond_2d
    iget-boolean v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->leased:Z

    if-nez v2, :cond_69

    :goto_31
    const-string v1, "Connection is still allocated"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 248
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->route:Lorg/apache/http/conn/routing/HttpRoute;

    invoke-static {v0, p1}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->state:Ljava/lang/Object;

    invoke-static {v0, p2}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_49

    .line 249
    :cond_46
    invoke-direct {p0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->closeConnection()V

    .line 251
    :cond_49
    iput-object p1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->route:Lorg/apache/http/conn/routing/HttpRoute;

    .line 252
    iput-object p2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->state:Ljava/lang/Object;

    .line 253
    invoke-direct {p0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->checkExpiry()V

    .line 254
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    if-nez v0, :cond_60

    .line 255
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->connFactory:Lorg/apache/http/conn/HttpConnectionFactory;

    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->connConfig:Lorg/apache/http/config/ConnectionConfig;

    invoke-interface {v0, p1, v1}, Lorg/apache/http/conn/HttpConnectionFactory;->create(Ljava/lang/Object;Lorg/apache/http/config/ConnectionConfig;)Lorg/apache/http/HttpConnection;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/ManagedHttpClientConnection;

    iput-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    .line 257
    :cond_60
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->leased:Z

    .line 258
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;
    :try_end_65
    .catchall {:try_start_3 .. :try_end_65} :catchall_6b

    monitor-exit p0

    return-object v0

    :cond_67
    move v2, v1

    .line 243
    goto :goto_8

    :cond_69
    move v0, v1

    .line 247
    goto :goto_31

    .line 243
    :catchall_6b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getConnectionConfig()Lorg/apache/http/config/ConnectionConfig;
    .registers 2

    .prologue
    .line 179
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->connConfig:Lorg/apache/http/config/ConnectionConfig;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getRoute()Lorg/apache/http/conn/routing/HttpRoute;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->route:Lorg/apache/http/conn/routing/HttpRoute;

    return-object v0
.end method

.method public declared-synchronized getSocketConfig()Lorg/apache/http/config/SocketConfig;
    .registers 2

    .prologue
    .line 171
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->socketConfig:Lorg/apache/http/config/SocketConfig;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getState()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->state:Ljava/lang/Object;

    return-object v0
.end method

.method public declared-synchronized releaseConnection(Lorg/apache/http/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V
    .registers 13
    .param p1, "conn"    # Lorg/apache/http/HttpClientConnection;
    .param p2, "state"    # Ljava/lang/Object;
    .param p3, "keepalive"    # J
    .param p5, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x0

    .line 265
    monitor-enter p0

    :try_start_4
    const-string v2, "Connection"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 266
    iget-object v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    if-ne p1, v2, :cond_e

    const/4 v1, 0x1

    :cond_e
    const-string v2, "Connection not obtained from this manager"

    invoke-static {v1, v2}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 267
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 268
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Releasing connection "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 270
    :cond_33
    iget-boolean v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->shutdown:Z

    if-eqz v1, :cond_3c

    .line 271
    invoke-direct {p0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->shutdownConnection()V
    :try_end_3a
    .catchall {:try_start_4 .. :try_end_3a} :catchall_5e

    .line 301
    :goto_3a
    monitor-exit p0

    return-void

    .line 275
    :cond_3c
    :try_start_3c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->updated:J

    .line 276
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    invoke-interface {v1}, Lorg/apache/http/conn/ManagedHttpClientConnection;->isOpen()Z

    move-result v1

    if-nez v1, :cond_61

    .line 277
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    .line 278
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->route:Lorg/apache/http/conn/routing/HttpRoute;

    .line 279
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    .line 280
    const-wide v2, 0x7fffffffffffffffL

    iput-wide v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->expiry:J
    :try_end_5a
    .catchall {:try_start_3c .. :try_end_5a} :catchall_b2

    .line 299
    :goto_5a
    const/4 v1, 0x0

    :try_start_5b
    iput-boolean v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->leased:Z
    :try_end_5d
    .catchall {:try_start_5b .. :try_end_5d} :catchall_5e

    goto :goto_3a

    .line 265
    :catchall_5e
    move-exception v1

    monitor-exit p0

    throw v1

    .line 282
    :cond_61
    :try_start_61
    iput-object p2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->state:Ljava/lang/Object;

    .line 283
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_a4

    .line 285
    cmp-long v1, p3, v4

    if-lez v1, :cond_b7

    .line 286
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 290
    .local v0, "s":Ljava/lang/String;
    :goto_8c
    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Connection can be kept alive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 292
    .end local v0    # "s":Ljava/lang/String;
    :cond_a4
    cmp-long v1, p3, v4

    if-lez v1, :cond_ba

    .line 293
    iget-wide v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->updated:J

    invoke-virtual {p5, p3, p4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->expiry:J
    :try_end_b1
    .catchall {:try_start_61 .. :try_end_b1} :catchall_b2

    goto :goto_5a

    .line 299
    :catchall_b2
    move-exception v1

    const/4 v2, 0x0

    :try_start_b4
    iput-boolean v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->leased:Z

    throw v1
    :try_end_b7
    .catchall {:try_start_b4 .. :try_end_b7} :catchall_5e

    .line 288
    :cond_b7
    :try_start_b7
    const-string v0, "indefinitely"

    .restart local v0    # "s":Ljava/lang/String;
    goto :goto_8c

    .line 295
    .end local v0    # "s":Ljava/lang/String;
    :cond_ba
    const-wide v2, 0x7fffffffffffffffL

    iput-wide v2, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->expiry:J
    :try_end_c1
    .catchall {:try_start_b7 .. :try_end_c1} :catchall_b2

    goto :goto_5a
.end method

.method public final requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ConnectionRequest;
    .registers 4
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 189
    const-string v0, "Route"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 190
    new-instance v0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager$1;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager$1;-><init>(Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)V

    return-object v0
.end method

.method public routeComplete(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V
    .registers 4
    .param p1, "conn"    # Lorg/apache/http/HttpClientConnection;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    return-void
.end method

.method public declared-synchronized setConnectionConfig(Lorg/apache/http/config/ConnectionConfig;)V
    .registers 3
    .param p1, "connConfig"    # Lorg/apache/http/config/ConnectionConfig;

    .prologue
    .line 183
    monitor-enter p0

    if-eqz p1, :cond_7

    .end local p1    # "connConfig":Lorg/apache/http/config/ConnectionConfig;
    :goto_3
    :try_start_3
    iput-object p1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->connConfig:Lorg/apache/http/config/ConnectionConfig;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_a

    .line 184
    monitor-exit p0

    return-void

    .line 183
    .restart local p1    # "connConfig":Lorg/apache/http/config/ConnectionConfig;
    :cond_7
    :try_start_7
    sget-object p1, Lorg/apache/http/config/ConnectionConfig;->DEFAULT:Lorg/apache/http/config/ConnectionConfig;
    :try_end_9
    .catchall {:try_start_7 .. :try_end_9} :catchall_a

    goto :goto_3

    .end local p1    # "connConfig":Lorg/apache/http/config/ConnectionConfig;
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSocketConfig(Lorg/apache/http/config/SocketConfig;)V
    .registers 3
    .param p1, "socketConfig"    # Lorg/apache/http/config/SocketConfig;

    .prologue
    .line 175
    monitor-enter p0

    if-eqz p1, :cond_7

    .end local p1    # "socketConfig":Lorg/apache/http/config/SocketConfig;
    :goto_3
    :try_start_3
    iput-object p1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->socketConfig:Lorg/apache/http/config/SocketConfig;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_a

    .line 176
    monitor-exit p0

    return-void

    .line 175
    .restart local p1    # "socketConfig":Lorg/apache/http/config/SocketConfig;
    :cond_7
    :try_start_7
    sget-object p1, Lorg/apache/http/config/SocketConfig;->DEFAULT:Lorg/apache/http/config/SocketConfig;
    :try_end_9
    .catchall {:try_start_7 .. :try_end_9} :catchall_a

    goto :goto_3

    .end local p1    # "socketConfig":Lorg/apache/http/config/SocketConfig;
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized shutdown()V
    .registers 2

    .prologue
    .line 365
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->shutdown:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_e

    if-eqz v0, :cond_7

    .line 370
    :goto_5
    monitor-exit p0

    return-void

    .line 368
    :cond_7
    const/4 v0, 0x1

    :try_start_8
    iput-boolean v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->shutdown:Z

    .line 369
    invoke-direct {p0}, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->shutdownConnection()V
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_e

    goto :goto_5

    .line 365
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public upgrade(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V
    .registers 7
    .param p1, "conn"    # Lorg/apache/http/HttpClientConnection;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    const-string v0, "Connection"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 327
    const-string v0, "HTTP route"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 328
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    if-ne p1, v0, :cond_20

    const/4 v0, 0x1

    :goto_f
    const-string v1, "Connection not obtained from this manager"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 329
    iget-object v0, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->connectionOperator:Lorg/apache/http/impl/conn/HttpClientConnectionOperator;

    iget-object v1, p0, Lorg/apache/http/impl/conn/BasicHttpClientConnectionManager;->conn:Lorg/apache/http/conn/ManagedHttpClientConnection;

    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p3}, Lorg/apache/http/impl/conn/HttpClientConnectionOperator;->upgrade(Lorg/apache/http/conn/ManagedHttpClientConnection;Lorg/apache/http/HttpHost;Lorg/apache/http/protocol/HttpContext;)V

    .line 330
    return-void

    .line 328
    :cond_20
    const/4 v0, 0x0

    goto :goto_f
.end method
