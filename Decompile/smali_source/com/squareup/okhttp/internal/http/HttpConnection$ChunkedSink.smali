.class final Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;
.super Ljava/lang/Object;
.source "HttpConnection.java"

# interfaces
.implements Lokio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/http/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ChunkedSink"
.end annotation


# instance fields
.field private closed:Z

.field private final hex:[B

.field final synthetic this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/internal/http/HttpConnection;)V
    .registers 3

    .prologue
    .line 328
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 330
    const/16 v0, 0x12

    new-array v0, v0, [B

    fill-array-data v0, :array_10

    iput-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->hex:[B

    return-void

    nop

    :array_10
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0xdt
        0xat
    .end array-data
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/internal/http/HttpConnection;Lcom/squareup/okhttp/internal/http/HttpConnection$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/internal/http/HttpConnection;
    .param p2, "x1"    # Lcom/squareup/okhttp/internal/http/HttpConnection$1;

    .prologue
    .line 328
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;-><init>(Lcom/squareup/okhttp/internal/http/HttpConnection;)V

    return-void
.end method

.method private writeHex(J)V
    .registers 10
    .param p1, "i"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 364
    const/16 v0, 0x10

    .line 366
    .local v0, "cursor":I
    :cond_2
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->hex:[B

    add-int/lit8 v0, v0, -0x1

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->HEX_DIGITS:[B
    invoke-static {}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$500()[B

    move-result-object v2

    const-wide/16 v4, 0xf

    and-long/2addr v4, p1

    long-to-int v3, v4

    aget-byte v2, v2, v3

    aput-byte v2, v1, v0

    .line 367
    const/4 v1, 0x4

    ushr-long/2addr p1, v1

    const-wide/16 v2, 0x0

    cmp-long v1, p1, v2

    if-nez v1, :cond_2

    .line 368
    iget-object v1, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->sink:Lokio/BufferedSink;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$200(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSink;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->hex:[B

    iget-object v3, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->hex:[B

    array-length v3, v3

    sub-int/2addr v3, v0

    invoke-interface {v1, v2, v0, v3}, Lokio/BufferedSink;->write([BII)Lokio/BufferedSink;

    .line 369
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 353
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->closed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_1e

    if-eqz v0, :cond_7

    .line 357
    :goto_5
    monitor-exit p0

    return-void

    .line 354
    :cond_7
    const/4 v0, 0x1

    :try_start_8
    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->closed:Z

    .line 355
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$200(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSink;

    move-result-object v0

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->FINAL_CHUNK:[B
    invoke-static {}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$400()[B

    move-result-object v1

    invoke-interface {v0, v1}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 356
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    const/4 v1, 0x3

    # setter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->state:I
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$302(Lcom/squareup/okhttp/internal/http/HttpConnection;I)I
    :try_end_1d
    .catchall {:try_start_8 .. :try_end_1d} :catchall_1e

    goto :goto_5

    .line 353
    :catchall_1e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->closed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_11

    if-eqz v0, :cond_7

    .line 350
    :goto_5
    monitor-exit p0

    return-void

    .line 349
    :cond_7
    :try_start_7
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$200(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSink;

    move-result-object v0

    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_11

    goto :goto_5

    .line 348
    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 335
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$200(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSink;

    move-result-object v0

    invoke-interface {v0}, Lokio/BufferedSink;->timeout()Lokio/Timeout;

    move-result-object v0

    return-object v0
.end method

.method public write(Lokio/Buffer;J)V
    .registers 6
    .param p1, "source"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 339
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->closed:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 340
    :cond_c
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-nez v0, :cond_13

    .line 345
    :goto_12
    return-void

    .line 342
    :cond_13
    invoke-direct {p0, p2, p3}, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->writeHex(J)V

    .line 343
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$200(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSink;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    .line 344
    iget-object v0, p0, Lcom/squareup/okhttp/internal/http/HttpConnection$ChunkedSink;->this$0:Lcom/squareup/okhttp/internal/http/HttpConnection;

    # getter for: Lcom/squareup/okhttp/internal/http/HttpConnection;->sink:Lokio/BufferedSink;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/http/HttpConnection;->access$200(Lcom/squareup/okhttp/internal/http/HttpConnection;)Lokio/BufferedSink;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    goto :goto_12
.end method
