.class public interface abstract Lorg/apache/http/conn/HttpConnectionFactory;
.super Ljava/lang/Object;
.source "HttpConnectionFactory.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C::",
        "Lorg/apache/http/HttpConnection;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract create(Ljava/lang/Object;Lorg/apache/http/config/ConnectionConfig;)Lorg/apache/http/HttpConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lorg/apache/http/config/ConnectionConfig;",
            ")TC;"
        }
    .end annotation
.end method
