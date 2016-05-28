.class Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;
.super Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;
.source "AdobeNetworkHttpFileUploadTask.java"


# instance fields
.field private _sourcePath:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_sourcePath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected captureInputStream()V
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->captureData(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    .line 149
    return-void
.end method

.method public init(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V
    .registers 6
    .param p1, "request"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .param p2, "accessToken"    # Ljava/lang/String;
    .param p3, "sourcePath"    # Ljava/lang/String;
    .param p4, "completionHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;
    .param p5, "requestHandler"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .prologue
    .line 42
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_sourcePath:Ljava/lang/String;

    .line 43
    invoke-super {p0, p1, p2, p4, p5}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTask;->init(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponseHandler;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)V

    .line 44
    return-void
.end method

.method protected writeToOutputStream()V
    .registers 23

    .prologue
    .line 49
    const/4 v13, 0x0

    .line 50
    .local v13, "fileInputStream":Ljava/io/FileInputStream;
    const/4 v10, 0x0

    .line 52
    .local v10, "dos":Ljava/io/DataOutputStream;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 53
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 54
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    const/16 v19, 0x1000

    invoke-virtual/range {v18 .. v19}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 55
    new-instance v4, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_sourcePath:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 56
    .local v4, "binaryFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v16

    .line 62
    .local v16, "fileSizeInBytes":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_request:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->getUrl()Ljava/net/URL;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v18

    const-string v19, "UTF-8"

    invoke-static/range {v18 .. v19}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/apache/commons/io/FilenameUtils;->getName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 63
    .local v15, "filename":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    const-string v19, "file"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v15}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    const-string v19, "Content-Transfer-Encoding"

    const-string v20, "binary"

    invoke-virtual/range {v18 .. v20}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    new-instance v11, Ljava/io/DataOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_urlConnection:Ljava/net/HttpURLConnection;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v11, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_79
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_79} :catch_1fe
    .catchall {:try_start_2 .. :try_end_79} :catchall_1c1

    .line 82
    .end local v10    # "dos":Ljava/io/DataOutputStream;
    .local v11, "dos":Ljava/io/DataOutputStream;
    :try_start_79
    new-instance v14, Ljava/io/FileInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_sourcePath:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-direct {v14, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_86
    .catch Ljava/io/IOException; {:try_start_79 .. :try_end_86} :catch_201
    .catchall {:try_start_79 .. :try_end_86} :catchall_1f7

    .line 84
    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .local v14, "fileInputStream":Ljava/io/FileInputStream;
    :try_start_86
    invoke-virtual {v14}, Ljava/io/FileInputStream;->available()I

    move-result v7

    .line 86
    .local v7, "bytesAvailable":I
    const/16 v18, 0x1000

    move/from16 v0, v18

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 87
    .local v6, "bufferSize":I
    new-array v5, v6, [B

    .line 90
    .local v5, "buffer":[B
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v14, v5, v0, v6}, Ljava/io/FileInputStream;->read([BII)I

    move-result v8

    .line 91
    .local v8, "bytesRead":I
    const/4 v9, 0x0

    .line 93
    .local v9, "bytesUploadedTillNow":I
    :goto_9d
    if-lez v8, :cond_163

    .line 94
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_requestHandler:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->isCancelled()Z
    :try_end_a8
    .catch Ljava/io/IOException; {:try_start_86 .. :try_end_a8} :catch_11d
    .catchall {:try_start_86 .. :try_end_a8} :catchall_1fa

    move-result v18

    if-eqz v18, :cond_e2

    .line 119
    if-eqz v14, :cond_b0

    .line 123
    :try_start_ad
    invoke-virtual {v14}, Ljava/io/FileInputStream;->close()V
    :try_end_b0
    .catch Ljava/io/IOException; {:try_start_ad .. :try_end_b0} :catch_b8

    .line 131
    :cond_b0
    :goto_b0
    if-eqz v11, :cond_b5

    .line 134
    :try_start_b2
    invoke-virtual {v11}, Ljava/io/DataOutputStream;->close()V
    :try_end_b5
    .catch Ljava/io/IOException; {:try_start_b2 .. :try_end_b5} :catch_cd

    :cond_b5
    :goto_b5
    move-object v10, v11

    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v10    # "dos":Ljava/io/DataOutputStream;
    move-object v13, v14

    .line 141
    .end local v4    # "binaryFile":Ljava/io/File;
    .end local v5    # "buffer":[B
    .end local v6    # "bufferSize":I
    .end local v7    # "bytesAvailable":I
    .end local v8    # "bytesRead":I
    .end local v9    # "bytesUploadedTillNow":I
    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v15    # "filename":Ljava/lang/String;
    .end local v16    # "fileSizeInBytes":J
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    :cond_b7
    :goto_b7
    return-void

    .line 125
    .end local v10    # "dos":Ljava/io/DataOutputStream;
    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "binaryFile":Ljava/io/File;
    .restart local v5    # "buffer":[B
    .restart local v6    # "bufferSize":I
    .restart local v7    # "bytesAvailable":I
    .restart local v8    # "bytesRead":I
    .restart local v9    # "bytesUploadedTillNow":I
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v15    # "filename":Ljava/lang/String;
    .restart local v16    # "fileSizeInBytes":J
    :catch_b8
    move-exception v12

    .line 127
    .local v12, "e":Ljava/io/IOException;
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_b0

    .line 135
    .end local v12    # "e":Ljava/io/IOException;
    :catch_cd
    move-exception v12

    .line 136
    .restart local v12    # "e":Ljava/io/IOException;
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_b5

    .line 98
    .end local v12    # "e":Ljava/io/IOException;
    :cond_e2
    const/16 v18, 0x0

    :try_start_e4
    move/from16 v0, v18

    invoke-virtual {v11, v5, v0, v8}, Ljava/io/DataOutputStream;->write([BII)V

    .line 99
    add-int/2addr v9, v8

    .line 100
    invoke-virtual {v14}, Ljava/io/FileInputStream;->available()I

    move-result v7

    .line 101
    const/16 v18, 0x1000

    move/from16 v0, v18

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 102
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v14, v5, v0, v6}, Ljava/io/FileInputStream;->read([BII)I

    move-result v8

    .line 104
    int-to-float v0, v9

    move/from16 v18, v0

    move-wide/from16 v0, v16

    long-to-float v0, v0

    move/from16 v19, v0

    div-float v18, v18, v19

    const/high16 v19, 0x42c80000

    mul-float v18, v18, v19

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->onProgressUpdate(Ljava/lang/Integer;)V
    :try_end_11c
    .catch Ljava/io/IOException; {:try_start_e4 .. :try_end_11c} :catch_11d
    .catchall {:try_start_e4 .. :try_end_11c} :catchall_1fa

    goto :goto_9d

    .line 113
    .end local v5    # "buffer":[B
    .end local v6    # "bufferSize":I
    .end local v7    # "bytesAvailable":I
    .end local v8    # "bytesRead":I
    .end local v9    # "bytesUploadedTillNow":I
    :catch_11d
    move-exception v12

    move-object v10, v11

    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v10    # "dos":Ljava/io/DataOutputStream;
    move-object v13, v14

    .line 114
    .end local v4    # "binaryFile":Ljava/io/File;
    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .end local v15    # "filename":Ljava/lang/String;
    .end local v16    # "fileSizeInBytes":J
    .restart local v12    # "e":Ljava/io/IOException;
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    :goto_120
    :try_start_120
    invoke-virtual {v12}, Ljava/io/IOException;->printStackTrace()V

    .line 115
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 116
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setHasFileError(Z)V
    :try_end_141
    .catchall {:try_start_120 .. :try_end_141} :catchall_1c1

    .line 119
    if-eqz v13, :cond_146

    .line 123
    :try_start_143
    invoke-virtual {v13}, Ljava/io/FileInputStream;->close()V
    :try_end_146
    .catch Ljava/io/IOException; {:try_start_143 .. :try_end_146} :catch_1ac

    .line 131
    :cond_146
    :goto_146
    if-eqz v10, :cond_b7

    .line 134
    :try_start_148
    invoke-virtual {v10}, Ljava/io/DataOutputStream;->close()V
    :try_end_14b
    .catch Ljava/io/IOException; {:try_start_148 .. :try_end_14b} :catch_14d

    goto/16 :goto_b7

    .line 135
    :catch_14d
    move-exception v12

    .line 136
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_b7

    .line 109
    .end local v10    # "dos":Ljava/io/DataOutputStream;
    .end local v12    # "e":Ljava/io/IOException;
    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v4    # "binaryFile":Ljava/io/File;
    .restart local v5    # "buffer":[B
    .restart local v6    # "bufferSize":I
    .restart local v7    # "bytesAvailable":I
    .restart local v8    # "bytesRead":I
    .restart local v9    # "bytesUploadedTillNow":I
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v15    # "filename":Ljava/lang/String;
    .restart local v16    # "fileSizeInBytes":J
    :cond_163
    :try_start_163
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask;->_response:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->setBytesSent(I)V

    .line 111
    invoke-virtual {v11}, Ljava/io/DataOutputStream;->flush()V
    :try_end_171
    .catch Ljava/io/IOException; {:try_start_163 .. :try_end_171} :catch_11d
    .catchall {:try_start_163 .. :try_end_171} :catchall_1fa

    .line 119
    if-eqz v14, :cond_176

    .line 123
    :try_start_173
    invoke-virtual {v14}, Ljava/io/FileInputStream;->close()V
    :try_end_176
    .catch Ljava/io/IOException; {:try_start_173 .. :try_end_176} :catch_17f

    .line 131
    :cond_176
    :goto_176
    if-eqz v11, :cond_205

    .line 134
    :try_start_178
    invoke-virtual {v11}, Ljava/io/DataOutputStream;->close()V
    :try_end_17b
    .catch Ljava/io/IOException; {:try_start_178 .. :try_end_17b} :catch_194

    move-object v10, v11

    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v10    # "dos":Ljava/io/DataOutputStream;
    move-object v13, v14

    .line 137
    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    goto/16 :goto_b7

    .line 125
    .end local v10    # "dos":Ljava/io/DataOutputStream;
    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    :catch_17f
    move-exception v12

    .line 127
    .restart local v12    # "e":Ljava/io/IOException;
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_176

    .line 135
    .end local v12    # "e":Ljava/io/IOException;
    :catch_194
    move-exception v12

    .line 136
    .restart local v12    # "e":Ljava/io/IOException;
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v10, v11

    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v10    # "dos":Ljava/io/DataOutputStream;
    move-object v13, v14

    .line 137
    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    goto/16 :goto_b7

    .line 125
    .end local v4    # "binaryFile":Ljava/io/File;
    .end local v5    # "buffer":[B
    .end local v6    # "bufferSize":I
    .end local v7    # "bytesAvailable":I
    .end local v8    # "bytesRead":I
    .end local v9    # "bytesUploadedTillNow":I
    .end local v15    # "filename":Ljava/lang/String;
    .end local v16    # "fileSizeInBytes":J
    :catch_1ac
    move-exception v12

    .line 127
    sget-object v18, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v19, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "Error during io operation"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_146

    .line 119
    .end local v12    # "e":Ljava/io/IOException;
    :catchall_1c1
    move-exception v18

    :goto_1c2
    if-eqz v13, :cond_1c7

    .line 123
    :try_start_1c4
    invoke-virtual {v13}, Ljava/io/FileInputStream;->close()V
    :try_end_1c7
    .catch Ljava/io/IOException; {:try_start_1c4 .. :try_end_1c7} :catch_1cd

    .line 131
    :cond_1c7
    :goto_1c7
    if-eqz v10, :cond_1cc

    .line 134
    :try_start_1c9
    invoke-virtual {v10}, Ljava/io/DataOutputStream;->close()V
    :try_end_1cc
    .catch Ljava/io/IOException; {:try_start_1c9 .. :try_end_1cc} :catch_1e2

    .line 137
    :cond_1cc
    :goto_1cc
    throw v18

    .line 125
    :catch_1cd
    move-exception v12

    .line 127
    .restart local v12    # "e":Ljava/io/IOException;
    sget-object v19, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v20, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v20

    const-string v21, "Error during io operation"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1c7

    .line 135
    .end local v12    # "e":Ljava/io/IOException;
    :catch_1e2
    move-exception v12

    .line 136
    .restart local v12    # "e":Ljava/io/IOException;
    sget-object v19, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v20, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpDataDownloadTask;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v20

    const-string v21, "Error during io operation"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2, v12}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1cc

    .line 119
    .end local v10    # "dos":Ljava/io/DataOutputStream;
    .end local v12    # "e":Ljava/io/IOException;
    .restart local v4    # "binaryFile":Ljava/io/File;
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v15    # "filename":Ljava/lang/String;
    .restart local v16    # "fileSizeInBytes":J
    :catchall_1f7
    move-exception v18

    move-object v10, v11

    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v10    # "dos":Ljava/io/DataOutputStream;
    goto :goto_1c2

    .end local v10    # "dos":Ljava/io/DataOutputStream;
    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    :catchall_1fa
    move-exception v18

    move-object v10, v11

    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v10    # "dos":Ljava/io/DataOutputStream;
    move-object v13, v14

    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    goto :goto_1c2

    .line 113
    .end local v4    # "binaryFile":Ljava/io/File;
    .end local v15    # "filename":Ljava/lang/String;
    .end local v16    # "fileSizeInBytes":J
    :catch_1fe
    move-exception v12

    goto/16 :goto_120

    .end local v10    # "dos":Ljava/io/DataOutputStream;
    .restart local v4    # "binaryFile":Ljava/io/File;
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v15    # "filename":Ljava/lang/String;
    .restart local v16    # "fileSizeInBytes":J
    :catch_201
    move-exception v12

    move-object v10, v11

    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v10    # "dos":Ljava/io/DataOutputStream;
    goto/16 :goto_120

    .end local v10    # "dos":Ljava/io/DataOutputStream;
    .end local v13    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v5    # "buffer":[B
    .restart local v6    # "bufferSize":I
    .restart local v7    # "bytesAvailable":I
    .restart local v8    # "bytesRead":I
    .restart local v9    # "bytesUploadedTillNow":I
    .restart local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v14    # "fileInputStream":Ljava/io/FileInputStream;
    :cond_205
    move-object v10, v11

    .end local v11    # "dos":Ljava/io/DataOutputStream;
    .restart local v10    # "dos":Ljava/io/DataOutputStream;
    move-object v13, v14

    .end local v14    # "fileInputStream":Ljava/io/FileInputStream;
    .restart local v13    # "fileInputStream":Ljava/io/FileInputStream;
    goto/16 :goto_b7
.end method
