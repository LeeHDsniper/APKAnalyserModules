.class Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactoryAdaptor;
.super Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;
.source "SchemeLayeredSocketFactoryAdaptor.java"

# interfaces
.implements Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final factory:Lorg/apache/http/conn/scheme/LayeredSocketFactory;


# direct methods
.method constructor <init>(Lorg/apache/http/conn/scheme/LayeredSocketFactory;)V
    .registers 2
    .param p1, "factory"    # Lorg/apache/http/conn/scheme/LayeredSocketFactory;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lorg/apache/http/conn/scheme/SchemeSocketFactoryAdaptor;-><init>(Lorg/apache/http/conn/scheme/SocketFactory;)V

    .line 47
    iput-object p1, p0, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/LayeredSocketFactory;

    .line 48
    return-void
.end method


# virtual methods
.method public createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 7
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "target"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactoryAdaptor;->factory:Lorg/apache/http/conn/scheme/LayeredSocketFactory;

    const/4 v1, 0x1

    invoke-interface {v0, p1, p2, p3, v1}, Lorg/apache/http/conn/scheme/LayeredSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method
