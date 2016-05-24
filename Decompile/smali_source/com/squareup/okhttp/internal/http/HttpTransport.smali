.class public final Lcom/squareup/okhttp/internal/http/HttpTransport;
.super Ljava/lang/Object;
.source "HttpTransport.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/http/Transport;


# instance fields
.field private final httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

.field private final httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/internal/http/HttpEngine;Lcom/squareup/okhttp/internal/http/HttpConnection;)V
    .registers 3
    .param p1, "httpEngine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .param p2, "httpConnection"    # Lcom/squareup/okhttp/internal/http/HttpConnection;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    .line 31
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    .line 32
    return-void
.end method


# virtual methods
.method public canReuseConnection()Z
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 91
    const-string v1, "close"

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getRequest()Lcom/squareup/okhttp/Request;

    move-result-object v2

    const-string v3, "Connection"

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 104
    :cond_15
    :goto_15
    return v0

    .line 96
    :cond_16
    const-string v1, "close"

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v2

    const-string v3, "Connection"

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 100
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->isClosed()Z

    move-result v1

    if-nez v1, :cond_15

    .line 104
    const/4 v0, 0x1

    goto :goto_15
.end method

.method public createRequestBody(Lcom/squareup/okhttp/Request;J)Lokio/Sink;
    .registers 6
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .param p2, "contentLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    const-string v0, "chunked"

    const-string v1, "Transfer-Encoding"

    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 37
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->newChunkedSink()Lokio/Sink;

    move-result-object v0

    .line 42
    :goto_14
    return-object v0

    .line 40
    :cond_15
    const-wide/16 v0, -0x1

    cmp-long v0, p2, v0

    if-eqz v0, :cond_22

    .line 42
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0, p2, p3}, Lcom/squareup/okhttp/internal/http/HttpConnection;->newFixedLengthSink(J)Lokio/Sink;

    move-result-object v0

    goto :goto_14

    .line 45
    :cond_22
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot stream a request body without chunked encoding or a known content length!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public disconnect(Lcom/squareup/okhttp/internal/http/HttpEngine;)V
    .registers 3
    .param p1, "engine"    # Lcom/squareup/okhttp/internal/http/HttpEngine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->closeIfOwnedBy(Ljava/lang/Object;)V

    .line 133
    return-void
.end method

.method public emptyTransferStream()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->emptyResponseBody()V

    .line 109
    return-void
.end method

.method public flushRequest()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->flush()V

    .line 51
    return-void
.end method

.method public getTransferStream(Lcom/squareup/okhttp/internal/http/CacheRequest;)Lokio/Source;
    .registers 8
    .param p1, "cacheRequest"    # Lcom/squareup/okhttp/internal/http/CacheRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->hasResponseBody()Z

    move-result v2

    if-nez v2, :cond_11

    .line 113
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    const-wide/16 v4, 0x0

    invoke-virtual {v2, p1, v4, v5}, Lcom/squareup/okhttp/internal/http/HttpConnection;->newFixedLengthSource(Lcom/squareup/okhttp/internal/http/CacheRequest;J)Lokio/Source;

    move-result-object v2

    .line 128
    :goto_10
    return-object v2

    .line 116
    :cond_11
    const-string v2, "chunked"

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v3}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v3

    const-string v4, "Transfer-Encoding"

    invoke-virtual {v3, v4}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 117
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2, p1, v3}, Lcom/squareup/okhttp/internal/http/HttpConnection;->newChunkedSource(Lcom/squareup/okhttp/internal/http/CacheRequest;Lcom/squareup/okhttp/internal/http/HttpEngine;)Lokio/Source;

    move-result-object v2

    goto :goto_10

    .line 120
    :cond_2e
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getResponse()Lcom/squareup/okhttp/Response;

    move-result-object v2

    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/OkHeaders;->contentLength(Lcom/squareup/okhttp/Response;)J

    move-result-wide v0

    .line 121
    .local v0, "contentLength":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_45

    .line 122
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v2, p1, v0, v1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->newFixedLengthSource(Lcom/squareup/okhttp/internal/http/CacheRequest;J)Lokio/Source;

    move-result-object v2

    goto :goto_10

    .line 128
    :cond_45
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v2, p1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->newUnknownLengthSource(Lcom/squareup/okhttp/internal/http/CacheRequest;)Lokio/Source;

    move-result-object v2

    goto :goto_10
.end method

.method public readResponseHeaders()Lcom/squareup/okhttp/Response$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->readResponse()Lcom/squareup/okhttp/Response$Builder;

    move-result-object v0

    return-object v0
.end method

.method public releaseConnectionOnIdle()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/http/HttpTransport;->canReuseConnection()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 83
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->poolOnIdle()V

    .line 87
    :goto_b
    return-void

    .line 85
    :cond_c
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->closeOnIdle()V

    goto :goto_b
.end method

.method public writeRequestBody(Lcom/squareup/okhttp/internal/http/RetryableSink;)V
    .registers 3
    .param p1, "requestBody"    # Lcom/squareup/okhttp/internal/http/RetryableSink;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->writeRequestBody(Lcom/squareup/okhttp/internal/http/RetryableSink;)V

    .line 55
    return-void
.end method

.method public writeRequestHeaders(Lcom/squareup/okhttp/Request;)V
    .registers 5
    .param p1, "request"    # Lcom/squareup/okhttp/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->writingRequestHeaders()V

    .line 71
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getConnection()Lcom/squareup/okhttp/Connection;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/Connection;->getRoute()Lcom/squareup/okhttp/Route;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/Route;->getProxy()Ljava/net/Proxy;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpEngine:Lcom/squareup/okhttp/internal/http/HttpEngine;

    invoke-virtual {v2}, Lcom/squareup/okhttp/internal/http/HttpEngine;->getConnection()Lcom/squareup/okhttp/Connection;

    move-result-object v2

    invoke-virtual {v2}, Lcom/squareup/okhttp/Connection;->getProtocol()Lcom/squareup/okhttp/Protocol;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/squareup/okhttp/internal/http/RequestLine;->get(Lcom/squareup/okhttp/Request;Ljava/net/Proxy$Type;Lcom/squareup/okhttp/Protocol;)Ljava/lang/String;

    move-result-object v0

    .line 74
    .local v0, "requestLine":Ljava/lang/String;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpTransport;->httpConnection:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->writeRequest(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)V

    .line 75
    return-void
.end method
