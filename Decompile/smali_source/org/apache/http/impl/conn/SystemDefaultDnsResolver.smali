.class public Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;
.super Ljava/lang/Object;
.source "SystemDefaultDnsResolver.java"

# interfaces
.implements Lorg/apache/http/conn/DnsResolver;


# static fields
.field public static final INSTANCE:Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 41
    new-instance v0, Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;-><init>()V

    sput-object v0, Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;->INSTANCE:Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public resolve(Ljava/lang/String;)[Ljava/net/InetAddress;
    .registers 3
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-static {p1}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method
