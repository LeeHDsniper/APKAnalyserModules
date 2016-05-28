.class public interface abstract Lorg/apache/http/conn/HttpRoutedConnection;
.super Ljava/lang/Object;
.source "HttpRoutedConnection.java"

# interfaces
.implements Lorg/apache/http/HttpInetConnection;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# virtual methods
.method public abstract getRoute()Lorg/apache/http/conn/routing/HttpRoute;
.end method

.method public abstract getSSLSession()Ljavax/net/ssl/SSLSession;
.end method

.method public abstract isSecure()Z
.end method
