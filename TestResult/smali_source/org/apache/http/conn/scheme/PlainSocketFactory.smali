.class public Lorg/apache/http/conn/scheme/PlainSocketFactory;
.super Ljava/lang/Object;
.source "PlainSocketFactory.java"

# interfaces
.implements Lorg/apache/http/conn/scheme/SchemeSocketFactory;
.implements Lorg/apache/http/conn/scheme/SocketFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final nameResolver:Lorg/apache/http/conn/scheme/HostNameResolver;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/conn/scheme/PlainSocketFactory;->nameResolver:Lorg/apache/http/conn/scheme/HostNameResolver;

    .line 77
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/HostNameResolver;)V
    .registers 2
    .param p1, "nameResolver"    # Lorg/apache/http/conn/scheme/HostNameResolver;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lorg/apache/http/conn/scheme/PlainSocketFactory;->nameResolver:Lorg/apache/http/conn/scheme/HostNameResolver;

    .line 72
    return-void
.end method

.method public static getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;
    .registers 1

    .prologue
    .line 62
    new-instance v0, Lorg/apache/http/conn/scheme/PlainSocketFactory;

    invoke-direct {v0}, Lorg/apache/http/conn/scheme/PlainSocketFactory;-><init>()V

    return-object v0
.end method


# virtual methods
.method public connectSocket(Ljava/net/Socket;Ljava/lang/String;ILjava/net/InetAddress;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 11
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "localAddress"    # Ljava/net/InetAddress;
    .param p5, "localPort"    # I
    .param p6, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;,
            Lorg/apache/http/conn/ConnectTimeoutException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 146
    const/4 v0, 0x0

    .line 147
    .local v0, "local":Ljava/net/InetSocketAddress;
    if-nez p4, :cond_5

    if-lez p5, :cond_c

    .line 148
    :cond_5
    new-instance v0, Ljava/net/InetSocketAddress;

    .end local v0    # "local":Ljava/net/InetSocketAddress;
    if-lez p5, :cond_20

    .end local p5    # "localPort":I
    :goto_9
    invoke-direct {v0, p4, p5}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 151
    .restart local v0    # "local":Ljava/net/InetSocketAddress;
    :cond_c
    iget-object v3, p0, Lorg/apache/http/conn/scheme/PlainSocketFactory;->nameResolver:Lorg/apache/http/conn/scheme/HostNameResolver;

    if-eqz v3, :cond_22

    .line 152
    iget-object v3, p0, Lorg/apache/http/conn/scheme/PlainSocketFactory;->nameResolver:Lorg/apache/http/conn/scheme/HostNameResolver;

    invoke-interface {v3, p2}, Lorg/apache/http/conn/scheme/HostNameResolver;->resolve(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    .line 156
    .local v2, "remoteAddress":Ljava/net/InetAddress;
    :goto_16
    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-direct {v1, v2, p3}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 157
    .local v1, "remote":Ljava/net/InetSocketAddress;
    invoke-virtual {p0, p1, v1, v0, p6}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;

    move-result-object v3

    return-object v3

    .line 148
    .end local v0    # "local":Ljava/net/InetSocketAddress;
    .end local v1    # "remote":Ljava/net/InetSocketAddress;
    .end local v2    # "remoteAddress":Ljava/net/InetAddress;
    .restart local p5    # "localPort":I
    :cond_20
    const/4 p5, 0x0

    goto :goto_9

    .line 154
    .end local p5    # "localPort":I
    .restart local v0    # "local":Ljava/net/InetSocketAddress;
    :cond_22
    invoke-static {p2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    .restart local v2    # "remoteAddress":Ljava/net/InetAddress;
    goto :goto_16
.end method

.method public connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 12
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "remoteAddress"    # Ljava/net/InetSocketAddress;
    .param p3, "localAddress"    # Ljava/net/InetSocketAddress;
    .param p4, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/conn/ConnectTimeoutException;
        }
    .end annotation

    .prologue
    .line 102
    const-string v4, "Remote address"

    invoke-static {p2, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 103
    const-string v4, "HTTP parameters"

    invoke-static {p4, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 104
    move-object v3, p1

    .line 105
    .local v3, "sock":Ljava/net/Socket;
    if-nez v3, :cond_11

    .line 106
    invoke-virtual {p0}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v3

    .line 108
    :cond_11
    if-eqz p3, :cond_1d

    .line 109
    invoke-static {p4}, Lorg/apache/http/params/HttpConnectionParams;->getSoReuseaddr(Lorg/apache/http/params/HttpParams;)Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/net/Socket;->setReuseAddress(Z)V

    .line 110
    invoke-virtual {v3, p3}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 112
    :cond_1d
    invoke-static {p4}, Lorg/apache/http/params/HttpConnectionParams;->getConnectionTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v0

    .line 113
    .local v0, "connTimeout":I
    invoke-static {p4}, Lorg/apache/http/params/HttpConnectionParams;->getSoTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v2

    .line 116
    .local v2, "soTimeout":I
    :try_start_25
    invoke-virtual {v3, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 117
    invoke-virtual {v3, p2, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_2b
    .catch Ljava/net/SocketTimeoutException; {:try_start_25 .. :try_end_2b} :catch_2c

    .line 121
    return-object v3

    .line 118
    :catch_2c
    move-exception v1

    .line 119
    .local v1, "ex":Ljava/net/SocketTimeoutException;
    new-instance v4, Lorg/apache/http/conn/ConnectTimeoutException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Connect to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " timed out"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/http/conn/ConnectTimeoutException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public createSocket()Ljava/net/Socket;
    .registers 2

    .prologue
    .line 91
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    return-object v0
.end method

.method public createSocket(Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 3
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 87
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    return-object v0
.end method

.method public final isSecure(Ljava/net/Socket;)Z
    .registers 3
    .param p1, "sock"    # Ljava/net/Socket;

    .prologue
    .line 134
    const/4 v0, 0x0

    return v0
.end method
