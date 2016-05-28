.class public Lorg/apache/http/client/utils/HttpClientUtils;
.super Ljava/lang/Object;
.source "HttpClientUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    return-void
.end method

.method public static closeQuietly(Lorg/apache/http/HttpResponse;)V
    .registers 3
    .param p0, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 71
    if-eqz p0, :cond_b

    .line 72
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 73
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_b

    .line 75
    :try_start_8
    invoke-static {v0}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_b} :catch_c

    .line 80
    .end local v0    # "entity":Lorg/apache/http/HttpEntity;
    :cond_b
    :goto_b
    return-void

    .line 76
    .restart local v0    # "entity":Lorg/apache/http/HttpEntity;
    :catch_c
    move-exception v1

    goto :goto_b
.end method

.method public static closeQuietly(Lorg/apache/http/client/HttpClient;)V
    .registers 2
    .param p0, "httpClient"    # Lorg/apache/http/client/HttpClient;

    .prologue
    .line 139
    if-eqz p0, :cond_b

    .line 140
    instance-of v0, p0, Ljava/io/Closeable;

    if-eqz v0, :cond_b

    .line 142
    :try_start_6
    check-cast p0, Ljava/io/Closeable;

    .end local p0    # "httpClient":Lorg/apache/http/client/HttpClient;
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_b} :catch_c

    .line 147
    :cond_b
    :goto_b
    return-void

    .line 143
    :catch_c
    move-exception v0

    goto :goto_b
.end method

.method public static closeQuietly(Lorg/apache/http/client/methods/CloseableHttpResponse;)V
    .registers 2
    .param p0, "response"    # Lorg/apache/http/client/methods/CloseableHttpResponse;

    .prologue
    .line 105
    if-eqz p0, :cond_c

    .line 108
    :try_start_2
    invoke-interface {p0}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V
    :try_end_9
    .catchall {:try_start_2 .. :try_end_9} :catchall_d

    .line 110
    :try_start_9
    invoke-interface {p0}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 115
    :cond_c
    :goto_c
    return-void

    .line 110
    :catchall_d
    move-exception v0

    invoke-interface {p0}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    throw v0
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_12} :catch_12

    .line 112
    :catch_12
    move-exception v0

    goto :goto_c
.end method
