.class public Lorg/apache/http/impl/client/ContentEncodingHttpClient;
.super Lorg/apache/http/impl/client/DefaultHttpClient;
.source "ContentEncodingHttpClient.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 77
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/ContentEncodingHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    .registers 3
    .param p1, "conman"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 63
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/params/HttpParams;)V
    .registers 3
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 70
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/http/impl/client/ContentEncodingHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 71
    return-void
.end method


# virtual methods
.method protected createHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;
    .registers 3

    .prologue
    .line 85
    invoke-super {p0}, Lorg/apache/http/impl/client/DefaultHttpClient;->createHttpProcessor()Lorg/apache/http/protocol/BasicHttpProcessor;

    move-result-object v0

    .line 87
    .local v0, "result":Lorg/apache/http/protocol/BasicHttpProcessor;
    new-instance v1, Lorg/apache/http/client/protocol/RequestAcceptEncoding;

    invoke-direct {v1}, Lorg/apache/http/client/protocol/RequestAcceptEncoding;-><init>()V

    invoke-virtual {v0, v1}, Lorg/apache/http/protocol/BasicHttpProcessor;->addRequestInterceptor(Lorg/apache/http/HttpRequestInterceptor;)V

    .line 88
    new-instance v1, Lorg/apache/http/client/protocol/ResponseContentEncoding;

    invoke-direct {v1}, Lorg/apache/http/client/protocol/ResponseContentEncoding;-><init>()V

    invoke-virtual {v0, v1}, Lorg/apache/http/protocol/BasicHttpProcessor;->addResponseInterceptor(Lorg/apache/http/HttpResponseInterceptor;)V

    .line 90
    return-object v0
.end method
