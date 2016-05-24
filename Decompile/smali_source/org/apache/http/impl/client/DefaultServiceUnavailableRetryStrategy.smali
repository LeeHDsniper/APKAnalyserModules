.class public Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;
.super Ljava/lang/Object;
.source "DefaultServiceUnavailableRetryStrategy.java"

# interfaces
.implements Lorg/apache/http/client/ServiceUnavailableRetryStrategy;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final maxRetries:I

.field private final retryInterval:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 68
    const/4 v0, 0x1

    const/16 v1, 0x3e8

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;-><init>(II)V

    .line 69
    return-void
.end method

.method public constructor <init>(II)V
    .registers 5
    .param p1, "maxRetries"    # I
    .param p2, "retryInterval"    # I

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const-string v0, "Max retries"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->positive(ILjava/lang/String;)I

    .line 62
    const-string v0, "Retry interval"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->positive(ILjava/lang/String;)I

    .line 63
    iput p1, p0, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;->maxRetries:I

    .line 64
    int-to-long v0, p2

    iput-wide v0, p0, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;->retryInterval:J

    .line 65
    return-void
.end method


# virtual methods
.method public getRetryInterval()J
    .registers 3

    .prologue
    .line 77
    iget-wide v0, p0, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;->retryInterval:J

    return-wide v0
.end method

.method public retryRequest(Lorg/apache/http/HttpResponse;ILorg/apache/http/protocol/HttpContext;)Z
    .registers 6
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "executionCount"    # I
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 72
    iget v0, p0, Lorg/apache/http/impl/client/DefaultServiceUnavailableRetryStrategy;->maxRetries:I

    if-gt p2, v0, :cond_12

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0x1f7

    if-ne v0, v1, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method
