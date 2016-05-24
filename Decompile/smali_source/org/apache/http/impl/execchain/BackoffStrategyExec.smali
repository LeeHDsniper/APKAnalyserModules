.class public Lorg/apache/http/impl/execchain/BackoffStrategyExec;
.super Ljava/lang/Object;
.source "BackoffStrategyExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final backoffManager:Lorg/apache/http/client/BackoffManager;

.field private final connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

.field private final requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/client/ConnectionBackoffStrategy;Lorg/apache/http/client/BackoffManager;)V
    .registers 5
    .param p1, "requestExecutor"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "connectionBackoffStrategy"    # Lorg/apache/http/client/ConnectionBackoffStrategy;
    .param p3, "backoffManager"    # Lorg/apache/http/client/BackoffManager;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const-string v0, "HTTP client request executor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 60
    const-string v0, "Connection backoff strategy"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 61
    const-string v0, "Backoff manager"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    iput-object p1, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    .line 63
    iput-object p2, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

    .line 64
    iput-object p3, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->backoffManager:Lorg/apache/http/client/BackoffManager;

    .line 65
    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .registers 8
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
    .line 72
    const-string v2, "HTTP route"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 73
    const-string v2, "HTTP request"

    invoke-static {p2, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 74
    const-string v2, "HTTP context"

    invoke-static {p3, v2}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 75
    const/4 v1, 0x0

    .line 77
    .local v1, "out":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_start_10
    iget-object v2, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    invoke-interface {v2, p1, p2, p3, p4}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_15} :catch_24

    move-result-object v1

    .line 96
    iget-object v2, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

    invoke-interface {v2, v1}, Lorg/apache/http/client/ConnectionBackoffStrategy;->shouldBackoff(Lorg/apache/http/HttpResponse;)Z

    move-result v2

    if-eqz v2, :cond_52

    .line 97
    iget-object v2, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->backoffManager:Lorg/apache/http/client/BackoffManager;

    invoke-interface {v2, p1}, Lorg/apache/http/client/BackoffManager;->backOff(Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 101
    :goto_23
    return-object v1

    .line 78
    :catch_24
    move-exception v0

    .line 79
    .local v0, "ex":Ljava/lang/Exception;
    if-eqz v1, :cond_2a

    .line 80
    invoke-interface {v1}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 82
    :cond_2a
    iget-object v2, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->connectionBackoffStrategy:Lorg/apache/http/client/ConnectionBackoffStrategy;

    invoke-interface {v2, v0}, Lorg/apache/http/client/ConnectionBackoffStrategy;->shouldBackoff(Ljava/lang/Throwable;)Z

    move-result v2

    if-eqz v2, :cond_37

    .line 83
    iget-object v2, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->backoffManager:Lorg/apache/http/client/BackoffManager;

    invoke-interface {v2, p1}, Lorg/apache/http/client/BackoffManager;->backOff(Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 85
    :cond_37
    instance-of v2, v0, Ljava/lang/RuntimeException;

    if-eqz v2, :cond_3e

    .line 86
    check-cast v0, Ljava/lang/RuntimeException;

    .end local v0    # "ex":Ljava/lang/Exception;
    throw v0

    .line 88
    .restart local v0    # "ex":Ljava/lang/Exception;
    :cond_3e
    instance-of v2, v0, Lorg/apache/http/HttpException;

    if-eqz v2, :cond_45

    .line 89
    check-cast v0, Lorg/apache/http/HttpException;

    .end local v0    # "ex":Ljava/lang/Exception;
    throw v0

    .line 91
    .restart local v0    # "ex":Ljava/lang/Exception;
    :cond_45
    instance-of v2, v0, Ljava/io/IOException;

    if-eqz v2, :cond_4c

    .line 92
    check-cast v0, Ljava/io/IOException;

    .end local v0    # "ex":Ljava/lang/Exception;
    throw v0

    .line 94
    .restart local v0    # "ex":Ljava/lang/Exception;
    :cond_4c
    new-instance v2, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {v2, v0}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 99
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_52
    iget-object v2, p0, Lorg/apache/http/impl/execchain/BackoffStrategyExec;->backoffManager:Lorg/apache/http/client/BackoffManager;

    invoke-interface {v2, p1}, Lorg/apache/http/client/BackoffManager;->probe(Lorg/apache/http/conn/routing/HttpRoute;)V

    goto :goto_23
.end method
