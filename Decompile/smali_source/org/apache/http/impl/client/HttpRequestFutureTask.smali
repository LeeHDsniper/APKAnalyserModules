.class public Lorg/apache/http/impl/client/HttpRequestFutureTask;
.super Ljava/util/concurrent/FutureTask;
.source "HttpRequestFutureTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/FutureTask",
        "<TV;>;"
    }
.end annotation


# instance fields
.field private final callable:Lorg/apache/http/impl/client/HttpRequestTaskCallable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/http/impl/client/HttpRequestTaskCallable",
            "<TV;>;"
        }
    .end annotation
.end field

.field private final request:Lorg/apache/http/client/methods/HttpUriRequest;


# direct methods
.method public constructor <init>(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/impl/client/HttpRequestTaskCallable;)V
    .registers 3
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/impl/client/HttpRequestTaskCallable",
            "<TV;>;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestFutureTask;, "Lorg/apache/http/impl/client/HttpRequestFutureTask<TV;>;"
    .local p2, "httpCallable":Lorg/apache/http/impl/client/HttpRequestTaskCallable;, "Lorg/apache/http/impl/client/HttpRequestTaskCallable<TV;>;"
    invoke-direct {p0, p2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 48
    iput-object p1, p0, Lorg/apache/http/impl/client/HttpRequestFutureTask;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 49
    iput-object p2, p0, Lorg/apache/http/impl/client/HttpRequestFutureTask;->callable:Lorg/apache/http/impl/client/HttpRequestTaskCallable;

    .line 50
    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .registers 3
    .param p1, "mayInterruptIfRunning"    # Z

    .prologue
    .line 58
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestFutureTask;, "Lorg/apache/http/impl/client/HttpRequestFutureTask<TV;>;"
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpRequestFutureTask;->callable:Lorg/apache/http/impl/client/HttpRequestTaskCallable;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->cancel()V

    .line 59
    if-eqz p1, :cond_c

    .line 60
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpRequestFutureTask;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v0}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V

    .line 62
    :cond_c
    invoke-super {p0, p1}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method public endedTime()J
    .registers 3

    .prologue
    .line 83
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestFutureTask;, "Lorg/apache/http/impl/client/HttpRequestFutureTask<TV;>;"
    invoke-virtual {p0}, Lorg/apache/http/impl/client/HttpRequestFutureTask;->isDone()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 84
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpRequestFutureTask;->callable:Lorg/apache/http/impl/client/HttpRequestTaskCallable;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->getEnded()J

    move-result-wide v0

    return-wide v0

    .line 86
    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Task is not done yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public requestDuration()J
    .registers 5

    .prologue
    .line 95
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestFutureTask;, "Lorg/apache/http/impl/client/HttpRequestFutureTask<TV;>;"
    invoke-virtual {p0}, Lorg/apache/http/impl/client/HttpRequestFutureTask;->isDone()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 96
    invoke-virtual {p0}, Lorg/apache/http/impl/client/HttpRequestFutureTask;->endedTime()J

    move-result-wide v0

    invoke-virtual {p0}, Lorg/apache/http/impl/client/HttpRequestFutureTask;->startedTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    return-wide v0

    .line 98
    :cond_10
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Task is not done yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public scheduledTime()J
    .registers 3

    .prologue
    .line 69
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestFutureTask;, "Lorg/apache/http/impl/client/HttpRequestFutureTask<TV;>;"
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpRequestFutureTask;->callable:Lorg/apache/http/impl/client/HttpRequestTaskCallable;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->getScheduled()J

    move-result-wide v0

    return-wide v0
.end method

.method public startedTime()J
    .registers 3

    .prologue
    .line 76
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestFutureTask;, "Lorg/apache/http/impl/client/HttpRequestFutureTask<TV;>;"
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpRequestFutureTask;->callable:Lorg/apache/http/impl/client/HttpRequestTaskCallable;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/HttpRequestTaskCallable;->getStarted()J

    move-result-wide v0

    return-wide v0
.end method

.method public taskDuration()J
    .registers 5

    .prologue
    .line 106
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestFutureTask;, "Lorg/apache/http/impl/client/HttpRequestFutureTask<TV;>;"
    invoke-virtual {p0}, Lorg/apache/http/impl/client/HttpRequestFutureTask;->isDone()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 107
    invoke-virtual {p0}, Lorg/apache/http/impl/client/HttpRequestFutureTask;->endedTime()J

    move-result-wide v0

    invoke-virtual {p0}, Lorg/apache/http/impl/client/HttpRequestFutureTask;->scheduledTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    return-wide v0

    .line 109
    :cond_10
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Task is not done yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 115
    .local p0, "this":Lorg/apache/http/impl/client/HttpRequestFutureTask;, "Lorg/apache/http/impl/client/HttpRequestFutureTask<TV;>;"
    iget-object v0, p0, Lorg/apache/http/impl/client/HttpRequestFutureTask;->request:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v0}, Lorg/apache/http/client/methods/HttpUriRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
