.class public interface abstract Lorg/apache/http/auth/ContextAwareAuthScheme;
.super Ljava/lang/Object;
.source "ContextAwareAuthScheme.java"

# interfaces
.implements Lorg/apache/http/auth/AuthScheme;


# virtual methods
.method public abstract authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation
.end method
