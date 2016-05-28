.class final Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;
.super Ljava/lang/Object;
.source "SpdyStream.java"

# interfaces
.implements Lokio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/SpdyStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SpdyDataSource"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private closed:Z

.field private finished:Z

.field private final maxByteCount:J

.field private final readBuffer:Lokio/Buffer;

.field private final receiveBuffer:Lokio/Buffer;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 314
    const-class v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private constructor <init>(Lcom/squareup/okhttp/internal/spdy/SpdyStream;J)V
    .registers 6
    .param p2, "maxByteCount"    # J

    .prologue
    .line 333
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 316
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->receiveBuffer:Lokio/Buffer;

    .line 319
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->readBuffer:Lokio/Buffer;

    .line 334
    iput-wide p2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->maxByteCount:J

    .line 335
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/internal/spdy/SpdyStream;JLcom/squareup/okhttp/internal/spdy/SpdyStream$1;)V
    .registers 5
    .param p1, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream;
    .param p2, "x1"    # J
    .param p4, "x2"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream$1;

    .prologue
    .line 314
    invoke-direct {p0, p1, p2, p3}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;-><init>(Lcom/squareup/okhttp/internal/spdy/SpdyStream;J)V

    return-void
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;

    .prologue
    .line 314
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->finished:Z

    return v0
.end method

