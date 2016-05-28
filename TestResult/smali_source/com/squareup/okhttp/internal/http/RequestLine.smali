.class public final Lcom/squareup/okhttp/internal/http/RequestLine;
.super Ljava/lang/Object;
.source "RequestLine.java"


# direct methods
.method static get(Lcom/squareup/okhttp/Request;Ljava/net/Proxy$Type;Lcom/squareup/okhttp/Protocol;)Ljava/lang/String;
    .registers 6
    .param p0, "request"    # Lcom/squareup/okhttp/Request;
    .param p1, "proxyType"    # Ljava/net/Proxy$Type;
    .param p2, "protocol"    # Lcom/squareup/okhttp/Protocol;

    .prologue
    const/16 v2, 0x20

    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .local v0, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    invoke-static {p0, p1}, Lcom/squareup/okhttp/internal/http/RequestLine;->includeAuthorityInRequestLine(Lcom/squareup/okhttp/Request;Ljava/net/Proxy$Type;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 24
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    :goto_1e
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    invoke-static {p2}, Lcom/squareup/okhttp/internal/http/RequestLine;->version(Lcom/squareup/okhttp/Protocol;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 26
    :cond_2d
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v1

    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/RequestLine;->requestPath(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1e
.end method

.method private static includeAuthorityInRequestLine(Lcom/squareup/okhttp/Request;Ljava/net/Proxy$Type;)Z
    .registers 3
    .param p0, "request"    # Lcom/squareup/okhttp/Request;
    .param p1, "proxyType"    # Ljava/net/Proxy$Type;

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->isHttps()Z

    move-result v0

    if-nez v0, :cond_c

    sget-object v0, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne p1, v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static requestPath(Ljava/net/URL;)Ljava/lang/String;
    .registers 4
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 48
    invoke-virtual {p0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "pathAndQuery":Ljava/lang/String;
    if-nez v0, :cond_9

    const-string v0, "/"

    .line 51
    .end local v0    # "pathAndQuery":Ljava/lang/String;
    :cond_8
    :goto_8
    return-object v0

    .line 50
    .restart local v0    # "pathAndQuery":Ljava/lang/String;
    :cond_9
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method

.method public static version(Lcom/squareup/okhttp/Protocol;)Ljava/lang/String;
    .registers 2
    .param p0, "protocol"    # Lcom/squareup/okhttp/Protocol;

    .prologue
    .line 55
    sget-object v0, Lcom/squareup/okhttp/Protocol;->HTTP_1_0:Lcom/squareup/okhttp/Protocol;

    if-ne p0, v0, :cond_7

    const-string v0, "HTTP/1.0"

    :goto_6
    return-object v0

    :cond_7
    const-string v0, "HTTP/1.1"

    goto :goto_6
.end method
