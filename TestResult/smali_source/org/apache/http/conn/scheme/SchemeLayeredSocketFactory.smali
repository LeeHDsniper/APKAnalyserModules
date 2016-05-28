.class public interface abstract Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;
.super Ljava/lang/Object;
.source "SchemeLayeredSocketFactory.java"

# interfaces
.implements Lorg/apache/http/conn/scheme/SchemeSocketFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# virtual methods
.method public abstract createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation
.end method
