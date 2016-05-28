.class final Lcom/facebook/internal/FileLruCache$StreamHeader;
.super Ljava/lang/Object;
.source "FileLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/FileLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "StreamHeader"
.end annotation


# direct methods
.method static readHeader(Ljava/io/InputStream;)Lorg/json/JSONObject;
    .registers 18
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 383
    invoke-virtual/range {p0 .. p0}, Ljava/io/InputStream;->read()I

    move-result v12

    .line 384
    .local v12, "version":I
    if-eqz v12, :cond_8

    .line 385
    const/4 v4, 0x0

    .line 427
    :goto_7
    return-object v4

    .line 388
    :cond_8
    const/4 v6, 0x0

    .line 389
    .local v6, "headerSize":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_a
    const/4 v13, 0x3

    if-lt v8, v13, :cond_46

    .line 400
    new-array v5, v6, [B

    .line 401
    .local v5, "headerBytes":[B
    const/4 v2, 0x0

    .line 402
    .local v2, "count":I
    :goto_10
    array-length v13, v5

    if-lt v2, v13, :cond_60

    .line 413
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v5}, Ljava/lang/String;-><init>([B)V

    .line 414
    .local v7, "headerString":Ljava/lang/String;
    const/4 v4, 0x0

    .line 415
    .local v4, "header":Lorg/json/JSONObject;
    new-instance v11, Lorg/json/JSONTokener;

    invoke-direct {v11, v7}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 417
    .local v11, "tokener":Lorg/json/JSONTokener;
    :try_start_1e
    invoke-virtual {v11}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v9

    .line 418
    .local v9, "parsed":Ljava/lang/Object;
    instance-of v13, v9, Lorg/json/JSONObject;

    if-nez v13, :cond_98

    .line 419
    sget-object v13, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    sget-object v14, Lcom/facebook/internal/FileLruCache;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "readHeader: expected JSONObject, got "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v13, v14, v15}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_44
    .catch Lorg/json/JSONException; {:try_start_1e .. :try_end_44} :catch_9e

    .line 420
    const/4 v4, 0x0

    goto :goto_7

    .line 390
    .end local v2    # "count":I
    .end local v4    # "header":Lorg/json/JSONObject;
    .end local v5    # "headerBytes":[B
    .end local v7    # "headerString":Ljava/lang/String;
    .end local v9    # "parsed":Ljava/lang/Object;
    .end local v11    # "tokener":Lorg/json/JSONTokener;
    :cond_46
    invoke-virtual/range {p0 .. p0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 391
    .local v1, "b":I
    const/4 v13, -0x1

    if-ne v1, v13, :cond_58

    .line 392
    sget-object v13, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    sget-object v14, Lcom/facebook/internal/FileLruCache;->TAG:Ljava/lang/String;

    .line 393
    const-string v15, "readHeader: stream.read returned -1 while reading header size"

    .line 392
    invoke-static {v13, v14, v15}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    const/4 v4, 0x0

    goto :goto_7

    .line 396
    :cond_58
    shl-int/lit8 v6, v6, 0x8

    .line 397
    and-int/lit16 v13, v1, 0xff

    add-int/2addr v6, v13

    .line 389
    add-int/lit8 v8, v8, 0x1

    goto :goto_a

    .line 403
    .end local v1    # "b":I
    .restart local v2    # "count":I
    .restart local v5    # "headerBytes":[B
    :cond_60
    array-length v13, v5

    sub-int/2addr v13, v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v2, v13}, Ljava/io/InputStream;->read([BII)I

    move-result v10

    .line 404
    .local v10, "readCount":I
    const/4 v13, 0x1

    if-ge v10, v13, :cond_95

    .line 405
    sget-object v13, Lcom/facebook/LoggingBehavior;->CACHE:Lcom/facebook/LoggingBehavior;

    sget-object v14, Lcom/facebook/internal/FileLruCache;->TAG:Ljava/lang/String;

    .line 406
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "readHeader: stream.read stopped at "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " when expected "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 407
    array-length v0, v5

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 406
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 405
    invoke-static {v13, v14, v15}, Lcom/facebook/internal/Logger;->log(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    const/4 v4, 0x0

    goto/16 :goto_7

    .line 410
    :cond_95
    add-int/2addr v2, v10

    goto/16 :goto_10

    .line 422
    .end local v10    # "readCount":I
    .restart local v4    # "header":Lorg/json/JSONObject;
    .restart local v7    # "headerString":Ljava/lang/String;
    .restart local v9    # "parsed":Ljava/lang/Object;
    .restart local v11    # "tokener":Lorg/json/JSONTokener;
    :cond_98
    :try_start_98
    move-object v0, v9

    check-cast v0, Lorg/json/JSONObject;

    move-object v4, v0
    :try_end_9c
    .catch Lorg/json/JSONException; {:try_start_98 .. :try_end_9c} :catch_9e

    goto/16 :goto_7

    .line 423
    .end local v9    # "parsed":Ljava/lang/Object;
    :catch_9e
    move-exception v3

    .line 424
    .local v3, "e":Lorg/json/JSONException;
    new-instance v13, Ljava/io/IOException;

    invoke-virtual {v3}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13
.end method

.method static writeHeader(Ljava/io/OutputStream;Lorg/json/JSONObject;)V
    .registers 5
    .param p0, "stream"    # Ljava/io/OutputStream;
    .param p1, "header"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 370
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    .line 371
    .local v1, "headerString":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 374
    .local v0, "headerBytes":[B
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 375
    array-length v2, v0

    shr-int/lit8 v2, v2, 0x10

    and-int/lit16 v2, v2, 0xff

    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 376
    array-length v2, v0

    shr-int/lit8 v2, v2, 0x8

    and-int/lit16 v2, v2, 0xff

    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 377
    array-length v2, v0

    shr-int/lit8 v2, v2, 0x0

    and-int/lit16 v2, v2, 0xff

    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 379
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 380
    return-void
.end method
