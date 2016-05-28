.class Lcom/facebook/Request$Serializer;
.super Ljava/lang/Object;
.source "Request.java"

# interfaces
.implements Lcom/facebook/Request$KeyValueSerializer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Serializer"
.end annotation


# instance fields
.field private firstWrite:Z

.field private final logger:Lcom/facebook/internal/Logger;

.field private final outputStream:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lcom/facebook/internal/Logger;)V
    .registers 4
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "logger"    # Lcom/facebook/internal/Logger;

    .prologue
    .line 2166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2164
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/Request$Serializer;->firstWrite:Z

    .line 2167
    iput-object p1, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    .line 2168
    iput-object p2, p0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    .line 2169
    return-void
.end method


# virtual methods
.method public varargs write(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2310
    iget-boolean v0, p0, Lcom/facebook/Request$Serializer;->firstWrite:Z

    if-eqz v0, :cond_28

    .line 2312
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    const-string v1, "--"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 2313
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    const-string v1, "3i2ndDfv2rTHiSisAbouNdArYfORhtTPEefj3q2f"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 2314
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    const-string v1, "\r\n"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 2315
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/Request$Serializer;->firstWrite:Z

    .line 2317
    :cond_28
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 2318
    return-void
.end method

.method public writeBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2228
    const-string v0, "image/png"

    invoke-virtual {p0, p1, p1, v0}, Lcom/facebook/Request$Serializer;->writeContentDisposition(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2230
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v1, 0x64

    iget-object v2, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {p2, v0, v1, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 2231
    const-string v0, ""

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/facebook/Request$Serializer;->writeLine(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2232
    invoke-virtual {p0}, Lcom/facebook/Request$Serializer;->writeRecordBoundary()V

    .line 2233
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    if-eqz v0, :cond_33

    .line 2234
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "    "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "<Image>"

    invoke-virtual {v0, v1, v2}, Lcom/facebook/internal/Logger;->appendKeyValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2236
    :cond_33
    return-void
.end method

.method public writeBytes(Ljava/lang/String;[B)V
    .registers 9
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 2239
    const-string v0, "content/unknown"

    invoke-virtual {p0, p1, p1, v0}, Lcom/facebook/Request$Serializer;->writeContentDisposition(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2240
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p2}, Ljava/io/OutputStream;->write([B)V

    .line 2241
    const-string v0, ""

    new-array v1, v5, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/facebook/Request$Serializer;->writeLine(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2242
    invoke-virtual {p0}, Lcom/facebook/Request$Serializer;->writeRecordBoundary()V

    .line 2243
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    if-eqz v0, :cond_3d

    .line 2244
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "    "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "<Data: %d>"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    array-length v4, p2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/facebook/internal/Logger;->appendKeyValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2246
    :cond_3d
    return-void
.end method

.method public writeContentDisposition(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2298
    const-string v0, "Content-Disposition: form-data; name=\"%s\""

    new-array v1, v4, [Ljava/lang/Object;

    aput-object p1, v1, v3

    invoke-virtual {p0, v0, v1}, Lcom/facebook/Request$Serializer;->write(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2299
    if-eqz p2, :cond_16

    .line 2300
    const-string v0, "; filename=\"%s\""

    new-array v1, v4, [Ljava/lang/Object;

    aput-object p2, v1, v3

    invoke-virtual {p0, v0, v1}, Lcom/facebook/Request$Serializer;->write(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2302
    :cond_16
    const-string v0, ""

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/facebook/Request$Serializer;->writeLine(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2303
    if-eqz p3, :cond_2d

    .line 2304
    const-string v0, "%s: %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "Content-Type"

    aput-object v2, v1, v3

    aput-object p3, v1, v4

    invoke-virtual {p0, v0, v1}, Lcom/facebook/Request$Serializer;->writeLine(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2306
    :cond_2d
    const-string v0, ""

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/facebook/Request$Serializer;->writeLine(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2307
    return-void
.end method

.method public writeFile(Ljava/lang/String;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;)V
    .registers 21
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "descriptor"    # Landroid/os/ParcelFileDescriptor;
    .param p3, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2253
    if-nez p3, :cond_4

    .line 2254
    const-string p3, "content/unknown"

    .line 2256
    :cond_4
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p1

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lcom/facebook/Request$Serializer;->writeContentDisposition(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2258
    const/4 v10, 0x0

    .line 2260
    .local v10, "totalBytes":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    instance-of v11, v11, Lcom/facebook/ProgressNoopOutputStream;

    if-eqz v11, :cond_61

    .line 2262
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    check-cast v11, Lcom/facebook/ProgressNoopOutputStream;

    invoke-virtual/range {p2 .. p2}, Landroid/os/ParcelFileDescriptor;->getStatSize()J

    move-result-wide v12

    invoke-virtual {v11, v12, v13}, Lcom/facebook/ProgressNoopOutputStream;->addProgress(J)V

    .line 2286
    :cond_25
    :goto_25
    const-string v11, ""

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v12}, Lcom/facebook/Request$Serializer;->writeLine(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2287
    invoke-virtual/range {p0 .. p0}, Lcom/facebook/Request$Serializer;->writeRecordBoundary()V

    .line 2288
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    if-eqz v11, :cond_60

    .line 2289
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "    "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "<Data: %d>"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lcom/facebook/internal/Logger;->appendKeyValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2291
    :cond_60
    return-void

    .line 2265
    :cond_61
    const/4 v8, 0x0

    .line 2266
    .local v8, "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    const/4 v5, 0x0

    .line 2268
    .local v5, "bufferedInputStream":Ljava/io/BufferedInputStream;
    :try_start_63
    new-instance v9, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    move-object/from16 v0, p2

    invoke-direct {v9, v0}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V
    :try_end_6a
    .catchall {:try_start_63 .. :try_end_6a} :catchall_8f

    .line 2269
    .end local v8    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    .local v9, "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    :try_start_6a
    new-instance v6, Ljava/io/BufferedInputStream;

    invoke-direct {v6, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_6f
    .catchall {:try_start_6a .. :try_end_6f} :catchall_9b

    .line 2271
    .end local v5    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .local v6, "bufferedInputStream":Ljava/io/BufferedInputStream;
    const/16 v11, 0x2000

    :try_start_71
    new-array v4, v11, [B

    .line 2273
    .local v4, "buffer":[B
    :goto_73
    invoke-virtual {v6, v4}, Ljava/io/BufferedInputStream;->read([B)I
    :try_end_76
    .catchall {:try_start_71 .. :try_end_76} :catchall_9e

    move-result v7

    .local v7, "bytesRead":I
    const/4 v11, -0x1

    if-ne v7, v11, :cond_85

    .line 2278
    if-eqz v6, :cond_7f

    .line 2279
    invoke-virtual {v6}, Ljava/io/BufferedInputStream;->close()V

    .line 2281
    :cond_7f
    if-eqz v9, :cond_25

    .line 2282
    invoke-virtual {v9}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;->close()V

    goto :goto_25

    .line 2274
    :cond_85
    :try_start_85
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    const/4 v12, 0x0

    invoke-virtual {v11, v4, v12, v7}, Ljava/io/OutputStream;->write([BII)V
    :try_end_8d
    .catchall {:try_start_85 .. :try_end_8d} :catchall_9e

    .line 2275
    add-int/2addr v10, v7

    goto :goto_73

    .line 2277
    .end local v4    # "buffer":[B
    .end local v6    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .end local v7    # "bytesRead":I
    .end local v9    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    .restart local v5    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .restart local v8    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    :catchall_8f
    move-exception v11

    .line 2278
    :goto_90
    if-eqz v5, :cond_95

    .line 2279
    invoke-virtual {v5}, Ljava/io/BufferedInputStream;->close()V

    .line 2281
    :cond_95
    if-eqz v8, :cond_9a

    .line 2282
    invoke-virtual {v8}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;->close()V

    .line 2284
    :cond_9a
    throw v11

    .line 2277
    .end local v8    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    .restart local v9    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    :catchall_9b
    move-exception v11

    move-object v8, v9

    .end local v9    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    .restart local v8    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    goto :goto_90

    .end local v5    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .end local v8    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    .restart local v6    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .restart local v9    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    :catchall_9e
    move-exception v11

    move-object v5, v6

    .end local v6    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .restart local v5    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    move-object v8, v9

    .end local v9    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    .restart local v8    # "inputStream":Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;
    goto :goto_90
.end method

.method public writeFile(Ljava/lang/String;Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "descriptorWithMimeType"    # Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2249
    invoke-virtual {p2}, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;->getFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    invoke-virtual {p2}, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;->getMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/Request$Serializer;->writeFile(Ljava/lang/String;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;)V

    .line 2250
    return-void
.end method

.method public varargs writeLine(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2321
    invoke-virtual {p0, p1, p2}, Lcom/facebook/Request$Serializer;->write(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2322
    const-string v0, "\r\n"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/facebook/Request$Serializer;->write(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2323
    return-void
.end method

.method public writeObject(Ljava/lang/String;Ljava/lang/Object;Lcom/facebook/Request;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "request"    # Lcom/facebook/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2172
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    instance-of v0, v0, Lcom/facebook/RequestOutputStream;

    if-eqz v0, :cond_d

    .line 2173
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    check-cast v0, Lcom/facebook/RequestOutputStream;

    invoke-interface {v0, p3}, Lcom/facebook/RequestOutputStream;->setCurrentRequest(Lcom/facebook/Request;)V

    .line 2176
    :cond_d
    # invokes: Lcom/facebook/Request;->isSupportedParameterType(Ljava/lang/Object;)Z
    invoke-static {p2}, Lcom/facebook/Request;->access$0(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 2177
    # invokes: Lcom/facebook/Request;->parameterToString(Ljava/lang/Object;)Ljava/lang/String;
    invoke-static {p2}, Lcom/facebook/Request;->access$1(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/facebook/Request$Serializer;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 2189
    .end local p2    # "value":Ljava/lang/Object;
    :goto_1a
    return-void

    .line 2178
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_1b
    instance-of v0, p2, Landroid/graphics/Bitmap;

    if-eqz v0, :cond_25

    .line 2179
    check-cast p2, Landroid/graphics/Bitmap;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/facebook/Request$Serializer;->writeBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_1a

    .line 2180
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_25
    instance-of v0, p2, [B

    if-eqz v0, :cond_2f

    .line 2181
    check-cast p2, [B

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/facebook/Request$Serializer;->writeBytes(Ljava/lang/String;[B)V

    goto :goto_1a

    .line 2182
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_2f
    instance-of v0, p2, Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_3a

    .line 2183
    check-cast p2, Landroid/os/ParcelFileDescriptor;

    .end local p2    # "value":Ljava/lang/Object;
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/facebook/Request$Serializer;->writeFile(Ljava/lang/String;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;)V

    goto :goto_1a

    .line 2184
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_3a
    instance-of v0, p2, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;

    if-eqz v0, :cond_44

    .line 2185
    check-cast p2, Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/facebook/Request$Serializer;->writeFile(Ljava/lang/String;Lcom/facebook/Request$ParcelFileDescriptorWithMimeType;)V

    goto :goto_1a

    .line 2187
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_44
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "value is not a supported type: String, Bitmap, byte[]"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeRecordBoundary()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2294
    const-string v0, "--%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "3i2ndDfv2rTHiSisAbouNdArYfORhtTPEefj3q2f"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/facebook/Request$Serializer;->writeLine(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2295
    return-void
.end method

.method public writeRequestsAsJson(Ljava/lang/String;Lorg/json/JSONArray;Ljava/util/Collection;)V
    .registers 14
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "requestJsonArray"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/json/JSONArray;",
            "Ljava/util/Collection",
            "<",
            "Lcom/facebook/Request;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .local p3, "requests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/facebook/Request;>;"
    const/4 v5, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 2193
    iget-object v4, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    instance-of v4, v4, Lcom/facebook/RequestOutputStream;

    if-nez v4, :cond_11

    .line 2194
    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lcom/facebook/Request$Serializer;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 2216
    :cond_10
    :goto_10
    return-void

    .line 2198
    :cond_11
    iget-object v3, p0, Lcom/facebook/Request$Serializer;->outputStream:Ljava/io/OutputStream;

    check-cast v3, Lcom/facebook/RequestOutputStream;

    .line 2199
    .local v3, "requestOutputStream":Lcom/facebook/RequestOutputStream;
    invoke-virtual {p0, p1, v5, v5}, Lcom/facebook/Request$Serializer;->writeContentDisposition(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2200
    const-string v4, "["

    new-array v5, v8, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v5}, Lcom/facebook/Request$Serializer;->write(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2201
    const/4 v0, 0x0

    .line 2202
    .local v0, "i":I
    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_24
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_4e

    .line 2212
    const-string v4, "]"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-virtual {p0, v4, v5}, Lcom/facebook/Request$Serializer;->write(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2213
    iget-object v4, p0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    if-eqz v4, :cond_10

    .line 2214
    iget-object v4, p0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "    "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/facebook/internal/Logger;->appendKeyValue(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_10

    .line 2202
    :cond_4e
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/Request;

    .line 2203
    .local v1, "request":Lcom/facebook/Request;
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 2204
    .local v2, "requestJson":Lorg/json/JSONObject;
    invoke-interface {v3, v1}, Lcom/facebook/RequestOutputStream;->setCurrentRequest(Lcom/facebook/Request;)V

    .line 2205
    if-lez v0, :cond_6d

    .line 2206
    const-string v5, ",%s"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {p0, v5, v6}, Lcom/facebook/Request$Serializer;->write(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2210
    :goto_6a
    add-int/lit8 v0, v0, 0x1

    goto :goto_24

    .line 2208
    :cond_6d
    const-string v5, "%s"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {p0, v5, v6}, Lcom/facebook/Request$Serializer;->write(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_6a
.end method

.method public writeString(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 2219
    invoke-virtual {p0, p1, v0, v0}, Lcom/facebook/Request$Serializer;->writeContentDisposition(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2220
    const-string v0, "%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/facebook/Request$Serializer;->writeLine(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2221
    invoke-virtual {p0}, Lcom/facebook/Request$Serializer;->writeRecordBoundary()V

    .line 2222
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    if-eqz v0, :cond_2a

    .line 2223
    iget-object v0, p0, Lcom/facebook/Request$Serializer;->logger:Lcom/facebook/internal/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "    "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/facebook/internal/Logger;->appendKeyValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2225
    :cond_2a
    return-void
.end method
