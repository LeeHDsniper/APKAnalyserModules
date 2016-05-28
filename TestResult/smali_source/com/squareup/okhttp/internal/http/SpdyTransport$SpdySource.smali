.class Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;
.super Ljava/lang/Object;
.source "SpdyTransport.java"

# interfaces
.implements Lokio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/SpdyTransport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SpdySource"
.end annotation


# instance fields
.field private final cacheBody:Lokio/Sink;

.field private final cacheRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

.field private closed:Z

.field private inputExhausted:Z

.field private final source:Lokio/Source;

.field private final stream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/spdy/SpdyStream;Lcom/squareup/okhttp/internal/http/CacheRequest;)V
    .registers 5
    .param p1, "stream"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream;
    .param p2, "cacheRequest"    # Lcom/squareup/okhttp/internal/http/CacheRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 250
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->stream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    .line 251
    invoke-virtual {p1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->getSource()Lokio/Source;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->source:Lokio/Source;

    .line 254
    if-eqz p2, :cond_19

    invoke-interface {p2}, Lcom/squareup/okhttp/internal/http/CacheRequest;->body()Lokio/Sink;

    move-result-object v0

    .line 255
    .local v0, "cacheBody":Lokio/Sink;
    :goto_11
    if-nez v0, :cond_14

    .line 256
    const/4 p2, 0x0

    .line 259
    :cond_14
    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->cacheBody:Lokio/Sink;

    .line 260
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->cacheRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    .line 261
    return-void

    .line 254
    .end local v0    # "cacheBody":Lokio/Sink;
    :cond_19
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private discardStream()Z
    .registers 8

    .prologue
    .line 308
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->stream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeout()Lokio/Timeout;

    move-result-object v1

    invoke-virtual {v1}, Lokio/Timeout;->timeoutNanos()J

    move-result-wide v2

    .line 309
    .local v2, "oldTimeoutNanos":J
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->stream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeout()Lokio/Timeout;

    move-result-object v1

    const-wide/16 v4, 0x64

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v4, v5, v6}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 311
    const/16 v1, 0x64

    :try_start_19
    invoke-static {p0, v1}, Lcom/squareup/okhttp/internal/Util;->skipAll(Lokio/Source;I)Z
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1c} :catch_29
    .catchall {:try_start_19 .. :try_end_1c} :catchall_37

    .line 312
    const/4 v1, 0x1

    .line 316
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->stream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeout()Lokio/Timeout;

    move-result-object v4

    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v2, v3, v5}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    :goto_28
    return v1

    .line 313
    :catch_29
    move-exception v0

    .line 314
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    .line 316
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->stream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeout()Lokio/Timeout;

    move-result-object v4

    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v2, v3, v5}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    goto :goto_28

    .end local v0    # "e":Ljava/io/IOException;
    :catchall_37
    move-exception v1

    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->stream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v4}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeout()Lokio/Timeout;

    move-result-object v4

    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v2, v3, v5}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    throw v1
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 291
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->closed:Z

    if-eqz v0, :cond_5

    .line 305
    :cond_4
    :goto_4
    return-void

    .line 293
    :cond_5
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->inputExhausted:Z

    if-nez v0, :cond_10

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->cacheBody:Lokio/Sink;

    if-eqz v0, :cond_10

    .line 294
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->discardStream()Z

    .line 297
    :cond_10
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->closed:Z

    .line 299
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->inputExhausted:Z

    if-nez v0, :cond_4

    .line 300
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->stream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    sget-object v1, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->CANCEL:Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->closeLater(Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V

    .line 301
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->cacheRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    if-eqz v0, :cond_4

    .line 302
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->cacheRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    invoke-interface {v0}, Lcom/squareup/okhttp/internal/http/CacheRequest;->abort()V

    goto :goto_4
.end method

.method public read(Lokio/Buffer;J)J
    .registers 10
    .param p1, "buffer"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, -0x1

    .line 265
    const-wide/16 v4, 0x0

    cmp-long v4, p2, v4

    if-gez v4, :cond_21

    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "byteCount < 0: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 266
    :cond_21
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->closed:Z

    if-eqz v4, :cond_2d

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "closed"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 267
    :cond_2d
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->inputExhausted:Z

    if-eqz v4, :cond_33

    move-wide v0, v2

    .line 283
    :cond_32
    :goto_32
    return-wide v0

    .line 269
    :cond_33
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->source:Lokio/Source;

    invoke-interface {v4, p1, p2, p3}, Lokio/Source;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 270
    .local v0, "read":J
    cmp-long v4, v0, v2

    if-nez v4, :cond_4b

    .line 271
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->inputExhausted:Z

    .line 272
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->cacheRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    if-eqz v4, :cond_49

    .line 273
    iget-object v4, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->cacheBody:Lokio/Sink;

    invoke-interface {v4}, Lokio/Sink;->close()V

    :cond_49
    move-wide v0, v2

    .line 275
    goto :goto_32

    .line 278
    :cond_4b
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->cacheBody:Lokio/Sink;

    if-eqz v2, :cond_32

    .line 280
    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->cacheBody:Lokio/Sink;

    invoke-virtual {p1}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object v3

    invoke-interface {v2, v3, v0, v1}, Lokio/Sink;->write(Lokio/Buffer;J)V

    goto :goto_32
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 287
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/SpdyTransport$SpdySource;->source:Lokio/Source;

    invoke-interface {v0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v0

    return-object v0
.end method
