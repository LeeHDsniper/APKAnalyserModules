.class Lorg/apache/http/conn/scheme/LayeredSocketFactoryAdaptor;
.super Lorg/apache/http/conn/scheme/SocketFactoryAdaptor;
.source "LayeredSocketFactoryAdaptor.java"

# interfaces
.implements Lorg/apache/http/conn/scheme/LayeredSocketFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final factory:Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;


# direct methods
.method constructor <init>(Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;)V
    .registers 2
    .param p1, "factory"    # Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lorg/apache/http/conn/scheme/SocketFactoryAdaptor;-><init>(Lorg/apache/http/conn/scheme/SchemeSocketFactory;)V

    .line 44
    iput-object p1, p0, Lorg/apache/http/conn/scheme/LayeredSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;

    .line 45
    return-void
.end method


# virtual methods
.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v0, p0, Lorg/apache/http/conn/scheme/LayeredSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/apache/http/conn/scheme/LayeredSchemeSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method
