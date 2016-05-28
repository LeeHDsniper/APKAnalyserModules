.class public Lorg/apache/http/impl/client/AutoRetryHttpClient;
.super Ljava/lang/Object;
.source "AutoRetryHttpClient.java"

# interfaces
.implements Lorg/apache/http/client/HttpClient;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final backend:Lorg/apache/http/client/HttpClient;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 83
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v1, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;-><init>()V

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/client/AutoRetryHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/ServiceUnavailableRetryStrategy;)V

    .line 84
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/HttpClient;)V
    .registers 3
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;

    .prologue
    .line 107
    new-instance v0, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/client/AutoRetryHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/ServiceUnavailableRetryStrategy;)V

    .line 108
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/ServiceUnavailableRetryStrategy;)V
    .registers 4
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;
    .param p2, "retryStrategy"    # Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/AutoRetryHttpClient;->log:Lorg/apache/commons/logging/Log;

    .line 71
    const-string v0, "HttpClient"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 72
    const-string v0, "ServiceUnavailableRetryStrategy"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 73
    iput-object p1, p0, Lorg/apache/http/impl/client/AutoRetryHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    .line 74
    iput-object p2, p0, Lorg/apache/http/impl/client/AutoRetryHttpClient;->retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    .line 75
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/ServiceUnavailableRetryStrategy;)V
    .registers 3
    .param p1, "config"    # Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    .prologue
    .line 95
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/apache/http/impl/client/AutoRetryHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/ServiceUnavailableRetryStrategy;)V

    .line 96
    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;
    .registers 5
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    .local p3, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/http/impl/client/AutoRetryHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;
    .registers 7
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    .local p3, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    invoke-virtual {p0, p1, p2, p4}, Lorg/apache/http/impl/client/AutoRetryHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 125
    .local v0, "resp":Lorg/apache/http/HttpResponse;
    invoke-interface {p3, v0}, Lorg/apache/http/client/ResponseHandler;->handleResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;
    .registers 4
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    .local p2, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/impl/client/AutoRetryHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;
    .registers 6
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    .local p2, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    invoke-virtual {p0, p1, p3}, Lorg/apache/http/impl/client/AutoRetryHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 150
    .local v0, "resp":Lorg/apache/http/HttpResponse;
    invoke-interface {p2, v0}, Lorg/apache/http/client/ResponseHandler;->handleResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/HttpResponse;
    .registers 5
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    const/4 v0, 0x0

    .line 113
    .local v0, "defaultContext":Lorg/apache/http/protocol/HttpContext;
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/impl/client/AutoRetryHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    return-object v1
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 14
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    const/4 v0, 0x1

    .line 156
    .local v0, "c":I
    :goto_1
    iget-object v7, p0, Lorg/apache/http/impl/client/AutoRetryHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    invoke-interface {v7, p1, p2, p3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 158
    .local v6, "response":Lorg/apache/http/HttpResponse;
    :try_start_7
    iget-object v7, p0, Lorg/apache/http/impl/client/AutoRetryHttpClient;->retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    invoke-interface {v7, v6, v0, p3}, Lorg/apache/http/client/ServiceUnavailableRetryStrategy;->retryRequest(Lorg/apache/http/HttpResponse;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v7

    if-eqz v7, :cond_5a

    .line 159
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 160
    iget-object v7, p0, Lorg/apache/http/impl/client/AutoRetryHttpClient;->retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    invoke-interface {v7}, Lorg/apache/http/client/ServiceUnavailableRetryStrategy;->getRetryInterval()J
    :try_end_1b
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_1b} :catch_48

    move-result-wide v4

    .line 162
    .local v4, "nextInterval":J
    :try_start_1c
    iget-object v7, p0, Lorg/apache/http/impl/client/AutoRetryHttpClient;->log:Lorg/apache/commons/logging/Log;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Wait for "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 163
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_37
    .catch Ljava/lang/InterruptedException; {:try_start_1c .. :try_end_37} :catch_3a
    .catch Ljava/lang/RuntimeException; {:try_start_1c .. :try_end_37} :catch_48

    .line 155
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 164
    :catch_3a
    move-exception v1

    .line 165
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_3b
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    .line 166
    new-instance v7, Ljava/io/InterruptedIOException;

    invoke-direct {v7}, Ljava/io/InterruptedIOException;-><init>()V

    throw v7
    :try_end_48
    .catch Ljava/lang/RuntimeException; {:try_start_3b .. :try_end_48} :catch_48

    .line 171
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .end local v4    # "nextInterval":J
    :catch_48
    move-exception v2

    .line 173
    .local v2, "ex":Ljava/lang/RuntimeException;
    :try_start_49
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V
    :try_end_50
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_50} :catch_51

    .line 177
    :goto_50
    throw v2

    .line 174
    :catch_51
    move-exception v3

    .line 175
    .local v3, "ioex":Ljava/io/IOException;
    iget-object v7, p0, Lorg/apache/http/impl/client/AutoRetryHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string v8, "I/O error consuming response content"

    invoke-interface {v7, v8, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_50

    .line 169
    .end local v2    # "ex":Ljava/lang/RuntimeException;
    .end local v3    # "ioex":Ljava/io/IOException;
    :cond_5a
    return-object v6
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    .registers 4
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    const/4 v0, 0x0

    .line 130
    .local v0, "context":Lorg/apache/http/protocol/HttpContext;
    invoke-virtual {p0, p1, v0}, Lorg/apache/http/impl/client/AutoRetryHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    return-object v1
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .registers 8
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v1

    .line 136
    .local v1, "uri":Ljava/net/URI;
    new-instance v0, Lorg/apache/http/HttpHost;

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/net/URI;->getPort()I

    move-result v3

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v2, v3, v4}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 138
    .local v0, "httpHost":Lorg/apache/http/HttpHost;
    invoke-virtual {p0, v0, p1, p2}, Lorg/apache/http/impl/client/AutoRetryHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    return-object v2
.end method

.method public getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
    .registers 2

    .prologue
    .line 183
    iget-object v0, p0, Lorg/apache/http/impl/client/AutoRetryHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    return-object v0
.end method

.method public getParams()Lorg/apache/http/params/HttpParams;
    .registers 2

    .prologue
    .line 187
    iget-object v0, p0, Lorg/apache/http/impl/client/AutoRetryHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    return-object v0
.end method
