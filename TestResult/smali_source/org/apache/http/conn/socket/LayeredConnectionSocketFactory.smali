.class public interface abstract Lorg/apache/http/conn/socket/LayeredConnectionSocketFactory;
.super Ljava/lang/Object;
.source "LayeredConnectionSocketFactory.java"

# interfaces
.implements Lorg/apache/http/conn/socket/ConnectionSocketFactory;


# virtual methods
.method public abstract createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/protocol/HttpContext;)Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation
.end method
