.class Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;
.super Ljava/lang/Object;
.source "PoolingHttpClientConnectionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ConfigData"
.end annotation


# instance fields
.field private final connectionConfigMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/config/ConnectionConfig;",
            ">;"
        }
    .end annotation
.end field

.field private volatile defaultConnectionConfig:Lorg/apache/http/config/ConnectionConfig;

.field private volatile defaultSocketConfig:Lorg/apache/http/config/SocketConfig;

.field private final socketConfigMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/config/SocketConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 438
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 439
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->socketConfigMap:Ljava/util/Map;

    .line 440
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->connectionConfigMap:Ljava/util/Map;

    .line 441
    return-void
.end method


# virtual methods
.method public getConnectionConfig(Lorg/apache/http/HttpHost;)Lorg/apache/http/config/ConnectionConfig;
    .registers 3
    .param p1, "host"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 468
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->connectionConfigMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/config/ConnectionConfig;

    return-object v0
.end method

.method public getDefaultConnectionConfig()Lorg/apache/http/config/ConnectionConfig;
    .registers 2

    .prologue
    .line 452
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->defaultConnectionConfig:Lorg/apache/http/config/ConnectionConfig;

    return-object v0
.end method

.method public getDefaultSocketConfig()Lorg/apache/http/config/SocketConfig;
    .registers 2

    .prologue
    .line 444
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->defaultSocketConfig:Lorg/apache/http/config/SocketConfig;

    return-object v0
.end method

.method public getSocketConfig(Lorg/apache/http/HttpHost;)Lorg/apache/http/config/SocketConfig;
    .registers 3
    .param p1, "host"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 460
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->socketConfigMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/config/SocketConfig;

    return-object v0
.end method

.method public setConnectionConfig(Lorg/apache/http/HttpHost;Lorg/apache/http/config/ConnectionConfig;)V
    .registers 4
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "connectionConfig"    # Lorg/apache/http/config/ConnectionConfig;

    .prologue
    .line 472
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->connectionConfigMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    return-void
.end method

.method public setDefaultConnectionConfig(Lorg/apache/http/config/ConnectionConfig;)V
    .registers 2
    .param p1, "defaultConnectionConfig"    # Lorg/apache/http/config/ConnectionConfig;

    .prologue
    .line 456
    iput-object p1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->defaultConnectionConfig:Lorg/apache/http/config/ConnectionConfig;

    .line 457
    return-void
.end method

.method public setDefaultSocketConfig(Lorg/apache/http/config/SocketConfig;)V
    .registers 2
    .param p1, "defaultSocketConfig"    # Lorg/apache/http/config/SocketConfig;

    .prologue
    .line 448
    iput-object p1, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->defaultSocketConfig:Lorg/apache/http/config/SocketConfig;

    .line 449
    return-void
.end method

.method public setSocketConfig(Lorg/apache/http/HttpHost;Lorg/apache/http/config/SocketConfig;)V
    .registers 4
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "socketConfig"    # Lorg/apache/http/config/SocketConfig;

    .prologue
    .line 464
    iget-object v0, p0, Lorg/apache/http/impl/conn/PoolingHttpClientConnectionManager$ConfigData;->socketConfigMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    return-void
.end method
