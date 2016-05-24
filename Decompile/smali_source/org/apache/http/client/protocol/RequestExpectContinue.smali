.class public Lorg/apache/http/client/protocol/RequestExpectContinue;
.super Ljava/lang/Object;
.source "RequestExpectContinue.java"

# interfaces
.implements Lorg/apache/http/HttpRequestInterceptor;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V
    .registers 11
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
    const-string v4, "HTTP request"

    invoke-static {p1, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 65
    const-string v4, "Expect"

    invoke-interface {p1, v4}, Lorg/apache/http/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_49

    .line 66
    instance-of v4, p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v4, :cond_49

    .line 67
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/RequestLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v3

    .local v3, "ver":Lorg/apache/http/ProtocolVersion;
    move-object v4, p1

    .line 68
    check-cast v4, Lorg/apache/http/HttpEntityEnclosingRequest;

    invoke-interface {v4}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    .line 70
    .local v2, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v2, :cond_49

    invoke-interface {v2}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_49

    sget-object v4, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-virtual {v3, v4}, Lorg/apache/http/ProtocolVersion;->lessEquals(Lorg/apache/http/ProtocolVersion;)Z

    move-result v4

    if-nez v4, :cond_49

    .line 72
    invoke-static {p2}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v0

    .line 73
    .local v0, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v1

    .line 74
    .local v1, "config":Lorg/apache/http/client/config/RequestConfig;
    invoke-virtual {v1}, Lorg/apache/http/client/config/RequestConfig;->isExpectContinueEnabled()Z

    move-result v4

    if-eqz v4, :cond_49

    .line 75
    const-string v4, "Expect"

    const-string v5, "100-continue"

    invoke-interface {p1, v4, v5}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .end local v0    # "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    .end local v1    # "config":Lorg/apache/http/client/config/RequestConfig;
    .end local v2    # "entity":Lorg/apache/http/HttpEntity;
    .end local v3    # "ver":Lorg/apache/http/ProtocolVersion;
    :cond_49
    return-void
.end method
