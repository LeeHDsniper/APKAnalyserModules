.class Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;
.super Ljava/lang/Object;
.source "HttpConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AbstractSource"
.end annotation


# instance fields
.field protected final cacheBody:Lokio/Sink;

.field private final cacheRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

.field protected closed:Z

.field final synthetic this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/http/HttpConnection;Lcom/squareup/okhttp/internal/http/CacheRequest;)V
    .registers 4
    .param p2, "cacheRequest"    # Lcom/squareup/okhttp/internal/http/CacheRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 379
    if-eqz p2, :cond_13

    invoke-interface {p2}, Lcom/squareup/okhttp/internal/http/CacheRequest;->body()Lokio/Sink;

    move-result-object v0

    .line 380
    .local v0, "cacheBody":Lokio/Sink;
    :goto_b
    if-nez v0, :cond_e

    .line 381
    const/4 p2, 0x0

    .line 384
    :cond_e
    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->cacheBody:Lokio/Sink;

    .line 385
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->cacheRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    .line 386
    return-void

    .line 379
    .end local v0    # "cacheBody":Lokio/Sink;
    :cond_13
    const/4 v0, 0x0

    goto :goto_b
.end method


# virtual methods
.method protected final cacheWrite(Lokio/Buffer;J)V
    .registers 8
    .param p1, "source"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->cacheBody:Lokio/Sink;

    if-eqz v1, :cond_15

    .line 392
    invoke-virtual {p1}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object v0

    .line 393
    .local v0, "sourceCopy":Lokio/Buffer;
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v2

    sub-long/2addr v2, p2

    invoke-virtual {v0, v2, v3}, Lokio/Buffer;->skip(J)V

    .line 394
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->cacheBody:Lokio/Sink;

    invoke-interface {v1, v0, p2, p3}, Lokio/Sink;->write(Lokio/Buffer;J)V

    .line 396
    .end local v0    # "sourceCopy":Lokio/Buffer;
    :cond_15
    return-void
.end method

.method protected final endOfInput(Z)V
    .registers 5
    .param p1, "recyclable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 403
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->state:I
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$300(Lcom/squareup/okhttp/internal/http/HttpConnection;)I

    move-result v0

    const/4 v1, 0x5

    if-eq v0, v1, :cond_29

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->state:I
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$300(Lcom/squareup/okhttp/internal/http/HttpConnection;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 405
    :cond_29
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->cacheRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    if-eqz v0, :cond_32

    .line 406
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->cacheBody:Lokio/Sink;

    invoke-interface {v0}, Lokio/Sink;->close()V

    .line 409
    :cond_32
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # setter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->state:I
    invoke-static {v0, v2}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$302(Lcom/squareup/okhttp/internal/http/HttpConnection;I)I

    .line 410
    if-eqz p1, :cond_59

    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->onIdle:I
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$600(Lcom/squareup/okhttp/internal/http/HttpConnection;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_59

    .line 411
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # setter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->onIdle:I
    invoke-static {v0, v2}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$602(Lcom/squareup/okhttp/internal/http/HttpConnection;I)I

    .line 412
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->pool:Lcom/squareup/okhttp/ConnectionPool;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$700(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lcom/squareup/okhttp/ConnectionPool;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->connection:Lcom/squareup/okhttp/Connection;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$800(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lcom/squareup/okhttp/Connection;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/squareup/okhttp/internal/Internal;->recycle(Lcom/squareup/okhttp/ConnectionPool;Lcom/squareup/okhttp/Connection;)V

    .line 417
    :cond_58
    :goto_58
    return-void

    .line 413
    :cond_59
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->onIdle:I
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$600(Lcom/squareup/okhttp/internal/http/HttpConnection;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_58

    .line 414
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    const/4 v1, 0x6

    # setter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->state:I
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$302(Lcom/squareup/okhttp/internal/http/HttpConnection;I)I

    .line 415
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->connection:Lcom/squareup/okhttp/Connection;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$800(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lcom/squareup/okhttp/Connection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    goto :goto_58
.end method

.method protected final unexpectedEndOfInput()V
    .registers 3

    .prologue
    .line 432
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->cacheRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    if-eqz v0, :cond_9

    .line 433
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->cacheRequest:Lcom/squareup/okhttp/internal/http/CacheRequest;

    invoke-interface {v0}, Lcom/squareup/okhttp/internal/http/CacheRequest;->abort()V

    .line 435
    :cond_9
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->connection:Lcom/squareup/okhttp/Connection;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$800(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lcom/squareup/okhttp/Connection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v0

    invoke-static {v0}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/net/Socket;)V

    .line 436
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$AbstractSource;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    const/4 v1, 0x6

    # setter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->state:I
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$302(Lcom/squareup/okhttp/internal/http/HttpConnection;I)I

    .line 437
    return-void
.end method
