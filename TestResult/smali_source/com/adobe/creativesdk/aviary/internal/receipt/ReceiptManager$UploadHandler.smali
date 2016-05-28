.class final Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;
.super Landroid/os/Handler;
.source "ReceiptManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "UploadHandler"
.end annotation


# instance fields
.field logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private mContext:Landroid/content/Context;

.field private final mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "looper"    # Landroid/os/Looper;
    .param p3, "info"    # Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    .prologue
    .line 256
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 252
    const-string v0, "ReceiptManagerUploadHandler"

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 257
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mContext:Landroid/content/Context;

    .line 258
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    .line 259
    return-void
.end method

.method private handleResults(Ljava/util/Collection;Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;)V
    .registers 19
    .param p2, "provider"    # Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;",
            ">;",
            "Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;",
            ")V"
        }
    .end annotation

    .prologue
    .line 416
    .local p1, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;>;"
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v10, "handleResults"

    invoke-interface {v9, v10}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 418
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 419
    .local v5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;>;"
    :goto_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_ae

    .line 420
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;

    .line 422
    .local v4, "item":Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v10, "---------"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-interface {v9, v10, v11}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 423
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v10, "item {id: %d, status: %d, failCount: %d}"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-wide v14, v4, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->id:J

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    iget v13, v4, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->status:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    iget v13, v4, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->count:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-interface {v9, v10, v11}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 425
    iget v9, v4, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->status:I

    const/16 v10, 0xc8

    if-eq v9, v10, :cond_58

    iget v9, v4, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->count:I

    const/16 v10, 0xa

    if-lt v9, v10, :cond_79

    .line 428
    :cond_58
    :try_start_58
    iget-wide v10, v4, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->id:J

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->deleteReceipt(J)I

    move-result v2

    .line 429
    .local v2, "deleteCount":I
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v10, "deleteCount: %d"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-interface {v9, v10, v11}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_73
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_58 .. :try_end_73} :catch_74

    goto :goto_d

    .line 430
    .end local v2    # "deleteCount":I
    :catch_74
    move-exception v3

    .line 431
    .local v3, "e":Landroid/database/sqlite/SQLiteException;
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    goto :goto_d

    .line 436
    .end local v3    # "e":Landroid/database/sqlite/SQLiteException;
    :cond_79
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 437
    .local v8, "values":Landroid/content/ContentValues;
    const-string v9, "r_fail_count"

    iget v10, v4, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->count:I

    add-int/lit8 v10, v10, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 440
    :try_start_8b
    iget-wide v10, v4, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->id:J

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11, v8}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->updateReceipt(JLandroid/content/ContentValues;)J

    move-result-wide v6

    .line 441
    .local v6, "rowId":J
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v10, "updated receipt: %d"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-interface {v9, v10, v11}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_a6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_8b .. :try_end_a6} :catch_a8

    goto/16 :goto_d

    .line 442
    .end local v6    # "rowId":J
    :catch_a8
    move-exception v3

    .line 443
    .restart local v3    # "e":Landroid/database/sqlite/SQLiteException;
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteException;->printStackTrace()V

    goto/16 :goto_d

    .line 447
    .end local v3    # "e":Landroid/database/sqlite/SQLiteException;
    .end local v4    # "item":Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;
    .end local v8    # "values":Landroid/content/ContentValues;
    :cond_ae
    return-void
.end method

