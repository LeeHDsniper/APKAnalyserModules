.class public Lorg/apache/http/client/protocol/RequestClientConnControl;
.super Ljava/lang/Object;
.source "RequestClientConnControl.java"

# interfaces
.implements Lorg/apache/http/HttpRequestInterceptor;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final PROXY_CONN_DIRECTIVE:Ljava/lang/String; = "Proxy-Connection"


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/protocol/RequestClientConnControl;->log:Lorg/apache/commons/logging/Log;

    .line 59
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .registers 8
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    const-string v3, "HTTP request"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 65
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "method":Ljava/lang/String;
    const-string v3, "CONNECT"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 67
    const-string v3, "Proxy-Connection"

    const-string v4, "Keep-Alive"

    invoke-interface {p1, v3, v4}, Lorg/apache/http/HttpRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    :cond_1c
    :goto_1c
    return-void

    .line 71
    :cond_1d
    invoke-static {p2}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v0

    .line 74
    .local v0, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getHttpRoute()Lorg/apache/http/conn/routing/RouteInfo;

    move-result-object v2

    .line 75
    .local v2, "route":Lorg/apache/http/conn/routing/RouteInfo;
    if-nez v2, :cond_2f

    .line 76
    iget-object v3, p0, Lorg/apache/http/client/protocol/RequestClientConnControl;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Connection route not set in the context"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_1c

    .line 80
    :cond_2f
    invoke-interface {v2}, Lorg/apache/http/conn/routing/RouteInfo;->getHopCount()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_3c

    invoke-interface {v2}, Lorg/apache/http/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 81
    :cond_3c
    const-string v3, "Connection"

    invoke-interface {p1, v3}, Lorg/apache/http/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4b

    .line 82
    const-string v3, "Connection"

    const-string v4, "Keep-Alive"

    invoke-interface {p1, v3, v4}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    :cond_4b
    invoke-interface {v2}, Lorg/apache/http/conn/routing/RouteInfo;->getHopCount()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1c

    invoke-interface {v2}, Lorg/apache/http/conn/routing/RouteInfo;->isTunnelled()Z

    move-result v3

    if-nez v3, :cond_1c

    .line 86
    const-string v3, "Proxy-Connection"

    invoke-interface {p1, v3}, Lorg/apache/http/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1c

    .line 87
    const-string v3, "Proxy-Connection"

    const-string v4, "Keep-Alive"

    invoke-interface {p1, v3, v4}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c
.end method
