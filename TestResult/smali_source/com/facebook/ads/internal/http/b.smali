.class Lcom/facebook/ads/internal/http/b;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final a:Lorg/apache/http/impl/client/AbstractHttpClient;

.field private final b:Lorg/apache/http/protocol/HttpContext;

.field private final c:Lorg/apache/http/client/methods/HttpUriRequest;

.field private final d:Lcom/facebook/ads/internal/http/c;

.field private e:I


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/client/AbstractHttpClient;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/methods/HttpUriRequest;Lcom/facebook/ads/internal/http/c;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/ads/internal/http/b;->a:Lorg/apache/http/impl/client/AbstractHttpClient;

    iput-object p2, p0, Lcom/facebook/ads/internal/http/b;->b:Lorg/apache/http/protocol/HttpContext;

    iput-object p3, p0, Lcom/facebook/ads/internal/http/b;->c:Lorg/apache/http/client/methods/HttpUriRequest;

    iput-object p4, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    return-void
.end method

.method private a()V
    .registers 4

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_27

    iget-object v0, p0, Lcom/facebook/ads/internal/http/b;->a:Lorg/apache/http/impl/client/AbstractHttpClient;

    iget-object v1, p0, Lcom/facebook/ads/internal/http/b;->c:Lorg/apache/http/client/methods/HttpUriRequest;

    iget-object v2, p0, Lcom/facebook/ads/internal/http/b;->b:Lorg/apache/http/protocol/HttpContext;

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/client/AbstractHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v1

    if-nez v1, :cond_27

    iget-object v1, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    if-eqz v1, :cond_27

    iget-object v1, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    invoke-virtual {v1, v0}, Lcom/facebook/ads/internal/http/c;->a(Lorg/apache/http/HttpResponse;)V

    :cond_27
    return-void
.end method

.method private b()V
    .registers 6

    const/4 v1, 0x1

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/facebook/ads/internal/http/b;->a:Lorg/apache/http/impl/client/AbstractHttpClient;

    invoke-virtual {v2}, Lorg/apache/http/impl/client/AbstractHttpClient;->getHttpRequestRetryHandler()Lorg/apache/http/client/HttpRequestRetryHandler;

    move-result-object v2

    :goto_8
    if-eqz v1, :cond_6d

    :try_start_a
    invoke-direct {p0}, Lcom/facebook/ads/internal/http/b;->a()V
    :try_end_d
    .catch Ljava/net/UnknownHostException; {:try_start_a .. :try_end_d} :catch_e
    .catch Ljava/net/SocketException; {:try_start_a .. :try_end_d} :catch_1b
    .catch Ljava/net/SocketTimeoutException; {:try_start_a .. :try_end_d} :catch_28
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_d} :catch_35
    .catch Ljava/lang/NullPointerException; {:try_start_a .. :try_end_d} :catch_43

    :cond_d
    :goto_d
    return-void

    :catch_e
    move-exception v0

    iget-object v1, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    const-string v2, "can\'t resolve host"

    invoke-virtual {v1, v0, v2}, Lcom/facebook/ads/internal/http/c;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_d

    :catch_1b
    move-exception v0

    iget-object v1, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    const-string v2, "can\'t resolve host"

    invoke-virtual {v1, v0, v2}, Lcom/facebook/ads/internal/http/c;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_d

    :catch_28
    move-exception v0

    iget-object v1, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    const-string v2, "socket time out"

    invoke-virtual {v1, v0, v2}, Lcom/facebook/ads/internal/http/c;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_d

    :catch_35
    move-exception v0

    iget v1, p0, Lcom/facebook/ads/internal/http/b;->e:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/facebook/ads/internal/http/b;->e:I

    iget-object v3, p0, Lcom/facebook/ads/internal/http/b;->b:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v2, v0, v1, v3}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v1

    goto :goto_8

    :catch_43
    move-exception v1

    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NPE in HttpClient"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/facebook/ads/internal/http/b;->e:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/facebook/ads/internal/http/b;->e:I

    iget-object v3, p0, Lcom/facebook/ads/internal/http/b;->b:Lorg/apache/http/protocol/HttpContext;

    invoke-interface {v2, v0, v1, v3}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v1

    goto :goto_8

    :cond_6d
    new-instance v1, Ljava/net/ConnectException;

    invoke-direct {v1}, Ljava/net/ConnectException;-><init>()V

    invoke-virtual {v1, v0}, Ljava/net/ConnectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v1
.end method


# virtual methods
.method public run()V
    .registers 4

    :try_start_0
    iget-object v0, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/http/c;->c()V

    :cond_9
    invoke-direct {p0}, Lcom/facebook/ads/internal/http/b;->b()V

    iget-object v0, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/http/c;->d()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_15} :catch_16

    :cond_15
    :goto_15
    return-void

    :catch_16
    move-exception v0

    move-object v1, v0

    iget-object v0, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/http/c;->d()V

    iget-object v2, p0, Lcom/facebook/ads/internal/http/b;->d:Lcom/facebook/ads/internal/http/c;

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Lcom/facebook/ads/internal/http/c;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_15
.end method