.method private upload()V
    .registers 6

    .prologue
    .line 282
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "upload"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 284
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 286
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;

    move-result-object v1

    .line 289
    .local v1, "provider":Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->getReceipts()Landroid/database/Cursor;

    move-result-object v0

    .line 292
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_20

    .line 293
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->uploadReceipts(Landroid/database/Cursor;)Ljava/util/Collection;

    move-result-object v2

    .line 294
    .local v2, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;>;"
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 295
    invoke-direct {p0, v2, v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->handleResults(Ljava/util/Collection;Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;)V

    .line 299
    .end local v2    # "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;>;"
    :cond_20
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptProvider;->getAccountContent()Landroid/database/Cursor;

    move-result-object v0

    .line 300
    if-eqz v0, :cond_2d

    .line 301
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->uploadAccountContent(Landroid/database/Cursor;)Ljava/util/Collection;

    move-result-object v2

    .line 302
    .restart local v2    # "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;>;"
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 313
    .end local v2    # "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;>;"
    :cond_2d
    return-void
.end method

.method private uploadAccountContent(Landroid/database/Cursor;)Ljava/util/Collection;
    .registers 20
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 316
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "uploadContent: {cursor.size: %d}"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getCount()I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 317
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 319
    .local v7, "responses":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;>;"
    const/4 v11, 0x0

    .line 321
    .local v11, "total":I
    :cond_1e
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v13

    if-eqz v13, :cond_ca

    .line 322
    const-string v13, "r_id"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 323
    .local v4, "id":J
    const-string v13, "r_json"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    .line 324
    .local v2, "blob":[B
    const-string v13, "r_item_type"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 325
    .local v12, "type":I
    const-string v13, "r_fail_count"

    .line 327
    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    const/4 v14, 0x0

    const/16 v15, 0xff

    invoke-static {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->clamp(III)I

    move-result v3

    .line 328
    .local v3, "failCount":I
    new-instance v10, Ljava/lang/String;

    const-string v13, "UTF-8"

    invoke-static {v13}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v13

    invoke-direct {v10, v2, v13}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 330
    .local v10, "text":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "trying to upload content: %d {type: %d, fails count: %d}"

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 334
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-boolean v13, v13, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->signatureRequired:Z

    if-eqz v13, :cond_de

    .line 335
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mContext:Landroid/content/Context;

    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 336
    .local v6, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mContext:Landroid/content/Context;

    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiSecret(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    .line 338
    .local v8, "secret":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v14, v14, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriContent:Ljava/lang/String;

    invoke-static {v13, v14, v10, v6, v8}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_cb

    .line 339
    const/16 v9, 0xc8

    .line 353
    .end local v6    # "key":Ljava/lang/String;
    .end local v8    # "secret":Ljava/lang/String;
    .local v9, "status":I
    :goto_bc
    new-instance v13, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;

    invoke-direct {v13, v4, v5, v9, v3}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;-><init>(JII)V

    invoke-interface {v7, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 355
    add-int/lit8 v11, v11, 0x1

    const/16 v13, 0x14

    if-lt v11, v13, :cond_1e

    .line 359
    .end local v2    # "blob":[B
    .end local v3    # "failCount":I
    .end local v4    # "id":J
    .end local v9    # "status":I
    .end local v10    # "text":Ljava/lang/String;
    .end local v12    # "type":I
    :cond_ca
    return-object v7

    .line 341
    .restart local v2    # "blob":[B
    .restart local v3    # "failCount":I
    .restart local v4    # "id":J
    .restart local v6    # "key":Ljava/lang/String;
    .restart local v8    # "secret":Ljava/lang/String;
    .restart local v10    # "text":Ljava/lang/String;
    .restart local v12    # "type":I
    :cond_cb
    const/16 v9, 0x194

    .line 342
    .restart local v9    # "status":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "Failed to send the content: %s"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v10, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_bc

    .line 345
    .end local v6    # "key":Ljava/lang/String;
    .end local v8    # "secret":Ljava/lang/String;
    .end local v9    # "status":I
    :cond_de
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v14, v14, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriContent:Ljava/lang/String;

    invoke-static {v13, v14, v10}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_f1

    .line 346
    const/16 v9, 0xc8

    .restart local v9    # "status":I
    goto :goto_bc

    .line 348
    .end local v9    # "status":I
    :cond_f1
    const/16 v9, 0x194

    .line 349
    .restart local v9    # "status":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "Failed to send the content: %s"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v10, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_bc
.end method

.method private uploadReceipts(Landroid/database/Cursor;)Ljava/util/Collection;
    .registers 20
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;",
            ">;"
        }
    .end annotation

    .prologue
    .line 363
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "uploadReceipts: {cursor.size: %d}"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->getCount()I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 364
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 366
    .local v7, "responses":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;>;"
    const/4 v11, 0x0

    .line 368
    .local v11, "total":I
    :cond_1e
    invoke-interface/range {p1 .. p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v13

    if-eqz v13, :cond_cd

    .line 369
    const-string v13, "r_id"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 370
    .local v4, "id":J
    const-string v13, "r_json"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    .line 371
    .local v2, "blob":[B
    const-string v13, "r_item_type"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 372
    .local v12, "type":I
    const-string v13, "r_fail_count"

    .line 374
    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    const/4 v14, 0x0

    const/16 v15, 0xff

    invoke-static {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->clamp(III)I

    move-result v3

    .line 375
    .local v3, "failCount":I
    new-instance v10, Ljava/lang/String;

    const-string v13, "UTF-8"

    invoke-static {v13}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v13

    invoke-direct {v10, v2, v13}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 377
    .local v10, "text":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "trying to upload ticket: %d {type: %d, fails count: %d}"

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 381
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-boolean v13, v13, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->signatureRequired:Z

    if-eqz v13, :cond_e8

    .line 382
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mContext:Landroid/content/Context;

    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 383
    .local v6, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mContext:Landroid/content/Context;

    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiSecret(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    .line 385
    .local v8, "secret":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mContext:Landroid/content/Context;

    const/4 v13, 0x1

    if-ne v12, v13, :cond_ce

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v13, v13, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriFree:Ljava/lang/String;

    :goto_b7
    invoke-static {v14, v13, v10, v6, v8}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_d5

    .line 389
    const/16 v9, 0xc8

    .line 406
    .end local v6    # "key":Ljava/lang/String;
    .end local v8    # "secret":Ljava/lang/String;
    .local v9, "status":I
    :goto_bf
    new-instance v13, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;

    invoke-direct {v13, v4, v5, v9, v3}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;-><init>(JII)V

    invoke-interface {v7, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 408
    add-int/lit8 v11, v11, 0x1

    const/16 v13, 0x14

    if-lt v11, v13, :cond_1e

    .line 412
    .end local v2    # "blob":[B
    .end local v3    # "failCount":I
    .end local v4    # "id":J
    .end local v9    # "status":I
    .end local v10    # "text":Ljava/lang/String;
    .end local v12    # "type":I
    :cond_cd
    return-object v7

    .line 385
    .restart local v2    # "blob":[B
    .restart local v3    # "failCount":I
    .restart local v4    # "id":J
    .restart local v6    # "key":Ljava/lang/String;
    .restart local v8    # "secret":Ljava/lang/String;
    .restart local v10    # "text":Ljava/lang/String;
    .restart local v12    # "type":I
    :cond_ce
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v13, v13, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriPaid:Ljava/lang/String;

    goto :goto_b7

    .line 391
    :cond_d5
    const/16 v9, 0x194

    .line 392
    .restart local v9    # "status":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "Failed to send the ticket: %s"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v10, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_bf

    .line 396
    .end local v6    # "key":Ljava/lang/String;
    .end local v8    # "secret":Ljava/lang/String;
    .end local v9    # "status":I
    :cond_e8
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mContext:Landroid/content/Context;

    const/4 v13, 0x1

    if-ne v12, v13, :cond_fe

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v13, v13, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriFree:Ljava/lang/String;

    :goto_f5
    invoke-static {v14, v13, v10}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_105

    .line 399
    const/16 v9, 0xc8

    .restart local v9    # "status":I
    goto :goto_bf

    .line 396
    .end local v9    # "status":I
    :cond_fe
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->mEndpointInfo:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    iget-object v13, v13, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriPaid:Ljava/lang/String;

    goto :goto_f5

    .line 401
    :cond_105
    const/16 v9, 0x194

    .line 402
    .restart local v9    # "status":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "Failed to send the ticket: %s"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v10, v15, v16

    invoke-interface {v13, v14, v15}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_bf
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 263
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "handleMessage: %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 266
    :try_start_13
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_32

    .line 272
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "not handled"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 279
    :goto_1f
    return-void

    .line 268
    :pswitch_20
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->upload()V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_23} :catch_24

    goto :goto_1f

    .line 275
    :catch_24
    move-exception v0

    .line 276
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 277
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_1f

    .line 266
    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_20
    .end packed-switch
.end method
