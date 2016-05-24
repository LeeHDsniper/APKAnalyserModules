.class Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;
.super Ljava/lang/Object;
.source "SchemeSocketFactoryAdaptor.java"

# interfaces
.implements Lorg/apache/http/conn/scheme/SchemeSocketFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final factory:Lorg/apache/http/conn/scheme/SocketFactory;


# direct methods
.method constructor <init>(Lorg/apache/http/conn/scheme/SocketFactory;)V
    .registers 2
    .param p1, "factory"    # Lorg/apache/http/conn/scheme/SocketFactory;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/SocketFactory;

    .line 50
    return-void
.end method


# virtual methods
.method public connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 12
    .param p1, "sock"    # Ljava/net/Socket;
    .param p2, "remoteAddress"    # Ljava/net/InetSocketAddress;
    .param p3, "localAddress"    # Ljava/net/InetSocketAddress;
    .param p4, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;,
            Lorg/apache/http/conn/ConnectTimeoutException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-virtual {p2}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v2

    .line 58
    .local v2, "host":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v3

    .line 59
    .local v3, "port":I
    const/4 v4, 0x0

    .line 60
    .local v4, "local":Ljava/net/InetAddress;
    const/4 v5, 0x0

    .line 61
    .local v5, "localPort":I
    if-eqz p3, :cond_14

    .line 62
    invoke-virtual {p3}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v4

    .line 63
    invoke-virtual {p3}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v5

    .line 65
    :cond_14
    iget-object v0, p0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/SocketFactory;

    move-object v1, p1

    move-object v6, p4

    invoke-interface/range {v0 .. v6}, Lorg/apache/http/conn/scheme/SocketFactory;->connectSocket(Ljava/net/Socket;Ljava/lang/String;ILjava/net/InetAddress;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 3
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/SocketFactory;

    invoke-interface {v0}, Lorg/apache/http/conn/scheme/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 82
    if-nez p1, :cond_4

    .line 83
    const/4 v0, 0x0

    .line 91
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_3
    return v0

    .line 85
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_4
    if-ne p0, p1, :cond_8

    .line 86
    const/4 v0, 0x1

    goto :goto_3

    .line 88
    :cond_8
    instance-of v0, p1, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;

    if-eqz v0, :cond_17

    .line 89
    iget-object v0, p0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/SocketFactory;

    check-cast p1, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-object v1, p1, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/SocketFactory;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3

    .line 91
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_17
    iget-object v0, p0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/SocketFactory;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public getFactory()Lorg/apache/http/conn/scheme/SocketFactory;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/SocketFactory;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/SocketFactory;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isSecure(Ljava/net/Socket;)Z
    .registers 3
    .param p1, "sock"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/SocketFactory;

    invoke-interface {v0, p1}, Lorg/apache/http/conn/scheme/SocketFactory;->isSecure(Ljava/net/Socket;)Z

    move-result v0

    return v0
.end method
