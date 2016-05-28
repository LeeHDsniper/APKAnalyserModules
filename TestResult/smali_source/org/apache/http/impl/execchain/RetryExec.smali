.class public Lorg/apache/http/impl/execchain/RetryExec;
.super Ljava/lang/Object;
.source "RetryExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

.field private final retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/client/HttpRequestRetryHandler;)V
    .registers 4
    .param p1, "requestExecutor"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    .line 68
    const-string v0, "HTTP request executor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 69
    const-string v0, "HTTP request retry handler"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    iput-object p1, p0, Lorg/apache/http/impl/execchain/RetryExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    .line 71
    iput-object p2, p0, Lorg/apache/http/impl/execchain/RetryExec;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    .line 72
    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .registers 11
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
    const-string v3, "HTTP route"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    const-string v3, "HTTP request"

    invoke-static {p2, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    const-string v3, "HTTP context"

    invoke-static {p3, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    invoke-virtual {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v2

    .line 83
    .local v2, "origheaders":[Lorg/apache/http/Header;
    const/4 v1, 0x1

    .line 85
    .local v1, "execCount":I
    :goto_14
    :try_start_14
    iget-object v3, p0, Lorg/apache/http/impl/execchain/RetryExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    invoke-interface {v3, p1, p2, p3, p4}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_19} :catch_1b

    move-result-object v3

    return-object v3

    .line 86
    :catch_1b
    move-exception v0

    .line 87
    .local v0, "ex":Ljava/io/IOException;
    if-eqz p4, :cond_2c

    invoke-interface {p4}, Lorg/apache/http/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 88
    iget-object v3, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Request has been aborted"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 89
    throw v0

    .line 91
    :cond_2c
    iget-object v3, p0, Lorg/apache/http/impl/execchain/RetryExec;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    invoke-interface {v3, v0, v1, p3}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    if-eqz v3, :cond_9e

    .line 92
    iget-object v3, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v3

    if-eqz v3, :cond_6a

    .line 93
    iget-object v3, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "I/O exception ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") caught when processing request: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 97
    :cond_6a
    iget-object v3, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_7b

    .line 98
    iget-object v3, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 100
    :cond_7b
    invoke-static {p2}, Lorg/apache/http/impl/execchain/Proxies;->isRepeatable(Lorg/apache/http/HttpRequest;)Z

    move-result v3

    if-nez v3, :cond_90

    .line 101
    iget-object v3, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Cannot retry non-repeatable request"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 102
    new-instance v3, Lorg/apache/http/client/NonRepeatableRequestException;

    const-string v4, "Cannot retry request with a non-repeatable request entity"

    invoke-direct {v3, v4, v0}, Lorg/apache/http/client/NonRepeatableRequestException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 105
    :cond_90
    invoke-virtual {p2, v2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setHeaders([Lorg/apache/http/Header;)V

    .line 106
    iget-object v3, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Retrying request"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 83
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_14

    .line 108
    :cond_9e
    throw v0
.end method
