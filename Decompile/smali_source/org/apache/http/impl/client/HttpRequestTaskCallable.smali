.class Lorg/apache/http/impl/client/HttpRequestTaskCallable;
.super Ljava/lang/Object;
.source "HttpRequestTaskCallable.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TV;>;"
    }
.end annotation


# instance fields
.field private final callback:Lorg/apache/http/concurrent/FutureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/concurrent/FutureCallback",
            "<TV;>;"
        }
    .end annotation
.end field

.field private final cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final context:Lorg/apache/http/protocol/HttpContext;

.field private ended:J

.field private final httpclient:Lorg/apache/http/client/HttpClient;

.field private final metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

.field private final request:Lorg/apache/http/client/methods/HttpUriRequest;

.field private final responseHandler:Lorg/apache/http/client/ResponseHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/client/ResponseHandler",
            "<TV;>;"
        }
    .end annotation
.end field

.field private final scheduled:J

.field private started:J


# direct methods
.method constructor <init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/concurrent/FutureCallback;Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;)V
    .registers 11
    .param p1, "httpClient"    # Lorg/apache/http/client/HttpClient;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p6, "metrics"    # Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/HttpClient;",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/protocol/HttpContext;",
            "Lorg/apache/http/client/ResponseHandler",
            "<TV;>;",
            "Lorg/apache/http/concurrent/FutureCallback",
            "<TV;>;",
            "Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestTaskCallable;, "Lorg/apache/http/impl/client/HttpRequestTaskCallable<TV;>;"
    .local p4, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<TV;>;"
    .local p5, "callback":Lorg/apache/http/concurrent/FutureCallback;, "Lorg/apache/http/concurrent/FutureCallback<TV;>;"
    const-wide/16 v2, -0x1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->scheduled:J

    .line 45
    iput-wide v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->started:J

    .line 46
    iput-wide v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->ended:J

    .line 61
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->httpclient:Lorg/apache/http/client/HttpClient;

    .line 62
    iput-object p4, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->responseHandler:Lorg/apache/http/client/ResponseHandler;

    .line 63
    iput-object p2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 64
    iput-object p3, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->context:Lorg/apache/http/protocol/HttpContext;

    .line 65
    iput-object p5, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->callback:Lorg/apache/http/concurrent/FutureCallback;

    .line 66
    iput-object p6, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    .line 67
    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestTaskCallable;, "Lorg/apache/http/impl/client/HttpRequestTaskCallable<TV;>;"
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_a3

    .line 84
    :try_start_8
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v2}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getActiveConnections()Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 85
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->started:J
    :try_end_17
    .catchall {:try_start_8 .. :try_end_17} :catchall_82

    .line 87
    :try_start_17
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v2}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getScheduledConnections()Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    .line 88
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->httpclient:Lorg/apache/http/client/HttpClient;

    iget-object v3, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    iget-object v4, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->responseHandler:Lorg/apache/http/client/ResponseHandler;

    iget-object v5, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->context:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v2, v3, v4, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v1

    .line 89
    .local v1, "result":Ljava/lang/Object;, "TV;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->ended:J

    .line 90
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v2}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getSuccessfulConnections()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    move-result-object v2

    iget-wide v4, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->started:J

    invoke-virtual {v2, v4, v5}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->increment(J)V

    .line 91
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->callback:Lorg/apache/http/concurrent/FutureCallback;

    if-eqz v2, :cond_46

    .line 92
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->callback:Lorg/apache/http/concurrent/FutureCallback;

    invoke-interface {v2, v1}, Lorg/apache/http/concurrent/FutureCallback;->completed(Ljava/lang/Object;)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_46} :catch_66
    .catchall {:try_start_17 .. :try_end_46} :catchall_82

    .line 104
    :cond_46
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v2}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getRequests()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    move-result-object v2

    iget-wide v4, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->started:J

    invoke-virtual {v2, v4, v5}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->increment(J)V

    .line 105
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v2}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getTasks()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    move-result-object v2

    iget-wide v4, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->started:J

    invoke-virtual {v2, v4, v5}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->increment(J)V

    .line 106
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v2}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getActiveConnections()Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    return-object v1

    .line 95
    .end local v1    # "result":Ljava/lang/Object;, "TV;"
    :catch_66
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/Exception;
    :try_start_67
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v2}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getFailedConnections()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    move-result-object v2

    iget-wide v4, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->started:J

    invoke-virtual {v2, v4, v5}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->increment(J)V

    .line 97
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->ended:J

    .line 98
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->callback:Lorg/apache/http/concurrent/FutureCallback;

    if-eqz v2, :cond_81

    .line 99
    iget-object v2, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->callback:Lorg/apache/http/concurrent/FutureCallback;

    invoke-interface {v2, v0}, Lorg/apache/http/concurrent/FutureCallback;->failed(Ljava/lang/Exception;)V

    .line 101
    :cond_81
    throw v0
    :try_end_82
    .catchall {:try_start_67 .. :try_end_82} :catchall_82

    .line 104
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_82
    move-exception v2

    iget-object v3, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v3}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getRequests()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    move-result-object v3

    iget-wide v4, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->started:J

    invoke-virtual {v3, v4, v5}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->increment(J)V

    .line 105
    iget-object v3, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v3}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getTasks()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;

    move-result-object v3

    iget-wide v4, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->started:J

    invoke-virtual {v3, v4, v5}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics$DurationCounter;->increment(J)V

    .line 106
    iget-object v3, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v3}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getActiveConnections()Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    throw v2

    .line 109
    :cond_a3
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "call has been cancelled for request "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v4}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public cancel()V
    .registers 3

    .prologue
    .line 114
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestTaskCallable;, "Lorg/apache/http/impl/client/HttpRequestTaskCallable<TV;>;"
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->cancelled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 115
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->callback:Lorg/apache/http/concurrent/FutureCallback;

    if-eqz v0, :cond_f

    .line 116
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->callback:Lorg/apache/http/concurrent/FutureCallback;

    invoke-interface {v0}, Lorg/apache/http/concurrent/FutureCallback;->cancelled()V

    .line 118
    :cond_f
    return-void
.end method

.method public getEnded()J
    .registers 3

    .prologue
    .line 78
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestTaskCallable;, "Lorg/apache/http/impl/client/HttpRequestTaskCallable<TV;>;"
    iget-wide v0, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->ended:J

    return-wide v0
.end method

.method public getScheduled()J
    .registers 3

    .prologue
    .line 70
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestTaskCallable;, "Lorg/apache/http/impl/client/HttpRequestTaskCallable<TV;>;"
    iget-wide v0, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->scheduled:J

    return-wide v0
.end method

.method public getStarted()J
    .registers 3

    .prologue
    .line 74
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestTaskCallable;, "Lorg/apache/http/impl/client/HttpRequestTaskCallable<TV;>;"
    iget-wide v0, p0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->started:J

    return-wide v0
.end method