.method static synthetic access$102(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;
    .param p1, "x1"    # Z

    .prologue
    .line 314
    iput-boolean p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->finished:Z

    return p1
.end method

.method static synthetic access$300(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;

    .prologue
    .line 314
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->closed:Z

    return v0
.end method

.method private checkNotClosed()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 438
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->closed:Z

    if-eqz v0, :cond_c

    .line 439
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 441
    :cond_c
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->errorCode:Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$800(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v0

    if-eqz v0, :cond_33

    .line 442
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stream was reset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->errorCode:Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$800(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 444
    :cond_33
    return-void
.end method

.method private waitUntilReadable()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 374
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeout:Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$700(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;->enter()V

    .line 376
    :goto_9
    :try_start_9
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_36

    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->finished:Z

    if-nez v0, :cond_36

    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->closed:Z

    if-nez v0, :cond_36

    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->errorCode:Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$800(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v0

    if-nez v0, :cond_36

    .line 377
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # invokes: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->waitForIo()V
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$900(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V
    :try_end_2a
    .catchall {:try_start_9 .. :try_end_2a} :catchall_2b

    goto :goto_9

    .line 380
    :catchall_2b
    move-exception v0

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeout:Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$700(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;->exitAndThrowIfTimedOut()V

    throw v0

    :cond_36
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeout:Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$700(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;->exitAndThrowIfTimedOut()V

    .line 382
    return-void
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
    .line 429
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v1

    .line 430
    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->closed:Z

    .line 431
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v0}, Lokio/Buffer;->clear()V

    .line 432
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 433
    monitor-exit v1
    :try_end_11
    .catchall {:try_start_4 .. :try_end_11} :catchall_17

    .line 434
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # invokes: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->cancelStreamIfNecessary()V
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1000(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V

    .line 435
    return-void

    .line 433
    :catchall_17
    move-exception v0

    :try_start_18
    monitor-exit v1
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw v0
.end method

.method public read(Lokio/Buffer;J)J
    .registers 12
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 339
    cmp-long v2, p2, v6

    if-gez v2, :cond_1f

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

    .line 342
    :cond_1f
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v3

    .line 343
    :try_start_22
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->waitUntilReadable()V

    .line 344
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->checkNotClosed()V

    .line 345
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v2}, Lokio/Buffer;->size()J

    move-result-wide v4

    cmp-long v2, v4, v6

    if-nez v2, :cond_36

    const-wide/16 v0, -0x1

    monitor-exit v3

    .line 369
    :goto_35
    return-wide v0

    .line 348
    :cond_36
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->readBuffer:Lokio/Buffer;

    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v4}, Lokio/Buffer;->size()J

    move-result-wide v4

    invoke-static {p2, p3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-virtual {v2, p1, v4, v5}, Lokio/Buffer;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 351
    .local v0, "read":J
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    iget-wide v4, v2, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->unacknowledgedBytesRead:J

    add-long/2addr v4, v0

    iput-wide v4, v2, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->unacknowledgedBytesRead:J

    .line 352
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    iget-wide v4, v2, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->unacknowledgedBytesRead:J

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v2

    iget-object v2, v2, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->okHttpSettings:Lcom/squareup/okhttp/internal/spdy/Settings;

    const/high16 v6, 0x10000

    invoke-virtual {v2, v6}, Lcom/squareup/okhttp/internal/spdy/Settings;->getInitialWindowSize(I)I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-long v6, v2

    cmp-long v2, v4, v6

    if-ltz v2, :cond_7f

    .line 354
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v2

    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->id:I
    invoke-static {v4}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$600(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)I

    move-result v4

    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    iget-wide v6, v5, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->unacknowledgedBytesRead:J

    invoke-virtual {v2, v4, v6, v7}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->writeWindowUpdateLater(IJ)V

    .line 355
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    const-wide/16 v4, 0x0

    iput-wide v4, v2, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->unacknowledgedBytesRead:J

    .line 357
    :cond_7f
    monitor-exit v3
    :try_end_80
    .catchall {:try_start_22 .. :try_end_80} :catchall_d1

    .line 360
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v3

    monitor-enter v3

    .line 361
    :try_start_87
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v2

    iget-wide v4, v2, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->unacknowledgedBytesRead:J

    add-long/2addr v4, v0

    iput-wide v4, v2, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->unacknowledgedBytesRead:J

    .line 362
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v2

    iget-wide v4, v2, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->unacknowledgedBytesRead:J

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v2

    iget-object v2, v2, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->okHttpSettings:Lcom/squareup/okhttp/internal/spdy/Settings;

    const/high16 v6, 0x10000

    invoke-virtual {v2, v6}, Lcom/squareup/okhttp/internal/spdy/Settings;->getInitialWindowSize(I)I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-long v6, v2

    cmp-long v2, v4, v6

    if-ltz v2, :cond_cb

    .line 364
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v2

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v5}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v5

    iget-wide v6, v5, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->unacknowledgedBytesRead:J

    invoke-virtual {v2, v4, v6, v7}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->writeWindowUpdateLater(IJ)V

    .line 365
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$500(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v2

    const-wide/16 v4, 0x0

    iput-wide v4, v2, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->unacknowledgedBytesRead:J

    .line 367
    :cond_cb
    monitor-exit v3

    goto/16 :goto_35

    :catchall_ce
    move-exception v2

    monitor-exit v3
    :try_end_d0
    .catchall {:try_start_87 .. :try_end_d0} :catchall_ce

    throw v2

    .line 357
    .end local v0    # "read":J
    :catchall_d1
    move-exception v2

    :try_start_d2
    monitor-exit v3
    :try_end_d3
    .catchall {:try_start_d2 .. :try_end_d3} :catchall_d1

    throw v2
.end method

.method receive(Lokio/BufferedSource;J)V
    .registers 16
    .param p1, "in"    # Lokio/BufferedSource;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 385
    sget-boolean v5, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->$assertionsDisabled:Z

    if-nez v5, :cond_32

    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-static {v5}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_32

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 411
    .local v0, "finished":Z
    .local v1, "flowControlError":Z
    .local v2, "read":J
    :cond_12
    sub-long/2addr p2, v2

    .line 414
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v6

    .line 415
    :try_start_16
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v5, v8, v10

    if-nez v5, :cond_76

    const/4 v4, 0x1

    .line 416
    .local v4, "wasEmpty":Z
    :goto_23
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->readBuffer:Lokio/Buffer;

    iget-object v7, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->receiveBuffer:Lokio/Buffer;

    invoke-virtual {v5, v7}, Lokio/Buffer;->writeAll(Lokio/Source;)J

    .line 417
    if-eqz v4, :cond_31

    .line 418
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 420
    :cond_31
    monitor-exit v6
    :try_end_32
    .catchall {:try_start_16 .. :try_end_32} :catchall_78

    .line 387
    .end local v0    # "finished":Z
    .end local v1    # "flowControlError":Z
    .end local v2    # "read":J
    .end local v4    # "wasEmpty":Z
    :cond_32
    const-wide/16 v6, 0x0

    cmp-long v5, p2, v6

    if-lez v5, :cond_58

    .line 390
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v6

    .line 391
    :try_start_3b
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->finished:Z

    .line 392
    .restart local v0    # "finished":Z
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->readBuffer:Lokio/Buffer;

    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v8

    add-long/2addr v8, p2

    iget-wide v10, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->maxByteCount:J

    cmp-long v5, v8, v10

    if-lez v5, :cond_59

    const/4 v1, 0x1

    .line 393
    .restart local v1    # "flowControlError":Z
    :goto_4b
    monitor-exit v6
    :try_end_4c
    .catchall {:try_start_3b .. :try_end_4c} :catchall_5b

    .line 396
    if-eqz v1, :cond_5e

    .line 397
    invoke-interface {p1, p2, p3}, Lokio/BufferedSource;->skip(J)V

    .line 398
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    sget-object v6, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->FLOW_CONTROL_ERROR:Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    invoke-virtual {v5, v6}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->closeLater(Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V

    .line 422
    .end local v0    # "finished":Z
    .end local v1    # "flowControlError":Z
    :cond_58
    :goto_58
    return-void

    .line 392
    .restart local v0    # "finished":Z
    :cond_59
    const/4 v1, 0x0

    goto :goto_4b

    .line 393
    .end local v0    # "finished":Z
    :catchall_5b
    move-exception v5

    :try_start_5c
    monitor-exit v6
    :try_end_5d
    .catchall {:try_start_5c .. :try_end_5d} :catchall_5b

    throw v5

    .line 403
    .restart local v0    # "finished":Z
    .restart local v1    # "flowControlError":Z
    :cond_5e
    if-eqz v0, :cond_64

    .line 404
    invoke-interface {p1, p2, p3}, Lokio/BufferedSource;->skip(J)V

    goto :goto_58

    .line 409
    :cond_64
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->receiveBuffer:Lokio/Buffer;

    invoke-interface {p1, v5, p2, p3}, Lokio/BufferedSource;->read(Lokio/Buffer;J)J

    move-result-wide v2

    .line 410
    .restart local v2    # "read":J
    const-wide/16 v6, -0x1

    cmp-long v5, v2, v6

    if-nez v5, :cond_12

    new-instance v5, Ljava/io/EOFException;

    invoke-direct {v5}, Ljava/io/EOFException;-><init>()V

    throw v5

    .line 415
    :cond_76
    const/4 v4, 0x0

    goto :goto_23

    .line 420
    :catchall_78
    move-exception v5

    :try_start_79
    monitor-exit v6
    :try_end_7a
    .catchall {:try_start_79 .. :try_end_7a} :catchall_78

    throw v5
.end method

.method public timeout()Lokio/Timeout;
    .registers 2

    .prologue
    .line 425
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeout:Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$700(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;

    move-result-object v0

    return-object v0
.end method
