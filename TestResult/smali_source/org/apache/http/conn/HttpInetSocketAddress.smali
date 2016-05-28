.class public Lorg/apache/http/conn/HttpInetSocketAddress;
.super Ljava/net/InetSocketAddress;
.source "HttpInetSocketAddress.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x5c4c0a13728d6ef5L


# instance fields
.field private final httphost:Lorg/apache/http/HttpHost;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;I)V
    .registers 5
    .param p1, "httphost"    # Lorg/apache/http/HttpHost;
    .param p2, "addr"    # Ljava/net/InetAddress;
    .param p3, "port"    # I

    .prologue
    .line 51
    invoke-direct {p0, p2, p3}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 52
    const-string v0, "HTTP host"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 53
    iput-object p1, p0, Lorg/apache/http/conn/HttpInetSocketAddress;->httphost:Lorg/apache/http/HttpHost;

    .line 54
    return-void
.end method


# virtual methods
.method public getHttpHost()Lorg/apache/http/HttpHost;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lorg/apache/http/conn/HttpInetSocketAddress;->httphost:Lorg/apache/http/HttpHost;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/http/conn/HttpInetSocketAddress;->httphost:Lorg/apache/http/HttpHost;

    invoke-virtual {v1}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/conn/HttpInetSocketAddress;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
