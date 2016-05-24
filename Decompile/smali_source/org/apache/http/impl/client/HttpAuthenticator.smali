.class public Lorg/apache/http/impl/client/HttpAuthenticator;
.super Lorg/apache/http/impl/auth/HttpAuthenticator;
.source "HttpAuthenticator.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/http/impl/auth/HttpAuthenticator;-><init>()V

    .line 50
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/logging/Log;)V
    .registers 2
    .param p1, "log"    # Lorg/apache/commons/logging/Log;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lorg/apache/http/impl/auth/HttpAuthenticator;-><init>(Lorg/apache/commons/logging/Log;)V

    .line 46
    return-void
.end method


# virtual methods
.method public authenticate(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 7
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "authStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p4, "authState"    # Lorg/apache/http/auth/AuthState;
    .param p5, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 58
    invoke-virtual/range {p0 .. p5}, Lorg/apache/http/impl/client/HttpAuthenticator;->handleAuthChallenge(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    return v0
.end method
