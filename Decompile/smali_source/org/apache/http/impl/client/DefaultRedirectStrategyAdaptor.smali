.class Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;
.super Ljava/lang/Object;
.source "DefaultRedirectStrategyAdaptor.java"

# interfaces
.implements Lorg/apache/http/client/RedirectStrategy;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final handler:Lorg/apache/http/client/RedirectHandler;


# direct methods
.method public constructor <init>(Lorg/apache/http/client/RedirectHandler;)V
    .registers 2
    .param p1, "handler"    # Lorg/apache/http/client/RedirectHandler;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;->handler:Lorg/apache/http/client/RedirectHandler;

    .line 55
    return-void
.end method


# virtual methods
.method public getHandler()Lorg/apache/http/client/RedirectHandler;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;->handler:Lorg/apache/http/client/RedirectHandler;

    return-object v0
.end method

.method public getRedirect(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/HttpUriRequest;
    .registers 7
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v2, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;->handler:Lorg/apache/http/client/RedirectHandler;

    invoke-interface {v2, p2, p3}, Lorg/apache/http/client/RedirectHandler;->getLocationURI(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Ljava/net/URI;

    move-result-object v1

    .line 69
    .local v1, "uri":Ljava/net/URI;
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "method":Ljava/lang/String;
    const-string v2, "HEAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 71
    new-instance v2, Lorg/apache/http/client/methods/HttpHead;

    invoke-direct {v2, v1}, Lorg/apache/http/client/methods/HttpHead;-><init>(Ljava/net/URI;)V

    .line 73
    :goto_1b
    return-object v2

    :cond_1c
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v2, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    goto :goto_1b
.end method

.method public isRedirected(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z
    .registers 5
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;->handler:Lorg/apache/http/client/RedirectHandler;

    invoke-interface {v0, p2, p3}, Lorg/apache/http/client/RedirectHandler;->isRedirectRequested(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    return v0
.end method
