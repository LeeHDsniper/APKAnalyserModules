.class public Lorg/apache/http/impl/client/FutureRequestExecutionService;
.super Ljava/lang/Object;
.source "FutureRequestExecutionService.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final closed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private final httpclient:Lorg/apache/http/client/HttpClient;

.field private final metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;


# direct methods
.method public constructor <init>(Lorg/apache/http/client/HttpClient;Ljava/util/concurrent/ExecutorService;)V
    .registers 5
    .param p1, "httpclient"    # Lorg/apache/http/client/HttpClient;
    .param p2, "executorService"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-direct {v0}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    .line 51
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 69
    iput-object p1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->httpclient:Lorg/apache/http/client/HttpClient;

    .line 70
    iput-object p2, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 71
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
    .line 136
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 137
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 138
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->httpclient:Lorg/apache/http/client/HttpClient;

    instance-of v0, v0, Ljava/io/Closeable;

    if-eqz v0, :cond_18

    .line 139
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->httpclient:Lorg/apache/http/client/HttpClient;

    check-cast v0, Ljava/io/Closeable;

    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    .line 141
    :cond_18
    return-void
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/ResponseHandler;)Lorg/apache/http/impl/client/HttpRequestFutureTask;
    .registers 5
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/protocol/HttpContext;",
            "Lorg/apache/http/client/ResponseHandler",
            "<TT;>;)",
            "Lorg/apache/http/impl/client/HttpRequestFutureTask",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 89
    .local p3, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/http/impl/client/FutureRequestExecutionService;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/concurrent/FutureCallback;)Lorg/apache/http/impl/client/HttpRequestFutureTask;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/concurrent/FutureCallback;)Lorg/apache/http/impl/client/HttpRequestFutureTask;
    .registers 13
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/protocol/HttpContext;",
            "Lorg/apache/http/client/ResponseHandler",
            "<TT;>;",
            "Lorg/apache/http/concurrent/FutureCallback",
            "<TT;>;)",
            "Lorg/apache/http/impl/client/HttpRequestFutureTask",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 114
    .local p3, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<TT;>;"
    .local p4, "callback":Lorg/apache/http/concurrent/FutureCallback;, "Lorg/apache/http/concurrent/FutureCallback<TT;>;"
    iget-object v1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->closed:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 115
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Close has been called on this httpclient instance."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 117
    :cond_10
    iget-object v1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    invoke-virtual {v1}, Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;->getScheduledConnections()Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 118
    new-instance v0, Lorg/apache/http/impl/client/HttpRequestTaskCallable;

    iget-object v1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->httpclient:Lorg/apache/http/client/HttpClient;

    iget-object v6, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/impl/client/HttpRequestTaskCallable;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/concurrent/FutureCallback;Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;)V

    .line 120
    .local v0, "callable":Lorg/apache/http/impl/client/HttpRequestTaskCallable;, "Lorg/apache/http/impl/client/HttpRequestTaskCallable<TT;>;"
    new-instance v7, Lorg/apache/http/impl/client/HttpRequestFutureTask;

    invoke-direct {v7, p1, v0}, Lorg/apache/http/impl/client/HttpRequestFutureTask;-><init>(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/impl/client/HttpRequestTaskCallable;)V

    .line 122
    .local v7, "httpRequestFutureTask":Lorg/apache/http/impl/client/HttpRequestFutureTask;, "Lorg/apache/http/impl/client/HttpRequestFutureTask<TT;>;"
    iget-object v1, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 124
    return-object v7
.end method

.method public metrics()Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lorg/apache/http/impl/client/FutureRequestExecutionService;->metrics:Lorg/apache/http/impl/client/FutureRequestExecutionMetrics;

    return-object v0
.end method
