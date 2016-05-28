.class Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;
.super Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;
.source "AdobeNetworkHttpFileDownloadTask.java"


# instance fields
.field _destinationPath:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;->_destinationPath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected captureInputStream()V
    .registers 13

    .prologue
    .line 43
    const/4 v6, 0x0

    .line 45
    .local v6, "outputStream":Ljava/io/FileOutputStream;
    :try_start_1
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v8

    const/16 v9, 0xc8

    if-ne v8, v9, :cond_93

    .line 47
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;->_urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 48
    .local v5, "inputStream":Ljava/io/InputStream;
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;->_urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v3

    .line 53
    .local v3, "contentLength":I
    new-instance v7, Ljava/io/FileOutputStream;

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;->_destinationPath:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1e} :catch_c1
    .catchall {:try_start_1 .. :try_end_1e} :catchall_a8

    .line 55
    .end local v6    # "outputStream":Ljava/io/FileOutputStream;
    .local v7, "outputStream":Ljava/io/FileOutputStream;
    const/4 v1, -0x1

    .line 56
    .local v1, "bytesRead":I
    const/4 v2, 0x0

    .line 57
    .local v2, "bytesReadTillNow":I
    const/16 v8, 0x1000

    :try_start_22
    new-array v0, v8, [B

    .line 58
    .local v0, "buffer":[B
    :goto_24
    invoke-virtual {v5, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v8, -0x1

    if-eq v1, v8, :cond_8a

    .line 59
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;->_requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->isCancelled()Z
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_30} :catch_5d
    .catchall {:try_start_22 .. :try_end_30} :catchall_be

    move-result v8

    if-eqz v8, :cond_49

    .line 82
    if-eqz v7, :cond_38

    .line 84
    :try_start_35
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_38} :catch_3a

    :cond_38
    :goto_38
    move-object v6, v7

    .line 94
    .end local v0    # "buffer":[B
    .end local v1    # "bytesRead":I
    .end local v2    # "bytesReadTillNow":I
    .end local v3    # "contentLength":I
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v7    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v6    # "outputStream":Ljava/io/FileOutputStream;
    :cond_39
    :goto_39
    return-void

    .line 87
    .end local v6    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v0    # "buffer":[B
    .restart local v1    # "bytesRead":I
    .restart local v2    # "bytesReadTillNow":I
    .restart local v3    # "contentLength":I
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "outputStream":Ljava/io/FileOutputStream;
    :catch_3a
    move-exception v4

    .line 89
    .local v4, "e":Ljava/io/IOException;
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v9, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Error during io operation"

    invoke-static {v8, v9, v10, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_38

    .line 61
    .end local v4    # "e":Ljava/io/IOException;
    :cond_49
    const/4 v8, 0x0

    :try_start_4a
    invoke-virtual {v7, v0, v8, v1}, Ljava/io/FileOutputStream;->write([BII)V

    .line 62
    add-int/2addr v2, v1

    .line 63
    int-to-float v8, v2

    int-to-float v9, v3

    div-float/2addr v8, v9

    const/high16 v9, 0x42c80000

    mul-float/2addr v8, v9

    float-to-int v8, v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;->onProgressUpdate(Ljava/lang/Integer;)V
    :try_end_5c
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_5c} :catch_5d
    .catchall {:try_start_4a .. :try_end_5c} :catchall_be

    goto :goto_24

    .line 73
    .end local v0    # "buffer":[B
    :catch_5d
    move-exception v4

    move-object v6, v7

    .line 74
    .end local v1    # "bytesRead":I
    .end local v2    # "bytesReadTillNow":I
    .end local v3    # "contentLength":I
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v7    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v4    # "e":Ljava/io/IOException;
    .restart local v6    # "outputStream":Ljava/io/FileOutputStream;
    :goto_5f
    :try_start_5f
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setHasFileError(Z)V

    .line 75
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 76
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v9, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Error during io operation"

    invoke-static {v8, v9, v10, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_75
    .catchall {:try_start_5f .. :try_end_75} :catchall_a8

    .line 82
    if-eqz v6, :cond_39

    .line 84
    :try_start_77
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_7a
    .catch Ljava/io/IOException; {:try_start_77 .. :try_end_7a} :catch_7b

    goto :goto_39

    .line 87
    :catch_7b
    move-exception v4

    .line 89
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v9, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Error during io operation"

    invoke-static {v8, v9, v10, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_39

    .line 66
    .end local v4    # "e":Ljava/io/IOException;
    .end local v6    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v0    # "buffer":[B
    .restart local v1    # "bytesRead":I
    .restart local v2    # "bytesReadTillNow":I
    .restart local v3    # "contentLength":I
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "outputStream":Ljava/io/FileOutputStream;
    :cond_8a
    :try_start_8a
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {v8, v2}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setBytesReceived(I)V

    .line 69
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_92
    .catch Ljava/io/IOException; {:try_start_8a .. :try_end_92} :catch_5d
    .catchall {:try_start_8a .. :try_end_92} :catchall_be

    move-object v6, v7

    .line 82
    .end local v0    # "buffer":[B
    .end local v1    # "bytesRead":I
    .end local v2    # "bytesReadTillNow":I
    .end local v3    # "contentLength":I
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v7    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v6    # "outputStream":Ljava/io/FileOutputStream;
    :cond_93
    if-eqz v6, :cond_39

    .line 84
    :try_start_95
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_95 .. :try_end_98} :catch_99

    goto :goto_39

    .line 87
    :catch_99
    move-exception v4

    .line 89
    .restart local v4    # "e":Ljava/io/IOException;
    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v9, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Error during io operation"

    invoke-static {v8, v9, v10, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_39

    .line 80
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_a8
    move-exception v8

    .line 82
    :goto_a9
    if-eqz v6, :cond_ae

    .line 84
    :try_start_ab
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_ae
    .catch Ljava/io/IOException; {:try_start_ab .. :try_end_ae} :catch_af

    .line 90
    :cond_ae
    :goto_ae
    throw v8

    .line 87
    :catch_af
    move-exception v4

    .line 89
    .restart local v4    # "e":Ljava/io/IOException;
    sget-object v9, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v10, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    const-string v11, "Error during io operation"

    invoke-static {v9, v10, v11, v4}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_ae

    .line 80
    .end local v4    # "e":Ljava/io/IOException;
    .end local v6    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v1    # "bytesRead":I
    .restart local v2    # "bytesReadTillNow":I
    .restart local v3    # "contentLength":I
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v7    # "outputStream":Ljava/io/FileOutputStream;
    :catchall_be
    move-exception v8

    move-object v6, v7

    .end local v7    # "outputStream":Ljava/io/FileOutputStream;
    .restart local v6    # "outputStream":Ljava/io/FileOutputStream;
    goto :goto_a9

    .line 73
    .end local v1    # "bytesRead":I
    .end local v2    # "bytesReadTillNow":I
    .end local v3    # "contentLength":I
    .end local v5    # "inputStream":Ljava/io/InputStream;
    :catch_c1
    move-exception v4

    goto :goto_5f
.end method

.method public init(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V
    .registers 6
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "accessToken"    # Ljava/lang/String;
    .param p3, "destinationPath"    # Ljava/lang/String;
    .param p4, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;
    .param p5, "requestHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .prologue
    .line 37
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask;->_destinationPath:Ljava/lang/String;

    .line 38
    invoke-super {p0, p1, p2, p4, p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->init(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V

    .line 39
    return-void
.end method
