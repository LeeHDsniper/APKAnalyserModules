.class public Loauth/signpost/commonshttp/HttpRequestAdapter;
.super Ljava/lang/Object;
.source "HttpRequestAdapter.java"

# interfaces
.implements Loauth/signpost/http/HttpRequest;


# instance fields
.field private entity:Lorg/apache/http/HttpEntity;

.field private request:Lorg/apache/http/client/methods/HttpUriRequest;


# direct methods
.method public constructor <init>(Lorg/apache/http/client/methods/HttpUriRequest;)V
    .registers 3
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 21
    instance-of v0, p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_11

    .line 22
    check-cast p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local p1    # "request":Lorg/apache/http/client/methods/HttpUriRequest;
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    iput-object v0, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->entity:Lorg/apache/http/HttpEntity;

    .line 24
    :cond_11
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 60
    iget-object v2, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->entity:Lorg/apache/http/HttpEntity;

    if-nez v2, :cond_6

    .line 67
    :cond_5
    :goto_5
    return-object v1

    .line 63
    :cond_6
    iget-object v2, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v2}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v0

    .line 64
    .local v0, "header":Lorg/apache/http/Header;
    if-eqz v0, :cond_5

    .line 67
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    goto :goto_5
.end method

.method public getHeader(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 39
    iget-object v1, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v1, p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 40
    .local v0, "header":Lorg/apache/http/Header;
    if-nez v0, :cond_a

    .line 41
    const/4 v1, 0x0

    .line 43
    :goto_9
    return-object v1

    :cond_a
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method public getMessagePayload()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->entity:Lorg/apache/http/HttpEntity;

    if-nez v0, :cond_6

    .line 72
    const/4 v0, 0x0

    .line 74
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->entity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_5
.end method

.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v0}, Lorg/apache/http/client/methods/HttpUriRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRequestUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v0}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 47
    iget-object v0, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v0, p1, p2}, Lorg/apache/http/client/methods/HttpUriRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public unwrap()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Loauth/signpost/commonshttp/HttpRequestAdapter;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    return-object v0
.end method
