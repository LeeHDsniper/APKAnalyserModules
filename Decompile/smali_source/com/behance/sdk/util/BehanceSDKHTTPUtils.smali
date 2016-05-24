.class public Lcom/behance/sdk/util/BehanceSDKHTTPUtils;
.super Ljava/lang/Object;
.source "BehanceSDKHTTPUtils.java"


# direct methods
.method public static doHTTPDelete(Lorg/apache/http/client/methods/HttpDelete;)Lcom/behance/sdk/util/HTTPResponse;
    .registers 2
    .param p0, "delete"    # Lorg/apache/http/client/methods/HttpDelete;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-static {p0}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->executeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v0

    return-object v0
.end method

.method public static doHTTPGet(Lorg/apache/http/client/methods/HttpGet;)Lcom/behance/sdk/util/HTTPResponse;
    .registers 2
    .param p0, "get"    # Lorg/apache/http/client/methods/HttpGet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-static {p0}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->executeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v0

    return-object v0
.end method

.method public static doHTTPPost(Lorg/apache/http/client/methods/HttpPost;)Lcom/behance/sdk/util/HTTPResponse;
    .registers 2
    .param p0, "post"    # Lorg/apache/http/client/methods/HttpPost;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {p0}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->executeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v0

    return-object v0
.end method

.method public static doHTTPPut(Lorg/apache/http/client/methods/HttpPut;)Lcom/behance/sdk/util/HTTPResponse;
    .registers 2
    .param p0, "put"    # Lorg/apache/http/client/methods/HttpPut;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-static {p0}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->executeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v0

    return-object v0
.end method

.method private static executeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lcom/behance/sdk/util/HTTPResponse;
    .registers 8
    .param p0, "uriRequest"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    const/4 v0, 0x0

    .line 86
    .local v0, "connectionManager":Lorg/apache/http/conn/ClientConnectionManager;
    :try_start_1
    new-instance v3, Lcom/behance/sdk/util/HTTPResponse;

    invoke-direct {v3}, Lcom/behance/sdk/util/HTTPResponse;-><init>()V

    .line 87
    .local v3, "response":Lcom/behance/sdk/util/HTTPResponse;
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->getHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v1

    .line 88
    .local v1, "httpClient":Lorg/apache/http/client/HttpClient;
    invoke-interface {v1}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    .line 89
    invoke-interface {v1, p0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 90
    .local v2, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    .line 91
    .local v5, "statusLine":Lorg/apache/http/StatusLine;
    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    .line 92
    .local v4, "statusCode":I
    invoke-virtual {v3, v4}, Lcom/behance/sdk/util/HTTPResponse;->setStatusCode(I)V

    .line 93
    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/behance/sdk/util/HTTPResponse;->setReasonPhrase(Ljava/lang/String;)V

    .line 94
    const/16 v6, 0xc8

    if-eq v4, v6, :cond_2c

    const/16 v6, 0xc9

    if-ne v4, v6, :cond_33

    .line 95
    :cond_2c
    invoke-static {v2}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->getContentAsString(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/behance/sdk/util/HTTPResponse;->setResponseString(Ljava/lang/String;)V
    :try_end_33
    .catchall {:try_start_1 .. :try_end_33} :catchall_39

    .line 99
    :cond_33
    if-eqz v0, :cond_38

    .line 100
    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    :cond_38
    return-object v3

    .line 99
    .end local v1    # "httpClient":Lorg/apache/http/client/HttpClient;
    .end local v2    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v3    # "response":Lcom/behance/sdk/util/HTTPResponse;
    .end local v4    # "statusCode":I
    .end local v5    # "statusLine":Lorg/apache/http/StatusLine;
    :catchall_39
    move-exception v6

    if-eqz v0, :cond_3f

    .line 100
    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    :cond_3f
    throw v6
.end method

.method public static getContentAsString(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .registers 6
    .param p0, "httpResponse"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    const/4 v3, 0x0

    .line 109
    .local v3, "response":Ljava/lang/String;
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    if-eqz v4, :cond_2a

    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v2

    .line 110
    .local v2, "istream":Ljava/io/InputStream;
    :goto_f
    if-eqz v2, :cond_29

    .line 111
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 112
    .local v0, "inputStreamReader":Ljava/io/InputStreamReader;
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 113
    .local v1, "ireader":Ljava/io/BufferedReader;
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 114
    invoke-virtual {v0}, Ljava/io/InputStreamReader;->close()V

    .line 115
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 117
    .end local v0    # "inputStreamReader":Ljava/io/InputStreamReader;
    .end local v1    # "ireader":Ljava/io/BufferedReader;
    :cond_29
    return-object v3

    .line 109
    .end local v2    # "istream":Ljava/io/InputStream;
    :cond_2a
    const/4 v2, 0x0

    goto :goto_f
.end method

.method public static getHttpClient()Lorg/apache/http/client/HttpClient;
    .registers 4

    .prologue
    const v2, 0xea60

    .line 121
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 122
    .local v0, "httpClient":Lorg/apache/http/client/HttpClient;
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    .line 123
    .local v1, "params":Lorg/apache/http/params/HttpParams;
    invoke-static {v1, v2}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 124
    invoke-static {v1, v2}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 125
    const/4 v2, 0x1

    invoke-static {v1, v2}, Lorg/apache/http/params/HttpConnectionParams;->setTcpNoDelay(Lorg/apache/http/params/HttpParams;Z)V

    .line 126
    const-wide/32 v2, 0xea60

    invoke-static {v1, v2, v3}, Lorg/apache/http/conn/params/ConnManagerParams;->setTimeout(Lorg/apache/http/params/HttpParams;J)V

    .line 127
    return-object v0
.end method
