.class public Lorg/apache/http/client/protocol/RequestDefaultHeaders;
.super Ljava/lang/Object;
.source "RequestDefaultHeaders.java"

# interfaces
.implements Lorg/apache/http/HttpRequestInterceptor;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final defaultHeaders:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<+",
            "Lorg/apache/http/Header;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/client/protocol/RequestDefaultHeaders;-><init>(Ljava/util/Collection;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lorg/apache/http/Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "defaultHeaders":Ljava/util/Collection;, "Ljava/util/Collection<+Lorg/apache/http/Header;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lorg/apache/http/client/protocol/RequestDefaultHeaders;->defaultHeaders:Ljava/util/Collection;

    .line 59
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .registers 9
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    const-string v4, "HTTP request"

    invoke-static {p1, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v3

    .line 70
    .local v3, "method":Ljava/lang/String;
    const-string v4, "CONNECT"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 87
    :cond_15
    return-void

    .line 76
    :cond_16
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v4

    const-string v5, "http.default-headers"

    invoke-interface {v4, v5}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    .line 78
    .local v1, "defHeaders":Ljava/util/Collection;, "Ljava/util/Collection<+Lorg/apache/http/Header;>;"
    if-nez v1, :cond_26

    .line 79
    iget-object v1, p0, Lorg/apache/http/client/protocol/RequestDefaultHeaders;->defaultHeaders:Ljava/util/Collection;

    .line 82
    :cond_26
    if-eqz v1, :cond_15

    .line 83
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_2c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_15

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/Header;

    .line 84
    .local v0, "defHeader":Lorg/apache/http/Header;
    invoke-interface {p1, v0}, Lorg/apache/http/HttpRequest;->addHeader(Lorg/apache/http/Header;)V

    goto :goto_2c
.end method
