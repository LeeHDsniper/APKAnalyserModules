.class public Lorg/apache/http/client/methods/HttpRequestWrapper;
.super Lorg/apache/http/message/AbstractHttpMessage;
.source "HttpRequestWrapper.java"

# interfaces
.implements Lorg/apache/http/client/methods/HttpUriRequest;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/client/methods/HttpRequestWrapper$1;,
        Lorg/apache/http/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final method:Ljava/lang/String;

.field private final original:Lorg/apache/http/HttpRequest;

.field private uri:Ljava/net/URI;

.field private version:Lorg/apache/http/ProtocolVersion;


# direct methods
.method private constructor <init>(Lorg/apache/http/HttpRequest;)V
    .registers 3
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/apache/http/message/AbstractHttpMessage;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->original:Lorg/apache/http/HttpRequest;

    .line 62
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->original:Lorg/apache/http/HttpRequest;

    invoke-interface {v0}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->version:Lorg/apache/http/ProtocolVersion;

    .line 63
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->original:Lorg/apache/http/HttpRequest;

    invoke-interface {v0}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->method:Ljava/lang/String;

    .line 64
    instance-of v0, p1, Lorg/apache/http/client/methods/HttpUriRequest;

    if-eqz v0, :cond_32

    move-object v0, p1

    .line 65
    check-cast v0, Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v0}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    .line 69
    :goto_2a
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setHeaders([Lorg/apache/http/Header;)V

    .line 70
    return-void

    .line 67
    :cond_32
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    goto :goto_2a
.end method

.method synthetic constructor <init>(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/methods/HttpRequestWrapper$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/apache/http/HttpRequest;
    .param p2, "x1"    # Lorg/apache/http/client/methods/HttpRequestWrapper$1;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;-><init>(Lorg/apache/http/HttpRequest;)V

    return-void
.end method

.method public static wrap(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/HttpRequestWrapper;
    .registers 2
    .param p0, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 148
    if-nez p0, :cond_4

    .line 149
    const/4 v0, 0x0

    .line 154
    :goto_3
    return-object v0

    .line 151
    :cond_4
    instance-of v0, p0, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_10

    .line 152
    new-instance v0, Lorg/apache/http/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;

    check-cast p0, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local p0    # "request":Lorg/apache/http/HttpRequest;
    invoke-direct {v0, p0}, Lorg/apache/http/client/methods/HttpRequestWrapper$HttpEntityEnclosingRequestWrapper;-><init>(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    goto :goto_3

    .line 154
    .restart local p0    # "request":Lorg/apache/http/HttpRequest;
    :cond_10
    new-instance v0, Lorg/apache/http/client/methods/HttpRequestWrapper;

    invoke-direct {v0, p0}, Lorg/apache/http/client/methods/HttpRequestWrapper;-><init>(Lorg/apache/http/HttpRequest;)V

    goto :goto_3
.end method


# virtual methods
.method public abort()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginal()Lorg/apache/http/HttpRequest;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->original:Lorg/apache/http/HttpRequest;

    return-object v0
.end method

.method public getParams()Lorg/apache/http/params/HttpParams;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 165
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->params:Lorg/apache/http/params/HttpParams;

    if-nez v0, :cond_10

    .line 166
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->original:Lorg/apache/http/HttpRequest;

    invoke-interface {v0}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/params/HttpParams;->copy()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->params:Lorg/apache/http/params/HttpParams;

    .line 168
    :cond_10
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->params:Lorg/apache/http/params/HttpParams;

    return-object v0
.end method

.method public getProtocolVersion()Lorg/apache/http/ProtocolVersion;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->version:Lorg/apache/http/ProtocolVersion;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->version:Lorg/apache/http/ProtocolVersion;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->original:Lorg/apache/http/HttpRequest;

    invoke-interface {v0}, Lorg/apache/http/HttpRequest;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    goto :goto_6
.end method

.method public getRequestLine()Lorg/apache/http/RequestLine;
    .registers 5

    .prologue
    .line 101
    const/4 v0, 0x0

    .line 102
    .local v0, "requestUri":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    if-eqz v1, :cond_21

    .line 103
    iget-object v1, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    invoke-virtual {v1}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v0

    .line 107
    :goto_b
    if-eqz v0, :cond_13

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_15

    .line 108
    :cond_13
    const-string v0, "/"

    .line 110
    :cond_15
    new-instance v1, Lorg/apache/http/message/BasicRequestLine;

    iget-object v2, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->method:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/http/message/BasicRequestLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/ProtocolVersion;)V

    return-object v1

    .line 105
    :cond_21
    iget-object v1, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->original:Lorg/apache/http/HttpRequest;

    invoke-interface {v1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method

.method public getURI()Ljava/net/URI;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    return-object v0
.end method

.method public isAborted()Z
    .registers 2

    .prologue
    .line 97
    const/4 v0, 0x0

    return v0
.end method

.method public setProtocolVersion(Lorg/apache/http/ProtocolVersion;)V
    .registers 2
    .param p1, "version"    # Lorg/apache/http/ProtocolVersion;

    .prologue
    .line 77
    iput-object p1, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->version:Lorg/apache/http/ProtocolVersion;

    .line 78
    return-void
.end method

.method public setURI(Ljava/net/URI;)V
    .registers 2
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 85
    iput-object p1, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->uri:Ljava/net/URI;

    .line 86
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/client/methods/HttpRequestWrapper;->headergroup:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
