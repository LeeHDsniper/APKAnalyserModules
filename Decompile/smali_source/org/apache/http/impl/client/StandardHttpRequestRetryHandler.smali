.class public Lorg/apache/http/impl/client/StandardHttpRequestRetryHandler;
.super Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;
.source "StandardHttpRequestRetryHandler.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final idempotentMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 70
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/client/StandardHttpRequestRetryHandler;-><init>(IZ)V

    .line 71
    return-void
.end method

.method public constructor <init>(IZ)V
    .registers 6
    .param p1, "retryCount"    # I
    .param p2, "requestSentRetryEnabled"    # Z

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;-><init>(IZ)V

    .line 57
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/StandardHttpRequestRetryHandler;->idempotentMethods:Ljava/util/Map;

    .line 58
    iget-object v0, p0, Lorg/apache/http/impl/client/StandardHttpRequestRetryHandler;->idempotentMethods:Ljava/util/Map;

    const-string v1, "GET"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    iget-object v0, p0, Lorg/apache/http/impl/client/StandardHttpRequestRetryHandler;->idempotentMethods:Ljava/util/Map;

    const-string v1, "HEAD"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    iget-object v0, p0, Lorg/apache/http/impl/client/StandardHttpRequestRetryHandler;->idempotentMethods:Ljava/util/Map;

    const-string v1, "PUT"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    iget-object v0, p0, Lorg/apache/http/impl/client/StandardHttpRequestRetryHandler;->idempotentMethods:Ljava/util/Map;

    const-string v1, "DELETE"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    iget-object v0, p0, Lorg/apache/http/impl/client/StandardHttpRequestRetryHandler;->idempotentMethods:Ljava/util/Map;

    const-string v1, "OPTIONS"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    iget-object v0, p0, Lorg/apache/http/impl/client/StandardHttpRequestRetryHandler;->idempotentMethods:Ljava/util/Map;

    const-string v1, "TRACE"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-void
.end method


# virtual methods
.method protected handleAsIdempotent(Lorg/apache/http/HttpRequest;)Z
    .registers 6
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 75
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 76
    .local v1, "method":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/http/impl/client/StandardHttpRequestRetryHandler;->idempotentMethods:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 77
    .local v0, "b":Ljava/lang/Boolean;
    if-eqz v0, :cond_20

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_20

    const/4 v2, 0x1

    :goto_1f
    return v2

    :cond_20
    const/4 v2, 0x0

    goto :goto_1f
.end method
