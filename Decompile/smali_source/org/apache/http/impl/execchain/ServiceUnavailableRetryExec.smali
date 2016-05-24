.class public Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;
.super Ljava/lang/Object;
.source "ServiceUnavailableRetryExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

.field private final retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/client/ServiceUnavailableRetryStrategy;)V
    .registers 4
    .param p1, "requestExecutor"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "retryStrategy"    # Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->log:Lorg/apache/commons/logging/Log;

    .line 68
    const-string v0, "HTTP request executor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    const-string v0, "Retry strategy"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    iput-object p1, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    .line 71
    iput-object p2, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    .line 72
    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .registers 14
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 79
    const/4 v0, 0x1

    .line 80
    .local v0, "c":I
    :goto_1
    iget-object v6, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    invoke-interface {v6, p1, p2, p3, p4}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v3

    .line 83
    .local v3, "response":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_start_7
    iget-object v6, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    invoke-interface {v6, v3, v0, p3}, Lorg/apache/http/client/ServiceUnavailableRetryStrategy;->retryRequest(Lorg/apache/http/HttpResponse;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v6

    if-eqz v6, :cond_4f

    .line 84
    invoke-interface {v3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 85
    iget-object v6, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    invoke-interface {v6}, Lorg/apache/http/client/ServiceUnavailableRetryStrategy;->getRetryInterval()J
    :try_end_17
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_17} :catch_4a

    move-result-wide v4

    .line 86
    .local v4, "nextInterval":J
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-lez v6, :cond_39

    .line 88
    :try_start_1e
    iget-object v6, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Wait for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 89
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_39
    .catch Ljava/lang/InterruptedException; {:try_start_1e .. :try_end_39} :catch_3c
    .catch Ljava/lang/RuntimeException; {:try_start_1e .. :try_end_39} :catch_4a

    .line 79
    :cond_39
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 90
    :catch_3c
    move-exception v1

    .line 91
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_3d
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->interrupt()V

    .line 92
    new-instance v6, Ljava/io/InterruptedIOException;

    invoke-direct {v6}, Ljava/io/InterruptedIOException;-><init>()V

    throw v6
    :try_end_4a
    .catch Ljava/lang/RuntimeException; {:try_start_3d .. :try_end_4a} :catch_4a

    .line 98
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .end local v4    # "nextInterval":J
    :catch_4a
    move-exception v2

    .line 99
    .local v2, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 100
    throw v2

    .line 96
    .end local v2    # "ex":Ljava/lang/RuntimeException;
    :cond_4f
    return-object v3
.end method
