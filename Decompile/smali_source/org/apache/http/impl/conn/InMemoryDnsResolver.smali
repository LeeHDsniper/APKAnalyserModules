.class public Lorg/apache/http/impl/conn/InMemoryDnsResolver;
.super Ljava/lang/Object;
.source "InMemoryDnsResolver.java"

# interfaces
.implements Lorg/apache/http/conn/DnsResolver;


# instance fields
.field private final dnsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation
.end field

.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-class v0, Lorg/apache/http/impl/conn/InMemoryDnsResolver;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/InMemoryDnsResolver;->log:Lorg/apache/commons/logging/Log;

    .line 61
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/conn/InMemoryDnsResolver;->dnsMap:Ljava/util/Map;

    .line 62
    return-void
.end method


# virtual methods
.method public varargs add(Ljava/lang/String;[Ljava/net/InetAddress;)V
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "ips"    # [Ljava/net/InetAddress;

    .prologue
    .line 75
    const-string v0, "Host name"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 76
    const-string v0, "Array of IP addresses"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 77
    iget-object v0, p0, Lorg/apache/http/impl/conn/InMemoryDnsResolver;->dnsMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    return-void
.end method

.method public resolve(Ljava/lang/String;)[Ljava/net/InetAddress;
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v1, p0, Lorg/apache/http/impl/conn/InMemoryDnsResolver;->dnsMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/net/InetAddress;

    .line 85
    .local v0, "resolvedAddresses":[Ljava/net/InetAddress;
    iget-object v1, p0, Lorg/apache/http/impl/conn/InMemoryDnsResolver;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v1

    if-eqz v1, :cond_36

    .line 86
    iget-object v1, p0, Lorg/apache/http/impl/conn/InMemoryDnsResolver;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Resolving "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 88
    :cond_36
    if-nez v0, :cond_51

    .line 89
    new-instance v1, Ljava/net/UnknownHostException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " cannot be resolved"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 91
    :cond_51
    return-object v0
.end method
