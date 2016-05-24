.class public Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
.super Ljava/lang/Object;
.source "AdobeNetworkHttpResponse.java"


# instance fields
.field private _networkException:Ljava/lang/Exception;

.field protected bytesReceived:I

.field protected bytesSent:I

.field protected data:Ljava/nio/ByteBuffer;

.field private hasFileError:Z

.field protected headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field protected statusCode:I

.field protected url:Ljava/net/URL;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->data:Ljava/nio/ByteBuffer;

    .line 29
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->statusCode:I

    .line 30
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->url:Ljava/net/URL;

    .line 31
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->headers:Ljava/util/Map;

    .line 32
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->bytesSent:I

    .line 33
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->bytesReceived:I

    .line 34
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->hasFileError:Z

    .line 35
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->_networkException:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public getBytesReceived()I
    .registers 2

    .prologue
    .line 113
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->bytesReceived:I

    return v0
.end method

.method public getDataBytes()[B
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->data:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_b

    .line 67
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 69
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getDataString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 55
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->data:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_1f

    .line 57
    :try_start_4
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_11
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_11} :catch_12

    .line 62
    :goto_11
    return-object v1

    .line 58
    :catch_12
    move-exception v0

    .line 59
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    goto :goto_11

    .line 62
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_1f
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public getHeaders()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public getNetworkException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->_networkException:Ljava/lang/Exception;

    return-object v0
.end method

.method public getStatusCode()I
    .registers 2

    .prologue
    .line 73
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->statusCode:I

    return v0
.end method

.method public getUrl()Ljava/net/URL;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->url:Ljava/net/URL;

    return-object v0
.end method

.method public hasFileError()Z
    .registers 2

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->hasFileError:Z

    return v0
.end method

.method setBytesReceived(I)V
    .registers 2
    .param p1, "bytesReceived"    # I

    .prologue
    .line 117
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->bytesReceived:I

    .line 118
    return-void
.end method

.method setBytesSent(I)V
    .registers 2
    .param p1, "bytesSent"    # I

    .prologue
    .line 109
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->bytesSent:I

    .line 110
    return-void
.end method

.method public setData(Ljava/nio/ByteBuffer;)V
    .registers 2
    .param p1, "data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->data:Ljava/nio/ByteBuffer;

    .line 82
    return-void
.end method

.method public setHasFileError(Z)V
    .registers 2
    .param p1, "hasFileError"    # Z

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->hasFileError:Z

    .line 44
    return-void
.end method

.method public setHeaders(Ljava/util/Map;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->headers:Ljava/util/Map;

    .line 102
    return-void
.end method

.method public setNetworkException(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->_networkException:Ljava/lang/Exception;

    .line 48
    return-void
.end method

.method public setStatusCode(I)V
    .registers 2
    .param p1, "statusCode"    # I

    .prologue
    .line 85
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->statusCode:I

    .line 86
    return-void
.end method

.method public setURL(Ljava/net/URL;)V
    .registers 2
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->url:Ljava/net/URL;

    .line 78
    return-void
.end method
