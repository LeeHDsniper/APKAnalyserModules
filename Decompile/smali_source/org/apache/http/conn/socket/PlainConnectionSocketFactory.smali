.class public Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;
.super Ljava/lang/Object;
.source "PlainConnectionSocketFactory.java"

# interfaces
.implements Lorg/apache/http/conn/socket/ConnectionSocketFactory;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    new-instance v0, Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;

    invoke-direct {v0}, Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;-><init>()V

    sput-object v0, Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;->INSTANCE:Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    return-void
.end method

.method public static getSocketFactory()Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;
    .registers 1

    .prologue
    .line 49
    sget-object v0, Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;->INSTANCE:Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;

    return-object v0
.end method


# virtual methods
.method public connectSocket(ILjava/net/Socket;Lorg/apache/http/HttpHost;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;
    .registers 10
    .param p1, "connectTimeout"    # I
    .param p2, "socket"    # Ljava/net/Socket;
    .param p3, "host"    # Lorg/apache/http/HttpHost;
    .param p4, "remoteAddress"    # Ljava/net/InetSocketAddress;
    .param p5, "localAddress"    # Ljava/net/InetSocketAddress;
    .param p6, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    if-eqz p2, :cond_c

    move-object v1, p2

    .line 68
    .local v1, "sock":Ljava/net/Socket;
    :goto_3
    if-eqz p5, :cond_8

    .line 69
    invoke-virtual {v1, p5}, Ljava/net/Socket;->bind(Ljava/net/SocketAddress;)V

    .line 72
    :cond_8
    :try_start_8
    invoke-virtual {v1, p4, p1}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_b} :catch_11

    .line 80
    return-object v1

    .line 67
    .end local v1    # "sock":Ljava/net/Socket;
    :cond_c
    invoke-virtual {p0, p6}, Lorg/apache/http/conn/socket/PlainConnectionSocketFactory;->createSocket(Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v1

    goto :goto_3

    .line 73
    .restart local v1    # "sock":Ljava/net/Socket;
    :catch_11
    move-exception v0

    .line 75
    .local v0, "ex":Ljava/io/IOException;
    :try_start_12
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_15} :catch_16

    .line 78
    :goto_15
    throw v0

    .line 76
    :catch_16
    move-exception v2

    goto :goto_15
.end method

.method public createSocket(Lorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;
    .registers 3
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    return-object v0
.end method
